# Feature: Compare to asm_1, we save more divstep loop counts

from genlib import *
import subprocess
import os
asm_main = ""

# asm_main += dot_include("snap.inc")
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


asm_main += initialization(ptr_x = ptr_x, 
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
const_2p41 = "x4"
const_2p62 = "x5"
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
s = "x18"


asm_main += f"ldr {g}, [{ptr_x}]\n"
asm_main += f"mov {f}, #-19\n"
asm_main += f"mov {delta}, #1\n"

# TODO, we do not need 2p41 and 2o62
asm_main += f"movz {const_2p41}, #512, LSL #32\n"
#asm_main += f"movz {const_2p62}, #16384, LSL #48\n"
asm_main += f"add  {const_2p41a2p20}, {const_2p41}, #1048576\n"
asm_main += f"movz  x7, #10347, LSL #16\n"
asm_main += f"movk  x7, #51739\n"
asm_main += f"dup  {vec_4x_M}.4s, w7\n"



asm_main += draw_line()

asm_main += init_FUV_GRS(FUV=FUV, GRS=GRS, f=f, g=g, const_2p41=const_2p41, const_2p62=const_2p62)

# asm_main += f"SNAP_SCALAR_REG {f}, \"f =\" \n"
# asm_main += f"SNAP_SCALAR_REG {g}, \"g =\" \n"
# asm_main += f"SNAP_SCALAR_REG {FUV}, \"FUV =\" \n"
# asm_main += f"SNAP_SCALAR_REG {GRS}, \"GRS =\" \n"

#asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += divstepxtimes(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=17)


asm_main += extraction(FUV=FUV, GRS=GRS, u=uu, v=vv, r=rr, s=ss, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=uu, v=vv, r=rr, s=ss, tmp1="x9", tmp2="x10")

asm_main += init_FUV_GRS(FUV=FUV, GRS=GRS, f=f, g=g, const_2p41=const_2p41, const_2p62=const_2p62)
asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=u, v=v, r=r, s=s, tmp1="x9", tmp2="x10")


asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")

asm_main += init_FUV_GRS(FUV=FUV, GRS=GRS, f=f, g=g, const_2p41=const_2p41, const_2p62=const_2p62)
asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")

#asm_main += f"SNAP_SCALAR_REG {uu}, \"uu =\" \n"

# update big number

COUNTER = "x19"
asm_main += f"mov {COUNTER}, #9\n"
asm_main += f"big_loop:\n"


asm_main += prepare_vec_uuvvvrrss_3(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
                                vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
                                vec_4x_2p30m1=vec_4x_2p30m1,
                                uu=uu, vv=vv, rr=rr, ss=ss, vec_uu_rr="v16", vec_vv_ss="v17")

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




asm_main += update_VS(vec_uu0_rr0_vv0_ss0 = vec_uu0_rr0_vv0_ss0, 
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

# vec = vec_V8_V9_S8_S9
# asm_main += f"umov %wregname{debug}, {vec}.s[0]\n"
# asm_main += f"str  {debug}, [{ptr_inv}]\n"
# asm_main += f"umov %wregname{debug}, {vec}.s[1]\n"
# asm_main += f"str  {debug}, [{ptr_inv}, #8]\n"
# asm_main += f"umov %wregname{debug}, {vec}.s[2]\n"
# asm_main += f"str  {debug}, [{ptr_inv}, #16]\n"
# asm_main += f"umov %wregname{debug}, {vec}.s[3]\n"
# asm_main += f"str  {debug}, [{ptr_inv}, #24]\n"




asm_main += f"umov %wregname{f}, {vec_F0_F1_G0_G1}.s[1]\n"
asm_main += f"umov w9, {vec_F0_F1_G0_G1}.s[0]\n"
asm_main += f"add {f}, x9, {f}, lsl #30\n"

asm_main += f"umov %wregname{g}, {vec_F0_F1_G0_G1}.s[3]\n"
asm_main += f"umov w9, {vec_F0_F1_G0_G1}.s[2]\n"
asm_main += f"add {g}, x9, {g}, lsl #30\n"

# if i == 0:
#     asm_main += f"str {f}, [{ptr_inv}]\n"
#     asm_main += f"str {g}, [{ptr_inv}, #8]\n"


asm_main += init_FUV_GRS(FUV=FUV, GRS=GRS, f=f, g=g, const_2p41=const_2p41, const_2p62=const_2p62)
asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += extraction(FUV=FUV, GRS=GRS, u=uu, v=vv, r=rr, s=ss, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=uu, v=vv, r=rr, s=ss, tmp1="x9", tmp2="x10")


asm_main += f"end:\n"

asm_main += init_FUV_GRS(FUV=FUV, GRS=GRS, f=f, g=g, const_2p41=const_2p41, const_2p62=const_2p62)
asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_fg_trunc(f=f, g=g, u=u, v=v, r=r, s=s, tmp1="x9", tmp2="x10")
asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")

asm_main += init_FUV_GRS(FUV=FUV, GRS=GRS, f=f, g=g, const_2p41=const_2p41, const_2p62=const_2p62)
#asm_main += divstepx20(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10")
asm_main += divstepxtimes(FUV=FUV, GRS=GRS, delta=delta, m1="x9",ff="x10", times=19)
asm_main += extraction(FUV=FUV, GRS=GRS, u=u, v=v, r=r, s=s, const_2p41a2p20=const_2p41a2p20)
asm_main += update_uuvvrrss(uu=uu, vv=vv, rr=rr, ss=ss, u=u, v=v, r=r, s=s, prod="x9", tmp="x10")



asm_main += f"subs {COUNTER}, {COUNTER}, #1\n"
asm_main += f"cbnz {COUNTER}, big_loop\n"


# asm_main += f"SNAP_SCALAR_REG {uu}, \"uu =\" \n"
# asm_main += f"SNAP_SCALAR_REG {vv}, \"vv =\" \n"
# asm_main += f"SNAP_SCALAR_REG {rr}, \"rr =\" \n"
# asm_main += f"SNAP_SCALAR_REG {ss}, \"ss =\" \n"

asm_main += prepare_vec_uuvvvrrss_3(vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
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

asm_main += update_VS(vec_uu0_rr0_vv0_ss0 = vec_uu0_rr0_vv0_ss0, 
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
asm_main += f"subs {Vlimb64_0}, {Vlimb64_0}, {signF}\n"



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
asm_output_path = os.path.join("..", "asm", "inverse_2_1.s")
with open(asm_output_path, "w") as f:
    f.write(asm_main)

# Generate snap.inc in include directory  
snap_inc_path = os.path.join("..", "include", "snap.inc")
write_snap_inc(snap_inc_path)

print(f"Generated assembly: {asm_output_path}")
print(f"Generated include: {snap_inc_path}")

# Note: Compilation is now handled by the Makefile
# To build and test, run: make test