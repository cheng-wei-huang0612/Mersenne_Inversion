#!/usr/bin/env python3
import subprocess
from pathlib import Path

WORKDIR = Path(__file__).resolve().parent
CMD = [
    "python3",
    "../../../home/ubuntu/cryptoline/scripts/to_zdsl.py",
    "inverse_interleave1.gas",
    "inverse_interleave1.cl",
]

TARGET_CL = WORKDIR / "inverse_interleave1.cl"

def rewrite_header() -> None:
    """Replace the first six lines with the desired hello-world banner."""
    lines = TARGET_CL.read_text().splitlines()
    new_header = []
    new_header.append("proc main (")
    new_header.extend([f"x{i}@int64," for i in range(0,30)])
    new_header.extend([f"%v{i}@int32[4]," for i in range(0,29)])
    new_header.append(f"%v{29}@int32[4]")
    new_header.append(") = {true && true}")

    remaining = lines[6:] if len(lines) > 6 else []
    TARGET_CL.write_text("\n".join(new_header + remaining) + "\n")

def main() -> None:
    subprocess.run(CMD, check=True, cwd=WORKDIR)
    rewrite_header()

if __name__ == "__main__":
    main()
