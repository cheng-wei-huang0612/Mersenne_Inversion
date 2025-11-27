# scripts/cli/migrate_existing_asm.py
from __future__ import annotations

from pathlib import Path
from scripts.registry.kernel_db import upsert_kernel_record, SRC_ROOT


def infer_slothy_spec_from_name(path: Path) -> str:
    name = path.name
    if "a72" in name:
        return "a72"
    if "a76" in name:
        return "a76"
    if "m1" in name:
        return "m1"
    return "NA"


def migrate_handwritten() -> None:
    asm_dir = SRC_ROOT / "asm"
    if not asm_dir.is_dir():
        print(f"[warn] {asm_dir} not found")
        return

    for p in sorted(asm_dir.glob("*.s")):
        print(f"[handwritten] {p.relative_to(SRC_ROOT)}")
        upsert_kernel_record(
            asm_path=p,
            opt=False,
            slothy_spec="NA",
        )


def migrate_opt() -> None:
    opt_dir = SRC_ROOT / "opt"
    if not opt_dir.is_dir():
        print(f"[warn] {opt_dir} not found")
        return

    for p in sorted(opt_dir.glob("*.s")):
        spec = infer_slothy_spec_from_name(p)
        print(f"[opt] {p.relative_to(SRC_ROOT)} (slothy_spec={spec})")
        upsert_kernel_record(
            asm_path=p,
            opt=True,
            slothy_spec=spec,
        )


def main() -> None:
    print(f"SRC_ROOT = {SRC_ROOT}")
    migrate_handwritten()
    migrate_opt()
    print("Migration done. kernels.db created/updated.")


if __name__ == "__main__":
    main()

