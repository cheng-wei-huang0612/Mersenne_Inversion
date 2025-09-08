# Debug Makefile for Mersenne Inversion Testing
# This makefile automates the process of converting failure logs and testing assembly code

# Directories and paths
DEBUG_DIR = .
SRC_DIR = ../src
ASM_DIR = $(SRC_DIR)/opt
INCLUDE_DIR = $(SRC_DIR)/include

# Source files
PYTHON_CONVERTER = convert_failures_to_header.py
LOG_FILE = more_failures.txt
HEADER_FILE = failing_test_cases.h
C_TEST_PROGRAM = test_failing_cases.c
ASM_INVERSE = $(ASM_DIR)/inverse_4_a72.s
SNAP_C = $(SRC_DIR)/snap.c
SNAP_INC = $(INCLUDE_DIR)/snap.inc

# Output files
TEST_BINARY = test_failing_cases
RESULTS_LOG = test_results.log

# Compiler flags
CFLAGS = -O2 -std=c11 -I$(INCLUDE_DIR) -I$(DEBUG_DIR)
LDFLAGS = -lgmp

# Python interpreter
PYTHON = python3

.PHONY: all clean test run help

# Default target
all: run

# Convert log file to header
$(HEADER_FILE): $(LOG_FILE) $(PYTHON_CONVERTER)
	@echo "Converting failure log to C header file..."
	$(PYTHON) $(PYTHON_CONVERTER)
	@echo "Header file $(HEADER_FILE) generated successfully!"

# Build the test program
$(TEST_BINARY): $(C_TEST_PROGRAM) $(HEADER_FILE) $(ASM_INVERSE) $(SNAP_C)
	@echo "Building test program..."
	@if [ ! -f "$(ASM_INVERSE)" ]; then \
		echo "Error: Assembly file $(ASM_INVERSE) not found!"; \
		echo "Please run 'make generate4' in the src directory first."; \
		exit 1; \
	fi
	@if [ ! -f "$(SNAP_INC)" ]; then \
		echo "Error: Include file $(SNAP_INC) not found!"; \
		echo "Please run 'make generate4' in the src directory first."; \
		exit 1; \
	fi
	gcc $(CFLAGS) $(C_TEST_PROGRAM) $(ASM_INVERSE) $(SNAP_C) $(LDFLAGS) -o $(TEST_BINARY)
	@echo "Test program built successfully!"

# Build target (same as test binary)
build: $(TEST_BINARY)

# Test target (build the binary)
test: $(TEST_BINARY)

# Run the test and generate results
run: $(TEST_BINARY)
	@echo "Running tests on failing cases..."
	@echo "This may take a while depending on the number of test cases..."
	./$(TEST_BINARY)
	@echo ""
	@echo "Test completed! Check $(RESULTS_LOG) for detailed results."
	@if [ -f "$(RESULTS_LOG)" ]; then \
		echo ""; \
		echo "=== SUMMARY FROM $(RESULTS_LOG) ==="; \
		tail -n 10 $(RESULTS_LOG); \
	fi

# Quick run that shows only summary
quick: $(TEST_BINARY)
	@echo "Running quick test (summary only)..."
	./$(TEST_BINARY) | grep -E "(Processed|Test completed|Total|Success rate)"

# Generate dependencies (if source files are missing)
deps:
	@echo "Checking dependencies..."
	@if [ ! -f "$(ASM_INVERSE)" ]; then \
		echo "Generating assembly files..."; \
		cd $(SRC_DIR) && make generate4; \
	fi

# Full pipeline: dependencies + convert + test + run
full: deps $(HEADER_FILE) $(TEST_BINARY) run

# Analyze results (show failures only)
analyze: $(RESULTS_LOG)
	@echo "=== ANALYSIS OF FAILURES ==="
	@if [ -f "$(RESULTS_LOG)" ]; then \
		echo "Failure cases:"; \
		grep -n "FAIL" $(RESULTS_LOG) | head -20; \
		echo ""; \
		echo "Total failures:"; \
		grep "Total failures:" $(RESULTS_LOG); \
	else \
		echo "No results file found. Run 'make run' first."; \
	fi

# Show test statistics
stats: $(RESULTS_LOG)
	@if [ -f "$(RESULTS_LOG)" ]; then \
		echo "=== TEST STATISTICS ==="; \
		echo -n "Total cases: "; grep "Total test cases:" $(RESULTS_LOG) | cut -d: -f2; \
		echo -n "Failures: "; grep "Total failures:" $(RESULTS_LOG) | cut -d: -f2; \
		echo -n "Success rate: "; grep "Success rate:" $(RESULTS_LOG) | cut -d: -f2; \
		echo ""; \
		echo "First 5 failing cases:"; \
		grep -A 1 "FAIL" $(RESULTS_LOG) | head -15; \
	else \
		echo "No results file found. Run 'make run' first."; \
	fi

# Verify the header file was generated correctly
verify-header: $(HEADER_FILE)
	@echo "=== HEADER FILE VERIFICATION ==="
	@echo "Header file: $(HEADER_FILE)"
	@if [ -f "$(HEADER_FILE)" ]; then \
		echo -n "Number of test cases defined: "; \
		grep "NUM_FAILING_TEST_CASES" $(HEADER_FILE) | grep -o '[0-9]\+'; \
		echo "First test case:"; \
		grep -A 1 "failing_test_cases\[" $(HEADER_FILE) | head -2; \
		echo "Last test case:"; \
		tail -n 5 $(HEADER_FILE) | head -2; \
	else \
		echo "Header file not found!"; \
	fi

# Clean all generated files
clean:
	@echo "Cleaning debug directory..."
	rm -f $(HEADER_FILE)
	rm -f $(TEST_BINARY)
	rm -f $(RESULTS_LOG)
	rm -f *.o *.out
	@echo "Clean completed!"

# Clean only results (keep binary)
clean-results:
	rm -f $(RESULTS_LOG)

# Check if all required files exist
check:
	@echo "=== DEPENDENCY CHECK ==="
	@echo -n "Log file $(LOG_FILE): "; [ -f "$(LOG_FILE)" ] && echo "✓ EXISTS" || echo "✗ MISSING"
	@echo -n "Python converter $(PYTHON_CONVERTER): "; [ -f "$(PYTHON_CONVERTER)" ] && echo "✓ EXISTS" || echo "✗ MISSING"
	@echo -n "C test program $(C_TEST_PROGRAM): "; [ -f "$(C_TEST_PROGRAM)" ] && echo "✓ EXISTS" || echo "✗ MISSING"
	@echo -n "Assembly file $(ASM_INVERSE): "; [ -f "$(ASM_INVERSE)" ] && echo "✓ EXISTS" || echo "✗ MISSING (run 'make deps')"
	@echo -n "Snap include $(SNAP_INC): "; [ -f "$(SNAP_INC)" ] && echo "✓ EXISTS" || echo "✗ MISSING (run 'make deps')"
	@echo -n "Snap C file $(SNAP_C): "; [ -f "$(SNAP_C)" ] && echo "✓ EXISTS" || echo "✗ MISSING"
	@echo ""
	@echo "=== GENERATED FILES ==="
	@echo -n "Header file $(HEADER_FILE): "; [ -f "$(HEADER_FILE)" ] && echo "✓ EXISTS" || echo "- NOT GENERATED YET"
	@echo -n "Test binary $(TEST_BINARY): "; [ -f "$(TEST_BINARY)" ] && echo "✓ EXISTS" || echo "- NOT BUILT YET"
	@echo -n "Results log $(RESULTS_LOG): "; [ -f "$(RESULTS_LOG)" ] && echo "✓ EXISTS" || echo "- NOT GENERATED YET"

# Help target
help:
	@echo "Debug Makefile for Mersenne Inversion Testing"
	@echo "=============================================="
	@echo ""
	@echo "MAIN TARGETS:"
	@echo "  all, run      - Complete pipeline: convert log → build → test → results"
	@echo "  full          - Full pipeline including dependency checking"
	@echo "  quick         - Run test but show only summary"
	@echo ""
	@echo "STEP-BY-STEP TARGETS:"
	@echo "  deps          - Generate missing assembly/include files from src/"
	@echo "  $(HEADER_FILE) - Convert $(LOG_FILE) to C header"
	@echo "  build, test   - Build the test program"
	@echo ""
	@echo "ANALYSIS TARGETS:"
	@echo "  analyze       - Show failure analysis from results"
	@echo "  stats         - Show test statistics and first few failures"
	@echo "  verify-header - Verify the generated header file"
	@echo ""
	@echo "UTILITY TARGETS:"
	@echo "  check         - Check if all required files exist"
	@echo "  clean         - Remove all generated files"
	@echo "  clean-results - Remove only test results (keep binary)"
	@echo "  help          - Show this help"
	@echo ""
	@echo "WORKFLOW:"
	@echo "  1. Place your failure log in $(LOG_FILE)"
	@echo "  2. Run 'make' or 'make run' to execute the complete pipeline"
	@echo "  3. Check $(RESULTS_LOG) for detailed results"
	@echo "  4. Use 'make analyze' or 'make stats' for failure analysis"
	@echo ""
	@echo "REQUIREMENTS:"
	@echo "  - GCC with AArch64 support"
	@echo "  - GMP library (libgmp-dev)"
	@echo "  - Python 3"
	@echo "  - Assembly files generated (run 'make deps' if missing)"
