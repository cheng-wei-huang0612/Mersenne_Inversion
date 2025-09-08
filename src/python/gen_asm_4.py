# Feature: We use new innerloop

from components import *
import subprocess
import os
asm_main = ""

asm_main += dot_include("snap.inc")
asm_main += enter("inverse")

asm_main += push_callee_saved_registers()

ptr_inv = "x0"
ptr_x   = "x1"

debug = "x27"

vec_2x_2p30m1 = "v1"
vec_4x_2p30m1 = "v2"
vec_F0_F1_G0_G1 = "v3"
vec_F2_F3_G2_G3 = "v4"
vec_F4_F5_G4_G5 = "v5"
vec_F6_F7_G6_G7 = "v6"
vec_F8_F9_G8_G9 = "v7"
vec_V0_V1_S0_S1 = "v8"
vec_V2_V3_S2_S3 = "v9"
vec_V4_V5_S4_S5 = "v10"
vec_V6_V7_S6_S7 = "v11"
vec_V8_V9_S8_S9 = "v12"
vec_uu0_rr0_vv0_ss0 = "v13"
vec_uu1_rr1_vv1_ss1 = "v14"
vec_4x_M =  "v15"


asm_main += initialization_2(ptr_x = ptr_x, 
                           tmp_x = "x2",
                           vec_2x_2p30m1 = vec_2x_2p30m1,
                            vec_F0_F1_G0_G1 = vec_F0_F1_G0_G1,
                            vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3,
                            vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5,
                            vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7,
                            vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9,
                            vec_V0_V1_S0_S1 = vec_V0_V1_S0_S1,
                            vec_V2_V3_S2_S3 = vec_V2_V3_S2_S3,
                            vec_V4_V5_S4_S5 = vec_V4_V5_S4_S5,
                            vec_V6_V7_S6_S7 = vec_V6_V7_S6_S7,
                            vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9)




asm_main += f"uzp1 {vec_4x_2p30m1}.4s, {vec_2x_2p30m1}.4s, {vec_2x_2p30m1}.4s\n"



f = "x1"
g = "x2"
delta = "x3"
f_0 = "x4"
f_1 = "x21"
g_0 = "x5"
g_1 = "x22"
const_2p41a2p20 = "x6"
FUV = "x7"
GRS = "x8"

m1 = "x9"
ff = "x10"

uu = "x11"
vv = "x12"
rr = "x13"
ss = "x14"
u = "x15"
v = "x16"
r = "x17"
s = "x20"


asm_main += f"ldp {g_0}, {g_1}, [{ptr_x}]\n"
asm_main += f"mov {f_0}, #-19\n"
asm_main += f"mov {f_1}, #-1\n"

asm_main += f"mov {f}, {f_0}\n"
asm_main += f"mov {g}, {g_0}\n"

asm_main += f"mov {delta}, #1\n"


asm_main += f"movz {const_2p41a2p20}, #512, LSL #32\n"
asm_main += f"add  {const_2p41a2p20}, {const_2p41a2p20}, #1048576\n"
asm_main += f"movz  x7, #10347, LSL #16\n"
asm_main += f"movk  x7, #51739\n"
asm_main += f"dup  {vec_4x_M}.4s, w7\n"



asm_main += draw_line()

asm_main += init_FUV_GRS_2(FUV=FUV, GRS=GRS, f=f, g=g)


asm_main += divstepxtimes_2(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=17)


asm_main += extraction(FUV=FUV, GRS=GRS, u=uu, v=vv, r=rr, s=ss, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=uu, v=vv, r=rr, s=ss, tmp1="x9", tmp2="x10")


asm_main += init_FUV_GRS_2(FUV=FUV, GRS=GRS, f=f, g=g)

asm_main += divstepxtimes_2(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=20)

asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=u, v=v, r=r, s=s, tmp1="x9", tmp2="x10")


asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")


asm_main += init_FUV_GRS_2(FUV=FUV, GRS=GRS, f=f, g=g)

asm_main += divstepxtimes_2(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=20)

asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")




# update big number

COUNTER = "x19"
# asm_main += f"mov {COUNTER}, #9\n"
asm_main += f"mov {COUNTER}, #9\n"
asm_main += f"Lbig_loop:\n"


# asm_main += f"str {uu}, [x0]\n"
# asm_main += f"str {vv}, [x0, #8]\n"
# asm_main += f"str {rr}, [x0, #16]\n"
# asm_main += f"str {ss}, [x0, #24]\n"
# asm_main += f"stp {f}, {g}, [x0]\n"


asm_main += Prepare_Vec_uuvvrrss().prepare_vec_uuvvvrrss_3(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
                                vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
                                vec_4x_2p30m1=vec_4x_2p30m1,
                                uu=uu, vv=vv, rr=rr, ss=ss, vec_uu_rr="v16", vec_vv_ss="v17")




sign_uu = "x23"
sign_vv = "x24"
sign_rr = "x25"
sign_ss = "x26"


asm_main += f"cmp {uu}, xzr\n"
asm_main += f"csetm {sign_uu}, mi\n"
asm_main += f"cneg {uu}, {uu}, mi\n"

asm_main += f"cmp {vv}, xzr\n"
asm_main += f"csetm {sign_vv}, mi\n"
asm_main += f"cneg {vv}, {vv}, mi\n"

asm_main += f"cmp {rr}, xzr\n"
asm_main += f"csetm {sign_rr}, mi\n"
asm_main += f"cneg {rr}, {rr}, mi\n"

asm_main += f"cmp {ss}, xzr\n"
asm_main += f"csetm {sign_ss}, mi\n"
asm_main += f"cneg {ss}, {ss}, mi\n"

# Don't know why, but this is slower
# asm_main += f"asr {sign_uu}, {uu}, #63\n"
# asm_main += f"eor {uu}, {uu}, {sign_uu}\n"
# asm_main += f"sub {uu}, {uu}, {sign_uu}\n"

# asm_main += f"asr {sign_vv}, {vv}, #63\n"
# asm_main += f"eor {vv}, {vv}, {sign_vv}\n"
# asm_main += f"sub {vv}, {vv}, {sign_vv}\n"

# asm_main += f"asr {sign_rr}, {rr}, #63\n"
# asm_main += f"eor {rr}, {rr}, {sign_rr}\n"
# asm_main += f"sub {rr}, {rr}, {sign_rr}\n"

# asm_main += f"asr {sign_ss}, {ss}, #63\n"
# asm_main += f"eor {ss}, {ss}, {sign_ss}\n"
# asm_main += f"sub {ss}, {ss}, {sign_ss}\n"




tmp0 = "x27"
tmp1 = "x28"
new_f_0 = "x15"
new_f_1 = "x16"
new_g_0 = "x17"
new_g_1 = "x20"

prod_lo = "x9"
prod_hi = "x10"

asm_main += f"and {tmp0}, {uu}, {sign_uu}\n"
asm_main += f"and {tmp1}, {vv}, {sign_vv}\n"
asm_main += f"add {new_f_0}, {tmp0}, {tmp1}\n"

asm_main += f"eor {tmp0}, {f_0}, {sign_uu}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {uu}\n"
asm_main += f"umulh {prod_hi}, {tmp0}, {uu}\n"

asm_main += f"adds {new_f_0}, {prod_lo}, {new_f_0}\n"
asm_main += f"adc {new_f_1}, {prod_hi}, xzr\n"

asm_main += f"eor {tmp0}, {f_1}, {sign_uu}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {uu}\n"
asm_main += f"add {new_f_1}, {new_f_1}, {prod_lo}\n"



asm_main += f"eor {tmp0}, {g_0}, {sign_vv}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {vv}\n"
asm_main += f"umulh {prod_hi}, {tmp0}, {vv}\n"

asm_main += f"adds {new_f_0}, {prod_lo}, {new_f_0}\n"
asm_main += f"adc {new_f_1}, {prod_hi}, {new_f_1}\n"

asm_main += f"eor {tmp0}, {g_1}, {sign_vv}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {vv}\n"
asm_main += f"add {new_f_1}, {new_f_1}, {prod_lo}\n"

asm_main += f"extr {f}, {new_f_1}, {new_f_0}, #60\n"







asm_main += f"and {tmp0}, {rr}, {sign_rr}\n"
asm_main += f"and {tmp1}, {ss}, {sign_ss}\n"
asm_main += f"add {new_g_0}, {tmp0}, {tmp1}\n"

asm_main += f"eor {tmp0}, {f_0}, {sign_rr}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {rr}\n"
asm_main += f"umulh {prod_hi}, {tmp0}, {rr}\n"

asm_main += f"adds {new_g_0}, {prod_lo}, {new_g_0}\n"
asm_main += f"adc {new_g_1}, {prod_hi}, xzr\n"

asm_main += f"eor {tmp0}, {f_1}, {sign_rr}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {rr}\n"
asm_main += f"add {new_g_1}, {new_g_1}, {prod_lo}\n"



asm_main += f"eor {tmp0}, {g_0}, {sign_ss}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {ss}\n"
asm_main += f"umulh {prod_hi}, {tmp0}, {ss}\n"

asm_main += f"adds {new_g_0}, {prod_lo}, {new_g_0}\n"
asm_main += f"adc {new_g_1}, {prod_hi}, {new_g_1}\n"

asm_main += f"eor {tmp0}, {g_1}, {sign_ss}\n"
asm_main += f"mul {prod_lo}, {tmp0}, {ss}\n"
asm_main += f"add {new_g_1}, {new_g_1}, {prod_lo}\n"

asm_main += f"extr {g}, {new_g_1}, {new_g_0}, #60\n"




# if i == 0:
#     asm_main += f"str {f}, [{ptr_inv}]\n"
#     asm_main += f"str {g}, [{ptr_inv}, #8]\n"


asm_main += init_FUV_GRS_2(FUV=FUV, GRS=GRS, f=f, g=g)
# asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += divstepxtimes_2(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=20)

asm_main += extraction(FUV=FUV, GRS=GRS, u=uu, v=vv, r=rr, s=ss, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=uu, v=vv, r=rr, s=ss, tmp1="x9", tmp2="x10")


asm_main += f"Lend:\n"
asm_main += f"L_optloop_start_1:\n"






asm_main += update_FG(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
                      vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
                      vec_F0_F1_G0_G1=vec_F0_F1_G0_G1,
                      vec_F2_F3_G2_G3=vec_F2_F3_G2_G3,
                      vec_F4_F5_G4_G5=vec_F4_F5_G4_G5,
                      vec_F6_F7_G6_G7=vec_F6_F7_G6_G7,
                      vec_F8_F9_G8_G9=vec_F8_F9_G8_G9,
                      vec_2x_2p30m1=vec_2x_2p30m1,
                      vec_prod="v16",
                      vec_buffer="v17")










asm_main += f"umov %wregname{f_0}, {vec_F0_F1_G0_G1}.s[0]\n"
asm_main += f"umov %wregname{tmp0}, {vec_F0_F1_G0_G1}.s[1]\n"
asm_main += f"add  {f_0}, {f_0}, {tmp0}, lsl #30\n"
asm_main += f"umov %wregname{tmp0}, {vec_F2_F3_G2_G3}.s[0]\n"
asm_main += f"add  {f_0}, {f_0}, {tmp0}, lsl #60\n"
asm_main += f"add  {f_1}, xzr, {tmp0}, lsr #4\n"
asm_main += f"umov %wregname{tmp0}, {vec_F2_F3_G2_G3}.s[1]\n"
asm_main += f"add  {f_1}, {f_1}, {tmp0}, lsl #26\n"

asm_main += f"umov %wregname{g_0}, {vec_F0_F1_G0_G1}.s[2]\n"
asm_main += f"umov %wregname{tmp0}, {vec_F0_F1_G0_G1}.s[3]\n"
asm_main += f"add  {g_0}, {g_0}, {tmp0}, lsl #30\n"
asm_main += f"umov %wregname{tmp0}, {vec_F2_F3_G2_G3}.s[2]\n"
asm_main += f"add  {g_0}, {g_0}, {tmp0}, lsl #60\n"
asm_main += f"add  {g_1}, xzr, {tmp0}, lsr #4\n"
asm_main += f"umov %wregname{tmp0}, {vec_F2_F3_G2_G3}.s[3]\n"
asm_main += f"add  {g_1}, {g_1}, {tmp0}, lsl #26\n"







asm_main += init_FUV_GRS_2(FUV=FUV, GRS=GRS, f=f, g=g)

asm_main += divstepxtimes_2(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=20)

asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=u, v=v, r=r, s=s, tmp1="x9", tmp2="x10")
asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")
asm_main += f"L_optloop_end_1:\n"

asm_main += f"L_optloop_start_2:\n"









asm_main += update_VS_2(vec_uu0_rr0_vv0_ss0 = vec_uu0_rr0_vv0_ss0, 
              vec_uu1_rr1_vv1_ss1 = vec_uu1_rr1_vv1_ss1, 
              vec_V0_V1_S0_S1 = vec_V0_V1_S0_S1, 
              vec_V2_V3_S2_S3 = vec_V2_V3_S2_S3, 
              vec_V4_V5_S4_S5 = vec_V4_V5_S4_S5, 
              vec_V6_V7_S6_S7 = vec_V6_V7_S6_S7,
              vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9,
              vec_2x_2p30m1 = vec_2x_2p30m1,
              vec_m19 = "v16",
              tmp = "x9",
              vec_prod = "v17",
              vec_buffer = "v18",
              vec_4x_M = vec_4x_M,
              vec_l0 = "v19",
              vec_l1 = "v20")



# asm_main += update_VS_carry(vec_V0_V1_S0_S1 = vec_V0_V1_S0_S1, 
#               vec_V2_V3_S2_S3 = vec_V2_V3_S2_S3, 
#               vec_V4_V5_S4_S5 = vec_V4_V5_S4_S5, 
#               vec_V6_V7_S6_S7 = vec_V6_V7_S6_S7,
#               vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9,
#               vec_2x_2p30m1 = vec_2x_2p30m1,
#               vec_prod = "v17",
#               vec_buffer = "v18")





asm_main += init_FUV_GRS_2(FUV=FUV, GRS=GRS, f=f, g=g)
#asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")

asm_main += divstepxtimes_2(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=19)

asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")


# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F0_F1_G0_G1}, \"vec_F0_F1_G0_G1 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F2_F3_G2_G3}, \"vec_F2_F3_G2_G3 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F4_F5_G4_G5}, \"vec_F4_F5_G4_G5 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F6_F7_G6_G7}, \"vec_F6_F7_G6_G7 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F8_F9_G8_G9}, \"vec_F8_F9_G8_G9 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V0_V1_S0_S1}, \"vec_V0_V1_S0_S1 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V2_V3_S2_S3}, \"vec_V2_V3_S2_S3 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V4_V5_S4_S5}, \"vec_V4_V5_S4_S5 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V6_V7_S6_S7}, \"vec_V6_V7_S6_S7 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V8_V9_S8_S9}, \"vec_V8_V9_S8_S9 =\" \n"




asm_main += f"L_optloop_end_2:\n"


asm_main += f"subs {COUNTER}, {COUNTER}, #1\n"
asm_main += f"cbnz {COUNTER}, Lbig_loop\n"


# asm_main += f"SNAP_SCALAR_REG {uu}, \"uu =\" \n"
# asm_main += f"SNAP_SCALAR_REG {vv}, \"vv =\" \n"
# asm_main += f"SNAP_SCALAR_REG {rr}, \"rr =\" \n"
# asm_main += f"SNAP_SCALAR_REG {ss}, \"ss =\" \n"

asm_main += Prepare_Vec_uuvvrrss().prepare_vec_uuvvvrrss_3(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
                                vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
                                vec_4x_2p30m1=vec_4x_2p30m1,
                                uu=uu, vv=vv, rr=rr, ss=ss, vec_uu_rr="v16", vec_vv_ss="v17")


# asm_main += prepare_vec_uuvvvrrss_2(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
#                                 vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
#                                 vec_4x_2p30m1=vec_4x_2p30m1,
#                                 uu=uu, vv=vv, rr=rr, ss=ss, vec_uu_rr="v16", vec_vv_ss="v17")

# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_uu0_rr0_vv0_ss0}, \"uu0, rr0, vv0, ss0 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_uu1_rr1_vv1_ss1}, \"uu1, rr1, vv1, ss1 =\" \n"

# asm_main += update_FG(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
#                     vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
#                     vec_F0_F1_G0_G1=vec_F0_F1_G0_G1,
#                     vec_F2_F3_G2_G3=vec_F2_F3_G2_G3,
#                     vec_F4_F5_G4_G5=vec_F4_F5_G4_G5,
#                     vec_F6_F7_G6_G7=vec_F6_F7_G6_G7,
#                     vec_F8_F9_G8_G9=vec_F8_F9_G8_G9,
#                     vec_2x_2p30m1=vec_2x_2p30m1,
#                     vec_prod="v16",
#                     vec_buffer="v17")

asm_main += update_FG_trunc(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
                    vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
                    vec_F0_F1_G0_G1=vec_F0_F1_G0_G1,
                    vec_F2_F3_G2_G3=vec_F2_F3_G2_G3,
                    vec_F4_F5_G4_G5=vec_F4_F5_G4_G5,
                    vec_F6_F7_G6_G7=vec_F6_F7_G6_G7,
                    vec_F8_F9_G8_G9=vec_F8_F9_G8_G9,
                    vec_2x_2p30m1=vec_2x_2p30m1,
                    vec_prod="v16",
                    vec_buffer="v17")

asm_main += update_VS_2(vec_uu0_rr0_vv0_ss0 = vec_uu0_rr0_vv0_ss0, 
              vec_uu1_rr1_vv1_ss1 = vec_uu1_rr1_vv1_ss1, 
              vec_V0_V1_S0_S1 = vec_V0_V1_S0_S1, 
              vec_V2_V3_S2_S3 = vec_V2_V3_S2_S3, 
              vec_V4_V5_S4_S5 = vec_V4_V5_S4_S5, 
              vec_V6_V7_S6_S7 = vec_V6_V7_S6_S7,
              vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9,
              vec_2x_2p30m1 = vec_2x_2p30m1,
              vec_m19 = "v16",
              tmp = "x9",
              vec_prod = "v17",
              vec_buffer = "v18",
              vec_4x_M = vec_4x_M,
              vec_l0 = "v19",
              vec_l1 = "v20")


asm_main += update_VS_carry(vec_V0_V1_S0_S1 = vec_V0_V1_S0_S1, 
              vec_V2_V3_S2_S3 = vec_V2_V3_S2_S3, 
              vec_V4_V5_S4_S5 = vec_V4_V5_S4_S5, 
              vec_V6_V7_S6_S7 = vec_V6_V7_S6_S7,
              vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9,
              vec_2x_2p30m1 = vec_2x_2p30m1,
              vec_prod = "v17",
              vec_buffer = "v18")

# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F0_F1_G0_G1}, \"vec_F0_F1_G0_G1 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F2_F3_G2_G3}, \"vec_F2_F3_G2_G3 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F4_F5_G4_G5}, \"vec_F4_F5_G4_G5 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F6_F7_G6_G7}, \"vec_F6_F7_G6_G7 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_F8_F9_G8_G9}, \"vec_F8_F9_G8_G9 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V0_V1_S0_S1}, \"vec_V0_V1_S0_S1 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V2_V3_S2_S3}, \"vec_V2_V3_S2_S3 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V4_V5_S4_S5}, \"vec_V4_V5_S4_S5 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V6_V7_S6_S7}, \"vec_V6_V7_S6_S7 =\" \n"
# asm_main += f"SNAP_VECTOR_REG_U32x4 {vec_V8_V9_S8_S9}, \"vec_V8_V9_S8_S9 =\" \n"


# vec = vec_V8_V9_S8_S9
# asm_main += f"umov %wregname{debug}, {vec}.s[0]\n"
# asm_main += f"str  {debug}, [{ptr_inv}]\n"
# asm_main += f"umov %wregname{debug}, {vec}.s[1]\n"
# asm_main += f"str  {debug}, [{ptr_inv}, #8]\n"
# asm_main += f"umov %wregname{debug}, {vec}.s[2]\n"
# asm_main += f"str  {debug}, [{ptr_inv}, #16]\n"
# asm_main += f"umov %wregname{debug}, {vec}.s[3]\n"
# asm_main += f"str  {debug}, [{ptr_inv}, #24]\n"





Vlimb30_0 = "x9"
Vlimb30_1 = "x10"
Vlimb30_2 = "x11"
Vlimb30_3 = "x12"
Vlimb30_4 = "x13"
Vlimb30_5 = "x14"
Vlimb30_6 = "x15"
Vlimb30_7 = "x16"
Vlimb30_8 = "x17"

Vlimb64_0 = "x9"
Vlimb64_1 = "x10"
Vlimb64_2 = "x11"
Vlimb64_3 = "x12"

tmp = "x13"

signF = "x19"


asm_main += f"smov {Vlimb30_0}, {vec_V0_V1_S0_S1}.s[0]\n"
asm_main += f"smov {Vlimb30_1}, {vec_V0_V1_S0_S1}.s[1]\n"
asm_main += f"smov {Vlimb30_2}, {vec_V2_V3_S2_S3}.s[0]\n"
asm_main += f"smov {Vlimb30_3}, {vec_V2_V3_S2_S3}.s[1]\n"
asm_main += f"smov {Vlimb30_4}, {vec_V4_V5_S4_S5}.s[0]\n"
asm_main += f"smov {Vlimb30_5}, {vec_V4_V5_S4_S5}.s[1]\n"
asm_main += f"smov {Vlimb30_6}, {vec_V6_V7_S6_S7}.s[0]\n"
asm_main += f"smov {Vlimb30_7}, {vec_V6_V7_S6_S7}.s[1]\n"
asm_main += f"smov {Vlimb30_8}, {vec_V8_V9_S8_S9}.s[0]\n"


asm_main += f"add  {Vlimb64_0}, {Vlimb30_0}, {Vlimb30_1}, LSL #30\n"
asm_main += f"add  {Vlimb64_0}, {Vlimb64_0}, {Vlimb30_2}, LSL #60\n"
asm_main += f"lsr  {Vlimb64_1}, {Vlimb30_2}, #4\n"
asm_main += f"add  {Vlimb64_1}, {Vlimb64_1}, {Vlimb30_3}, LSL #26\n"
asm_main += f"add  {Vlimb64_1}, {Vlimb64_1}, {Vlimb30_4}, LSL #56\n"
asm_main += f"lsr  {Vlimb64_2}, {Vlimb30_4}, #8\n"
asm_main += f"add  {Vlimb64_2}, {Vlimb64_2}, {Vlimb30_5}, LSL #22\n"
asm_main += f"add  {Vlimb64_2}, {Vlimb64_2}, {Vlimb30_6}, LSL #52\n"
asm_main += f"lsr  {Vlimb64_3}, {Vlimb30_6}, #12\n"
asm_main += f"add  {Vlimb64_3}, {Vlimb64_3}, {Vlimb30_7}, LSL #18\n"
asm_main += f"add  {Vlimb64_3}, {Vlimb64_3}, {Vlimb30_8}, LSL #48\n"









asm_main += f"smov {signF}, {vec_F0_F1_G0_G1}.s[0]\n"
asm_main += f"lsl {signF}, {signF}, #34\n"
asm_main += f"asr {signF}, {signF}, #35\n"




asm_main += f"eor {Vlimb64_0}, {Vlimb64_0}, {signF}\n"
asm_main += f"eor {Vlimb64_1}, {Vlimb64_1}, {signF}\n"
asm_main += f"eor {Vlimb64_2}, {Vlimb64_2}, {signF}\n"
asm_main += f"eor {Vlimb64_3}, {Vlimb64_3}, {signF}\n"
asm_main += f"neg {signF}, {signF}\n"
asm_main += f"adds {Vlimb64_0}, {Vlimb64_0}, {signF}\n"
asm_main += f"adcs {Vlimb64_1}, {Vlimb64_1}, xzr\n"
asm_main += f"adcs {Vlimb64_2}, {Vlimb64_2}, xzr\n"
asm_main += f"adcs {Vlimb64_3}, {Vlimb64_3}, xzr\n"

#if N=1 then += P
asm_main += f"adds xzr, {Vlimb64_3}, #0\n"

asm_main += f"mov {tmp}, #-19\n"
asm_main += f"csel {tmp}, {tmp}, xzr, mi\n"
asm_main += f"adds {Vlimb64_0}, {Vlimb64_0}, {tmp}\n"

asm_main += f"asr {tmp}, {tmp}, #5\n"
asm_main += f"adcs {Vlimb64_1}, {Vlimb64_1}, {tmp}\n"
asm_main += f"adcs {Vlimb64_2}, {Vlimb64_2}, {tmp}\n"

asm_main += f"lsr {tmp}, {tmp}, #1\n"
asm_main += f"adcs {Vlimb64_3}, {Vlimb64_3}, {tmp}\n"





asm_main += f"stp {Vlimb64_0}, {Vlimb64_1}, [{ptr_inv}]\n"
asm_main += f"stp {Vlimb64_2}, {Vlimb64_3}, [{ptr_inv}, #16]\n"




asm_main += pop_callee_saved_registers()
asm_main += ret()

asm_main = q_register_replacement(asm_main)
asm_main = w_register_replacement(asm_main)

# Write generated assembly to asm directory
asm_output_path = os.path.join("..", "asm", "inverse_4.s")
with open(asm_output_path, "w") as f:
    f.write(asm_main)

# Generate snap.inc in include directory  
snap_inc_path = os.path.join("..", "include", "snap.inc")
write_snap_inc(snap_inc_path)

print(f"Generated assembly: {asm_output_path}")
print(f"Generated include: {snap_inc_path}")

# Note: Compilation is now handled by the Makefile
# To build and test, run: make test