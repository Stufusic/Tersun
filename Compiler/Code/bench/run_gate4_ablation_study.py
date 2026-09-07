#!/usr/bin/env python3
# ==============================================================================
# Gate 4 Tier-1 Adaptive VM: Comprehensive Multi-Variant Ablation Study
# Evaluates:
#   V3  : Baseline Register-Resident Direct Threaded (Gate 3)
#   V4A : V3 + Tier A Superinstructions (Local 0..3, Incr Imm)
#   V4B : V4A + Tier B (Array Indexing) + Tier C (Loop Range Fast)
#   V4C : V4B + State-Based Adaptive Quickening
#   V4D : V4C + Shape-Based Field Inline Caching
#   V4E : V4D + Fast Frame Allocation Architecture
#   V4F : Full Adaptive Pipeline (All Gates 1-4 optimizations enabled)
# ==============================================================================

import os
import sys
import subprocess
import time
import re
import json
import statistics

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

HERE = os.path.dirname(os.path.abspath(__file__))
CODE_DIR = os.path.dirname(HERE)
ROOT_DIR = os.path.dirname(CODE_DIR)
SETUNC = os.path.join(CODE_DIR, "setunc.exe")
FROZEN_GATE4 = os.path.join(ROOT_DIR, "Doc", "artifacts", "frozen_gate4")
os.makedirs(FROZEN_GATE4, exist_ok=True)

VARIANTS = [
    ("V3",  "--opt-v3",      "Baseline Direct Threaded (Gate 3)"),
    ("V4A", "--opt-tier-a",  "+ Tier A Superinstructions (Locals 0..3, Incr Imm)"),
    ("V4B", "--opt-tier-b",  "+ Tier B/C (Array Indexing & Loop Fusion)"),
    ("V4C", "--opt-tier-c",  "+ Adaptive Quickening (Speculative Int)"),
    ("V4D", "--opt-tier-d",  "+ Shape-Based Field Inline Caching"),
    ("V4E", "--opt-tier-e",  "+ Zero-Allocation Frame Architecture"),
    ("V4F", "--opt-v4f",     "Full Gate 4 Tier-1 Adaptive VM")
]

WORKLOADS = [
    {
        "id": "B1",
        "name": "B1: Dispatch Heavy (3M ops)",
        "file": "bench_dispatch.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "B2",
        "name": "B2: Arithmetic Throughput (5M ops)",
        "file": "bench_arithmetic.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "B3",
        "name": "B3: Control & Branching (4M ops)",
        "file": "bench_control.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "B4",
        "name": "B4: Memory Allocation (1M ops)",
        "file": "bench_memory.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "H1",
        "name": "H1: Prime Sieve 100k (H1=9592)",
        "file": "heavy_sieve.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)",
        "checksum_regex": r"count=(\d+)",
        "expected_checksum": "9592"
    },
    {
        "id": "H2",
        "name": "H2: Matmul 100x100 (H2=20250000)",
        "file": "heavy_matmul.stn",
        "reps": 5,
        "time_regex": r"time_us=(\d+)",
        "checksum_regex": r"checksum=([\d.e+]+)",
        "expected_checksum": "20250000"
    },
    {
        "id": "H3",
        "name": "H3: N-Queens N=11 (H3=2680)",
        "file": "heavy_nqueens.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)",
        "checksum_regex": r"solutions=(\d+)",
        "expected_checksum": "2680"
    },
    {
        "id": "H4",
        "name": "H4: Binary Trees D=14 (H4=178973354)",
        "file": "heavy_trees.stn",
        "reps": 10,
        "time_regex": r"time_us=(\d+)",
        "checksum_regex": r"checksum=(\d+)",
        "expected_checksum": "178973354"
    },
    {
        "id": "P1",
        "name": "P1: Monomorphic Call (1M ops)",
        "file": "bench_polymorphic.stn",
        "reps": 10,
        "time_regex": r"P1_us=(\d+)"
    },
    {
        "id": "P2",
        "name": "P2: Bimorphic Call (1M ops)",
        "file": "bench_polymorphic.stn",
        "reps": 10,
        "time_regex": r"P2_us=(\d+)"
    },
    {
        "id": "P3",
        "name": "P3: Megamorphic Call (1M ops)",
        "file": "bench_polymorphic.stn",
        "reps": 10,
        "time_regex": r"P3_us=(\d+)"
    },
    {
        "id": "H5A",
        "name": "H5A: Monomorphic Field Access (1M ops)",
        "file": "bench_shape_ic.stn",
        "reps": 10,
        "time_regex": r"H5A_us=(\d+)"
    },
    {
        "id": "H5B",
        "name": "H5B: Polymorphic Field Access (1M ops)",
        "file": "bench_shape_ic.stn",
        "reps": 10,
        "time_regex": r"H5B_us=(\d+)"
    }
]

def run_cmd(cmd, cwd=HERE, timeout=300):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, cwd=cwd)
    out, err = p.communicate(timeout=timeout)
    return p.returncode, out.strip(), err.strip()

def parse_telemetry(err_text):
    telem = {
        "dispatches": 0,
        "superinstructions": 0,
        "loop_fast_iter": 0,
        "quick_hits": 0,
        "quick_misses": 0,
        "deopt_count": 0,
        "ic_hits": 0,
        "ic_misses": 0
    }
    for k in telem.keys():
        m = re.search(rf"{k}=(\d+)", err_text)
        if m:
            telem[k] = int(m.group(1))
    return telem

def calc_stats(samples):
    if not samples:
        return {"median": 0.0, "mean": 0.0, "stddev": 0.0, "min": 0.0, "max": 0.0}
    med = statistics.median(samples)
    mean = statistics.mean(samples)
    stdev = statistics.stdev(samples) if len(samples) > 1 else 0.0
    return {
        "median": round(med, 3),
        "mean": round(mean, 3),
        "stddev": round(stdev, 4),
        "min": round(min(samples), 3),
        "max": round(max(samples), 3)
    }

print("=" * 80)
print("  TERSUN GATE 4 TIER-1 ADAPTIVE VM MULTI-VARIANT ABLATION STUDY")
print("=" * 80)
print(f"Toolchain Binary : {SETUNC}")
print(f"Artifacts Path   : {FROZEN_GATE4}")
print(f"Variants Tested  : {len(VARIANTS)}")
print(f"Workloads Tested : {len(WORKLOADS)}")
print("=" * 80)

matrix_results = {}

for v_id, v_flag, v_desc in VARIANTS:
    print(f"\n>>> Running Variant {v_id}: {v_flag} ({v_desc})")
    matrix_results[v_id] = {
        "id": v_id,
        "flag": v_flag,
        "desc": v_desc,
        "workloads": {}
    }

    for wl in WORKLOADS:
        wl_id = wl["id"]
        wl_file = os.path.join(HERE, wl["file"])
        reps = wl["reps"]
        time_samples_ms = []
        last_telem = {}
        checksum_ok = True

        for r in range(reps):
            cmd = [SETUNC, "run", wl_file, v_flag, "--telemetry"]
            t0 = time.perf_counter()
            rc, stdout, stderr = run_cmd(cmd)
            t1 = time.perf_counter()

            if rc != 0:
                print(f"  [ERROR] {wl_id} failed on run {r}: {stderr}")
                checksum_ok = False
                break

            # Parse time
            m_time = re.search(wl["time_regex"], stdout)
            if m_time:
                t_ms = float(m_time.group(1)) / 1000.0
            else:
                t_ms = (t1 - t0) * 1000.0
            time_samples_ms.append(t_ms)

            # Check checksum if required
            if "checksum_regex" in wl:
                m_chk = re.search(wl["checksum_regex"], stdout)
                if m_chk:
                    chk_val = m_chk.group(1)
                    if chk_val != wl["expected_checksum"]:
                        print(f"  [MISMATCH] {wl_id} expected {wl['expected_checksum']}, got {chk_val}")
                        checksum_ok = False
                else:
                    checksum_ok = False

            last_telem = parse_telemetry(stderr)

        stats = calc_stats(time_samples_ms)
        matrix_results[v_id]["workloads"][wl_id] = {
            "stats": stats,
            "samples": time_samples_ms,
            "telemetry": last_telem,
            "checksum_verified": checksum_ok
        }
        print(f"  [{wl_id:4s}] Median: {stats['median']:8.3f} ms | StdDev: {stats['stddev']:6.3f} ms | Verified: {checksum_ok}")

# Save full matrix JSON
out_json_path = os.path.join(FROZEN_GATE4, "gate4_ablation_matrix.json")
with open(out_json_path, "w", encoding="utf-8") as f:
    json.dump({
        "metadata": {
            "date": time.strftime("%Y-%m-%d %H:%M:%S"),
            "host_compiler": "GCC 15.2.0 C++20",
            "os": sys.platform
        },
        "variants": VARIANTS,
        "workloads": [w["id"] for w in WORKLOADS],
        "results": matrix_results
    }, f, indent=2)

print("\n" + "=" * 80)
print("  GATE 4 MULTI-VARIANT ABLATION MATRIX SUMMARY (Time in ms, Median)")
print("=" * 80)

header = f"{'Workload':<12} | " + " | ".join([f"{v[0]:>8}" for v in VARIANTS]) + " | Speedup (V4F/V3)"
print(header)
print("-" * len(header))

for wl in WORKLOADS:
    wl_id = wl["id"]
    row_strs = []
    v3_med = matrix_results["V3"]["workloads"][wl_id]["stats"]["median"]
    v4f_med = matrix_results["V4F"]["workloads"][wl_id]["stats"]["median"]
    sp = (v3_med / v4f_med) if v4f_med > 0 else 1.0

    for v_id, _, _ in VARIANTS:
        med = matrix_results[v_id]["workloads"][wl_id]["stats"]["median"]
        row_strs.append(f"{med:8.3f}")

    print(f"{wl_id:<12} | " + " | ".join(row_strs) + f" | {sp:8.2f}x")

print("=" * 80)
print(f"Full results written to: {out_json_path}")
