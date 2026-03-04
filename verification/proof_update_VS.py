
import subprocess
from gen_cl import *

cryptoline_path = "../home/ubuntu/cryptoline"
rule_path = "my_aarch64.rules"
gas_path = "gas_files/update_VS_full.gas"
raw_cl_path = "lab/update_bignum_VS_full_raw.cl"
cl_path = "lab/update_bignum_VS_full_out.cl"


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
        vars.append(Var("sint32[4]", f"%vec_V{i}_V{i+1}_S{i}_S{i+1}"))
    vars.append(Var("sint64[2]", "%vec_2x_2p30m1"))
    for i in range(0, 10, 2):
        vars.append(Var("sint32[4]", f"%vec_V{i}_V{i+1}_S{i}_S{i+1}_expected"))


    vars_out = []
    for i in range(0, 10, 2):
        vars_out.append(Var("sint32[4]", f"%vec_V{i}_V{i+1}_S{i}_S{i+1}_out"))


    emit_blocks.append("""
proc main (""")
    emit_blocks.append(cl_var_layout(vars, 2))
    emit_blocks.append(";")
    emit_blocks.append(cl_var_layout(vars_out, 2))


    # emit = "\n".join(emit_blocks)
    # with open(cl_path, "w", encoding="utf-8") as f:
    #     f.write(emit)



    do_cv(cmd = ["cv", "-v", "-vo", "lex",  cl_path])
    # do_cv(cmd = ["cv", "-v", "-isafety", "-jobs 64", cl_path])




if __name__ == "__main__":
    raise SystemExit(main())

