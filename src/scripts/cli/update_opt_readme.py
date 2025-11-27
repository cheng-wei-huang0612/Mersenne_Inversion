# scripts/cli/update_opt_readme.py
from __future__ import annotations

from pathlib import Path
from scripts.registry.kernel_db import SRC_ROOT, get_conn, init_db  # 你在 kernel_db 裡如果沒寫 get_conn/init_db，就加一下
from scripts.registry.kernel_db import README_PATH

BEGIN = "<!-- BEGIN_KERNEL_TABLE -->"
END = "<!-- END_KERNEL_TABLE -->"


def fetch_opt_kernels():
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


def make_table(rows):
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

    def fmt(x):
        if x is None:
            return ""
        if isinstance(x, (int, float)):
            return f"{x:.1f}"
        return str(x)

    for r in rows:
        opt_mark = "✅" if r["opt"] else ""
        line = (
            f"| `{r['short_hash']}` "
            f"| `{r['path']}` "
            f"| {opt_mark} "
            f"| {r['slothy_spec']} "
            f"| {fmt(r['bench_cycle_a72'])} "
            f"| {fmt(r['bench_cycle_a76'])} "
            f"| {fmt(r['bench_cycle_applem1fire'])} "
            f"| {fmt(r['bench_cycle_applem1cold'])} "
            f"| {fmt(r['bench_time_a72'])} "
            f"| {fmt(r['bench_time_a76'])} "
            f"| {fmt(r['bench_time_applem1fire'])} "
            f"| {fmt(r['bench_time_applem1cold'])} |"
        )
        lines.append(line)

    return "\n".join(lines)


def update_readme():
    readme = README_PATH
    content = readme.read_text(encoding="utf-8")
    if BEGIN not in content or END not in content:
        raise RuntimeError("opt/README.md 中找不到 BEGIN/END 標記")

    rows = fetch_opt_kernels()
    table_md = make_table(rows)

    before, rest = content.split(BEGIN, 1)
    _, after = rest.split(END, 1)

    new_block = f"{BEGIN}\n{table_md}\n{END}"
    new_content = before + new_block + after
    readme.write_text(new_content, encoding="utf-8")
    print("opt/README.md updated")


def main():
    update_readme()


if __name__ == "__main__":
    main()

