# scripts/cli/a72_bench.py
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
A72_JSON = RESULTS_DIR / "a72_bench.json"


def load_a72_results() -> Dict[str, Dict[str, Any]]:
    if not A72_JSON.exists():
        return {}
    data = json.loads(A72_JSON.read_text(encoding="utf-8"))
    # 確保 key 是字串
    return {str(k): v for k, v in data.items()}


def save_a72_results(data: Dict[str, Dict[str, Any]]) -> None:
    A72_JSON.write_text(json.dumps(data, indent=2, sort_keys=True), encoding="utf-8")
    print(f"[a72_bench] updated {A72_JSON}")


def build_uid_skeleton() -> Dict[str, Dict[str, Any]]:
    """
    Step 1:
    掃過 src/asm/inverse_*.s 和 src/opt/inverse_*.s，
    算出 hash -> {path, bench_name, cycle=None} 的 skeleton。

    這裡用檔案內容 hash，確保和 kernels.db 一致。
    """
    skeleton: Dict[str, Dict[str, Any]] = {}

    # 這兩個 folder
    candidates = [
        SRC_ROOT / "asm",
        SRC_ROOT / "opt",
    ]

    for folder in candidates:
        if not folder.is_dir():
            continue
        for p in sorted(folder.glob("inverse_*.s")):
            # inverse_4_a72_3950.s -> stem = inverse_4_a72_3950
            stem = p.stem
            bench_name = f"bench_{stem}"  # bench_inverse_4_a72_3950

            full_hash, short_hash = hash_asm_file(p)
            key = short_hash  # 你說 UID 用短 hash 就好

            # 如果之前已經有，就不要覆蓋 cycle，保留舊結果
            if key not in skeleton:
                skeleton[key] = {
                    "path": str(p.relative_to(SRC_ROOT)),  # 如 opt/inverse_4_a72_3950.s
                    "bench_name": bench_name,
                    "cycle": None,
                }

    return skeleton


def merge_existing_results(
    skeleton: Dict[str, Dict[str, Any]],
    existing: Dict[str, Dict[str, Any]],
) -> Dict[str, Dict[str, Any]]:
    """
    如果之前 JSON 已經有一些 cycle 結果，保留它們，不要洗掉。
    """
    merged: Dict[str, Dict[str, Any]] = {}

    for uid, meta in skeleton.items():
        old = existing.get(uid, {})
        merged[uid] = {
            "path": meta["path"],
            "bench_name": meta["bench_name"],
            "cycle": old.get("cycle", meta["cycle"]),
        }

    # 如果 existing 裡有一些已經不存在的 UID，要不要保留看你喜好
    # 這裡先自動丟掉不存在的 asm（避免殘留）
    return merged


def run_make_all() -> str:
    """
    Step 2 & 3:
    在 aarch64-bench/ 跑：
      make CYCLES=PERF
      make CYCLES=PERF bench_all

    回傳第二步的 stdout（包含 summary_cycle）。
    """
    print(f"[a72_bench] running 'make CYCLES=PERF' in {BENCH_ROOT}")
    subprocess.run(
        ["make", "CYCLES=PERF"],
        cwd=BENCH_ROOT,
        check=True,
    )

    print(f"[a72_bench] running 'make CYCLES=PERF bench_all' in {BENCH_ROOT}")
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
    Step 4:
    parse make bench_all 的 stdout，抓出：
      bench_inverse_* -> summary_cycle

    回傳 dict: bench_name -> cycle
    """
    # pattern:
    # === Running bench_inverse_4_a72_4200 ===
    #   ...
    # summary_cycle = 4514
    pattern = re.compile(
        r"=== Running (bench_inverse_[^=\s]+) ===.*?summary_cycle\s*=\s*([0-9]+)",
        re.DOTALL,
    )

    results: Dict[str, float] = {}
    for m in pattern.finditer(out):
        bench_name = m.group(1)
        cycle = float(m.group(2))
        results[bench_name] = cycle

    print(f"[a72_bench] parsed {len(results)} benchmark results from bench_all output")
    return results


def attach_cycles_by_uid(
    data: Dict[str, Dict[str, Any]],
    bench_cycles: Dict[str, float],
) -> Dict[str, Dict[str, Any]]:
    """
    Step 5:
    用 bench name 的結果填入 UID dict，
    只填得出來的，其他保持 None。
    """
    updated = {}
    for uid, meta in data.items():
        bench_name = meta["bench_name"]
        cycle = bench_cycles.get(bench_name, meta["cycle"])
        updated[uid] = {
            **meta,
            "cycle": cycle,
        }
    return updated


def main() -> None:
    # 1. 用檔案內容 hash 建 skeleton
    print("[a72_bench] building UID skeleton from asm/ and opt/")
    skeleton = build_uid_skeleton()

    # 既有 JSON 結果（如果有）
    existing = load_a72_results()
    merged = merge_existing_results(skeleton, existing)

    # 2 & 3. make + bench_all
    out = run_make_all()

    # 4. parse stdout
    bench_cycles = parse_bench_all_output(out)

    # 5. 填入 JSON
    final = attach_cycles_by_uid(merged, bench_cycles)
    save_a72_results(final)


if __name__ == "__main__":
    main()

