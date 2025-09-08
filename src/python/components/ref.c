

#include <arm_neon.h>
void prepare_vec_uuvvvrrss(uint32x4_t *vec_uu0_rr0_vv0_ss0, uint32x4_t *vec_uu1_rr1_vv1_ss1, const uint32x4_t vec_4x_2p30m1, int64_t *uu, int64_t *vv, int64_t *rr, int64_t *ss) {
    int32_t uu0 = (int32_t)(*uu & 0x3fffffff);
    int32_t vv0 = (int32_t)(*vv & 0x3fffffff);
    int32_t rr0 = (int32_t)(*rr & 0x3fffffff);
    int32_t ss0 = (int32_t)(*ss & 0x3fffffff);

    *vec_uu0_rr0_vv0_ss0 = (uint32x4_t){(uu0), (rr0), (vv0), (ss0)};

    int32_t uu1 = *uu >> 30;
    int32_t vv1 = *vv >> 30;
    int32_t rr1 = *rr >> 30;
    int32_t ss1 = *ss >> 30;
    *vec_uu1_rr1_vv1_ss1 = (uint32x4_t){(uu1), (rr1), (vv1), (ss1)};
}