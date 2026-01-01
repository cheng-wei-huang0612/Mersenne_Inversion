#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

extern void inverse(uint64_t inv[static 4], uint64_t x[static 4]);

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
    mpz_t mpP, mpCorrectInv;
    mpz_init(mpP);
    mpz_init(mpCorrectInv);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19);


    //mpz_set_str(mpX, "20214871201774049636868342709964433550308093914181089952380808474176500195135", 10);
    //mpz_set_str(mpX, "18446744073709551617", 10);
    mpz_set_str(mpX, "6129982163463555433433388108601236734474956488734408704", 10);
    mpz_set_str(mpX, "0",10);
    // mpz_add(mpX, mpX, mpP);
    // mpz_set_str(mpX, "38305559724211951161727329354596991034635343649772960093117784332570715266771", 10);
    gmp_printf("x = %Zd\n", mpX);

    uint64_t x[4] = {0};
    uint64k_from_mpz(x, 4, mpX);
    uint64_t inv[4] = {0};
    inverse(inv, x);
    mpz_from_uint64k(mpInv, 4, inv);



    
    mpz_invert(mpCorrectInv, mpX, mpP);
    
    mpz_clear(mpP);
    
    printf("  x (in limbs) = [%llu, %llu, %llu, %llu]\n", x[0], x[1], x[2], x[3]);
    printf("  x (in limbs) = [%llx, %llx, %llx, %llx]\n", x[0], x[1], x[2], x[3]);
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
