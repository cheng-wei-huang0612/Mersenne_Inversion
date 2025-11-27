# scripts/cli/update_opt_readme.py
from __future__ import annotations

import json
from pathlib import Path

from scripts.registry.kernel_db import SRC_ROOT, get_conn, init_db, README_PATH

BEGIN = "<!-- BEGIN_KERNEL_TABLE -->"
END = "<!-- END_KERNEL_TABLE -->"

RESULTS_DIR = SRC_ROOT / "results"
A72_JSON = RESULTS_DIR / "a72_bench.json"
A76_JSON = RESULTS_DIR / "a76_bench.json"


def load_json(path: Path) -> dict[str, dict]:
    if not path.exists():
        return {}
    data = json.loads(path.read_text(encoding="utf-8"))
    return {str(k): v for k, v in data.items()}


def load_a72_results() -> dict[str, dict]:
    return load_json(A72_JSON)


def load_a76_results() -> dict[str, dict]:
    return load_json(A76_JSON)


def fetch_kernels():
    """
    目前列出所有 kernels；如果只想看 opt 可以改成 WHERE opt=1。
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


def make_table(rows, a72_results, a76_results):
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
        a76 = a76_results.get(uid, {})

        c72 = a72.get("cycle")
        c76 = a76.get("cycle")

        line = (
            f"| `{uid}` "
            f"| `{r['path']}` "
            f"| {opt_mark} "
            f"| {r['slothy_spec']} "
            f"| {fmt(c72)} "
            f"| {fmt(c76)} "
            f"| {fmt(None)} "  # m1_fire 之後要再接自己的 JSON
            f"| {fmt(None)} "  # m1_cold 同上
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
    a76_results = load_a76_results()
    table_md = make_table(rows, a72_results, a76_results)

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

