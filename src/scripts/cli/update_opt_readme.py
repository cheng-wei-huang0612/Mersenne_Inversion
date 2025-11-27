# scripts/cli/update_opt_readme.py
from __future__ import annotations

from pathlib import Path
import json

from scripts.registry.kernel_db import SRC_ROOT, get_conn, init_db, README_PATH

BEGIN = "<!-- BEGIN_KERNEL_TABLE -->"
END = "<!-- END_KERNEL_TABLE -->"

RESULTS_DIR = SRC_ROOT / "results"
A72_JSON = RESULTS_DIR / "a72_bench.json"


def load_a72_results() -> dict[str, dict]:
    """
    從 results/a72_bench.json 抓出 UID -> {cycle, ...} 的 mapping。
    """
    if not A72_JSON.exists():
        return {}
    data = json.loads(A72_JSON.read_text(encoding="utf-8"))
    # key 是 UID (short_hash)
    return {str(k): v for k, v in data.items()}


def fetch_kernels():
    """
    目前直接列出 kernels 裡所有 row（handwritten + opt），
    你要的話也可以 WHERE opt=1 只看 opt。
    """
    init_db()
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        SELECT *
        FROM kernels
        ORDER BY path;
        """
    )
    rows = cur.fetchall()
    conn.close()
    return rows


def fmt(x):
    if x is None:
        return ""
    if isinstance(x, (int, float)):
        return f"{x:.1f}"
    return str(x)


def make_table(rows, a72_results):
    lines = []
    lines.append(
        "| UID(hash) | path | opt? | SLOTHY_spec | "
        "cycle_a72 | cycle_a76 | cycle_m1_fire | cycle_m1_cold | "
        "time_a72 | time_a76 | time_m1_fire | time_m1_cold |"
    )
    lines.append(
        "|-----------|------|------|-------------|"
        "-----------|-----------|---------------|---------------|"
        "----------|----------|--------------|--------------|"
    )

    for r in rows:
        uid = r["short_hash"]
        opt_mark = "✅" if r["opt"] else ""
        a72 = a72_results.get(uid, {})
        c72 = a72.get("cycle")

        line = (
            f"| `{uid}` "
            f"| `{r['path']}` "
            f"| {opt_mark} "
            f"| {r['slothy_spec']} "
            f"| {fmt(c72)} "             # A72 cycle 來自 JSON
            f"| {fmt(None)} "            # 其他平台先留空，之後再填
            f"| {fmt(None)} "
            f"| {fmt(None)} "
            f"| {fmt(None)} "
            f"| {fmt(None)} "
            f"| {fmt(None)} "
            f"| {fmt(None)} |"
        )
        lines.append(line)

    return "\n".join(lines)


def update_readme():
    readme = README_PATH
    content = readme.read_text(encoding="utf-8")
    if BEGIN not in content or END not in content:
        raise RuntimeError("README.md 中找不到 BEGIN/END 標記")

    rows = fetch_kernels()
    a72_results = load_a72_results()
    table_md = make_table(rows, a72_results)

    before, rest = content.split(BEGIN, 1)
    _, after = rest.split(END, 1)

    new_block = f"{BEGIN}\n{table_md}\n{END}"
    new_content = before + new_block + after
    readme.write_text(new_content, encoding="utf-8")
    print("README.md updated")


def main():
    update_readme()


if __name__ == "__main__":
    main()

