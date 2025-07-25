#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <gmp.h>

#define MASK2p30m1 0x3FFFFFFF
#define BIGNUM_LIMB 9
// Function to print uint64_t array in 2^64 radix
void print_radix64(const uint64_t arr[], int k) {
    printf("[");
    for (int i = 0; i < k; i++) {
        printf("%llu", (unsigned long long)arr[i]);
        if (i != k - 1) printf(", ");
    }
    printf("]");
}

// Function to print int32_t array in 2^30 radix
void print_radix30(const int32_t arr[], int k) {
    printf("[");
    for (int i = 0; i < k; i++) {
        printf("%08x", arr[i]);
        if (i != k - 1) printf(", ");
    }
    printf("]");
}

void divstep_multiple(int64_t *pFUV, int64_t *pGRS, int64_t *pDELTA, int loop_count){
    int64_t m1, ff;
    int64_t FUV = *pFUV;
    int64_t GRS = *pGRS;
    int64_t DELTA = *pDELTA;

    for (size_t i = 0; i < loop_count; i++)
    {
        m1 = DELTA - 1;
        if ((GRS & 1) == 1) {
            ff = FUV;
        } else {
            ff = 0;
        }
        
        int64_t rotated_GRS = ((uint64_t)GRS << 63) | ((uint64_t)GRS >> 1);
        int64_t tst_result = m1 & rotated_GRS;
        
        // DELTA = m1 if N=0 else -DELTA
        if (tst_result >= 0) {  // N flag (negative bit) is clear
            DELTA = m1;
        } else {
            DELTA = -DELTA;
        }
        
        // FUV = GRS if N=1 else FUV
        if (tst_result < 0) {  // N flag is set
            FUV = GRS;
        }
        
        // ff = ff if N=0 else -ff
        if (tst_result < 0) {  // negative check for ff
            ff = -ff;
        }
        
        // GRS = (GRS + ff) >> 1 (算術位移)
        GRS = (GRS + ff) >> 1;
    }

    *pFUV = FUV;
    *pGRS = GRS;
    *pDELTA = DELTA;
}

void divstepx20(int64_t *FUV, int64_t *GRS, int64_t *delta) {
    // Perform 20 iterations of divstep_multiple
    divstep_multiple(FUV, GRS, delta, 20);
}

// Function to extract uu, vv, rr, ss from FUV and GRS
void extraction(int64_t *FUV, int64_t *GRS, int64_t uuvvrrss[4]) {
    int64_t uu, vv, rr, ss;
    vv = *FUV + 0x20000100000ULL; // 2^20 + 2^41
    vv = (int64_t)(vv >> 42);

    uu = *FUV + 0x100000ULL; // 2^20
    uu = (uint64_t)(uu << 22);
    uu = (int64_t)(uu >> 43);

    ss = *GRS + 0x20000100000ULL; // 2^20 + 2^41
    ss = (int64_t)(ss >> 42);

    rr = *GRS + 0x100000ULL; // 2^20
    rr = (uint64_t)(rr << 22);
    rr = (int64_t)(rr >> 43);

    uuvvrrss[0] = uu;
    uuvvrrss[1] = vv;
    uuvvrrss[2] = rr;
    uuvvrrss[3] = ss;
}

void update_fg_long(int64_t *f, int64_t *g, int64_t *uuvvrrss){

    int64_t f_low = *f & MASK2p30m1;
    int64_t g_low = *g & MASK2p30m1;
    int64_t f_high = (*f >> 30) ;
    int64_t g_high = (*g >> 30) ;
    
    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];  
    
    int64_t prod = 0;
    prod = (f_low * uu) + (g_low * vv);
    prod = prod >> 20;
    prod += ((f_high * uu) + (g_high * vv))<<10;
    *f = prod;
    
    prod = 0;
    prod = (f_low * rr) + (g_low * ss);
    prod = prod >> 20;
    prod += ((f_high * rr) + (g_high * ss))<<10;
    *g = prod;
    
}
void update_fg_trunc(int64_t *f, int64_t *g, int64_t *uuvvrrss) {
    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];

    int64_t f_new = (*f * uu + *g * vv) >> 20;
    int64_t g_new = (*f * rr + *g * ss) >> 20;

    *f = f_new;
    *g = g_new;
}

void update_uuvvrrss(int64_t *uuvvrrss, int64_t *uvrs) {
    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];
    int64_t u = uvrs[0];
    int64_t v = uvrs[1];
    int64_t r = uvrs[2];
    int64_t s = uvrs[3];

    int64_t new_uu = u * uu + v * rr;
    int64_t new_rr = r * uu + s * rr;
    int64_t new_vv = u * vv + v * ss;
    int64_t new_ss = r * vv + s * ss;

    uuvvrrss[0] = new_uu;
    uuvvrrss[1] = new_vv;
    uuvvrrss[2] = new_rr;
    uuvvrrss[3] = new_ss;
}



void mpz_from_30k(mpz_t mpF, int32_t *F, int k) {
    for (int i = 0; i < k - 1; i++) {

        // Assert that the highest two bits of F[i] are zero
        // (i.e., F[i] fits in 30 bits)
        if ((F[i] & (~MASK2p30m1)) != 0) {
            fprintf(stderr, "Assertion failed: F[%d] has nonzero bits above bit 29\n", i);
            for (size_t j = 0; j < k; j++)
            {
                printf("F[%d] = %d\n", j, F[j]);
            }
            abort();
        }
    }
    mpz_set_si(mpF, F[k-1]);
    for (int i = k-2; i >= 0; i--) {
        mpz_mul_2exp(mpF, mpF, 30);
        mpz_add_ui(mpF, mpF, (uint32_t)F[i]);
    }

}


void mpz_to_30k(int32_t *F, const mpz_t mpF, int k)
{
    mpz_t tmp, rem;
    mpz_init_set(tmp, mpF);   /* tmp ← mpF 的可變拷貝          */
    mpz_init(rem);            /* 用來存 2^30 餘數               */

    /* 逐一抽出低端 30bit limbs —— 對應 mpz_from_30k 的迴圈 */
    for (int i = 0; i < k - 1; i++) {
        /* rem = tmp mod 2^30 ，範圍保證 0 ≤ rem < 2^30      */
        mpz_fdiv_r_2exp(rem, tmp, 30);
        uint32_t limb = (uint32_t)mpz_get_ui(rem);

        /* 應該永遠只佔 30 bit；若超出代表 k 不夠大或溢位   */
        if (limb & ~MASK2p30m1) {
            fprintf(stderr, "Limb overflow at index %d\n", i);
            abort();
        }
        F[i] = (int32_t)limb;

        /* tmp = floor(tmp / 2^30) —— 右移 30 位進入下一輪   */
        mpz_fdiv_q_2exp(tmp, tmp, 30);
    }

    /* 迴圈結束後剩下最高 limb，可帶正負號                 */
    if (!mpz_fits_sint_p(tmp)) {
        fprintf(stderr, "Top limb does not fit into 32-bit signed int\n");
        abort();
    }
    F[k - 1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(tmp);
    mpz_clear(rem);
}

void uint64k_from_mpz(uint64_t *dst, size_t k, const mpz_t src)
{
    mpz_t tmp, rem;
    mpz_init_set(tmp, src);   /* tmp ← src 的可變拷貝          */
    mpz_init(rem);            /* 用來存 2^30 餘數               */

    /* 逐一抽出低端 30bit limbs —— 對應 mpz_from_30k 的迴圈 */
    for (int i = 0; i < k; i++) {
        /* rem = tmp mod 2^64 ，範圍保證 0 ≤ rem < 2^64      */
        mpz_fdiv_r_2exp(rem, tmp, 64);
        uint64_t limb = (uint64_t)mpz_get_ui(rem);


        dst[i] = (int64_t)limb;

        /* tmp = floor(tmp / 2^64) —— 右移 64 位進入下一輪   */
        mpz_fdiv_q_2exp(tmp, tmp, 64);
    }


    mpz_clear(tmp);
    mpz_clear(rem);
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



void update_FG(int32_t *F, int32_t *G, int64_t *uuvvrrss) {
    mpz_t mpF, mpG, mpUU, mpVV, mpRR, mpSS;
    mpz_inits(mpF, mpG, mpUU, mpVV, mpRR, mpSS, NULL);

    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];

    mpz_set_si(mpUU, uu);
    mpz_set_si(mpVV, vv);
    mpz_set_si(mpRR, rr);
    mpz_set_si(mpSS, ss);

    mpz_from_30k(mpF, F, BIGNUM_LIMB);
    mpz_from_30k(mpG, G, BIGNUM_LIMB);

    mpz_t tmpF, tmpG;
    mpz_inits(tmpF, tmpG, NULL);

    // tmpF = uu * mpF + vv * mpG
    mpz_mul(tmpF, mpUU, mpF);
    mpz_addmul(tmpF, mpVV, mpG);

    // tmpG = rr * mpF + ss * mpG
    mpz_mul(tmpG, mpRR, mpF);
    mpz_addmul(tmpG, mpSS, mpG);

    mpz_fdiv_q_2exp(tmpF, tmpF, 60);
    mpz_fdiv_q_2exp(tmpG, tmpG, 60);

    // Copy results back
    mpz_set(mpF, tmpF);
    mpz_set(mpG, tmpG);

    mpz_clears(tmpF, tmpG, NULL);

    mpz_to_30k(F, mpF, BIGNUM_LIMB);
    mpz_to_30k(G, mpG, BIGNUM_LIMB);

    mpz_clears(mpF, mpG, mpUU, mpVV, mpRR, mpSS, NULL);
}




void update_VS(int32_t *V, int32_t *S, int64_t *uuvvrrss){
    mpz_t mpV, mpS, mpUU, mpVV, mpRR, mpSS, mpP;
    mpz_inits(mpV, mpS, mpUU, mpVV, mpRR, mpSS, mpP, NULL);

    //mpz_from_30k(mpP, P, BIGNUM_LIMB);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19); // P = 2^255 - 19


    // Compute 2^-60 mod P
    mpz_t inv2_60;
    mpz_init(inv2_60);
    mpz_ui_pow_ui(inv2_60, 2, 60);      // inv2_60 = 2^60
    mpz_invert(inv2_60, inv2_60, mpP);  // inv2_60 = (2^60)^(-1) mod P
    // Now inv2_60 holds 2^-60 mod P

    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];

    mpz_set_si(mpUU, uu);
    mpz_set_si(mpVV, vv);
    mpz_set_si(mpRR, rr);
    mpz_set_si(mpSS, ss);

    mpz_from_30k(mpV, V, BIGNUM_LIMB);
    mpz_from_30k(mpS, S, BIGNUM_LIMB);
    
    mpz_t tmpV, tmpS;
    mpz_inits(tmpV, tmpS, NULL);
    
    // tmpV = uu * mpV + vv * mpS
    mpz_mul(tmpV, mpUU, mpV);
    mpz_addmul(tmpV, mpVV, mpS);
    mpz_mul(tmpV, tmpV, inv2_60);
    
    // tmpS = rr * mpV + ss * mpS
    mpz_mul(tmpS, mpRR, mpV);
    mpz_addmul(tmpS, mpSS, mpS);
    mpz_mul(tmpS, tmpS, inv2_60);
    
    mpz_mod(mpV, tmpV, mpP);


    mpz_mod(mpS, tmpS, mpP);

    mpz_clears(tmpV, tmpS, NULL);

    mpz_to_30k(V, mpV, BIGNUM_LIMB);
    mpz_to_30k(S, mpS, BIGNUM_LIMB);

    mpz_clears(mpV, mpS, mpUU, mpVV, mpRR, mpSS, NULL);
}



void inverse(uint64_t inv[static 4], uint64_t x[static 4]){
    int64_t f = -19;
    int64_t g = x[0];
    int64_t delta = 1;
    int64_t FUV, GRS;
    int64_t uuvvrrss[4];
    int64_t uvrs[4];


    int32_t F[BIGNUM_LIMB] = {0};
    int32_t G[BIGNUM_LIMB] = {0};
    int32_t V[BIGNUM_LIMB] = {0};
    int32_t S[BIGNUM_LIMB] = {0};
    S[0] = 1;


    // radix conversion
    mpz_t mpF, mpG;
    mpz_init(mpF);
    mpz_init(mpG);
    mpz_from_uint64k(mpG, 4, x);
    mpz_to_30k(G, mpG, BIGNUM_LIMB);
    F[0] = MASK2p30m1-18; // 2^30 - 19 = 1073741805
    for (size_t i = 1; i < 8; i++)
    {
        F[i] = MASK2p30m1;
    }
    F[8] = 32767; // 2^15 - 1




    // check if F is 2^255 - 19
    {
    mpz_from_30k(mpF, F, BIGNUM_LIMB);
    mpz_t mpF_check;
    mpz_init(mpF_check);
    mpz_ui_pow_ui(mpF_check, 2, 255);
    mpz_sub_ui(mpF_check, mpF_check, 19);
    if (mpz_cmp(mpF, mpF_check) != 0) {
        fprintf(stderr, "Assertion failed: mpF != 2^255 - 19\n");
        abort();
    }
    mpz_clear(mpF_check);
    }


    
    
    // f = f & ((1ULL << 60) - 1);
    // g = g & ((1ULL << 60) - 1);


                                                                    printf("f = %llu\n", f);
                                                                    printf("g = %llu\n", g);
    FUV = (f & 1048575) - ( (int64_t) 1 << 41 );
    GRS = (g & 1048575) - ( (int64_t) 1 << 62 );
                                                                    printf("Before First  Divstep, FUV = %llu\n", FUV);
                                                                    printf("Before First  Divstep, GRS = %llu\n", GRS);
    divstepx20(&FUV, &GRS, &delta);
                                                                    printf("After  First Divstep FUV = %llu\n", FUV);
                                                                    printf("After  First Divstep GRS = %llu\n", GRS);
    extraction(&FUV, &GRS, uuvvrrss);
    update_fg_trunc(&f, &g, uuvvrrss);


                                                                    printf("uu = %lld\n", uuvvrrss[0]);
                                                                    printf("vv = %lld\n", uuvvrrss[1]);
                                                                    printf("rr = %lld\n", uuvvrrss[2]);
                                                                    printf("ss = %lld\n", uuvvrrss[3]);

                                                                    printf("f mod 2p20  = %llu\n", f & 1048575);
                                                                    printf("g mod 2p20  = %llu\n", g & 1048575);
            FUV = (f & 1048575) - ( (int64_t) 1 << 41 );
            GRS = (g & 1048575) - ( (int64_t) 1 << 62 );
                                                                    printf("Before Second Divstep, FUV = %lld\n", FUV);
                                                                    printf("Before Second Divstep, GRS = %lld\n", GRS);
            divstepx20(&FUV, &GRS, &delta);
                                                                    printf("After Second Divstep, FUV = %lld\n", FUV);
                                                                    printf("After Second Divstep, GRS = %lld\n", GRS);
            extraction(&FUV, &GRS, uvrs);
            update_fg_trunc(&f, &g, uvrs);
            update_uuvvrrss(uuvvrrss, uvrs);

                                                                    printf("uu = %lld\n", uuvvrrss[0]);
                                                                    printf("vv = %lld\n", uuvvrrss[1]);
                                                                    printf("rr = %lld\n", uuvvrrss[2]);
                                                                    printf("ss = %lld\n", uuvvrrss[3]);

                                                                    printf("f mod 2p20  = %llu\n", f & 1048575);
                                                                    printf("g mod 2p20  = %llu\n", g & 1048575);
                    FUV = (f & 1048575) - ( (int64_t) 1 << 41 );
                    GRS = (g & 1048575) - ( (int64_t) 1 << 62 );


                                                                    printf("Before Second Divstep, FUV = %lld\n", FUV);
                                                                    printf("Before Second Divstep, GRS = %lld\n", GRS);
                    divstepx20(&FUV, &GRS, &delta);
                                                                    printf("After Second Divstep, FUV = %lld\n", FUV);
                                                                    printf("After Second Divstep, GRS = %lld\n", GRS);
                    extraction(&FUV, &GRS, uvrs);
                    update_uuvvrrss(uuvvrrss, uvrs);

                                                                    printf("uu = %llx\n", uuvvrrss[0]);
                                                                    printf("vv = %llx\n", uuvvrrss[1]);
                                                                    printf("rr = %llx\n", uuvvrrss[2]);
                                                                    printf("ss = %llx\n", uuvvrrss[3]);
        
{
    mpz_t mpF, mpG;
    mpz_init(mpF);
    mpz_init(mpG);
    uint64_t F64[4], G64[4];
    mpz_from_30k(mpF, F, BIGNUM_LIMB);
    mpz_from_30k(mpG, G, BIGNUM_LIMB);
    uint64k_from_mpz(F64, 4, mpF);
    uint64k_from_mpz(G64, 4, mpG);


    printf("before update: F = %llx, %llx, %llx, %llx\n", F64[0], F64[1], F64[2], F64[3]);
    printf("\n");

    printf("before update: G = %llx, %llx, %llx, %llx\n", G64[0], G64[1], G64[2], G64[3]);
    printf("\n");
}

    update_FG(F, G, uuvvrrss);
    update_VS(V, S, uuvvrrss);

{
    mpz_t mpF, mpG;
    mpz_init(mpF);
    mpz_init(mpG);
    uint64_t F64[4], G64[4];
    mpz_from_30k(mpF, F, BIGNUM_LIMB);
    mpz_from_30k(mpG, G, BIGNUM_LIMB);
    uint64k_from_mpz(F64, 4, mpF);
    uint64k_from_mpz(G64, 4, mpG);


    printf("after  update: F = %llx, %llx, %llx, %llx\n", F64[0], F64[1], F64[2], F64[3]);
    printf("\n");

    printf("after  update: G = %llx, %llx, %llx, %llx\n", G64[0], G64[1], G64[2], G64[3]);
    printf("\n");
}


    for (size_t loop_count = 0; loop_count < (10-1); loop_count++)
    {

        f = F[1];
        g = G[1];
        f = f << 30;
        g = g << 30;
        f += F[0];
        g += G[0];

                                                                    printf("f = %llu\n", f);
                                                                    printf("g = %llu\n", g);

        FUV = (f & 1048575) - ( (int64_t) 1 << 41 );
        GRS = (g & 1048575) - ( (int64_t) 1 << 62 );

        divstepx20(&FUV, &GRS, &delta);
        extraction(&FUV, &GRS, uuvvrrss);
        update_fg_trunc(&f, &g, uuvvrrss);


                FUV = (f & 1048575) - ( (int64_t) 1 << 41 );
                GRS = (g & 1048575) - ( (int64_t) 1 << 62 );


                divstepx20(&FUV, &GRS, &delta);
                extraction(&FUV, &GRS, uvrs);
                update_fg_trunc(&f, &g, uvrs);
                update_uuvvrrss(uuvvrrss, uvrs);


                        FUV = (f & 1048575) - ( (int64_t) 1 << 41 );
                        GRS = (g & 1048575) - ( (int64_t) 1 << 62 );


                        divstepx20(&FUV, &GRS, &delta);
                        extraction(&FUV, &GRS, uvrs);
                        update_uuvvrrss(uuvvrrss, uvrs);


        update_FG(F, G, uuvvrrss);
        update_VS(V, S, uuvvrrss);



    }

    mpz_t mpV;
    mpz_init(mpV);
    
    mpz_from_30k(mpV, V, BIGNUM_LIMB);
    gmp_printf("Final V = %Zd\n", mpV);
    
    int32_t signF = (F[0] << 2) >> 2;
    mpz_mul_si(mpV, mpV, signF); // V = -V
    gmp_printf("Final V = %Zd\n", mpV);
    
    mpz_t mpP;
    mpz_init(mpP);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19); // P = 2^255 - 19
    mpz_mod(mpV, mpV, mpP); // V = V mod P
    uint64k_from_mpz(inv, 4, mpV);
    




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
    inverse(inv, x);
    mpz_from_uint64k(mpInv, 4, inv);



    mpz_t mpP, mpCorrectInv;
    mpz_init(mpP);
    mpz_init(mpCorrectInv);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19);
    
    mpz_invert(mpCorrectInv, mpX, mpP);
    
    mpz_clear(mpP);
    
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
