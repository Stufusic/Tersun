#!/usr/bin/env python3
# ==============================================================================
# G6R.1 Forensics Matrix Runner
# Executes 4 workloads (W1..W4) across 5 execution modes (M0..M4)
# Captures Cold vs Warm, computes robust statistics (Median, P95, CV%),
# records full 8-group telemetry counters to JSON datasets.
# ==============================================================================

import os
import sys
import subprocess
import time
import re
import math
import statistics
import json
import hashlib
import argparse

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(os.path.dirname(HERE))
SETUNC = os.path.join(CODE, "setunc.exe")
BENCH_DIR = os.path.join(CODE, "benchmarks", "forensics")
INPUTS_DIR = os.path.join(BENCH_DIR, "inputs")
RAW_DIR = os.path.join(BENCH_DIR, "raw")
NORM_DIR = os.path.join(BENCH_DIR, "normalized")
WORKING_DIR = os.path.join(CODE, "build", "g6r1", "working")

os.makedirs(RAW_DIR, exist_ok=True)
os.makedirs(NORM_DIR, exist_ok=True)
os.makedirs(WORKING_DIR, exist_ok=True)

WORKLOADS = {
    "W1": {
        "id": "W1",
        "name": "Fibonacci Recursive (N=30)",
        "source": os.path.join(INPUTS_DIR, "w1_fibonacci.stn"),
        "regex": r"W1_FIB checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    },
    "W2": {
        "id": "W2",
        "name": "Prime Sieve of Eratosthenes (N=100k)",
        "source": os.path.join(INPUTS_DIR, "w2_sieve.stn"),
        "regex": r"W2_SIEVE checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    },
    "W3": {
        "id": "W3",
        "name": "Matrix Multiplication (100x100 Flat 1D)",
        "source": os.path.join(INPUTS_DIR, "w3_matmul.stn"),
        "regex": r"W3_MATMUL checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    },
    "W4": {
        "id": "W4",
        "name": "Object Property Updates (200k iters)",
        "source": os.path.join(INPUTS_DIR, "w4_object.stn"),
        "regex": r"W4_OBJECT checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    }
}

MODES = {
    "M0": {
        "id": "M0",
        "name": "Interpreter (Switch Dispatch)",
        "flags": ["--interp", "--dispatch=switch", "--opt-v3"]
    },
    "M1": {
        "id": "M1",
        "name": "Optimized Interpreter (Cached Dispatch + TOS + Fusion)",
        "flags": ["--interp", "--dispatch=cached", "--opt-all"]
    },
    "M2": {
        "id": "M2",
        "name": "Baseline JIT (Tier 1 Baseline JIT)",
        "flags": ["--jit-tier-a"]
    },
    "M3": {
        "id": "M3",
        "name": "Auto-Tier JIT (Tier 0/1/2 OSR Adaptive)",
        "flags": ["--jit"]
    },
    "M4": {
        "id": "M4",
        "name": "Native AOT (LLVM / Native -O3)",
        "flags": ["--native"]
    }
}

def run_cmd(cmd, cwd=CODE, timeout=300):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return p.returncode, p.stdout.strip(), p.stderr.strip()

def compute_statistics(times):
    n = len(times)
    if n == 0:
        return {}
    s_times = sorted(times)
    med = statistics.median(s_times)
    mean_val = statistics.mean(s_times)
    stddev_val = statistics.stdev(s_times) if n > 1 else 0.0
    cv_pct = (stddev_val / mean_val * 100.0) if mean_val > 0 else 0.0
    
    idx_p95 = min(int(math.ceil(0.95 * n)) - 1, n - 1)
    p95_val = s_times[idx_p95]
    
    se = stddev_val / math.sqrt(n) if n > 1 else 0.0
    t_crit = 2.093 if n < 30 else 2.045
    ci_low = max(0.0, mean_val - t_crit * se)
    ci_high = mean_val + t_crit * se
    
    return {
        "count": n,
        "median_ms": round(med, 4),
        "mean_ms": round(mean_val, 4),
        "stddev_ms": round(stddev_val, 4),
        "p95_ms": round(p95_val, 4),
        "min_ms": round(s_times[0], 4),
        "max_ms": round(s_times[-1], 4),
        "cv_pct": round(cv_pct, 2),
        "ci95_low_ms": round(ci_low, 4),
        "ci95_high_ms": round(ci_high, 4)
    }

def compile_workload(w_id, mode_id):
    w = WORKLOADS[w_id]
    stn_src = w["source"]
    
    if mode_id == "M4":
        # Compile native AOT
        exe_path = os.path.join(WORKING_DIR, f"{w_id.lower()}_native.exe")
        rc, out, err = run_cmd([SETUNC, "compile", stn_src, "--native", "-O3", "-o", exe_path])
        if rc != 0:
            raise RuntimeError(f"Failed to compile native AOT for {w_id}: {err}\n{out}")
        return exe_path
    else:
        # Compile bytecode .tbc
        tbc_path = os.path.join(WORKING_DIR, f"{w_id.lower()}.tbc")
        rc, out, err = run_cmd([SETUNC, "compile", stn_src, "-o", tbc_path])
        if rc != 0:
            raise RuntimeError(f"Failed to compile bytecode for {w_id}: {err}\n{out}")
        return tbc_path

def run_workload_mode(w_id, mode_id, reps=20, warmup=5, include_cold=True):
    target = compile_workload(w_id, mode_id)
    w = WORKLOADS[w_id]
    mode = MODES[mode_id]
    
    print(f"[{w_id} x {mode_id}] {w['name']} | Mode: {mode['name']}")
    
    cold_result = None
    raw_runs = []
    telemetry_samples = []

    # 1. Cold run
    if include_cold:
        cold_dump = os.path.join(RAW_DIR, f"{w_id}_{mode_id}_cold_dump.json")
        if mode_id == "M4":
            t0 = time.perf_counter()
            rc, out, err = run_cmd([target])
            t1 = time.perf_counter()
            elapsed_ms = (t1 - t0) * 1000.0
            m = re.search(w["regex"], out)
            internal_ms = int(m.group(2)) / 1000.0 if m else elapsed_ms
            checksum = m.group(1) if m else "none"
        else:
            cmd = [SETUNC, "run"] + mode["flags"] + ["--forensics", f"--forensics-dump={cold_dump}", target]
            t0 = time.perf_counter()
            rc, out, err = run_cmd(cmd)
            t1 = time.perf_counter()
            elapsed_ms = (t1 - t0) * 1000.0
            m = re.search(w["regex"], out)
            internal_ms = int(m.group(2)) / 1000.0 if m else elapsed_ms
            checksum = m.group(1) if m else "none"
            
        cold_result = {
            "wall_clock_total_ms": round(elapsed_ms, 4),
            "internal_time_ms": round(internal_ms, 4),
            "checksum": checksum,
            "telemetry_file": cold_dump if os.path.exists(cold_dump) else None
        }
        print(f"  -> Cold Run: Total={cold_result['wall_clock_total_ms']:.2f}ms, Internal={cold_result['internal_time_ms']:.2f}ms")

    # 2. Warmup cycles
    print(f"  -> Warming up ({warmup} iterations)...")
    for _ in range(warmup):
        if mode_id == "M4":
            run_cmd([target])
        else:
            cmd = [SETUNC, "run"] + mode["flags"] + [target]
            run_cmd(cmd)

    # 3. Measured Warm Runs (N reps)
    print(f"  -> Measuring {reps} independent warm runs...")
    for run_idx in range(reps):
        dump_path = os.path.join(RAW_DIR, f"{w_id}_{mode_id}_run{run_idx}_telemetry.json")
        if mode_id == "M4":
            t0 = time.perf_counter()
            rc, out, err = run_cmd([target])
            t1 = time.perf_counter()
            elapsed_ms = (t1 - t0) * 1000.0
            m = re.search(w["regex"], out)
            internal_ms = int(m.group(2)) / 1000.0 if m else elapsed_ms
            cs = m.group(1) if m else "none"
            telemetry_data = {}
        else:
            cmd = [SETUNC, "run"] + mode["flags"] + ["--forensics", f"--forensics-dump={dump_path}", target]
            t0 = time.perf_counter()
            rc, out, err = run_cmd(cmd)
            t1 = time.perf_counter()
            elapsed_ms = (t1 - t0) * 1000.0
            m = re.search(w["regex"], out)
            internal_ms = int(m.group(2)) / 1000.0 if m else elapsed_ms
            cs = m.group(1) if m else "none"
            
            telemetry_data = {}
            if os.path.exists(dump_path):
                try:
                    with open(dump_path, "r", encoding="utf-8") as f:
                        telemetry_data = json.load(f)
                except Exception:
                    pass

        raw_runs.append({
            "run_id": run_idx,
            "wall_clock_ms": round(elapsed_ms, 4),
            "internal_time_ms": round(internal_ms, 4),
            "checksum": cs,
            "startup_ms": telemetry_data.get("wall_clock", {}).get("startup_time_ms", 0.0),
            "program_ms": telemetry_data.get("wall_clock", {}).get("program_time_ms", 0.0),
            "jit_compile_ms": telemetry_data.get("tier_jit", {}).get("jit_compile_time_ms", 0.0)
        })
        if telemetry_data:
            telemetry_samples.append(telemetry_data)

    times = [r["internal_time_ms"] for r in raw_runs]
    stats = compute_statistics(times)
    print(f"  -> Warm Stats: Median={stats['median_ms']:.2f}ms, P95={stats['p95_ms']:.2f}ms, CV%={stats['cv_pct']:.2f}%\n")

    result = {
        "workload_id": w_id,
        "mode_id": mode_id,
        "mode_name": mode["name"],
        "reps": reps,
        "warmup": warmup,
        "cold": cold_result,
        "stats": stats,
        "raw_runs": raw_runs,
        "last_telemetry": telemetry_samples[-1] if telemetry_samples else {}
    }
    return result

def main():
    parser = argparse.ArgumentParser(description="Tersun G6R.1 Forensics Matrix Runner")
    parser.add_argument("--workload", default="all", choices=["W1", "W2", "W3", "W4", "all"])
    parser.add_argument("--mode", default="all", choices=["M0", "M1", "M2", "M3", "M4", "all"])
    parser.add_argument("--reps", type=int, default=20, help="Number of measured runs (default: 20)")
    parser.add_argument("--warmup", type=int, default=5, help="Number of warmup iterations (default: 5)")
    parser.add_argument("--no-cold", action="store_true", help="Skip cold run")
    args = parser.parse_args()

    workloads_to_run = ["W1", "W2", "W3", "W4"] if args.workload == "all" else [args.workload]
    modes_to_run = ["M0", "M1", "M2", "M3", "M4"] if args.mode == "all" else [args.mode]

    matrix_results = {}
    for w_id in workloads_to_run:
        matrix_results[w_id] = {}
        for m_id in modes_to_run:
            res = run_workload_mode(w_id, m_id, reps=args.reps, warmup=args.warmup, include_cold=not args.no_cold)
            matrix_results[w_id][m_id] = res

    # Save summary dataset
    summary_path = os.path.join(NORM_DIR, "matrix_summary.json")
    with open(summary_path, "w", encoding="utf-8") as f:
        json.dump(matrix_results, f, indent=2)
    print(f"[Done] Matrix results successfully saved to: {summary_path}")

if __name__ == "__main__":
    main()
