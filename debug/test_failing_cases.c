#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include <string.h>
#include "failing_test_cases.h"

// External assembly function
extern void inverse(uint64_t inv[static 4], uint64_t x[static 4]);

// Helper functions from the original driver.c
void uint64k_from_mpz(uint64_t *dst, size_t k, const mpz_t src)
{
    /* Clear unwritten high bits to avoid residual old values */
    for (size_t i = 0; i < k; ++i) dst[i] = 0;

    mpz_export(dst,        /* rop  → destination array        */
               NULL,       /* countp → can pass NULL          */
               -1,         /* order  → -1 = LSW first         */
               sizeof(uint64_t), /* size → 8 bytes per word */
               0,          /* endian → 0 = native byte-order  */
               0,          /* nails  → 0 = no nail bits       */
               src);       /* op    → source mpz               */
}

/* k×64-bit little-endian array → mpz */
void mpz_from_uint64k(mpz_t dst, size_t k, const uint64_t *src)
{
    mpz_import(dst,        /* rop   → destination mpz          */
               k,          /* count → k words                  */
               -1,         /* order → -1 = LSW first          */
               sizeof(uint64_t), /* size → 8 bytes per word */
               0,          /* endian → 0 = native byte-order  */
               0,          /* nails  → 0 = no nail bits       */
               src);       /* op     → source array            */
}

// Function to print a 256-bit number as hex limbs
void print_limbs(const uint64_t limbs[4], const char* prefix)
{
    printf("%s[0x%016llx, 0x%016llx, 0x%016llx, 0x%016llx]\n", 
           prefix, limbs[0], limbs[1], limbs[2], limbs[3]);
}

// Function to print GMP number in hex with a reasonable width
void print_gmp_hex(const mpz_t num, const char* prefix)
{
    char *hex_str = mpz_get_str(NULL, 16, num);
    printf("%s0x%s\n", prefix, hex_str);
    free(hex_str);
}

int main(int argc, char const *argv[])
{
    FILE *output_file = fopen("test_results.log", "w");
    if (!output_file) {
        fprintf(stderr, "Error: Cannot create output file test_results.log\n");
        return 1;
    }
    
    // Initialize GMP variables
    mpz_t mpX, mpInv, mpCorrectInv, mpP;
    mpz_init(mpX);
    mpz_init(mpInv);
    mpz_init(mpCorrectInv);
    mpz_init(mpP);
    
    // Set up the modulus: p = 2^255 - 19 (Curve25519 prime)
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19);
    
    printf("Testing %d failing cases against inverse_4.s...\n", NUM_FAILING_TEST_CASES);
    fprintf(output_file, "Test Results for inverse_4.s\n");
    fprintf(output_file, "=============================\n");
    fprintf(output_file, "Modulus p = 2^255 - 19\n\n");
    
    int total_failures = 0;
    
    for (int test_case = 0; test_case < NUM_FAILING_TEST_CASES; test_case++) {
        // Get the test input
        uint64_t x[4];
        memcpy(x, failing_test_cases[test_case], sizeof(x));
        
        // Convert to GMP for correct inverse calculation
        mpz_from_uint64k(mpX, 4, x);
        
        // Skip if x is 0 or not coprime with p
        if (mpz_cmp_ui(mpX, 0) == 0) {
            fprintf(output_file, "Test case %d: SKIPPED (x = 0)\n", test_case);
            continue;
        }
        
        mpz_t gcd;
        mpz_init(gcd);
        mpz_gcd(gcd, mpX, mpP);
        if (mpz_cmp_ui(gcd, 1) != 0) {
            fprintf(output_file, "Test case %d: SKIPPED (gcd(x, p) != 1)\n", test_case);
            mpz_clear(gcd);
            continue;
        }
        mpz_clear(gcd);
        
        // Calculate correct inverse using GMP
        int invert_result = mpz_invert(mpCorrectInv, mpX, mpP);
        if (!invert_result) {
            fprintf(output_file, "Test case %d: SKIPPED (no inverse exists)\n", test_case);
            continue;
        }
        
        // Call our assembly function
        uint64_t inv[4] = {0};
        inverse(inv, x);
        
        // Convert assembly result to GMP
        mpz_from_uint64k(mpInv, 4, inv);
        
        // Compare results
        int is_correct = (mpz_cmp(mpInv, mpCorrectInv) == 0);
        
        // Log the result
        fprintf(output_file, "Test case %d: %s\n", test_case, is_correct ? "PASS" : "FAIL");
        fprintf(output_file, "  Input (limbs):    [0x%016llx, 0x%016llx, 0x%016llx, 0x%016llx]\n", 
                x[0], x[1], x[2], x[3]);
        
        if (!is_correct) {
            total_failures++;
            fprintf(output_file, "  Expected (limbs): ");
            
            // Convert correct result back to limbs for comparison
            uint64_t correct_limbs[4] = {0};
            uint64k_from_mpz(correct_limbs, 4, mpCorrectInv);
            fprintf(output_file, "[0x%016llx, 0x%016llx, 0x%016llx, 0x%016llx]\n", 
                    correct_limbs[0], correct_limbs[1], correct_limbs[2], correct_limbs[3]);
            
            fprintf(output_file, "  Actual (limbs):   [0x%016llx, 0x%016llx, 0x%016llx, 0x%016llx]\n", 
                    inv[0], inv[1], inv[2], inv[3]);
            
            // Print the differences
            fprintf(output_file, "  Difference:       [");
            for (int i = 0; i < 4; i++) {
                uint64_t diff = inv[i] ^ correct_limbs[i];  // XOR to show bit differences
                fprintf(output_file, "0x%016llx", diff);
                if (i < 3) fprintf(output_file, ", ");
            }
            fprintf(output_file, "]\n");
            
            // Also print in decimal for easier analysis
            char *x_str = mpz_get_str(NULL, 10, mpX);
            char *expected_str = mpz_get_str(NULL, 10, mpCorrectInv);
            char *actual_str = mpz_get_str(NULL, 10, mpInv);
            
            fprintf(output_file, "  Input (decimal):    %s\n", x_str);
            fprintf(output_file, "  Expected (decimal): %s\n", expected_str);
            fprintf(output_file, "  Actual (decimal):   %s\n", actual_str);
            
            free(x_str);
            free(expected_str);
            free(actual_str);
        }
        fprintf(output_file, "\n");
        
        // Print progress to console
        if ((test_case + 1) % 100 == 0 || test_case + 1 == NUM_FAILING_TEST_CASES) {
            printf("Processed %d/%d test cases, %d failures so far\n", 
                   test_case + 1, NUM_FAILING_TEST_CASES, total_failures);
        }
    }
    
    // Summary
    printf("\nTest completed!\n");
    printf("Total test cases: %d\n", NUM_FAILING_TEST_CASES);
    printf("Total failures: %d\n", total_failures);
    printf("Success rate: %.2f%%\n", 
           NUM_FAILING_TEST_CASES > 0 ? 
           100.0 * (NUM_FAILING_TEST_CASES - total_failures) / NUM_FAILING_TEST_CASES : 0.0);
    
    fprintf(output_file, "SUMMARY\n");
    fprintf(output_file, "=======\n");
    fprintf(output_file, "Total test cases: %d\n", NUM_FAILING_TEST_CASES);
    fprintf(output_file, "Total failures: %d\n", total_failures);
    fprintf(output_file, "Success rate: %.2f%%\n", 
            NUM_FAILING_TEST_CASES > 0 ? 
            100.0 * (NUM_FAILING_TEST_CASES - total_failures) / NUM_FAILING_TEST_CASES : 0.0);
    
    // Cleanup
    mpz_clear(mpX);
    mpz_clear(mpInv);
    mpz_clear(mpCorrectInv);
    mpz_clear(mpP);
    fclose(output_file);
    
    printf("Detailed results written to test_results.log\n");
    
    return 0;
}
