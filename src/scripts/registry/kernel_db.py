# scripts/registry/kernel_db.py
from pathlib import Path
import sqlite3, hashlib

# 對這個檔來說：
# __file__ = .../Mersenne_Inversion/src/scripts/registry/kernel_db.py

# parents[0] = .../src/scripts/registry
# parents[1] = .../src/scripts
# parents[2] = .../src
# parents[3] = .../Mersenne_Inversion

SRC_ROOT = Path(__file__).resolve().parents[2]
REPO_ROOT = SRC_ROOT.parent

DB_PATH = SRC_ROOT / "kernels.db"
BENCH_ROOT = REPO_ROOT / "aarch64-bench"
README_PATH = REPO_ROOT / "README.md"

def get_conn() -> sqlite3.Connection:
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def init_db() -> None:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS kernels (
            full_hash       TEXT PRIMARY KEY,
            short_hash      TEXT NOT NULL,
            path            TEXT NOT NULL,
            opt             INTEGER NOT NULL,    -- 0 = handwritten, 1 = SLOTHY opt
            slothy_spec     TEXT,                -- 'a72', 'a76', 'm1', 'NA', ...

            bench_cycle_a72           REAL,
            bench_cycle_a76           REAL,
            bench_cycle_applem1fire   REAL,
            bench_cycle_applem1cold   REAL,

            bench_time_a72            REAL,
            bench_time_a76            REAL,
            bench_time_applem1fire    REAL,
            bench_time_applem1cold    REAL
        );
        """
    )
    conn.commit()
    conn.close()


def hash_asm_file(path: Path, short_len: int = 16) -> tuple[str, str]:
    data = path.read_bytes()
    h_full = hashlib.sha3_256(data).hexdigest()
    short = h_full[:short_len]
    return h_full, short


def upsert_kernel_record(
    *,
    asm_path: Path,
    opt: bool,
    slothy_spec: str | None = None,
    bench_cycle_a72: float | None = None,
    bench_cycle_a76: float | None = None,
    bench_cycle_applem1fire: float | None = None,
    bench_cycle_applem1cold: float | None = None,
    bench_time_a72: float | None = None,
    bench_time_a76: float | None = None,
    bench_time_applem1fire: float | None = None,
    bench_time_applem1cold: float | None = None,
) -> tuple[str, str]:
    init_db()
    full_hash, short_hash = hash_asm_file(asm_path)

    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO kernels (
            full_hash, short_hash, path,
            opt, slothy_spec,
            bench_cycle_a72, bench_cycle_a76,
            bench_cycle_applem1fire, bench_cycle_applem1cold,
            bench_time_a72, bench_time_a76,
            bench_time_applem1fire, bench_time_applem1cold
        ) VALUES (
            :full_hash, :short_hash, :path,
            :opt, :slothy_spec,
            :bench_cycle_a72, :bench_cycle_a76,
            :bench_cycle_applem1fire, :bench_cycle_applem1cold,
            :bench_time_a72, :bench_time_a76,
            :bench_time_applem1fire, :bench_time_applem1cold
        )
        ON CONFLICT(full_hash) DO UPDATE SET
            short_hash              = excluded.short_hash,
            path                    = excluded.path,
            opt                     = excluded.opt,
            slothy_spec             = excluded.slothy_spec,
            bench_cycle_a72         = excluded.bench_cycle_a72,
            bench_cycle_a76         = excluded.bench_cycle_a76,
            bench_cycle_applem1fire = excluded.bench_cycle_applem1fire,
            bench_cycle_applem1cold = excluded.bench_cycle_applem1cold,
            bench_time_a72          = excluded.bench_time_a72,
            bench_time_a76          = excluded.bench_time_a76,
            bench_time_applem1fire  = excluded.bench_time_applem1fire,
            bench_time_a72          = excluded.bench_time_a72;
        """,
        {
            "full_hash": full_hash,
            "short_hash": short_hash,
            "path": str(asm_path.relative_to(SRC_ROOT)),
            "opt": int(opt),
            "slothy_spec": slothy_spec or "NA",
            "bench_cycle_a72": bench_cycle_a72,
            "bench_cycle_a76": bench_cycle_a76,
            "bench_cycle_applem1fire": bench_cycle_applem1fire,
            "bench_cycle_applem1cold": bench_cycle_applem1cold,
            "bench_time_a72": bench_time_a72,
            "bench_time_a76": bench_time_a76,
            "bench_time_applem1fire": bench_time_applem1fire,
            "bench_time_applem1cold": bench_time_applem1cold,
        },
    )
    conn.commit()
    conn.close()

    return full_hash, short_hash

