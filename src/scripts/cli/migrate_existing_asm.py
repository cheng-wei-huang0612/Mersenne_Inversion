# scripts/cli/migrate_existing_asm.py
from __future__ import annotations

from pathlib import Path

from scripts.registry.kernel_db import (
    upsert_kernel_record,
    SRC_ROOT,
    get_conn,
    init_db,
)


def infer_slothy_spec_from_name(path: Path) -> str:
    name = path.name
    if "a72" in name:
        return "a72"
    if "a76" in name:
        return "a76"
    if "m1" in name:
        return "m1"
    return "NA"


def migrate_handwritten() -> list[str]:
    """
    掃 asm/ 底下的 .s，更新 DB，並回傳所有實際存在的 path（相對 SRC_ROOT）。
    """
    asm_dir = SRC_ROOT / "asm"
    existing: list[str] = []

    if not asm_dir.is_dir():
        print(f"[warn] {asm_dir} not found")
        return existing

    for p in sorted(asm_dir.glob("*.s")):
        rel = str(p.relative_to(SRC_ROOT))
        print(f"[handwritten] {rel}")
        upsert_kernel_record(
            asm_path=p,
            opt=False,
            slothy_spec="NA",
        )
        existing.append(rel)

    return existing


def migrate_opt() -> list[str]:
    """
    掃 opt/ 底下的 .s，更新 DB，並回傳所有實際存在的 path（相對 SRC_ROOT）。
    """
    opt_dir = SRC_ROOT / "opt"
    existing: list[str] = []

    if not opt_dir.is_dir():
        print(f"[warn] {opt_dir} not found")
        return existing

    for p in sorted(opt_dir.glob("*.s")):
        rel = str(p.relative_to(SRC_ROOT))
        spec = infer_slothy_spec_from_name(p)
        print(f"[opt] {rel} (slothy_spec={spec})")
        upsert_kernel_record(
            asm_path=p,
            opt=True,
            slothy_spec=spec,
        )
        existing.append(rel)

    return existing


def cleanup_db(existing_paths: list[str]) -> None:
    """
    把 kernels.db 裡 path 不在 existing_paths 裡的 row 刪掉，
    用來清掉「檔案已經刪掉，但 DB 裡還殘留」的舊紀錄。
    """
    init_db()
    conn = get_conn()
    cur = conn.cursor()

    if not existing_paths:
        # 理論上不會發生（除非你真的把 asm/opt 都清空了）
        print("[migrate] no existing paths found, clearing kernels table")
        cur.execute("DELETE FROM kernels;")
    else:
        placeholders = ",".join("?" for _ in existing_paths)
        sql = f"DELETE FROM kernels WHERE path NOT IN ({placeholders})"
        print("[migrate] cleaning up DB entries whose path no longer exists...")
        cur.execute(sql, existing_paths)

    conn.commit()
    conn.close()


def main() -> None:
    print(f"SRC_ROOT = {SRC_ROOT}")
    existing_paths: list[str] = []
    existing_paths.extend(migrate_handwritten())
    existing_paths.extend(migrate_opt())
    cleanup_db(existing_paths)
    print("Migration done. kernels.db created/updated & cleaned.")


if __name__ == "__main__":
    main()

