// ──────────────────────────────────────────────────────────────
//  snap.c – print helpers for scalar / vector snapshots
// ──────────────────────────────────────────────────────────────
#include <stdio.h>
#include <stdint.h>

void print_scalar_reg_tag(unsigned long long reg_val, const char* tag)
{
    printf("[SNAPSHOT] %s: 0x%016llx (%llu)\n",
           tag, reg_val, reg_val);
}


/// 印出 128-bit 向量的 4 個 uint32_t
void print_vector_reg_u32x4(const uint32_t vec[4], const char* tag)
{
    printf("[SNAPSHOT] %s: "
           "{0x%08x, 0x%08x, 0x%08x, 0x%08x}\n",
           tag,
           vec[0], vec[1], vec[2], vec[3]);
}

/// 印出 128-bit 向量的 2 個 uint64_t
void print_vector_reg_u64x2(const uint64_t vec[2], const char* tag)
{
    printf("[SNAPSHOT] %s: "
           "{0x%016llx, 0x%016llx}\n",
           tag,
           (unsigned long long)vec[0],
           (unsigned long long)vec[1]);
}

// ──────────────────────────────────────────────────────────────
//  end of snap.c
// ──────────────────────────────────────────────────────────────