from dataclasses import dataclass

# =========================================================
# 基礎型別定義
# =========================================================

SIZE_MAP = {"uint64": 64, "sint64": 64, "uint128": 128}
uint64 = "uint64"
sint64 = "sint64"
uint128 = "uint128"

@dataclass
class Var:
    type: str
    name: str

    @property
    def size(self) -> int:
        return SIZE_MAP.get(self.type, 0)

    def __str__(self):
        return self.name

    def with_type(self):
        return f"{self.type} {self.name}"


class EA:
    MASK = (1 << 64) - 1
    STEP = 8

    def __init__(self, v):
        self.v = int(v) & self.MASK

    def literal(self):
        return "L"+str(hex(self.v))

    def __int__(self): return self.v
    def __repr__(self): return f"{self.__class__.__name__}(0x{self.v:012x})"
    def __str__(self): return f"L0x{self.v:012x}"

    def increment_8bytes(self):
        self.v += 8

    def increment_16bytes(self):
        self.v += 16

    def increment_nbytes(self, amount):
        self.v += amount

    def decrement_8bytes(self):
        self.v -= 8

    def decrement_16bytes(self):
        self.v -= 16

    def decrement_nbytes(self, amount):
        self.v -= amount

    # def add(self, x): self.v = (self.v + int(x)) & self.MASK; return self
    # def sub(self, x): self.v = (self.v - int(x)) & self.MASK; return self
    # def inc(self, n=1): self.v = (self.v + n * self.STEP) & self.MASK; return self
    # def dec(self, n=1): self.v = (self.v - n * self.STEP) & self.MASK; return self



class PC:
    MASK = (1 << 64) - 1
    STEP = 8

    def __init__(self, v):
        self.v = int(v) & self.MASK

    # def literal(self):
    #     return "L"+str(hex(self.v))

    def __int__(self): return self.v
    def __repr__(self): return f"{self.__class__.__name__}(0x{self.v:012x})"
    def __str__(self): return f"L0x{self.v:012x}"

    def increment_4bytes(self):
        self.v += 4

    def increment_nbytes(self, amount):
        self.v += amount

    def decrement_4bytes(self):
        self.v -= 4

    def decrement_nbytes(self, amount):
        self.v -= amount


class Epred:

    def __init__(self, *arg):
        if len(arg) == 0:
            self.epreds = []
        else:
            self.epreds = [i for i in arg]

    def __str__(self):
        if self.epreds == []:
            return "    true"
        else:
            buffer = ""
            for i, epred in enumerate(self.epreds, 1):
                is_last = (i == len(self.epreds))
                sep = ",\n" if not is_last else ""
                buffer += f"    {epred}{sep}\n"
            return buffer

    def append(self, other):
        if isinstance(other, str):
            self.epreds.append(other)
        elif isinstance(other, Epred):
            self.epreds += other.epreds
        else:
            print("not implemented")
    def pop(self, target):
        pass


class Rpred:
    def __init__(self, *arg):
        if len(arg) == 0:
            self.rpreds = []
        else:
            self.rpreds = [i for i in arg]

    def __str__(self):
        if self.rpreds == []:
            return "    true"
        else:
            buffer = ""
            for i, epred in enumerate(self.rpreds, 1):
                is_last = (i == len(self.rpreds))
                sep = ",\n" if not is_last else ""
                buffer += f"    {epred}{sep}"
            return buffer

    def append(self, other):
        if isinstance(other, str):
            self.rpreds.append(other)
        elif isinstance(other, Rpred):
            self.rpreds += other.rpreds
        else:
            print("not implemented")
    def pop(self, target):
        pass


def signed_lt(var0, var1):
    return Rpred(f"{var0} <s {var1}")


class Pred:
    def __init__(self, epred = Epred(), rpred = Rpred()):

        self.epred = epred
        self.rpred = rpred

    def __str__(self):
        return f"{self.epred}\n&&\n{self.rpred}"


def cl_precondition(pred = Pred()):
    return f"{{\n{pred}\n}}"

def cl_postcondition(pred = Pred()):
    return f"{{\n{pred}\n}}"

def cl_cut(pred = Pred()):
    return f"\ncut\n{pred}\n;\n"

def cl_assert(pred = Pred()):
    return f"\nassert\n{pred}\n;\n"

def cl_assume(pred = Pred()):
    return f"\nassume\n{pred}\n;\n"




def cl_var_layout(vars, var_per_line=4):
    ret_string = ""
    for i, var in enumerate(vars, 1):
        is_last = (i == len(vars))
        end_char = "\n" if i % var_per_line == 0 or is_last else " "
        sep = "," if not is_last else ""
        tab_char = (" "*4) if i % var_per_line == 1 else ""
        ret_string += f"{tab_char}{var.type} {var}{sep}{end_char}"
    return ret_string


def cl_line_comment(comment: str):
    return f"\n// {comment}\n"
def cl_block_comment(comment: str):
    return f"\n(* {comment} *)\n"

def cl_proc_head(proc_name = "main"):
    return f"proc {proc_name} (\n" 

def cl_proc_tail():
    return f") ="

def cl_newline():
    return "\n\n"

def output_string(emit):
    lines = []
    for e in emit:
        s = str(e)
        if not s.endswith("\n"):
            s += "\n"
        lines.append(s)
    return "".join(lines)




def mov_var_var(op0, op1):
    return f"mov {op0} {op1};\n"

def mov_var_const(op0, const, const_type):
    return f"mov {op0} ({const})@{const_type};\n"

def ldp_q0_q1_from_x0(q0, q1, x0, ea, pc):
    ret_string = ""

    ret_string += cl_block_comment(f"ldp	{q0}, {q1}, [{x0}]")
    ret_string += cl_block_comment(f"#! EA = {ea}; Value = 0x0000000000000000; PC = {pc}")

    for i in [q0, q1]:
        for j in range(2):
            ret_string += mov_var_var(f"{i}_uint64_{j}", ea.literal())
            ea.increment_8bytes()

    pc.increment_4bytes()
    return ret_string

def vector_qu64_to_vu64(var):
    ret_string = ""
    v_var = f"v{var[1:]}"
    for i in range(2):
        ret_string += \
        mov_var_var(f"{v_var}_uint64_{i}", f"{var}_uint64_{i}")
    return ret_string


def movi_u64(v0, imm, pc):
    ret_string = ""

    ret_string += cl_block_comment(f"movi {v0}.2d, #0x{imm:016x}")
    ret_string += cl_block_comment(f"#! PC = {pc}")

    for i in range(2):
        ret_string += \
        mov_var_const(f"{v0}_uint64_{i}", imm, uint64)
    pc.increment_4bytes()
    return ret_string

def mov_x_imm(x0, imm, pc):
    ret_string = ""
    ret_string += cl_block_comment(f"mov {x0}, #0x{imm:016x}")
    ret_string += cl_block_comment(f"#! PC = {pc}")
    ret_string += mov_var_const(f"{x0}", imm, uint64)
    pc.increment_4bytes()
    return ret_string

def lsr_x_imm(x0, x1, imm, pc):
    ret_string = ""
    ret_string += cl_block_comment(f"lsr {x0}, {x1}, #0x{imm:x}")
    ret_string += cl_block_comment(f"#! PC = {pc}")
    pc.increment_4bytes()
    return ret_string


def zip1_u64(rop, op0, op1, pc):
    ret_string = ""

    ret_string += cl_block_comment(f"zip1	{rop}.2d, {op0}.2d, {op1}.2d")
    ret_string += cl_block_comment(f"#! PC = {pc}")
    ret_string += mov_var_var(f"{rop}_uint64_0", f"{op0}_uint64_0")
    ret_string += mov_var_var(f"{rop}_uint64_1", f"{op1}_uint64_0")
    pc.increment_4bytes()
    return ret_string

def zip2_u64(rop, op0, op1, pc):
    ret_string = ""
    ret_string += cl_block_comment(f"zip2	{rop}.2d, {op0}.2d, {op1}.2d")
    ret_string += cl_block_comment(f"#! PC = {pc}")
    ret_string += mov_var_var(f"{rop}_uint64_0", f"{op0}_uint64_1")
    ret_string += mov_var_var(f"{rop}_uint64_1", f"{op1}_uint64_1")
    pc.increment_4bytes()
    return ret_string

def mov_x_to_v_u64(v0, lane, x0, pc):
    ret_string = ""
    ret_string += cl_block_comment(f"mov  {v0}.d[{lane}], {x0}")
    ret_string += cl_block_comment(f"#! PC = {pc}")
    ret_string += mov_var_var(f"{v0}_uint64_0", f"{x0}")
    pc.increment_4bytes()
    return ret_string

