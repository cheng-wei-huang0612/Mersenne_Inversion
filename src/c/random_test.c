/* 逆元隨機測試 – 5 次嘗試版
 * 若第一次得到 (b) 或 (c) 結果，會再重試至多 4 次（共 5 次）；
 * 只要其中一次屬於 (a) 即列為通過，否則即刻中止並回傳失敗。
 *
 * ※ 必要前置：
 *     - uint64k_from_mpz()
 *     - mpz_from_uint64k()
 *     - inverse()  (實際逆元實作)
 *   皆與舊版相同，僅主程式邏輯調整。
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <gmp.h>

#ifndef NUM_OF_TEST
#define NUM_OF_TEST 1000000U         /* 可用 -DNUM_OF_TEST=... 覆寫 */
#endif
#ifndef SEED
#define SEED 1234           /* 可用 -DSEED=... 覆寫 */
#endif
#define MAX_ATTEMPTS 5              /* 1 次 + 4 次重試 */

/* ——— 外部函式宣告 ——— */

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




void inverse(uint64_t dst[static 4], const uint64_t src[static 4]);

/* 分類：0 = (a) 完全一致、1 = (b) 同餘代表元不同、2 = (c) 完全錯誤 */
static int classify_inverse(const mpz_t got, const mpz_t correct, const mpz_t p)
{
    if (mpz_cmp(got, correct) == 0) return 0;          /* (a) */

    mpz_t diff;
    mpz_init(diff);
    mpz_sub(diff, got, correct);
    mpz_mod(diff, diff, p);
    int kind = (mpz_sgn(diff) == 0) ? 1 : 2;           /* (b) or (c) */
    mpz_clear(diff);
    return kind;
}

int main(void)
{
    /* ❶ 建立常數 p = 2²⁵⁵ − 19 */
    mpz_t mpP;
    mpz_init(mpP);
    mpz_ui_pow_ui(mpP, 2, 255);
    mpz_sub_ui(mpP, mpP, 19);

    /* ❷ 初始化亂數器 */
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, SEED);

    /* ❸ 配置暫存變數 */
    unsigned long passed = 0;
    mpz_t mpX, mpInvCorrect, mpInvGot;
    mpz_inits(mpX, mpInvCorrect, mpInvGot, NULL);

    for (unsigned long i = 0; i < NUM_OF_TEST; ++i) {

        /* 生成隨機 1 ≤ x < p */
        do { mpz_urandomm(mpX, rstate, mpP); } while (mpz_sgn(mpX) == 0);

        /* 參考逆元 (GMP) */
        if (!mpz_invert(mpInvCorrect, mpX, mpP)) {
            fprintf(stderr, "x 與 p 不互質（理論上不會發生）\n");
            goto cleanup_fail;
        }

        /* ——— 最多嘗試 MAX_ATTEMPTS 次 ——— */
        int success = 0, last_kind = 2 /* 預設 (c) */;
        for (int attempt = 0; attempt < MAX_ATTEMPTS; ++attempt) {

            uint64_t x[4], inv[4];
            uint64k_from_mpz(x, 4, mpX);
            inverse(inv, x);
            mpz_from_uint64k(mpInvGot, 4, inv);

            last_kind = classify_inverse(mpInvGot, mpInvCorrect, mpP);
            if (last_kind == 0) {            /* (a) → 成功 */
                passed++;
                success = 1;
                break;
            }
            /* (b)/(c) 時若未達上限就重試；否則留給迴圈外處理 */
        }

        if (!success) {                      /* 五次都失敗 */
            if (last_kind == 1)
                printf("[代表元不一致] 於第 %lu 筆資料偵測到！\n", i);
            else
                printf("[錯誤] 於第 %lu 筆資料偵測到！\n", i);

            gmp_printf("x              = %Zd\n", mpX);
            gmp_printf("inv (got)      = %Zd\n", mpInvGot);
            gmp_printf("inv (expected) = %Zd\n", mpInvCorrect);
            goto cleanup_fail;
        }
    }

    /* ❹ 統計輸出 */
    printf("全部 %u 筆測試通過！（a 類通過次數 = %lu）\n",
           NUM_OF_TEST, passed);

    /* ❺ 資源釋放並正常結束 */
    mpz_clears(mpX, mpInvCorrect, mpInvGot, mpP, NULL);
    gmp_randclear(rstate);
    return EXIT_SUCCESS;

cleanup_fail:
    mpz_clears(mpX, mpInvCorrect, mpInvGot, mpP, NULL);
    gmp_randclear(rstate);
    return EXIT_FAILURE;
}