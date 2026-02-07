import subprocess

cryptoline_path = "../home/ubuntu/cryptoline"
rule_path = "my_aarch64.rules"
gas_path = "gas_files/initialization.gas"
raw_cl_path = "test_initialization_raw.cl"
cl_path = "test_initialization.cl"


def get_raw_cl():
    cmd = [
        "python3",
        f"{cryptoline_path}/scripts/to_zdsl.py",
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



def get_next_instruction(byte_ptr):
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

        return fin.tell(), "".join(block_lines)


def getandappend_next_instruction(byte_ptr, emit_blocks):
    byte_ptr, blk = get_next_instruction(byte_ptr)
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

mov L0xffffc68e1808 op_x0;
mov L0xffffc68e1810 op_x1;
mov L0xffffc68e1818 op_x2;
mov L0xffffc68e1820 op_x3;
""")

    byte_ptr = 0


    byte_ptr = getandappend_next_instruction(byte_ptr, emit_blocks)

    emit_blocks.append("""
// Hi I am a assertion that are manually inserted
assert true && const 64 0 = const 64 0
;
""")

    byte_ptr = getandappend_multiple_next_instruction(byte_ptr, emit_blocks, 3)

    emit = "\n".join(emit_blocks)
    with open(cl_path, "w", encoding="utf-8") as f:
        f.write(emit)



    do_cv(cmd = ["cv", "-v", cl_path])




if __name__ == "__main__":
    raise SystemExit(main())

