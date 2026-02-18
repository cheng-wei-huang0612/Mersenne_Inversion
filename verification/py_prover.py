
import subprocess
from gen_cl import *

cryptoline_path = "../home/ubuntu/cryptoline"
rule_path = "my_aarch64.rules"
gas_path = "gas_files/inverse.gas"
raw_cl_path = "test_inverse_raw.cl"
cl_path = "test_inverse.cl"


def get_raw_cl():
    cmd = [
        "python3",
        f"{cryptoline_path}/scripts/to_zdsl.py",
        "--no-post",
        "-r",
        rule_path,
        gas_path,
        "-o",
        raw_cl_path
    ]

    try:
        r = subprocess.run(
            cmd,
            check=True,
            capture_output=True,
            text=True,
        )
    except subprocess.CalledProcessError as e:
        print("Command failed:")
        print(" ", e.cmd)
        print("returncode:", e.returncode)
        print("---- stdout ----")
        print(e.stdout or "")
        print("---- stderr ----")
        print(e.stderr or "")
        return e.returncode

    print(r.stdout, end="")
    if r.stderr:
        print(r.stderr, end="")
    return 0


def do_cv(cmd = None, log_to_cl = False):
    if cmd == None:
        cmd = [
            "cv",
            "-v",
            cl_path,
        ]

    print(cmd)

    try:
        r = subprocess.run(
            cmd,
            check=True,
            capture_output=True,
            text=True,
        )
    except subprocess.CalledProcessError as e:
        print("Command failed:")
        print(" ", e.cmd)
        print("returncode:", e.returncode)
        print("---- stdout ----")
        print(e.stdout or "")
        print("---- stderr ----")
        print(e.stderr or "")
        return e.returncode

    print(r.stdout, end="")

    if log_to_cl:
        # append stdout to the top/bottom of the .cl file
        banner = f"(*\n{" ".join(cmd)}\n{r.stdout}\n*)\n"
        try:
            with open(cl_path, "r", encoding="utf-8") as f:
                original = f.read()
            with open(cl_path, "w", encoding="utf-8") as f:
                f.write(banner)
                f.write(original)
                if not original.endswith("\n"):
                    f.write("\n")
                f.write("\n\n\n")
                f.write(banner)
        except OSError as e:
            print(f"Failed to update {cl_path}: {e}")
            return 1

    if r.stderr:
        print(r.stderr, end="")
    return 0



def get_next_instruction(byte_ptr, with_cl = True):
    """
    byte_ptr: int file offset (fin.tell()).
    Returns: (content:str|None, new_byte_ptr:int)
    """
    with open(raw_cl_path, "r", encoding="utf-8") as fin:
        fin.seek(byte_ptr)

        # 1) 找到下一個 "(*"
        line = fin.readline()
        while line and not line.lstrip().startswith("(*"):
            line = fin.readline()
        if not line:
            return None, fin.tell()

        # 2) 讀一個 block：從這行開始，到下一個 "(*" 前
        block_lines = [line]
        while True:
            pos = fin.tell()
            line = fin.readline()
            if not line:
                # EOF
                break
            if line.lstrip().startswith("(*"):
                # 下一個 block 的開頭：回退到它之前的位置
                fin.seek(pos)
                break
            block_lines.append(line)

        # 3) if with_cl == False, erase all cl syntax
        if not with_cl:
            block_lines = [block_lines[0]]

        return fin.tell(), "".join(block_lines)


def getandappend_next_instruction(byte_ptr, emit_blocks, with_cl = True):
    byte_ptr, blk = get_next_instruction(byte_ptr, with_cl)
    emit_blocks.append(blk)
    return byte_ptr

def getandappend_multiple_next_instruction(byte_ptr, emit_blocks, num, with_cl = True):
    for _ in range(num):
        byte_ptr, blk = get_next_instruction(byte_ptr, with_cl)
        emit_blocks.append(blk)
    return byte_ptr

def main():
    get_raw_cl()


    emit_blocks = []

    emit_blocks.append("""
proc divstep_ver_a(fuv@sint64, grs@sint64, delta@sint64, delta_range@sint64;
                   fuv_out@sint64, grs_out@sint64, delta_out@sint64, ne_out@bit, delta_range_out@sint64) = {
    true && 
    fuv = (const 64 1) (mod (const 64 2)),
    (const 64 (-1400)) <=s delta_range, delta_range <=s (const 64 1400),
    ((const 64 0)-delta_range) <=s delta, delta <=s delta_range
}

mov x8 grs;
mov x7 fuv;
mov x3 delta;


(* tst	x8, #0x1 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;

(* csel	x10, x7, xzr, ne *)
cmov x10 ne x7 0@sint64;

(* ccmp	x3, xzr, #0x8, ne *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;

(* cneg	x3, x3, ge *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;;

(* cneg	x10, x10, ge *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;;

(* csel	x7, x8, x7, ge *)
cmov x7 ge x8 x7;

(* add	x8, x8, x10 *)
adds dc x8 x8 x10;

(* add	x3, x3, #0x2 *)
add x3 x3 0x2@sint64;

(* tst	x8, #0x2 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;

(* asr	x8, x8, #1 *)
ssplit x8 dcL x8 1;

assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
mov ne_out ne;
add delta_range_out delta_range 2@sint64;

{true &&
    fuv_out = (const 64 1) (mod (const 64 2)),
    grs_out = (uext ne_out 63) (mod (const 64 2)),
    (const 64 0) -delta_range_out <=s delta_out, delta_out <=s delta_range_out,
    delta_range_out = delta_range + (const 64 2)
}
""")

    emit_blocks.append("""
proc divstep_ver_b(fuv@sint64, grs@sint64, delta@sint64, ne@bit, delta_range@sint64;
                   fuv_out@sint64, grs_out@sint64, delta_out@sint64, ne_out@bit, delta_range_out@sint64) = {
    true && 
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    ((const 64 0)-delta_range) <=s delta, delta <=s delta_range,
    (const 64 (-1400)) <=s delta_range, delta_range <=s (const 64 1400)
}

mov x8 grs;
mov x7 fuv;
mov x3 delta;

(* csel	x10, x7, xzr, ne *)
cmov x10 ne x7 0@sint64;	// ne = any;

(* ccmp	x3, xzr, #0x8, ne *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;

(* cneg	x3, x3, ge *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;

(* cneg	x10, x10, ge *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;

(* csel	x7, x8, x7, ge *)
cmov x7 ge x8 x7;	// ge = tcont;

(* add	x8, x8, x10 *)
adds dc x8 x8 x10;

(* add	x3, x3, #0x2 *)
add x3 x3 0x2@sint64;

(* tst	x8, #0x2 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;

(* asr	x8, x8, #1 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
mov ne_out ne;
add delta_range_out delta_range 2@sint64;


{true &&
    fuv_out = (const 64 1) (mod (const 64 2)),
    grs_out = (uext ne_out 63) (mod (const 64 2)),
    (const 64 0) -delta_range_out <=s delta_out, delta_out <=s delta_range_out,
    delta_range_out = delta_range + (const 64 2)
}
""")



    emit_blocks.append("""
proc divstep_ver_c(fuv@sint64, grs@sint64, delta@sint64, ne@bit, delta_range@sint64;
                   fuv_out@sint64, grs_out@sint64, delta_out@sint64, delta_range_out@sint64) = {
    true && 
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    ((const 64 0)-delta_range) <=s delta, delta <=s delta_range,
    (const 64 (-1400)) <=s delta_range, delta_range <=s (const 64 1400)
}

mov x8 grs;
mov x7 fuv;
mov x3 delta;

(* csel	x10, x7, xzr, ne *)
cmov x10 ne x7 0@sint64;	// ne = any;

(* ccmp	x3, xzr, #0x8, ne *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;

(* cneg	x3, x3, ge *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;

(* cneg	x10, x10, ge *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;

(* csel	x7, x8, x7, ge *)
cmov x7 ge x8 x7;	// ge = tcont;

(* add	x8, x8, x10 *)
adds dc x8 x8 x10;

(* add	x3, x3, #0x2 *)
add x3 x3 0x2@sint64;

(* asr	x8, x8, #1 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
add delta_range_out delta_range 2@sint64;


{true &&
    fuv_out = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range_out <=s delta_out, delta_out <=s delta_range_out,
    delta_range_out = delta_range + (const 64 2)
}
""")

    emit_blocks.append("""
proc extraction (
    fuv@sint64, grs@sint64,
    f_xxx_20@sint64, g_xxx_20@sint64,
    u@sint64, r@sint64,
    v@sint64, s@sint64,
    const_2p41a2p20@sint64;
    u_out@sint64, r_out@sint64,
    v_out@sint64, s_out@sint64

)
= {
    true
&&
    fuv = f_xxx_20 + u * (const 64 (2**21)) + v * (const 64 (2**42)),
    grs = g_xxx_20 + r * (const 64 (2**21)) + s * (const 64 (2**42)),

    (const 64 (-(2**20)+1)) <=s f_xxx_20,
    f_xxx_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_xxx_20,
    g_xxx_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1)),

    const_2p41a2p20 = (const 64 (2**20 + 2**41))
}

mov x6 const_2p41a2p20;
mov x7 fuv;
mov x8 grs;


(* add	x12, x7, x6                                 #! PC = 0xaaaaafca0c08 *)
add x12 x7 x6;

(* asr	x12, x12, #42                               #! PC = 0xaaaaafca0c0c *)
cast x12@sint64 x12;
split x12 dc x12 42;

(* add	x11, x7, #0x100, lsl #12                    #! PC = 0xaaaaafca0c10 *)
add x11 x7 (2**20)@sint64;

(* lsl	x11, x11, #22                               #! PC = 0xaaaaafca0c14 *)
split dcH x11 x11 (64-22); shl x11 x11 22;

(* asr	x11, x11, #43                               #! PC = 0xaaaaafca0c18 *)
cast x11@sint64 x11;
split x11 dc x11 43;

(* add	x14, x8, x6                                 #! PC = 0xaaaaafca0c1c *)
add x14 x8 x6;

(* asr	x14, x14, #42                               #! PC = 0xaaaaafca0c20 *)
cast x14@sint64 x14;
split x14 dc x14 42;

(* add	x13, x8, #0x100, lsl #12                    #! PC = 0xaaaaafca0c24 *)
add x13 x8 (2**20)@sint64;

(* lsl	x13, x13, #22                               #! PC = 0xaaaaafca0c28 *)
split dcH x13 x13 (64-22); shl x13 x13 22;

(* asr	x13, x13, #43                               #! PC = 0xaaaaafca0c2c *)
cast x13@sint64 x13;
split x13 dc x13 43;


mov u_out x11;
mov v_out x12;
mov r_out x13;
mov s_out x14;


assert true && u_out = u;
assert true && v_out = v;
assert true && r_out = r;
assert true && s_out = s;
assume u_out = u && u_out = u;
assume v_out = v && v_out = v;
assume r_out = r && r_out = r;
assume s_out = s && s_out = s;


{
    u_out = u,
    v_out = v,
    r_out = r,
    s_out = s
    &&
    u_out = u,
    v_out = v,
    r_out = r,
    s_out = s
}
""")


    emit_blocks.append("""
proc update_fg_1 (
f@sint64, g@sint64,
u@sint64, r@sint64,
v@sint64, s@sint64,
f_updated@sint64, g_updated@sint64;
f_out@sint64, g_out@sint64
)
=
{
    u * f + v * g = f_updated * (-(2**20)),
    r * f + s * g = g_updated * (-(2**20))
    &&
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1))
}

mov x11 u;
mov x12 v;
mov x13 r;
mov x14 s;
mov x1 f;
mov x2 g;


(* mul	x9, x11, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x11 x1;
(* madd	x9, x12, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x12;
adds dc x9 x9 tmp;

assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * f_updated (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * f_updated;

(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;
(* mul	x10, x13, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x13 x1;
(* madd	x10, x14, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x14;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * g_updated (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * g_updated;

(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;
(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;



assert true && x1 = (const 64 (-1)) * f_updated (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_updated (mod (const 64 (2**44)));
mov f_out x1;
mov g_out x2;



{true &&
    f_out = (const 64 (-1)) * f_updated (mod (const 64 (2**44))),
    g_out = (const 64 (-1)) * g_updated (mod (const 64 (2**44)))
}
""")

    emit_blocks.append("""
proc update_fg_2 (
f@sint64, g@sint64,
u@sint64, r@sint64,
v@sint64, s@sint64,
f_updated@sint64, g_updated@sint64;
f_out@sint64, g_out@sint64
)
=
{
    u * f + v * g = f_updated * (-(2**20)),
    r * f + s * g = g_updated * (-(2**20))
    &&
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1))
}

mov x15 u;
mov x16 v;
mov x17 r;
mov x20 s;
mov x1 f;
mov x2 g;


(* mul	x9, x15, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x15 x1;
(* madd	x9, x16, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x16;
adds dc x9 x9 tmp;

assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * f_updated (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * f_updated;

(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;
(* mul	x10, x17, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x17 x1;
(* madd	x10, x20, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x20;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * g_updated (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * g_updated;


(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;
(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;




assert true && x1 = (const 64 (-1)) * f_updated (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_updated (mod (const 64 (2**44)));
mov f_out x1;
mov g_out x2;



{true && 
    f_out = (const 64 (-1)) * f_updated (mod (const 64 (2**44))),
    g_out = (const 64 (-1)) * g_updated (mod (const 64 (2**44)))
}
""")

    emit_blocks.append("""

proc update_uuvvrrss (
    u_0_20@sint64,
    v_0_20@sint64,
    r_0_20@sint64,
    s_0_20@sint64,
    u_20_40@sint64,
    v_20_40@sint64,
    r_20_40@sint64,
    s_20_40@sint64;
    u_0_40@sint64,
    v_0_40@sint64,
    r_0_40@sint64,
    s_0_40@sint64
) = 
{
  true
        &&

(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20) - 1)),
u_20_40 + v_20_40 <=s (const 64 (2**20)),
u_20_40 - v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
r_20_40 + s_20_40 <=s (const 64 (2**20)),
r_20_40 - s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
u_0_20 + v_0_20 <=s (const 64 (2**20)),
u_0_20 - v_0_20 <=s (const 64 (2**20)),
(const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
(const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
r_0_20 + s_0_20 <=s (const 64 (2**20)),
r_0_20 - s_0_20 <=s (const 64 (2**20)),
(const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
(const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))
}




mov x11 u_0_20;
mov x12 v_0_20;
mov x13 r_0_20;
mov x14 s_0_20;
mov x15 u_20_40;
mov x16 v_20_40;
mov x17 r_20_40;
mov x20 s_20_40;



// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
smul x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
smul tmp x13 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
smul x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
smul tmp x13 x20;
sadd x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
smul x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
smul tmp x14 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
smul x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
smul tmp x14 x20;
sadd x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;

mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;


assert
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
    && true
;

assert true &&
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
;

// By theorem from matrix norm, we have
assume true &&
u_0_40 + v_0_40 <=s (const 64 (2**40)),
u_0_40 - v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
r_0_40 + s_0_40 <=s (const 64 (2**40)),
r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1));

{
u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
    &&
u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40,
u_0_40 + v_0_40 <=s (const 64 (2**40)),
u_0_40 - v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
r_0_40 + s_0_40 <=s (const 64 (2**40)),
r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1))
}


proc update_uuvvrrss_2 (
    u_0_40@sint64,
    v_0_40@sint64,
    r_0_40@sint64,
    s_0_40@sint64,
    u_40_59@sint64,
    v_40_59@sint64,
    r_40_59@sint64,
    s_40_59@sint64;
    u_0_59@sint64,
    v_0_59@sint64,
    r_0_59@sint64,
    s_0_59@sint64
) = 
{
  true
        &&

    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1)),

    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20) - 1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40))

}




mov x11 u_0_40;
mov x12 v_0_40;
mov x13 r_0_40;
mov x14 s_0_40;
mov x15 u_40_59;
mov x16 v_40_59;
mov x17 r_40_59;
mov x20 s_40_59;



// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
smul x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
smul tmp x13 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
smul x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
smul tmp x13 x20;
sadd x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
smul x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
smul tmp x14 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
smul x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
smul tmp x14 x20;
sadd x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;

mov u_0_59 x11;
mov v_0_59 x12;
mov r_0_59 x13;
mov s_0_59 x14;


assert
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    && true
;

assert true &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
;

// By theorem from matrix norm, we have
assume true &&
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1));

{
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59,
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1))
}

proc prepare_vec_uuvvrrss (
u@sint64, v@sint64, r@sint64, s@sint64,
%vec_4x_2p30m1@sint32[4];
%vec_uu0_rr0_vv0_ss0@sint32[4], %vec_uu1_rr1_vv1_ss1@sint32[4])
= {true &&
%vec_4x_2p30m1 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32],
(const 64 (-(2**60))) <=s u, u <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v, v <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r, r <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s, s <=s (const 64 ((2**60) - 1))
}

mov x11 u;
mov x12 v;
mov x13 r;
mov x14 s;
nondet %v16@sint64[2];
nondet %v17@sint64[2];
mov %v2 %vec_4x_2p30m1;

(* mov	v16.d[0], x11                               #! PC = 0xaaaabe371960 *)
mov %v16 [x11, %v16[1]];

(* mov	v16.d[1], x13                               #! PC = 0xaaaabe371964 *)
mov %v16 [%v16[0], x13];

(* mov	v17.d[0], x12                               #! PC = 0xaaaabe371968 *)
mov %v17 [x12, %v17[1]];

(* mov	v17.d[1], x14                               #! PC = 0xaaaabe37196c *)
mov %v17 [%v17[0], x14];

(* uzp1	v13.4s, v16.4s, v17.4s                     #! PC = 0xaaaabe371970 *)
cast %v16@sint32[4] %v16;
cast %v17@sint32[4] %v17;
mov %v13 [%v16[0], %v16[2], %v17[0], %v17[2]];

(* and	v13.16b, v13.16b, v2.16b                    #! PC = 0xaaaabe371974 *)
and %v13@sint32[4] %v13 %v2;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371978 *)
cast %v16@sint64[2] %v16;
split %v16 %dc %v16 30;

(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37197c *)
cast %v17@sint64[2] %v17;
split %v17 %dc %v17 30;

(* uzp1	v14.4s, v16.4s, v17.4s                     #! PC = 0xaaaabe371980 *)
cast %v16@sint32[4] %v16;
cast %v17@sint32[4] %v17;
mov %v14 [%v16[0], %v16[2], %v17[0], %v17[2]];

mov %vec_uu0_rr0_vv0_ss0 %v13;
mov %vec_uu1_rr1_vv1_ss1 %v14;

{true &&
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]]) 2 = u,
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]]) 2 = r,
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]]) 2 = v,
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]]) 2 = s
}
""")










    emit_blocks.append("""
proc main(op_x0@uint64, op_x1@uint64, op_x2@uint64, op_x3@uint64)
= {true && true}

nondet x19@uint64;
nondet x20@uint64;
nondet x21@uint64;
nondet x22@uint64;
nondet x23@uint64;
nondet x24@uint64;
nondet x25@uint64;
nondet x26@uint64;
nondet x27@uint64;
nondet x28@uint64;
nondet x29@uint64;
nondet x30@uint64;
nondet sp@uint64;
nondet %v8@uint64[2];
nondet %v9@uint64[2];
nondet %v10@uint64[2];
nondet %v11@uint64[2];
nondet %v12@uint64[2];
nondet %v13@uint64[2];
nondet %v14@uint64[2];
nondet %v15@uint64[2];



nondet %v3@sint32[4];
nondet %v5@sint32[4];
nondet %v6@sint32[4];




mov L0xffffc68e1808 op_x0;
mov L0xffffc68e1810 op_x1;
mov L0xffffc68e1818 op_x2;
mov L0xffffc68e1820 op_x3;
""")

    byte_ptr = 0


    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 12)
    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks)
    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks)

    emit_blocks.append("""
    ghost x5_old@uint64, x22_old@uint64, x4_old@uint64, x21_old@uint64:
    and [x5_old = x5, x22_old = x22, x4_old = x4, x21_old = x21]
    &&
    and [x5_old = x5, x22_old = x22, x4_old = x4, x21_old = x21]
    ;
""")


    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 14)


    emit_blocks.append("""
    // so far x5 x22 x4 x21 should be normalize to mod 25519
    assert
    true &&
    ulimbs 64 [x5_old, x22_old, x4_old, x21_old] = 
    ulimbs 64 [x5, x22, x4, x21]
    (mod (const 256 ((2**255) - 19))),
    slimbs 64 [x5, x22, x4, x21] >=s (const 256 0),
    slimbs 64 [x5, x22, x4, x21] <=s (const 256 ((2**255) - 19))
    ;

""")





    emit_blocks.append("""
cast %v5@uint64[2] %v5;
cast %v6@uint64[2] %v6;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 5)


    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 2)

    emit_blocks.append("""
cast %v3@uint64[2] %v3;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 41)

    emit_blocks.append("""
cast %v1@sint32[4] %v1;
nondet %v2@sint32[4];
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 6)

    emit_blocks.append("""
cast x3@sint64 x3;
""")


    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks, with_cl = False)
    emit_blocks.append("""
mov x6 0x20000000000@sint64;
""")
    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks, with_cl = False)
    emit_blocks.append("""
split dcH tmp 0x100@sint64 52;
cast tmp@sint64 tmp;
shl tmp tmp 12;
adds carry x6 x6 tmp;
""")


    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks, with_cl = False)
    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks, with_cl = False)
    emit_blocks.append("""
mov x7 678100992@uint64;
""")



    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks)



    emit_blocks.append("""
    cast %v3@sint32[4] %v3;
    mov [F0, F1, G0, G1] %v3;
    cast %v4@sint32[4] %v4;
    mov [F2, F3, G2, G3] %v4;
    cast %v5@sint32[4] %v5;
    mov [F4, F5, G4, G5] %v5;
    cast %v6@sint32[4] %v6;
    mov [F6, F7, G6, G7] %v6;
    cast %v7@sint32[4] %v7;
    mov [F8, F9, G8, G9] %v7;
    cast %v8@sint32[4] %v8;
    mov [V0, V1, S0, S1] %v8;
    cast %v9@sint32[4] %v9;
    mov [V2, V3, S2, S3] %v9;
    cast %v10@sint32[4] %v10;
    mov [V4, V5, S4, S5] %v10;
    cast %v11@sint32[4] %v11;
    mov [V6, V7, S6, S7] %v11;
    cast %v12@sint32[4] %v12;
    mov [V8, V9, S8, S9] %v12;

    mov %vec_4x_2p30m1 %v2;
""")

    emit_blocks.append(cl_assert(Epred(), Rpred(
    "F0 = (const 32 ((2**30) - 19))",
    "F1 = (const 32 ((2**30) -  1))",
    "F2 = (const 32 ((2**30) -  1))",
    "F3 = (const 32 ((2**30) -  1))",
    "F4 = (const 32 ((2**30) -  1))",
    "F5 = (const 32 ((2**30) -  1))",
    "F6 = (const 32 ((2**30) -  1))",
    "F7 = (const 32 ((2**30) -  1))",
    "F8 = (const 32 ((2**15) -  1))",
    "F9 = (const 32 0)",
    "G9 = (const 32 0)",
    "V0 = (const 32 0)",
    "V1 = (const 32 0)",
    "V2 = (const 32 0)",
    "V3 = (const 32 0)",
    "V4 = (const 32 0)",
    "V5 = (const 32 0)",
    "V6 = (const 32 0)",
    "V7 = (const 32 0)",
    "V8 = (const 32 0)",
    "V9 = (const 32 0)",
    "S0 = (const 32 1)",
    "S1 = (const 32 0)",
    "S2 = (const 32 0)",
    "S3 = (const 32 0)",
    "S4 = (const 32 0)",
    "S5 = (const 32 0)",
    "S6 = (const 32 0)",
    "S7 = (const 32 0)",
    "S8 = (const 32 0)",
    "S9 = (const 32 0)",
    "(const 32 0) <=s F0, F0 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F1, F1 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F2, F2 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F3, F3 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F4, F4 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F5, F5 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F6, F6 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F7, F7 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s F8, F8 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G0, G0 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G1, G1 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G2, G2 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G3, G3 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G4, G4 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G5, G5 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G6, G6 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G7, G7 <=s (const 32 ((2**30)-1))",
    "(const 32 0) <=s G8, G8 <=s (const 32 ((2**30)-1))",

    "slimbs 30 [F0, F1, F2, F3, F4, F5, F6, F7, F8] = (const 272 ((2**255) - 19))",
    "slimbs 30 [G0, G1, G2, G3, G4, G5, G6, G7, G8] = (uext (limbs 64 [op_x0, op_x1, op_x2, op_x3]) 16) (mod (const 272 ((2**255) - 19)))",
    "slimbs 30 [V0, V1, V2, V3, V4, V5, V6, V7, V8] = (const 272 0)",
    "slimbs 30 [S0, S1, S2, S3, S4, S5, S6, S7, S8] = (const 272 1)",

    "%v2 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32]",

    "ulimbs 64 [x4, x21] = const 128 (-19)",
    "uext (ulimbs 64 [x5, x22]) 144 = slimbs 30 [G0, G1, G2, G3, G4, G5, G6, G7, G8] (mod (const 272 (2**128)))",


    "%v15 = [678100992@uint32, 678100992@uint32, 678100992@uint32, 678100992@uint32]",
    "x6 = (const 64 (2**20 + 2**41))",
    )))



    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 4)


    emit_blocks.append("""
    cast x1@sint64 x1;
    cast x2@sint64 x2;
    cast x7@sint64 x7;
    cast x8@sint64 x8;

mov const_2p41a2p20 x6;
mov f_0_low60_0 x1;
mov g_0_low60_0 x2;
mov delta x3;
mov fuv x7;
mov grs x8;
and f_0_low60_0_low20_0@sint64 f_0_low60_0 (2**20 - 1)@sint64;
and g_0_low60_0_low20_0@sint64 g_0_low60_0 (2**20 - 1)@sint64;
mov u_0_20 (-(2**20))@sint64;
mov v_0_20 ( 0)@sint64;
mov r_0_20 ( 0)@sint64;
mov s_0_20 (-(2**20))@sint64;

cut
u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
fuv = f_0_low60_0_low20_0 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
grs = g_0_low60_0_low20_0 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_0,
f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_0,
g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
fuv = (const 64 1) (mod (const 64 2)),
delta = (const 64 1),
u_0_20 = (const 64 (-(2**20))),
v_0_20 = (const 64 (0)),
r_0_20 = (const 64 (0)),
s_0_20 = (const 64 (-(2**20))),
const_2p41a2p20 = (const 64 (2**20 + 2**41)),
%v2 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32]
;
""")

    emit_blocks.append("// divstep 0")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 10, with_cl = False)
    emit_blocks.append("""
call divstep_ver_a(x7, x8, x3, 1@sint64; x7, x8 ,x3, ne, delta_range);
""")

    for i in range(1,19):
        emit_blocks.append(f"// divstep {i}")
        byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 9, with_cl = False)

        emit_blocks.append("""
call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);
""")


    emit_blocks.append("// divstep 19")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 8, with_cl = False)
    emit_blocks.append("""
call divstep_ver_c(x7, x8, x3, ne, delta_range; x7, x8 ,x3, delta_range);
""")



    emit_blocks.append("""
mov fuv x7;
mov grs x8;
mov delta x3;

nondet f_0_low60_0_low20_20@sint64;
nondet g_0_low60_0_low20_20@sint64;
nondet u_0_20@sint64;
nondet v_0_20@sint64;
nondet r_0_20@sint64;
nondet s_0_20@sint64;
nondet f_0_low60_20@sint64;
nondet g_0_low60_20@sint64;

// from lemma we have
assume
    u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
    r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    fuv = (const 64 1) (mod (const 64 2)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20)),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))
;

// by the theory of jumpdivstep, we have
assume
    u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
    r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
    f_0_low60_20 = (const 64 1) (mod (const 64 2))
;

cut
    u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
    r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    f_0_low60_20 = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 41),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20)),
    const_2p41a2p20 = (const 64 (2**20 + 2**41))
;
""")

    emit_blocks.append("""
// extraction
""")


    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 10, with_cl = False)
    emit_blocks.append("""
call extraction(
    x7, x8,
    f_0_low60_0_low20_20, g_0_low60_0_low20_20,
    u_0_20, r_0_20,
    v_0_20, s_0_20,
    x6;
    x11, x13,
    x12, x14);
""")


    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 7, with_cl = False)
    emit_blocks.append("""
call update_fg_1(
    x1, x2,
    x11, x13,
    x12, x14,
    f_0_low60_20, g_0_low60_20;
    x1, x2
    );
""")


    emit_blocks.append("""
mov neg_f_0_low60_20 x1;
mov neg_g_0_low60_20 x2;
assert true && neg_f_0_low60_20 = (const 64 (-1)) * f_0_low60_20 (mod (const 64 (2**44)));
assert true && neg_g_0_low60_20 = (const 64 (-1)) * g_0_low60_20 (mod (const 64 (2**44)));

mov const_2p41a2p20 x6;

""")




    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 4)

    emit_blocks.append("""
    cast x1@sint64 x1;
    cast x2@sint64 x2;
    cast x7@sint64 x7;
    cast x8@sint64 x8;

mov const_2p41a2p20 x6;
mov neg_f_0_low60_20 x1;
mov neg_g_0_low60_20 x2;
mov delta x3;
mov fuv x7;
mov grs x8;
and neg_f_0_low60_20_low20_0@sint64 neg_f_0_low60_20 (2**20 - 1)@sint64;
and neg_g_0_low60_20_low20_0@sint64 neg_g_0_low60_20 (2**20 - 1)@sint64;
mov u_20_40 (-(2**20))@sint64;
mov v_20_40 ( 0)@sint64;
mov r_20_40 ( 0)@sint64;
mov s_20_40 (-(2**20))@sint64;
cut
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))
&&
    fuv = neg_f_0_low60_20_low20_0 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_0 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 41),
    u_20_40 = (const 64 (-(2**20))),
    v_20_40 = (const 64 (0)),
    r_20_40 = (const 64 (0)),
    s_20_40 = (const 64 (-(2**20))),
    const_2p41a2p20 = (const 64 (2**20 + 2**41)),

and [
    x11 = u_0_20,
    x12 = v_0_20,
    x13 = r_0_20,
    x14 = s_0_20,
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))] prove with [all cuts]
;
""")


    emit_blocks.append("// divstep 20")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 10, with_cl = False)
    emit_blocks.append("""
call divstep_ver_a(x7, x8, x3, delta_range; x7, x8 ,x3, ne, delta_range);
""")

    for i in range(1,19):
        emit_blocks.append(f"// divstep {i+20}")
        byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 9, with_cl = False)

        emit_blocks.append("""
call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);
""")


    emit_blocks.append(f"// divstep {19+20}")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 8, with_cl = False)
    emit_blocks.append("""
call divstep_ver_c(x7, x8, x3, ne, delta_range; x7, x8 ,x3, delta_range);
""")
    emit_blocks.append("""

mov fuv x7;
mov grs x8;
mov delta x3;
mov const_2p41a2p20 x6;

nondet neg_f_0_low60_20_low20_20@sint64;
nondet neg_g_0_low60_20_low20_20@sint64;
nondet u_20_40@sint64;
nondet v_20_40@sint64;
nondet r_20_40@sint64;
nondet s_20_40@sint64;

// from lemma we have
assume
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_20 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_20 * (-(2**20))
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
    u_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_20_40 = (const 64 0) (mod (const 64 (2**(20-20))))
;


nondet neg_f_0_low60_40@sint64;
nondet neg_g_0_low60_40@sint64;
nondet f_0_low60_40@sint64;
nondet g_0_low60_40@sint64;
// by the theory of jumpdivstep, we have
assume
    u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
    u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
    r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
    neg_f_0_low60_40 = (const 64 1) (mod (const 64 2))
;

cut
    u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
    u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
    r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 81),

    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),

and [
    x11 = u_0_20,
    x12 = v_0_20,
    x13 = r_0_20,
    x14 = s_0_20,
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))] prove with [all cuts]
    ,

    const_2p41a2p20 = (const 64 (2**20 + 2**41)),
    neg_f_0_low60_40 = (const 64 1) (mod (const 64 2))
;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 10, with_cl = False)
    emit_blocks.append("""
call extraction(
    x7, x8,
    neg_f_0_low60_20_low20_20, neg_g_0_low60_20_low20_20,
    u_20_40, r_20_40,
    v_20_40, s_20_40,
    x6;
    x15, x17,
    x16, x20);
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 7, with_cl = False)
    emit_blocks.append("""
call update_fg_2(
    x1, x2,
    x15, x17,
    x16, x20,
    neg_f_0_low60_40, neg_g_0_low60_40;
    x1, x2
    );
""")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 10, with_cl = False)



    emit_blocks.append("""
call update_uuvvrrss(
x11,x12,x13,x14,x15,x16,x17,x20;
x11,x12,x13,x14
);
""")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 4)
    emit_blocks.append("""
    cast x1@sint64 x1;
    cast x2@sint64 x2;
    cast x7@sint64 x7;
    cast x8@sint64 x8;

mov const_2p41a2p20 x6;
mov f_0_low60_40 x1;
mov g_0_low60_40 x2;
mov delta x3;
mov fuv x7;
mov grs x8;
mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;

and f_0_low60_40_low20_0@sint64 f_0_low60_40 (2**20 - 1)@sint64;
and g_0_low60_40_low20_0@sint64 g_0_low60_40 (2**20 - 1)@sint64;
mov u_40_59 (-(2**20))@sint64;
mov v_40_59 ( 0)@sint64;
mov r_40_59 ( 0)@sint64;
mov s_40_59 (-(2**20))@sint64;

cut
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (-(2**20)),
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_40_low20_0 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_0 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),

    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 81),
    u_40_59 = (const 64 (-(2**20))),
    v_40_59 = (const 64 (0)),
    r_40_59 = (const 64 (0)),
    s_40_59 = (const 64 (-(2**20))),
    const_2p41a2p20 = (const 64 (2**20 + 2**41)),

    x11 = u_0_40,
    x12 = v_0_40,
    x13 = r_0_40,
    x14 = s_0_40,
    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40)-1)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40))
;
""")

    emit_blocks.append("// divstep 40")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 10, with_cl = False)
    emit_blocks.append("""
call divstep_ver_a(x7, x8, x3, delta_range; x7, x8 ,x3, ne, delta_range);
""")

    for i in range(1,18):
        emit_blocks.append(f"// divstep {i+40}")
        byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 9, with_cl = False)

        emit_blocks.append("""
call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);
""")


    emit_blocks.append(f"// divstep {18+40}")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 8, with_cl = False)
    emit_blocks.append("""
call divstep_ver_c(x7, x8, x3, ne, delta_range; x7, x8 ,x3, delta_range);
""")


    emit_blocks.append("""

mov fuv x7;
mov grs x8;
mov delta x3;
mov const_2p41a2p20 x6;

nondet f_0_low60_40_low20_19@sint64;
nondet g_0_low60_40_low20_19@sint64;
nondet u_40_59@sint64;
nondet v_40_59@sint64;
nondet r_40_59@sint64;
nondet s_40_59@sint64;

// from lemma we have
assume
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_19 * (-(2**20)),
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_19 * (-(2**20))
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19))))
;


nondet neg_f_0_low60_59@sint64;
nondet neg_g_0_low60_59@sint64;
nondet f_0_low60_59@sint64;
nondet g_0_low60_59@sint64;
// by the theory of jumpdivstep, we have
assume
    u_40_59 * f_0_low60_40 + v_40_59 * g_0_low60_40 = f_0_low60_59 * (-(2**20)),
    r_40_59 * f_0_low60_40 + s_40_59 * g_0_low60_40 = g_0_low60_59 * (-(2**20))
&&
    f_0_low60_59 = (const 64 1) (mod (const 64 2))
;

cut
    u_40_59 * f_0_low60_40 + v_40_59 * g_0_low60_40 = f_0_low60_59 * (-(2**20)),
    r_40_59 * f_0_low60_40 + s_40_59 * g_0_low60_40 = g_0_low60_59 * (-(2**20))
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),

and [
    x11 = u_0_40,
    x12 = v_0_40,
    x13 = r_0_40,
    x14 = s_0_40,
    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40)-1)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
    %v2 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32]
    ] prove with [all cuts]
    ,

    const_2p41a2p20 = (const 64 (2**20 + 2**41)),
    f_0_low60_59 = (const 64 1) (mod (const 64 2))
;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 8, with_cl = False)
    emit_blocks.append("""
call extraction(
    x7, x8,
    f_0_low60_40_low20_19, g_0_low60_40_low20_19,
    u_40_59, r_40_59,
    v_40_59, s_40_59,
    x6;
    x15, x17,
    x16, x20);
""")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 12, with_cl = False)

    emit_blocks.append("""
call update_uuvvrrss_2(
    x11, x12, x13, x14, x15, x16, x17, x20;
    x11, x12, x13, x14
);
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 1, with_cl = False)
    emit_blocks.append("// x19 is the loop counter")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 9, with_cl = False)
    emit_blocks.append("""
    call prepare_vec_uuvvrrss(
    x11, x12, x13, x14,
    %v2;
    %v13, %v14
);
""")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 52)
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 52, with_cl = False)



    emit = "\n".join(emit_blocks)
    with open(cl_path, "w", encoding="utf-8") as f:
        f.write(emit)



    do_cv(cmd = ["cv", "-v", "-disable_safety", cl_path])
    # do_cv(cmd = ["cv", "-v", "-isafety", "-jobs 64", cl_path])




if __name__ == "__main__":
    raise SystemExit(main())

