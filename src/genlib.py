def push_callee_saved_registers():
    asm_script = ""
    asm_script += "stp x29, x30, [sp, #-16]!\n"
    asm_script += "mov x29, sp\n"
    asm_script += "stp x19, x20, [sp, #-16]!\n"
    asm_script += "stp x21, x22, [sp, #-16]!\n"
    asm_script += "stp x23, x24, [sp, #-16]!\n"
    asm_script += "stp x25, x26, [sp, #-16]!\n"
    asm_script += "stp x27, x28, [sp, #-16]!\n"
    asm_script += "stp q8, q9, [sp, #-32]!\n"
    asm_script += "stp q10, q11, [sp, #-32]!\n"
    asm_script += "stp q12, q13, [sp, #-32]!\n"
    asm_script += "stp q14, q15, [sp, #-32]!\n"
    return asm_script

def pop_callee_saved_registers():
    asm_script = ""
    asm_script += "ldp q14, q15, [sp], #32\n"
    asm_script += "ldp q12, q13, [sp], #32\n"
    asm_script += "ldp q10, q11, [sp], #32\n"
    asm_script += "ldp q8, q9, [sp], #32\n"
    asm_script += "ldp x27, x28, [sp], #16\n"
    asm_script += "ldp x25, x26, [sp], #16\n"
    asm_script += "ldp x23, x24, [sp], #16\n"
    asm_script += "ldp x21, x22, [sp], #16\n"
    asm_script += "ldp x19, x20, [sp], #16\n"
    asm_script += "ldp x29, x30, [sp], #16\n"
    return asm_script

def initialization(ptr_x, 
                   tmp_x,
                   vec_2x_2p30m1,
                   vec_F0_F1_G0_G1,
                   vec_F2_F3_G2_G3,
                   vec_F4_F5_G4_G5,
                   vec_F6_F7_G6_G7,
                   vec_F8_F9_G8_G9,
                   vec_V0_V1_S0_S1,
                   vec_V2_V3_S2_S3,
                   vec_V4_V5_S4_S5,
                   vec_V6_V7_S6_S7,
                   vec_V8_V9_S8_S9):

    asm_script = ""

    vec_p0_p3 = vec_F0_F1_G0_G1
    vec_p2_p1 = vec_F2_F3_G2_G3
    vec_x0_x1 = vec_F4_F5_G4_G5


    print(f"vec_p2_p1: {vec_p2_p1}")


    vec_x2_x3 = vec_F6_F7_G6_G7

    asm_script += f"ldp %qregname{vec_x0_x1}, %qregname{vec_x2_x3}, [{ptr_x}]\n"
    asm_script += f"movi {vec_p2_p1}.2d, #-1\n"
    asm_script += f"mov {tmp_x}, #-1\n"
    asm_script += f"lsr {tmp_x}, {tmp_x}, #1\n"
    asm_script += f"ins {vec_p0_p3}.d[1], {tmp_x}\n"
    asm_script += f"mov {tmp_x}, #-19\n"
    asm_script += f"ins {vec_p0_p3}.d[0], {tmp_x}\n"

    vec_p0_x0 = vec_V0_V1_S0_S1
    vec_p1_x1 = vec_V2_V3_S2_S3
    vec_p2_x2 = vec_V4_V5_S4_S5
    vec_p3_x3 = vec_V6_V7_S6_S7

    asm_script += f"zip1 {vec_p0_x0}.2d, {vec_p0_p3}.2d, {vec_x0_x1}.2d\n"
    asm_script += f"zip2 {vec_p1_x1}.2d, {vec_p2_p1}.2d, {vec_x0_x1}.2d\n"
    asm_script += f"zip1 {vec_p2_x2}.2d, {vec_p2_p1}.2d, {vec_x2_x3}.2d\n"
    asm_script += f"zip2 {vec_p3_x3}.2d, {vec_p0_p3}.2d, {vec_x2_x3}.2d\n"

    asm_script += f"ushr {vec_2x_2p30m1}.2d, {vec_p2_p1}.2d, #34\n"

    vec_buffer = vec_V8_V9_S8_S9

    asm_script += f"and {vec_F0_F1_G0_G1}.16b, {vec_p0_x0}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"ushr {vec_buffer}.2d, {vec_p0_x0}.2d, #30\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr {vec_F0_F1_G0_G1}.16b, {vec_F0_F1_G0_G1}.16b, {vec_buffer}.16b\n"

    asm_script += f"ushr {vec_F2_F3_G2_G3}.2d, {vec_p0_x0}.2d, #60\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_p1_x1}.2d, #4\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"orr {vec_F2_F3_G2_G3}.16b, {vec_F2_F3_G2_G3}.16b, {vec_buffer}.16b\n"
    asm_script += f"ushr {vec_buffer}.2d, {vec_p1_x1}.2d, #26\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr {vec_F2_F3_G2_G3}.16b, {vec_F2_F3_G2_G3}.16b, {vec_buffer}.16b\n"

    asm_script += f"ushr {vec_F4_F5_G4_G5}.2d, {vec_p1_x1}.2d, #56\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_p2_x2}.2d, #8\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"orr {vec_F4_F5_G4_G5}.16b, {vec_F4_F5_G4_G5}.16b, {vec_buffer}.16b\n"
    asm_script += f"ushr {vec_buffer}.2d, {vec_p2_x2}.2d, #22\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr {vec_F4_F5_G4_G5}.16b, {vec_F4_F5_G4_G5}.16b, {vec_buffer}.16b\n"

    asm_script += f"ushr {vec_F6_F7_G6_G7}.2d, {vec_p2_x2}.2d, #52\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_p3_x3}.2d, #12\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"orr {vec_F6_F7_G6_G7}.16b, {vec_F6_F7_G6_G7}.16b, {vec_buffer}.16b\n"
    asm_script += f"ushr {vec_buffer}.2d, {vec_p3_x3}.2d, #18\n"
    asm_script += f"and {vec_buffer}.16b, {vec_buffer}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"shl {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr {vec_F6_F7_G6_G7}.16b, {vec_F6_F7_G6_G7}.16b, {vec_buffer}.16b\n"

    asm_script += f"ushr {vec_F8_F9_G8_G9}.2d, {vec_p3_x3}.2d, #48\n"



    asm_script += f"movi {vec_V0_V1_S0_S1}.2d, #0\n"
    asm_script += f"mov  {tmp_x}, #1\n"
    asm_script += f"ins  {vec_V0_V1_S0_S1}.d[1], {tmp_x}\n"
    asm_script += f"movi {vec_V2_V3_S2_S3}.2d, #0\n"
    asm_script += f"movi {vec_V4_V5_S4_S5}.2d, #0\n"
    asm_script += f"movi {vec_V6_V7_S6_S7}.2d, #0\n"
    asm_script += f"movi {vec_V8_V9_S8_S9}.2d, #0\n"

    return asm_script

def extraction(FUV: str, GRS: str, u: str, v: str, r: str, s: str, const_2p41a2p20: str):

    asm_script = ""
    asm_script += f"add {v}, {FUV}, {const_2p41a2p20}\n"
    asm_script += f"asr {v}, {v}, #42\n"
    asm_script += f"add {u}, {FUV}, #1048576\n"
    asm_script += f"lsl {u}, {u}, #22\n"
    asm_script += f"asr {u}, {u}, #43\n"
    asm_script += f"add {s}, {GRS}, {const_2p41a2p20}\n"
    asm_script += f"asr {s}, {s}, #42\n"
    asm_script += f"add {r}, {GRS}, #1048576\n"
    asm_script += f"lsl {r}, {r}, #22\n"
    asm_script += f"asr {r}, {r}, #43\n"
    return asm_script


def update_fg(f, f_low, f_high, g, g_low, g_high, u, v, r, s, tmp_prod, tmp):

    asm_script = ""
    asm_script += f"and {f_low}, {f}, 0x3FFFFFFF\n"
    asm_script += f"and {g_low}, {g}, 0x3FFFFFFF\n"
    asm_script += f"asr {f_high}, {f}, #30\n"
    asm_script += f"asr {g_high}, {g}, #30\n"

    asm_script += f"smaddl {tmp_prod}, _%w{f_low}, _%w{u}, XZR\n"
    asm_script += f"smaddl {tmp_prod}, _%w{g_low}, _%w{v}, {tmp_prod}\n"
    asm_script += f"asr {tmp_prod}, {tmp_prod}, #20\n"

    asm_script += f"smaddl {tmp}, _%w{f_high}, _%w{u}, XZR\n"
    asm_script += f"smaddl {tmp}, _%w{g_high}, _%w{v}, {tmp}\n"
    asm_script += f"lsl {tmp}, {tmp}, #10\n"
    asm_script += f"add {f}, {tmp_prod}, {tmp}\n"

    asm_script += f"smaddl {tmp_prod}, _%w{f_low}, _%w{r}, XZR\n"
    asm_script += f"smaddl {tmp_prod}, _%w{g_low}, _%w{s}, {tmp_prod}\n"
    asm_script += f"asr {tmp_prod}, {tmp_prod}, #20\n"

    asm_script += f"smaddl {tmp}, _%w{f_high}, _%w{r}, XZR\n"
    asm_script += f"smaddl {tmp}, _%w{g_high}, _%w{s}, {tmp}\n"
    asm_script += f"lsl {tmp}, {tmp}, #10\n"
    asm_script += f"add {g}, {tmp_prod}, {tmp}\n"

    return asm_script
    
def update_fg_trunc(f, g, u, v, r, s, tmp1, tmp2):
    asm_script = ""
    asm_script += f"mul {tmp1}, {u}, {f}\n"
    asm_script += f"madd {tmp1}, {v}, {g}, {tmp1}\n"
    asm_script += f"asr {tmp1}, {tmp1}, #20\n"

    asm_script += f"mul {tmp2}, {r}, {f}\n"
    asm_script += f"madd {tmp2}, {s}, {g}, {tmp2}\n"
    asm_script += f"asr {tmp2}, {tmp2}, #20\n"

    asm_script += f"mov {f}, {tmp1}\n"
    asm_script += f"mov {g}, {tmp2}\n"


    return asm_script

def update_uuvvrrss(u, v, r, s, uu, vv, rr, ss, prod, tmp):
    asm_script = ""
    asm_script += f"madd {prod}, {u}, {uu}, XZR\n"
    asm_script += f"madd {tmp},  {v}, {rr}, {prod}\n"

    asm_script += f"madd {prod}, {r}, {uu}, XZR\n"
    asm_script += f"madd {rr}, {s}, {rr}, {prod}\n"
    asm_script += f"mov {uu}, {tmp}\n"


    asm_script += f"madd {prod}, {u}, {vv}, XZR\n"
    asm_script += f"madd {tmp},  {v}, {ss}, {prod}\n"
    asm_script += f"madd {prod}, {r}, {vv}, XZR\n"
    asm_script += f"madd {ss}, {s}, {ss}, {prod}\n"
    asm_script += f"mov {vv}, {tmp}\n"

    return asm_script


def hensel_lifting_get_M(two, inv, tmp, p, vec_4x_M):
    asm_script = ""
    asm_script += comment("Hensel lifting to get M")
    asm_script += f"mov {two}, #2\n"
    asm_script += f"mov {inv}, #1\n"
    asm_script += f"mov {tmp}, #0\n"

    asm_script += f".rept 5\n"

    asm_script += f"mul {tmp}, {p}, {inv}\n"
    asm_script += f"sub {tmp}, {two}, {tmp}\n"
    asm_script += f"mul {inv}, {inv}, {tmp}\n"

    asm_script += f".endr\n"

    asm_script += f"neg {inv}, {inv}\n"
    asm_script += f"and {inv}, {inv}, 0x3FFFFFFF\n"

    asm_script += f"dup {vec_4x_M}.4s, %wregname{inv}\n"

    return asm_script

def init_FUV_GRS(FUV, GRS, f, g, const_2p41, const_2p62):
    asm_script = ""
    asm_script += f"and {FUV}, {f}, #1048575\n"
    asm_script += f"sub {FUV}, {FUV}, {const_2p41}\n"
    asm_script += f"and {GRS}, {g}, #1048575\n"
    asm_script += f"sub {GRS}, {GRS}, {const_2p62}\n"
    return asm_script


def divstepx20(FUV, GRS, delta, m1, ff):
    asm_script = ""
    asm_script += f".rept 20\n"
    asm_script += f"sub {m1}, {delta}, #1\n"
    asm_script += f"tst {GRS}, #1\n"
    asm_script += f"csel {ff}, {FUV}, XZR, ne\n"
    asm_script += f"tst {m1}, {GRS}, ROR #1\n"
    asm_script += f"csneg {delta}, {m1}, {delta}, pl\n"
    asm_script += f"csel {FUV}, {GRS}, {FUV}, mi\n"
    asm_script += f"csneg {ff}, {ff}, {ff}, pl\n"
    asm_script += f"add {GRS}, {GRS}, {ff}\n"
    asm_script += f"asr {GRS}, {GRS}, #1\n"
    asm_script += f".endr\n"
    return asm_script

def prepare_vec_uuvvvrrss(vec_uu0_rr0_vv0_ss0, vec_uu1_rr1_vv1_ss1, vec_4x_2p30m1, uu, vv, rr, ss):
    asm_script = ""
    asm_script += f"ins {vec_uu0_rr0_vv0_ss0}.s[0], %wregname{uu}\n"
    asm_script += f"ins {vec_uu0_rr0_vv0_ss0}.s[1], %wregname{rr}\n"
    asm_script += f"ins {vec_uu0_rr0_vv0_ss0}.s[2], %wregname{vv}\n"
    asm_script += f"ins {vec_uu0_rr0_vv0_ss0}.s[3], %wregname{ss}\n"
    asm_script += f"and {vec_uu0_rr0_vv0_ss0}.16b, {vec_uu0_rr0_vv0_ss0}.16b, {vec_4x_2p30m1}.16b\n"

    asm_script += f"asr {uu}, {uu}, #30\n"
    asm_script += f"asr {vv}, {vv}, #30\n"
    asm_script += f"asr {rr}, {rr}, #30\n"
    asm_script += f"asr {ss}, {ss}, #30\n"

    asm_script += f"ins {vec_uu1_rr1_vv1_ss1}.s[0], %wregname{uu}\n"
    asm_script += f"ins {vec_uu1_rr1_vv1_ss1}.s[1], %wregname{rr}\n"
    asm_script += f"ins {vec_uu1_rr1_vv1_ss1}.s[2], %wregname{vv}\n"
    asm_script += f"ins {vec_uu1_rr1_vv1_ss1}.s[3], %wregname{ss}\n"


    return asm_script


def update_FG(vec_uu0_rr0_vv0_ss0, 
              vec_uu1_rr1_vv1_ss1, 
              vec_F0_F1_G0_G1, 
              vec_F2_F3_G2_G3, 
              vec_F4_F5_G4_G5, 
              vec_F6_F7_G6_G7,
              vec_F8_F9_G8_G9,
              vec_2x_2p30m1,
              vec_prod,
              vec_buffer):
    asm_script = ""

    asm_script += f"// limb 0\n"
    asm_script += f"smull  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F0_F1_G0_G1}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F0_F1_G0_G1}.s[2]\n"

    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 1\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F0_F1_G0_G1}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F0_F1_G0_G1}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F0_F1_G0_G1}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F0_F1_G0_G1}.s[3]\n"

    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 2\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F0_F1_G0_G1}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F0_F1_G0_G1}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F2_F3_G2_G3}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F2_F3_G2_G3}.s[2]\n"

    asm_script += f"and    {vec_F0_F1_G0_G1}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 3\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F2_F3_G2_G3}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F2_F3_G2_G3}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F2_F3_G2_G3}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F2_F3_G2_G3}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_F0_F1_G0_G1}.16b, {vec_F0_F1_G0_G1}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 4\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F2_F3_G2_G3}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F2_F3_G2_G3}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F4_F5_G4_G5}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F4_F5_G4_G5}.s[2]\n"

    asm_script += f"and    {vec_F2_F3_G2_G3}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 5\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F4_F5_G4_G5}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F4_F5_G4_G5}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F4_F5_G4_G5}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F4_F5_G4_G5}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_F2_F3_G2_G3}.16b, {vec_F2_F3_G2_G3}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 6\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F4_F5_G4_G5}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F4_F5_G4_G5}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F6_F7_G6_G7}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F6_F7_G6_G7}.s[2]\n"

    asm_script += f"and    {vec_F4_F5_G4_G5}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 7\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F6_F7_G6_G7}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F6_F7_G6_G7}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F6_F7_G6_G7}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F6_F7_G6_G7}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_F4_F5_G4_G5}.16b, {vec_F4_F5_G4_G5}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 8\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F6_F7_G6_G7}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F6_F7_G6_G7}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_F8_F9_G8_G9}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_F8_F9_G8_G9}.s[2]\n"

    asm_script += f"and    {vec_F6_F7_G6_G7}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 9\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_F8_F9_G8_G9}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_F8_F9_G8_G9}.s[2]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_F8_F9_G8_G9}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_F6_F7_G6_G7}.16b, {vec_F6_F7_G6_G7}.16b, {vec_buffer}.16b\n"

    return asm_script


def update_V_no_reduction(vec_uu0_rr0_vv0_ss0, 
              vec_uu1_rr1_vv1_ss1, 
              vec_V0_V1_S0_S1, 
              vec_V2_V3_S2_S3, 
              vec_V4_V5_S4_S5, 
              vec_V6_V7_S6_S7,
              vec_V8_V9_S8_S9,
              vec_2x_2p30m1,
              vec_m19,
              tmp,
              vec_prod,
              vec_buffer,
              vec_4x_M,
              vec_l0,
              vec_l1):
    

    # Revisit: l0, l1 mul can be more efficient!



    asm_script = ""
    asm_script += f"mov {tmp}, #19\n"
    asm_script += f"dup {vec_m19}.2d, {tmp}\n"


    asm_script += f"// limb 0\n"
    asm_script += f"smull  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V0_V1_S0_S1}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V0_V1_S0_S1}.s[2]\n"

    asm_script += f"mul {vec_l0}.4s, {vec_prod}.4s, {vec_4x_M}.4s\n"
    asm_script += f"and {vec_l0}.16b, {vec_l0}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"uzp1 {vec_l0}.4s, {vec_l0}.4s, {vec_l0}.4s\n"

    asm_script += f"smlsl {vec_prod}.2d, {vec_l0}.2s, {vec_m19}.s[0]\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 1\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V0_V1_S0_S1}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V0_V1_S0_S1}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V0_V1_S0_S1}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V0_V1_S0_S1}.s[3]\n"

    asm_script += f"mul    {vec_l1}.4s, {vec_prod}.4s, {vec_4x_M}.4s\n"

    asm_script += f"and    {vec_l1}.16b, {vec_l1}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"uzp1   {vec_l1}.4s, {vec_l1}.4s, {vec_l1}.4s\n"
    asm_script += f"smlsl  {vec_prod}.2d, {vec_l1}.2s, {vec_m19}.s[0]\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 2\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V0_V1_S0_S1}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V0_V1_S0_S1}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V2_V3_S2_S3}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V2_V3_S2_S3}.s[2]\n"

    asm_script += f"and    {vec_V0_V1_S0_S1}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 3\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V2_V3_S2_S3}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V2_V3_S2_S3}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V2_V3_S2_S3}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V2_V3_S2_S3}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V0_V1_S0_S1}.16b, {vec_V0_V1_S0_S1}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 4\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V2_V3_S2_S3}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V2_V3_S2_S3}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V4_V5_S4_S5}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V4_V5_S4_S5}.s[2]\n"

    asm_script += f"and    {vec_V2_V3_S2_S3}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 5\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V4_V5_S4_S5}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V4_V5_S4_S5}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V4_V5_S4_S5}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V4_V5_S4_S5}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V2_V3_S2_S3}.16b, {vec_V2_V3_S2_S3}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 6\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V4_V5_S4_S5}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V4_V5_S4_S5}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V6_V7_S6_S7}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V6_V7_S6_S7}.s[2]\n"

    asm_script += f"and    {vec_V4_V5_S4_S5}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 7\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V6_V7_S6_S7}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V6_V7_S6_S7}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V6_V7_S6_S7}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V6_V7_S6_S7}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V4_V5_S4_S5}.16b, {vec_V4_V5_S4_S5}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 8\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V6_V7_S6_S7}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V6_V7_S6_S7}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V8_V9_S8_S9}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V8_V9_S8_S9}.s[2]\n"

    asm_script += f"ushll  {vec_l0}.2d, {vec_l0}.2s, #15\n"
    asm_script += f"add    {vec_prod}.2d, {vec_prod}.2d, {vec_l0}.2d\n"

    asm_script += f"and    {vec_V6_V7_S6_S7}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 9\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V8_V9_S8_S9}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V8_V9_S8_S9}.s[2]\n"

    asm_script += f"ushll  {vec_l1}.2d, {vec_l1}.2s, #15\n"
    asm_script += f"add    {vec_prod}.2d, {vec_prod}.2d, {vec_l1}.2d\n"


    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_V8_V9_S8_S9}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V6_V7_S6_S7}.16b, {vec_V6_V7_S6_S7}.16b, {vec_buffer}.16b\n"

    return asm_script

def update_VS(vec_uu0_rr0_vv0_ss0, 
              vec_uu1_rr1_vv1_ss1, 
              vec_V0_V1_S0_S1, 
              vec_V2_V3_S2_S3, 
              vec_V4_V5_S4_S5, 
              vec_V6_V7_S6_S7,
              vec_V8_V9_S8_S9,
              vec_2x_2p30m1,
              vec_m19,
              tmp,
              vec_prod,
              vec_buffer,
              vec_4x_M,
              vec_l0,
              vec_l1):
    

    # Revisit: l0, l1 mul can be more efficient!



    asm_script = ""
    asm_script += f"mov {tmp}, #19\n"
    asm_script += f"dup {vec_m19}.2d, {tmp}\n"


    asm_script += f"// limb 0\n"
    asm_script += f"smull  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V0_V1_S0_S1}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V0_V1_S0_S1}.s[2]\n"

    asm_script += f"mul {vec_l0}.4s, {vec_prod}.4s, {vec_4x_M}.4s\n"
    asm_script += f"and {vec_l0}.16b, {vec_l0}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"uzp1 {vec_l0}.4s, {vec_l0}.4s, {vec_l0}.4s\n"

    asm_script += f"smlsl {vec_prod}.2d, {vec_l0}.2s, {vec_m19}.s[0]\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 1\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V0_V1_S0_S1}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V0_V1_S0_S1}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V0_V1_S0_S1}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V0_V1_S0_S1}.s[3]\n"

    asm_script += f"mul    {vec_l1}.4s, {vec_prod}.4s, {vec_4x_M}.4s\n"

    asm_script += f"and    {vec_l1}.16b, {vec_l1}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"uzp1   {vec_l1}.4s, {vec_l1}.4s, {vec_l1}.4s\n"
    asm_script += f"smlsl  {vec_prod}.2d, {vec_l1}.2s, {vec_m19}.s[0]\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 2\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V0_V1_S0_S1}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V0_V1_S0_S1}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V2_V3_S2_S3}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V2_V3_S2_S3}.s[2]\n"

    asm_script += f"and    {vec_V0_V1_S0_S1}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 3\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V2_V3_S2_S3}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V2_V3_S2_S3}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V2_V3_S2_S3}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V2_V3_S2_S3}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V0_V1_S0_S1}.16b, {vec_V0_V1_S0_S1}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 4\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V2_V3_S2_S3}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V2_V3_S2_S3}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V4_V5_S4_S5}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V4_V5_S4_S5}.s[2]\n"

    asm_script += f"and    {vec_V2_V3_S2_S3}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 5\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V4_V5_S4_S5}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V4_V5_S4_S5}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V4_V5_S4_S5}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V4_V5_S4_S5}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V2_V3_S2_S3}.16b, {vec_V2_V3_S2_S3}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 6\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V4_V5_S4_S5}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V4_V5_S4_S5}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V6_V7_S6_S7}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V6_V7_S6_S7}.s[2]\n"

    asm_script += f"and    {vec_V4_V5_S4_S5}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 7\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V6_V7_S6_S7}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V6_V7_S6_S7}.s[2]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V6_V7_S6_S7}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V6_V7_S6_S7}.s[3]\n"

    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V4_V5_S4_S5}.16b, {vec_V4_V5_S4_S5}.16b, {vec_buffer}.16b\n"


    asm_script += f"// limb 8\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V6_V7_S6_S7}.s[1]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V6_V7_S6_S7}.s[3]\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.2s, {vec_V8_V9_S8_S9}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu0_rr0_vv0_ss0}.4s, {vec_V8_V9_S8_S9}.s[2]\n"

    asm_script += f"ushll  {vec_l0}.2d, {vec_l0}.2s, #15\n"
    asm_script += f"add    {vec_prod}.2d, {vec_prod}.2d, {vec_l0}.2d\n"

    asm_script += f"and    {vec_V6_V7_S6_S7}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_prod}.2d, {vec_prod}.2d, #30\n"


    asm_script += f"// limb 9\n"
    asm_script += f"smlal  {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.2s, {vec_V8_V9_S8_S9}.s[0]\n"
    asm_script += f"smlal2 {vec_prod}.2d, {vec_uu1_rr1_vv1_ss1}.4s, {vec_V8_V9_S8_S9}.s[2]\n"

    asm_script += f"ushll  {vec_l1}.2d, {vec_l1}.2s, #15\n"
    asm_script += f"add    {vec_prod}.2d, {vec_prod}.2d, {vec_l1}.2d\n"


    asm_script += f"and    {vec_buffer}.16b, {vec_prod}.16b, {vec_2x_2p30m1}.16b\n"
    asm_script += f"sshr   {vec_V8_V9_S8_S9}.2d, {vec_prod}.2d, #30\n"
    asm_script += f"shl    {vec_buffer}.2d, {vec_buffer}.2d, #32\n"
    asm_script += f"orr    {vec_V6_V7_S6_S7}.16b, {vec_V6_V7_S6_S7}.16b, {vec_buffer}.16b\n"


    asm_script += f"sshr   {vec_buffer}.2d, {vec_V8_V9_S8_S9}.2d, #15\n"
    asm_script += f"shl    {vec_prod}.2d, {vec_buffer}.2d, #15\n"
    asm_script += f"sub    {vec_V8_V9_S8_S9}.2d, {vec_V8_V9_S8_S9}.2d, {vec_prod}.2d\n"

    asm_script += f"mla    {vec_V0_V1_S0_S1}.4s, {vec_buffer}.4s, {vec_m19}.4s\n"

    return asm_script

def loop_get_low60(vec_F0_F1_G0_G1, f, g, f_low, g_low, f_high, g_high):
    asm_script = ""
    asm_script += f"mov %wregname{f_low}, {vec_F0_F1_G0_G1}.s[0]\n"
    asm_script += f"mov %wregname{f_high}, {vec_F0_F1_G0_G1}.s[1]\n"
    asm_script += f"mov %wregname{g_low}, {vec_F0_F1_G0_G1}.s[2]\n"
    asm_script += f"mov %wregname{g_high}, {vec_F0_F1_G0_G1}.s[3]\n"

    asm_script += f"add {f}, {f_low}, {f_high}, LSL #30\n"
    asm_script += f"add {g}, {g_low}, {g_high}, LSL #30\n"

    return asm_script

def sign_extraction(sign, vec_l0_l_l_l):
    asm_script = ""
    asm_script += f"smov {sign}, {vec_l0_l_l_l}.s[0]\n"
    asm_script += f"lsl {sign}, {sign}, #35\n"
    asm_script += f"asr {sign}, {sign}, #37\n"

    return asm_script

def w_register_replacement(asm_script: str):
    return asm_script.replace("_%wx","w").replace("%wregnamex","w")

def q_register_replacement(asm_script: str):
    return asm_script.replace("_%qv","q").replace("%qregnamev","q")


def enter(program_name):
    asm_script = ""
    asm_script += f".global {program_name}\n"
    asm_script += f".global _{program_name}\n"

    asm_script += f"{program_name}:\n"
    asm_script += f"_{program_name}:\n"
    return asm_script

def ret():
    return "ret\n"

def draw_line(comment_symbol="//", line_length=40):
    return f"\n\n\n{comment_symbol} {'-' * line_length}\n\n\n\n"

def comment(text, comment_symbol="//"):
    return f"\n\n{comment_symbol}\n{comment_symbol} {text}\n{comment_symbol}\n\n\n"

def dot_include(include_file):
    asm_script = ""
    asm_script += f".include \"{include_file}\"\n"
    return asm_script

def C_include(include_file):
    asm_script = ""
    asm_script += f"#include \"{include_file}\"\n"
    return asm_script






# ---


def write_snap_inc(path):
    content = """#pragma once
// ──────────────────────────────────────────────────────────────
//  snap.inc – scalar & vector register snapshot macros (AArch64)
// ──────────────────────────────────────────────────────────────

/*
 * 使用方式：
 *   • 在組譯命令加上 -DASM_TRACE，可啟用所有快照巨集。
 *   • 不加 -DASM_TRACE 亦可順利編譯，巨集本體將被摺疊為空。
 */

// #define ASM_TRACE 1

#ifdef ASM_TRACE
    .text

// ──────────────────────────────────────────────────────────────
// Helper 1：push all caller-saved GPR + x30
// ──────────────────────────────────────────────────────────────
    .macro SNAP_PUSH_CALLER
        stp  x0,  x1,  [sp, #-16]!
        stp  x2,  x3,  [sp, #-16]!
        stp  x4,  x5,  [sp, #-16]!
        stp  x6,  x7,  [sp, #-16]!
        stp  x8,  x9,  [sp, #-16]!
        stp  x10, x11, [sp, #-16]!
        stp  x12, x13, [sp, #-16]!
        stp  x14, x15, [sp, #-16]!
        stp  x16, x17, [sp, #-16]!
        sub  sp, sp, #16
        str  x30,      [sp]
        sub  sp, sp, #128
        stp  q0,  q1,  [sp, #0]
        stp  q2,  q3,  [sp, #32]
        stp  q4,  q5,  [sp, #64]
        stp  q6,  q7,  [sp, #96]
    .endm

// ──────────────────────────────────────────────────────────────
    .macro SNAP_POP_CALLER
        ldp  q6,  q7,  [sp, #96]
        ldp  q4,  q5,  [sp, #64]
        ldp  q2,  q3,  [sp, #32]
        ldp  q0,  q1,  [sp, #0]
        add  sp, sp, #128
        ldr  x30,      [sp]
        add  sp, sp, #16
        ldp  x16, x17, [sp], #16
        ldp  x14, x15, [sp], #16
        ldp  x12, x13, [sp], #16
        ldp  x10, x11, [sp], #16
        ldp  x8,  x9,  [sp], #16
        ldp  x6,  x7,  [sp], #16
        ldp  x4,  x5,  [sp], #16
        ldp  x2,  x3,  [sp], #16
        ldp  x0,  x1,  [sp], #16
    .endm

// ──────────────────────────────────────────────────────────────
    .macro SNAP_SCALAR_REG reg, tag
        SNAP_PUSH_CALLER
        mov  x0,  \\reg
        adr  x1,  1000f
        bl   _print_scalar_reg_tag
        SNAP_POP_CALLER
        b    2000f
        .balign 4
1000:   .asciz "\\tag"
        .balign 4
2000:
    .endm

// ──────────────────────────────────────────────────────────────
    .macro SNAP_VECTOR_REG_U32x4 vreg, tag
        SNAP_PUSH_CALLER
        sub  sp, sp, #16
        st1  {\\vreg\\().4s}, [sp]
        mov  x0,  sp
        adr  x1,  1000f
        bl   _print_vector_reg_u32x4
        add  sp, sp, #16
        SNAP_POP_CALLER
        b    2000f
        .balign 4
1000:   .asciz "\\tag"
        .balign 4
2000:
    .endm

// ──────────────────────────────────────────────────────────────
    .macro SNAP_VECTOR_REG_U64x2 vreg, tag
        SNAP_PUSH_CALLER
        sub  sp, sp, #16
        st1  {\\vreg\\().2d}, [sp]
        mov  x0,  sp
        adr  x1,  1000f
        bl   _print_vector_reg_u64x2
        add  sp, sp, #16
        SNAP_POP_CALLER
        b    2000f
        .balign 4
1000:   .asciz "\\tag"
        .balign 4
2000:
    .endm

#else
    .macro SNAP_PUSH_CALLER
    .endm

    .macro SNAP_POP_CALLER
    .endm

    .macro SNAP_SCALAR_REG reg, tag
    .endm

    .macro SNAP_VECTOR_REG_U32x4 vreg, tag
    .endm

    .macro SNAP_VECTOR_REG_U64x2 vreg, tag
    .endm
#endif
"""
    with open(path, "w") as f:
        f.write(content)

