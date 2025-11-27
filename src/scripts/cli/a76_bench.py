# scripts/cli/a76_bench.py
from __future__ import annotations

from pathlib import Path
import subprocess
import re
import json
from typing import Dict, Any

from scripts.registry.kernel_db import (
    SRC_ROOT,
    REPO_ROOT,
    BENCH_ROOT,
    init_db,
    get_conn,
    hash_asm_file,
)

RESULTS_DIR = SRC_ROOT / "results"
RESULTS_DIR.mkdir(exist_ok=True)
A76_JSON = RESULTS_DIR / "a76_bench.json"


def load_a76_results() -> Dict[str, Dict[str, Any]]:
    if not A76_JSON.exists():
        return {}
    data = json.loads(A76_JSON.read_text(encoding="utf-8"))
    return {str(k): v for k, v in data.items()}


def save_a76_results(data: Dict[str, Dict[str, Any]]) -> None:
    A76_JSON.write_text(json.dumps(data, indent=2, sort_keys=True), encoding="utf-8")
    print(f"[a76_bench] updated {A76_JSON}")


def build_uid_skeleton() -> Dict[str, Dict[str, Any]]:
    """
    掃過 src/asm/inverse_*.s 和 src/opt/inverse_*.s，
    算出 hash -> {path, bench_name, cycle=None} 的 skeleton。
    跟 a72_bench 一樣，只是 output 檔不一樣。
    """
    skeleton: Dict[str, Dict[str, Any]] = {}

    candidates = [
        SRC_ROOT / "asm",
        SRC_ROOT / "opt",
    ]

    for folder in candidates:
        if not folder.is_dir():
            continue
        for p in sorted(folder.glob("inverse_*.s")):
            stem = p.stem                          # inverse_4_a76_??? or inverse_1 etc.
            bench_name = f"bench_{stem}"          # bench_inverse_4_a76_???

            full_hash, short_hash = hash_asm_file(p)
            key = short_hash

            if key not in skeleton:
                skeleton[key] = {
                    "path": str(p.relative_to(SRC_ROOT)),
                    "bench_name": bench_name,
                    "cycle": None,
                }

    return skeleton


def merge_existing_results(
    skeleton: Dict[str, Dict[str, Any]],
    existing: Dict[str, Dict[str, Any]],
) -> Dict[str, Dict[str, Any]]:
    """
    保留舊 JSON 裡已經有的 cycle，不洗掉。
    """
    merged: Dict[str, Dict[str, Any]] = {}

    for uid, meta in skeleton.items():
        old = existing.get(uid, {})
        merged[uid] = {
            "path": meta["path"],
            "bench_name": meta["bench_name"],
            "cycle": old.get("cycle", meta["cycle"]),
        }

    # 不保留「已經找不到對應 asm/opt 檔」的舊 UID
    return merged


def run_make_all() -> str:
    """
    在 aarch64-bench/ 跑：
      make CYCLES=PERF
      make CYCLES=PERF bench_all

    回傳第二步的 stdout。
    在 A76 那台機器上跑，就會得到 A76 的 cycles。
    """
    print(f"[a76_bench] running 'make CYCLES=PERF' in {BENCH_ROOT}")
    subprocess.run(
        ["make", "CYCLES=PERF"],
        cwd=BENCH_ROOT,
        check=True,
    )

    print(f"[a76_bench] running 'make CYCLES=PERF bench_all' in {BENCH_ROOT}")
    proc = subprocess.run(
        ["make", "CYCLES=PERF", "bench_all"],
        cwd=BENCH_ROOT,
        check=True,
        capture_output=True,
        text=True,
    )

    return proc.stdout


def parse_bench_all_output(out: str) -> Dict[str, float]:
    """
    parse bench_all 的 stdout，抓出：
      bench_inverse_* -> summary_cycle
    """
    pattern = re.compile(
        r"=== Running (bench_inverse_[^=\s]+) ===.*?summary_cycle\s*=\s*([0-9]+)",
        re.DOTALL,
    )

    results: Dict[str, float] = {}
    for m in pattern.finditer(out):
        bench_name = m.group(1)
        cycle = float(m.group(2))
        results[bench_name] = cycle

    print(f"[a76_bench] parsed {len(results)} benchmark results from bench_all output")
    return results


def attach_cycles_by_uid(
    data: Dict[str, Dict[str, Any]],
    bench_cycles: Dict[str, float],
) -> Dict[str, Dict[str, Any]]:
    """
    用 bench_name 的結果填入 UID dict，
    只填得出來的，其他保持 None。
    """
    updated: Dict[str, Dict[str, Any]] = {}
    for uid, meta in data.items():
        bench_name = meta["bench_name"]
        cycle = bench_cycles.get(bench_name, meta["cycle"])
        updated[uid] = {**meta, "cycle": cycle}
    return updated


def main() -> None:
    print("[a76_bench] building UID skeleton from asm/ and opt/")
    skeleton = build_uid_skeleton()

    existing = load_a76_results()
    merged = merge_existing_results(skeleton, existing)

    out = run_make_all()
    bench_cycles = parse_bench_all_output(out)

    final = attach_cycles_by_uid(merged, bench_cycles)
    save_a76_results(final)


if __name__ == "__main__":
    main()

