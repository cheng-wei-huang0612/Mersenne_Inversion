/* ────────────────────────────────────────────────────────────
 * randomtest.c ‒ 批次隨機測試 4-limb modular inverse
 *
 * 編譯範例：
 *   gcc -O2 -std=c11 -DSEED=1234 -DNUM_OF_TEST=10000 \
 *       randomtest.c inverse.o -lgmp
 *
 *  ─ 宏定義 ───────────────────────────────────────────────
 *   • SEED         ‒ PRNG 種子（預設 42）
 *   • NUM_OF_TEST  ‒ 測試向量數（預設 1'000）
 * ──────────────────────────────────────────────────────────── */
#ifndef SEED
#  define SEED 45u
#endif

#ifndef NUM_OF_TEST
#  define NUM_OF_TEST 10000000u
#endif

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <gmp.h>

/* 外部 AArch64 實作：inv ≡ x⁻¹ (mod 2²⁵⁵−19) */
extern void inverse(uint64_t inv[static 4], const uint64_t x[static 4]);

/* mpz ⇄ 4×uint64 轉換工具（little-endian limbs）─────────── */
static void uint64k_from_mpz(uint64_t *dst, size_t k, const mpz_t src)
{
    for (size_t i = 0; i < k; ++i) dst[i] = 0;
    mpz_export(dst, NULL, -1, sizeof(uint64_t), 0, 0, src);
}

static void mpz_from_uint64k(mpz_t dst, size_t k, const uint64_t *src)
{
    mpz_import(dst, k, -1, sizeof(uint64_t), 0, 0, src);
}

/* ──────────────────────────────────────────────────────────── */
int main(void)
{
    /* ❶ 建立常數 p = 2²⁵⁵ − 19 */
    mpz_t mpP;
    mpz_init(mpP);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19);

    /* ❷ 初始化 GMP 隨機狀態 */
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long)SEED);

    /* ❸ 重複測試 */
    unsigned long passed = 0;
    mpz_t mpX, mpInvCorrect, mpInvGot, mpInvReduced;
    mpz_inits(mpX, mpInvCorrect, mpInvGot, mpInvReduced, NULL);

    for (unsigned long i = 0; i < NUM_OF_TEST; ++i) {
        /* 生成隨機 1 ≤ x < p */
        do { mpz_urandomm(mpX, rstate, mpP); } while (mpz_sgn(mpX) == 0);

        /* 呼叫 inverse() */
        uint64_t x[4], inv[4];
        uint64k_from_mpz(x, 4, mpX);
        inverse(inv, x);
        mpz_from_uint64k(mpInvGot, 4, inv);

        /* 參考值：GMP mpz_invert */
        if (!mpz_invert(mpInvCorrect, mpX, mpP)) {
            fprintf(stderr, "x 與 p 不互質，理論上不會發生！\n");
            return EXIT_FAILURE;
        }

        /* 分類判定 */
        if (mpz_cmp(mpInvGot, mpInvCorrect) == 0) {
            passed++;
            continue;                /* 情況 (a) ‒ 完全一致 */
        }

        /* 將 Got 做模約化，檢查是否同餘但代表元不同 ─ 情況 (b) */
        mpz_mod(mpInvReduced, mpInvGot, mpP);
        if (mpz_cmp(mpInvReduced, mpInvCorrect) == 0) {
            printf("[代表元不一致] 於第 %lu 筆資料偵測到！\n", i);
            gmp_printf("x              = %Zd\n", mpX);
            gmp_printf("inv (got)      = %Zd\n", mpInvGot);
            gmp_printf("inv (expected) = %Zd\n", mpInvCorrect);
            goto cleanup_fail;       /* 立即終止 */
        }

        /* 其他皆為錯誤 ─ 情況 (c) */
        printf("[錯誤] 於第 %lu 筆資料偵測到！\n", i);
        gmp_printf("x              = %Zd\n", mpX);
        gmp_printf("inv (got)      = %Zd\n", mpInvGot);
        gmp_printf("inv (expected) = %Zd\n", mpInvCorrect);
        goto cleanup_fail;
    }

    /* ❹ 統計輸出 */
    printf("全部 %u 筆測試皆為正確代表元！ (pass = %lu)\n",
           NUM_OF_TEST, passed);

    /* 資源釋放 */
    mpz_clears(mpX, mpInvCorrect, mpInvGot, mpInvReduced, mpP, NULL);
    gmp_randclear(rstate);
    return EXIT_SUCCESS;

cleanup_fail:
    mpz_clears(mpX, mpInvCorrect, mpInvGot, mpInvReduced, mpP, NULL);
    gmp_randclear(rstate);
    return EXIT_FAILURE;
}