
import subprocess
from gen_cl import *

cryptoline_path = "../home/ubuntu/cryptoline"
rule_path = "my_aarch64.rules"
gas_path = "gas_files/initialization.gas"
raw_cl_path = "initialization_raw.cl"
cl_path = "initialization.cl"


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

def getandappend_multiple_next_instruction(byte_ptr, emit_blocks, num):
    for _ in range(num):
        byte_ptr, blk = get_next_instruction(byte_ptr)
        emit_blocks.append(blk)
    return byte_ptr

def main():
    get_raw_cl()


    emit_blocks = []

    emit_blocks.append("""
proc main(op_x0@uint64, op_x1@uint64, op_x2@uint64, op_x3@uint64)
= {true && true}

nondet %v3@sint32[4];

nondet %v5@sint32[4];
nondet %v6@sint32[4];




mov L0xffffc68e1808 op_x0;
mov L0xffffc68e1810 op_x1;
mov L0xffffc68e1818 op_x2;
mov L0xffffc68e1820 op_x3;
""")

    byte_ptr = 0


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

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 8)

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


    "%v15 = [678100992@uint32, 678100992@uint32, 678100992@uint32, 678100992@uint32]",
    "x6 = (const 64 (2**20 + 2**41))",
    )))






    emit = "\n".join(emit_blocks)
    with open(cl_path, "w", encoding="utf-8") as f:
        f.write(emit)



    do_cv(cmd = ["cv", "-v", cl_path])
    # do_cv(cmd = ["cv", "-v", "-debug", "-isafety", cl_path])




if __name__ == "__main__":
    raise SystemExit(main())

