
import re

from typing import Dict, List, Optional


class Instr:
    def __init__(self, instr_id, raw, code, pc=None,
                 outputs=None, inputs=None, inouts=None, cl_template=None):
        self.instr_id = instr_id          # 自訂名字：mov_x_to_vector_d_low, uzp1_4s, ...
        self.raw = raw
        self.code = code          # 去掉註解後的純 code
        self.pc = pc
        self.outputs = outputs or []
        self.inputs = inputs or []
        self.inouts = inouts or []
        self.cl_template=cl_template

    def __repr__(self):
        return (f"Instr(kind={self.instr_id!r}, "
                f"pc={hex(self.pc) if self.pc is not None else None}, "
                f"outputs={self.outputs}, "
                f"inputs={self.inputs}, "
                f"inouts={self.inouts}, "
                f"code={self.code!r}), "
                f"cl_template={self.cl_template}")


def placeholder_regex(name: str) -> str:
    if name[:4].upper() == "LANE":
        return r"[0-9]+"

    first = name[0].upper()
    if first == "X":
        return r"x[0-9]+"
    if first == "W":
        return r"w[0-9]+"
    if first == "V":
        return r"v[0-9]+"

    raise FatalParsingException(f"Unknown placeholder <{name}> in pattern")


def compile_pattern(pattern: str) -> re.Pattern:
    """
    "mov <Vd>.d[<lane>], <Xa>" →
    ^\s*mov\s+(?P<Vd>v[0-9]+)\.d\[(?P<lane>[0-9]+)\]\s*,\s*(?P<Xa>x[0-9]+)\s*$
    """
    parts = ["^\\s*"]
    i = 0
    L = len(pattern)

    while i < L:
        ch = pattern[i]
        if ch == "<":
            j = pattern.find(">", i)
            if j == -1:
                raise FatalParsingException(f"Unclosed < in pattern: {pattern}")
            name = pattern[i+1:j]
            rx = placeholder_regex(name)
            parts.append(f"(?P<{name}>{rx})")
            i = j + 1
        elif ch.isspace():
            # collapse 多個空白成一個 \s+
            while i < L and pattern[i].isspace():
                i += 1
            parts.append(r"\s+")
        elif ch == ",":
            parts.append(r"\s*,\s*")
            i += 1
        else:
            parts.append(re.escape(ch))
            i += 1

    parts.append(r"\s*$")
    return re.compile("".join(parts))




PATTERNS: List["InstrPattern"] = []



class InstrPattern:

    def __init__(self, instr_id, pattern,input = [], output = [], inout = [], modifiesFlags = False,cl_template = ""):
        self.instr_id = instr_id
        self.regex = compile_pattern(pattern)
        self.input = input
        self.output = output
        self.inout = inout
        self.cl_template = cl_template


        PATTERNS.append(self)

    def try_match(self, code: str):
        m = self.regex.match(code)
        if not m:
            return None

        groups = m.groupdict()  # {'Vd': 'v16', 'Xa': 'x11', ...}

        inputs = {}
        outputs = {}
        inouts = {}

        for name in self.input:
            if name not in groups:
                raise FatalParsingException(f"Input placeholder <{name}> not found for {self.instr_id}, when parsing {code}")
            inputs[name] = groups[name]

        for name in self.output:
            if name not in groups:
                raise FatalParsingException(f"Input placeholder <{name}> not found for {self.instr_id}, when parsing {code}")
            outputs[name] = groups[name]

        for name in self.inout:
            if name not in groups:
                raise FatalParsingException(f"Input placeholder <{name}> not found for {self.instr_id}, when parsing {code}")
            inouts[name] = groups[name]

        return Instr(
            instr_id=self.instr_id,
            raw = None,
            code=code,
            pc=None,
            inputs=inputs,
            outputs=outputs,
            inouts=inouts,
            cl_template=self.cl_template
        )

InstrPattern(
    instr_id = "mov_x_to_vector_d_low",
    pattern = "mov <Vd>.d[0], <Xa>",
    input = ["Xa"],
    output = ["Vd"],
    modifiesFlags = False,
    cl_template = "mov %<Vd> [<Xa>, %<Vd>[1]];"
)


InstrPattern(
    instr_id = "mov_x_to_vector_d_high",
    pattern = "mov <Vd>.d[1], <Xa>",
    input = ["Xa"],
    output = ["Vd"],
    modifiesFlags = False,
    cl_template = "mov %<Vd> [%<Vd>[0], <Xa>];"
)


def strip_code(line: str) -> str:
    """
    移除一行 asm 中的註解，只保留真正的指令部分。

    規則：
    - 先砍掉 '#!' 之後的東西（例如 '#! PC = 0x...'）
    - 再砍掉 '//' 之後的東西（例如 '// ne = any'）
    - 保留像 '#0x2' 這種 immediate，因為它在 '#!' 之前
    """
    # 先去掉 '#!' 後面的 PC 註解
    code = line.split('#!', 1)[0]
    # 再去掉 '//' 後面的 objdump 註解
    code = code.split('//', 1)[0]
    # 去掉前後空白
    return code.strip()


PC_RE = re.compile(r'PC\s*=\s*(0x[0-9a-fA-F]+)')
def get_pc(line):
    m_pc = PC_RE.search(line)
    if m_pc:
        return int(m_pc.group(1), 16)




def parse_instr(line):

    pc = get_pc(line)
    code = strip_code(line)

    for pattern in PATTERNS:
        m = pattern.try_match(code)
        if m:
            m.pc = pc
            m.raw = line
            return m

def main():
    lines = [line.rstrip("\r\n").rstrip('\n') for line in open("inverse_interleave1.gas")]
    lines = lines[:40]
    instrs = []

    for line in lines:
        stripped = line.lstrip()
        if stripped == "":
            continue
        elif stripped.startswith("#"):
            continue
        else:
            print(line)
            instrs.append(parse_instr(line))
            print(instrs[-1])


if __name__ == "__main__":
    main()
