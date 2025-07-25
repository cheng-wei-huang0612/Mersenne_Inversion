#include <stdio.h>
#include <stdint.h>
#include <gmp.h>

// External function declaration
extern void bignum_inv_p25519(uint64_t z[4], const uint64_t x[4]);

void print_limbs(const char* name, const uint64_t limbs[4]) {
    printf("%s (in limbs) = [%llu, %llu, %llu, %llu]\n", 
           name, limbs[0], limbs[1], limbs[2], limbs[3]);
    printf("%s (in limbs) = [%llx, %llx, %llx, %llx]\n", 
           name, limbs[0], limbs[1], limbs[2], limbs[3]);
}

void limbs_to_mpz(mpz_t result, const uint64_t limbs[4]) {
    mpz_set_ui(result, 0);
    for (int i = 3; i >= 0; i--) {
        mpz_mul_2exp(result, result, 64);
        mpz_add_ui(result, result, limbs[i]);
    }
}

void mpz_to_limbs(uint64_t limbs[4], const mpz_t value) {
    mpz_t temp;
    mpz_init(temp);
    mpz_set(temp, value);
    
    for (int i = 0; i < 4; i++) {
        limbs[i] = mpz_get_ui(temp);
        mpz_div_2exp(temp, temp, 64);
    }
    
    mpz_clear(temp);
}


void uint64k_from_mpz(uint64_t *dst, size_t k, const mpz_t src)
{
    /* 清空未覆寫的高位，避免殘留舊值 */
    for (size_t i = 0; i < k; ++i) dst[i] = 0;

    mpz_export(dst,        /* rop  → 目標陣列               */
               NULL,       /* countp → 不需要可傳 NULL      */
               -1,         /* order  → -1 = LSW 在前        */
               sizeof(uint64_t), /* size → 8 bytes per word */
               0,          /* endian → 0 = native byte-order */
               0,          /* nails  → 0 = 不保留 nail bits */
               src);       /* op    → 來源 mpz              */
}

/* k×64-bit little-endian 陣列 → mpz */
void mpz_from_uint64k(mpz_t dst, size_t k, const uint64_t *src)
{
    mpz_import(dst,        /* rop   → 目標 mpz              */
               k,          /* count → k 個 words            */
               -1,         /* order → -1 = LSW 在前         */
               sizeof(uint64_t), /* size → 8 bytes per word */
               0,          /* endian → 0 = native byte-order */
               0,          /* nails  → 0 = 不保留 nail bits */
               src);       /* op     → 來源陣列             */
}

int main(int argc, char const *argv[])
{
    
    
    mpz_t mpX, mpInv;
    mpz_init(mpX);
    mpz_init(mpInv);


    mpz_set_str(mpX, "18446744073709551617", 10);
    uint64_t x[4] = {0};
    uint64k_from_mpz(x, 4, mpX);
    uint64_t inv[4] = {0};
    bignum_inv_p25519(inv, x);
    mpz_from_uint64k(mpInv, 4, inv);



    mpz_t mpP, mpCorrectInv;
    mpz_init(mpP);
    mpz_init(mpCorrectInv);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19);
    
    mpz_invert(mpCorrectInv, mpX, mpP);
    
    mpz_clear(mpP);
    
    printf("  x (in limbs) = [%llu, %llu, %llu, %llu]\n", x[0], x[1], x[2], x[3]);
    printf("inv (in limbs) = [%llu, %llu, %llu, %llu]\n", inv[0], inv[1], inv[2], inv[3]);
    printf("inv (in limbs) = [%lld, %lld, %lld, %lld]\n", inv[0], inv[1], inv[2], inv[3]);
    printf("inv (in limbs) = [%llx, %llx, %llx, %llx]\n", inv[0], inv[1], inv[2], inv[3]);

    gmp_printf("x = %Zd\n", mpX);
    gmp_printf("inv = %Zd\n", mpInv);
    gmp_printf("inv (from inverse function) = %Zd\n", mpCorrectInv);

    if (mpz_cmp(mpInv, mpCorrectInv) == 0) {
        printf("PASS\n");
    } else {
        printf("FAIL\n");
    }

    return 0;
}
