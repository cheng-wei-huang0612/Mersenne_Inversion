
import subprocess
from gen_cl import *

cryptoline_path = "../home/ubuntu/cryptoline"
rule_path = "my_aarch64.rules"
gas_path = "gas_files/update_FG.gas"
raw_cl_path = "lab/update_bignum_FG_1_raw.cl"
cl_path = "lab/update_bignum_FG_1.cl"


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
    byte_ptr = 0

    vars = []
    for i in range(0, 2):
        vars.append(Var("sint32[4]", f"%vec_uu{i}_rr{i}_vv{i}_ss{i}"))
    for i in range(0, 10, 2):
        vars.append(Var("sint32[4]", f"%vec_F{i}_F{i+1}_G{i}_G{i+1}"))
    vars.append(Var("sint64[2]", "%vec_2x_2p30m1"))
    for i in range(0, 10, 2):
        vars.append(Var("sint32[4]", f"%vec_F{i}_F{i+1}_G{i}_G{i+1}_expected"))


    vars_out = []
    for i in range(0, 10, 2):
        vars_out.append(Var("sint32[4]", f"%vec_F{i}_F{i+1}_G{i}_G{i+1}_out"))


    emit_blocks.append("""
proc main (""")
    emit_blocks.append(cl_var_layout(vars, 2))
    emit_blocks.append(";")
    emit_blocks.append(cl_var_layout(vars_out, 2))

    emit_blocks.append(cl_precondition(
        Epred(
    """
    // u * F + v * G  
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[0], %vec_F0_F1_G0_G1[1],
        %vec_F2_F3_G2_G3[0], %vec_F2_F3_G2_G3[1],
        %vec_F4_F5_G4_G5[0], %vec_F4_F5_G4_G5[1],
        %vec_F6_F7_G6_G7[0], %vec_F6_F7_G6_G7[1],
        %vec_F8_F9_G8_G9[0], %vec_F8_F9_G8_G9[1]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[2], %vec_F0_F1_G0_G1[3],
        %vec_F2_F3_G2_G3[2], %vec_F2_F3_G2_G3[3],
        %vec_F4_F5_G4_G5[2], %vec_F4_F5_G4_G5[3],
        %vec_F6_F7_G6_G7[2], %vec_F6_F7_G6_G7[3],
        %vec_F8_F9_G8_G9[2], %vec_F8_F9_G8_G9[3]
    ] = 
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[0], %vec_F0_F1_G0_G1_expected[1],
        %vec_F2_F3_G2_G3_expected[0], %vec_F2_F3_G2_G3_expected[1],
        %vec_F4_F5_G4_G5_expected[0], %vec_F4_F5_G4_G5_expected[1],
        %vec_F6_F7_G6_G7_expected[0], %vec_F6_F7_G6_G7_expected[1],
        %vec_F8_F9_G8_G9_expected[0], %vec_F8_F9_G8_G9_expected[1]
    ] * (-(2**60))
    """,
    """
    // r * F + s * G  
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[0], %vec_F0_F1_G0_G1[1],
        %vec_F2_F3_G2_G3[0], %vec_F2_F3_G2_G3[1],
        %vec_F4_F5_G4_G5[0], %vec_F4_F5_G4_G5[1],
        %vec_F6_F7_G6_G7[0], %vec_F6_F7_G6_G7[1],
        %vec_F8_F9_G8_G9[0], %vec_F8_F9_G8_G9[1]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[2], %vec_F0_F1_G0_G1[3],
        %vec_F2_F3_G2_G3[2], %vec_F2_F3_G2_G3[3],
        %vec_F4_F5_G4_G5[2], %vec_F4_F5_G4_G5[3],
        %vec_F6_F7_G6_G7[2], %vec_F6_F7_G6_G7[3],
        %vec_F8_F9_G8_G9[2], %vec_F8_F9_G8_G9[3]
    ] = 
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[2], %vec_F0_F1_G0_G1_expected[3],
        %vec_F2_F3_G2_G3_expected[2], %vec_F2_F3_G2_G3_expected[3],
        %vec_F4_F5_G4_G5_expected[2], %vec_F4_F5_G4_G5_expected[3],
        %vec_F6_F7_G6_G7_expected[2], %vec_F6_F7_G6_G7_expected[3],
        %vec_F8_F9_G8_G9_expected[2], %vec_F8_F9_G8_G9_expected[3]
    ] * (-(2**60))

    """,
    "%vec_2x_2p30m1 = [((2**30)-1), ((2**30)-1)]",
    "%vec_F0_F1_G0_G1 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)]",
    "%vec_F0_F1_G0_G1 >= [0, 0, 0, 0]",
    "%vec_F2_F3_G2_G3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)]",
    "%vec_F2_F3_G2_G3 >= [0, 0, 0, 0]",
    "%vec_F4_F5_G4_G5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)]",
    "%vec_F4_F5_G4_G5 >= [0, 0, 0, 0]",
    "%vec_F6_F7_G6_G7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)]",
    "%vec_F6_F7_G6_G7 >= [0, 0, 0, 0]",
    "%vec_F8_F9_G8_G9 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)]",
    "%vec_F8_F9_G8_G9 >= [0, 0, 0, 0]",

            """
    (0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1)

    // norm condition
    // |u| + |v| < 2**60
    # (%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0]) +
    # (%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2]) 
    """
        ),
        Rpred(
            "%vec_2x_2p30m1 = [(2**30 - 1)@sint64, (2**30 - 1)@sint64]",
            "[0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F0_F1_G0_G1",
            "%vec_F0_F1_G0_G1 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32]",
            "[0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F2_F3_G2_G3",
            "%vec_F2_F3_G2_G3 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32]",
            "[0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F4_F5_G4_G5",
            "%vec_F4_F5_G4_G5 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32]",
            "[0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F6_F7_G6_G7",
            "%vec_F6_F7_G6_G7 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32]",
            "[(-(2**15))@sint32, (0)@sint32, (-(2**15))@sint32, (0)@sint32] <=s %vec_F8_F9_G8_G9",
            "%vec_F8_F9_G8_G9 <=s [((2**15)-1)@sint32, (0)@sint32, ((2**15)-1)@sint32, (0)@sint32]",
            """
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <=s ((2**30)-1)@sint32,
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <=s ((2**30)-1)@sint32,
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <=s ((2**30)-1)@sint32,
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <=s ((2**30)-1)@sint32
    """
        )
    ))
 
    for i in range(0, 10, 2):
        emit_blocks.append(f"mov %v{(i//2) +3} %vec_F{i}_F{i+1}_G{i}_G{i+1};")
    for i in range(0, 2):
        emit_blocks.append(f"mov %v{i + 13} %vec_uu{i}_rr{i}_vv{i}_ss{i};")
    emit_blocks.append(f"mov %v1 %vec_2x_2p30m1;")

    emit_blocks.append("""
nondet %v16@sint32[4];
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 2)
    emit_blocks.append(cl_assert(Epred(
        f"""{cl_eand(
            "%v16[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2]",
            "%v16[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2]",
        )} prove with [algebra solver smt:z3]""",
        "%v16[0] = 0 (mod (2**30))",
        "%v16[1] = 0 (mod (2**30))",
        ), Rpred()))
        
    emit_blocks.append(cl_assume(Epred(
        "%v16[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2]",
        "%v16[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2]",
        "%v16[0] = 0 (mod (2**30))",
        "%v16[1] = 0 (mod (2**30))",
        ), Rpred(
        "%v16[0] = 0@64 (mod ((2**30)@sint64))",
        "%v16[1] = 0@64 (mod ((2**30)@sint64))",
        )))
        
        
    emit_blocks.append("""
ghost %v16_old0@sint64[2]:
%v16_old0 = %v16 &&
%v16_old0 = %v16 ;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 1)

    emit_blocks.append("""
assert true &&
%v16[0] * ((2**30)@sint64) = %v16_old0[0],
%v16[1] * ((2**30)@sint64) = %v16_old0[1];

assume
%v16[0] * ((2**30)) = %v16_old0[0],
%v16[1] * ((2**30)) = %v16_old0[1]
&&
%v16[0] * ((2**30)@sint64) = %v16_old0[0],
%v16[1] * ((2**30)@sint64) = %v16_old0[1];

assert
    %v16[0] * (2**30) = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] prove with [algebra solver smt:z3],
    %v16[1] * (2**30) = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] prove with [algebra solver smt:z3]
&& true;

assume
    %v16[0] * (2**30) = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2],
    %v16[1] * (2**30) = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2]
&& true;

""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 4)
    emit_blocks.append("""
assert 
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
] && true;

assume
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
] && true;

assert 
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
] prove with [algebra solver smt:z3] && true;


assume
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
] && true;

assert 
%v16[0] * (2**30) = 0 (mod (2**60)),
%v16[1] * (2**30) = 0 (mod (2**60))
&& true;

assume 
%v16[0] * (2**30) = 0 (mod (2**60)),
%v16[1] * (2**30) = 0 (mod (2**60))
&& true;

assert 
%v16[0] = 0 (mod (2**30)) prove with [algebra solver smt:z3],
%v16[1] = 0 (mod (2**30)) prove with [algebra solver smt:z3]
&& true;

assume 
%v16[0] = 0 (mod (2**30)),
%v16[1] = 0 (mod (2**30))
&&
%v16[0] = 0@64 (mod ((2**30)@sint64)),
%v16[1] = 0@64 (mod ((2**30)@sint64));

ghost %v16_old1@sint64[2]:
%v16_old1 = %v16 &&
%v16_old1 = %v16 ;
""")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 1)
    emit_blocks.append("""
assert true &&
%v16[0] * ((2**30)@sint64) = %v16_old1[0],
%v16[1] * ((2**30)@sint64) = %v16_old1[1];

assume
%v16[0] * ((2**30)) = %v16_old1[0],
%v16[1] * ((2**30)) = %v16_old1[1]
&&
%v16[0] * ((2**30)@sint64) = %v16_old1[0],
%v16[1] * ((2**30)@sint64) = %v16_old1[1];



assert and[
    %v16[0] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ]
    prove with [algebra solver smt:z3]
    && true;

assume and[
    %v16[0] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ]
    && true;

cut and[
    %v16[0] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ]
    && true;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 4)
    emit_blocks.append("""
assert 
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
] prove with [all cuts, precondition]
&& true;
assume
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
]
&& true;
""")

    emit_blocks.append("""

assert 
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
] prove with [algebra solver smt:z3, all cuts, precondition]
&& true;


assume
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
]
&& true;
""")
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 1)

#     emit_blocks.append("""
# assert true
# &&
# (const 64 0) <=s %v3[0], %v3[0] <=s (const 64 ((2**30)-1)),
# (const 64 0) <=s %v3[1], %v3[1] <=s (const 64 ((2**30)-1)),
# %v3[0] = %v16[0] (mod ((2**30)@64)),
# %v3[1] = %v16[1] (mod ((2**30)@64));
# 
# assume
# 0 <= %v3[0], %v3[0] <= ((2**30)-1),
# 0 <= %v3[1], %v3[1] <= ((2**30)-1),
# %v3[0] = %v16[0] (mod (2**30)),
# %v3[1] = %v16[1] (mod (2**30))
# &&
# (const 64 0) <=s %v3[0], %v3[0] <=s (const 64 ((2**30)-1)),
# (const 64 0) <=s %v3[1], %v3[1] <=s (const 64 ((2**30)-1)),
# %v3[0] = %v16[0] (mod ((2**30)@64)),
# %v3[1] = %v16[1] (mod ((2**30)@64));
# 
# 
# assert and [
# %v3[0] * (2**60) = (-1) * (%vec_F0_F1_G0_G1_expected[0]) * (2**60) (mod (2**90)) ,
# %v3[1] * (2**60) = (-1) * (%vec_F0_F1_G0_G1_expected[2]) * (2**60) (mod (2**90)) 
# ] prove with [precondition]
# && true;
# 
# assume and [
# %v3[0] * (2**60) = (-1) * (%vec_F0_F1_G0_G1_expected[0]) * (2**60) (mod (2**90)) ,
# %v3[1] * (2**60) = (-1) * (%vec_F0_F1_G0_G1_expected[2]) * (2**60) (mod (2**90)) 
# ]
# && true;
# 
# // probablistic solver
# # assert and [
# # %v3[0] = (-1) * (%vec_F0_F1_G0_G1_expected[0]) (mod (2**30)),
# # %v3[1] = (-1) * (%vec_F0_F1_G0_G1_expected[2]) (mod (2**30))
# # ] 
# # prove with [algebra solver smt:z3]
# # && true;
# 
# assume and [
# %v3[0] = (-1) * (%vec_F0_F1_G0_G1_expected[0]) (mod (2**30)),
# %v3[1] = (-1) * (%vec_F0_F1_G0_G1_expected[2]) (mod (2**30))
# ] 
# && true;
# 
# 
# ghost %v16_old2@sint64[2]:
# %v16_old2 = %v16 &&
# %v16_old2 = %v16 ;
# 
# """)
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 1)
#     emit_blocks.append("""
# assert 
# true
# && 
# %v16[0] * (const 64 (2**30)) + %v3[0] = %v16_old2[0],
# %v16[1] * (const 64 (2**30)) + %v3[1] = %v16_old2[1]
# ;
# 
# assume
# %v16[0] * (2**30) + %v3[0] = %v16_old2[0],
# %v16[1] * (2**30) + %v3[1] = %v16_old2[1]
# && 
# %v16[0] * (const 64 (2**30)) + %v3[0] = %v16_old2[0],
# %v16[1] * (const 64 (2**30)) + %v3[1] = %v16_old2[1]
# ;
# 
# cut 
# %v3[0] = (-1) * (%vec_F0_F1_G0_G1_expected[0]) (mod (2**30)),
# %v3[1] = (-1) * (%vec_F0_F1_G0_G1_expected[2]) (mod (2**30)),
# %v16[0] * (2**90) = (
#         %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
#         (
#             %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
#             %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
#         ) * (2**30) +
#         (
#             %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
#             %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
#         ) * (2**60)
#     )
# - %v3[0] * (2**60)
# ,
# %v16[1] * (2**90) = (
#         %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
#         (
#             %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
#             %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
#         ) * (2**30) +
#         (
#             %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
#             %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
#         ) * (2**60)
#     )
# - %v3[1] * (2**60)
# 
# && true prove with [all cuts, precondition];
# 
# """)

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 4)
#     emit_blocks.append("""
# assert 
# and [
#     %v16[0] * (2**90) = 
#     %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
#     (
#         %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
#         %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
#     ) * (2**30) +
#     (
#         %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
#         %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
#     ) * (2**60) +
#     (
#         %vec_uu1_rr1_vv1_ss1[0] * %vec_F2_F3_G2_G3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F2_F3_G2_G3[0] +
#         %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[3]
#     ) * (2**90)
#     - %v3[0] * (2**60)
#     (mod (2**154))
#     # ,
#     # %v16[1] * (2**90) = 
#     # %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
#     # (
#     #     %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
#     #     %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
#     # ) * (2**30) +
#     # (
#     #     %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
#     #     %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
#     # ) * (2**60)
#     # (mod (2**124))
# ] prove with [all cuts, precondition]
# && true;
# """)
    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 44)


    emit_blocks.append("""
cut true && true prove with [all cuts, precondition];
""")

    emit = "\n".join(emit_blocks)
    with open(cl_path, "w", encoding="utf-8") as f:
        f.write(emit)



    do_cv(cmd = ["cv", "-v", "-vo", "lex",  cl_path])
    # do_cv(cmd = ["cv", "-v", "-isafety", "-jobs 64", cl_path])




if __name__ == "__main__":
    raise SystemExit(main())

