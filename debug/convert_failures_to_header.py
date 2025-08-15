#!/usr/bin/env python3
"""
Convert the more_failures.txt log into a C header file with test data arrays.
"""

import re
import sys
import os

def parse_failing_inputs(log_file_path):
    """Parse the failing inputs from the log file."""
    failing_inputs = []
    
    with open(log_file_path, 'r') as f:
        content = f.read()
    
    # Regular expression to match the failing input lines
    pattern = r'Failing input \(big-endian\) = (0x[0-9a-fA-F]{16}):([0-9a-fA-F]{16}):([0-9a-fA-F]{16}):([0-9a-fA-F]{16})'
    
    matches = re.findall(pattern, content)
    
    for match in matches:
        # Convert big-endian hex strings to little-endian uint64_t array
        # The format is: limb3:limb2:limb1:limb0 (big-endian)
        # We need to store as [limb0, limb1, limb2, limb3] (little-endian)
        limb3 = int(match[0], 16)  # Most significant
        limb2 = int(match[1], 16)
        limb1 = int(match[2], 16)
        limb0 = int(match[3], 16)  # Least significant
        
        failing_inputs.append([limb0, limb1, limb2, limb3])
    
    return failing_inputs

def generate_header_file(failing_inputs, output_path):
    """Generate the C header file with the test data."""
    
    header_content = f"""/*
 * Generated header file containing failing test cases
 * Auto-generated from more_failures.txt
 * Total test cases: {len(failing_inputs)}
 */

#ifndef FAILING_TEST_CASES_H
#define FAILING_TEST_CASES_H

#include <stdint.h>

#define NUM_FAILING_TEST_CASES {len(failing_inputs)}

/* Array of failing test inputs (256-bit numbers as 4x64-bit limbs in little-endian) */
static const uint64_t failing_test_cases[NUM_FAILING_TEST_CASES][4] = {{
"""
    
    for i, limbs in enumerate(failing_inputs):
        header_content += f"    {{ 0x{limbs[0]:016x}ULL, 0x{limbs[1]:016x}ULL, 0x{limbs[2]:016x}ULL, 0x{limbs[3]:016x}ULL }}"
        if i < len(failing_inputs) - 1:
            header_content += ","
        header_content += f"  // Test case {i}\n"
    
    header_content += """};

#endif /* FAILING_TEST_CASES_H */
"""
    
    with open(output_path, 'w') as f:
        f.write(header_content)

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    log_file_path = os.path.join(script_dir, 'more_failures.txt')
    output_path = os.path.join(script_dir, 'failing_test_cases.h')
    
    if not os.path.exists(log_file_path):
        print(f"Error: {log_file_path} not found!")
        sys.exit(1)
    
    print(f"Parsing failing inputs from {log_file_path}...")
    failing_inputs = parse_failing_inputs(log_file_path)
    print(f"Found {len(failing_inputs)} failing test cases")
    
    print(f"Generating header file {output_path}...")
    generate_header_file(failing_inputs, output_path)
    print(f"Header file generated successfully!")
    
    # Print first few entries for verification
    print("\nFirst 3 test cases:")
    for i in range(min(3, len(failing_inputs))):
        limbs = failing_inputs[i]
        print(f"  Test {i}: [0x{limbs[0]:016x}, 0x{limbs[1]:016x}, 0x{limbs[2]:016x}, 0x{limbs[3]:016x}]")

if __name__ == "__main__":
    main()
