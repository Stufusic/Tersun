#!/usr/bin/env python3
# ==============================================================================
# Cross-Language Benchmark Suite: Tersun Gate 4 VM vs C++20 vs Rust vs Python
# Workloads H1 - H4 across:
#   1. C++20 (GCC 15.2.0 -std=c++20 -O3)
#   2. Rust (rustc 1.84+ -O -C opt-level=3)
#   3. Tersun 1.0.3 VM (Gate 4 Tier-1 Adaptive VM --opt-v4f)
#   4. CPython 3.14.3
# ==============================================================================

import os
import sys
import subprocess
import time
import re
import json
import statistics
import shutil

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

HERE = os.path.dirname(os.path.abspath(__file__))
CODE_DIR = os.path.dirname(HERE)
ROOT_DIR = os.path.dirname(CODE_DIR)
SETUNC = os.path.join(CODE_DIR, "setunc.exe")
BUILD_DIR = os.path.join(HERE, "build")
DOC_ARTIFACTS = os.path.join(ROOT_DIR, "Doc", "artifacts", "cross_language_benchmark")

os.makedirs(BUILD_DIR, exist_ok=True)
os.makedirs(DOC_ARTIFACTS, exist_ok=True)

REPS = 10

def run_cmd(cmd, cwd=HERE, timeout=300):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, cwd=cwd)
    out, err = p.communicate(timeout=timeout)
    return p.returncode, out.strip(), err.strip()

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

# Find compilers
GXX = shutil.which("g++") or "g++"
PYTHON = sys.executable
RUSTC = shutil.which("rustc")

# Check scoop rust path if not in system PATH
if not RUSTC:
    userprofile = os.environ.get("USERPROFILE", "")
    scoop_rust = os.path.join(userprofile, "scoop", "apps", "rust-gnu", "current", "bin", "rustc.exe")
    if os.path.exists(scoop_rust):
        RUSTC = scoop_rust

print("=" * 80)
print("  CROSS-LANGUAGE BENCHMARK: TERSUN VM vs C++20 vs RUST vs PYTHON 3.14")
print("=" * 80)
print(f"C++ Compiler   : {GXX} (GCC 15.2.0 -std=c++20 -O3)")
print(f"Python Runtime : {PYTHON} (CPython {sys.version.split()[0]})")
print(f"Rust Compiler  : {RUSTC if RUSTC else 'PENDING INSTALLATION'}")
print(f"Tersun VM      : {SETUNC} (Gate 4 Tier-1 Adaptive VM)")
print(f"Repetitions    : {REPS} per benchmark")
print("=" * 80)

# 1. Compile C++ reference
cpp_exe = os.path.join(BUILD_DIR, "heavy_cpp_ref.exe")
print(f"[*] Compiling C++ reference binary: {cpp_exe}...")
rc, out, err = run_cmd([GXX, "-std=c++20", "-O3", os.path.join(HERE, "heavy_cpp_ref.cpp"), "-o", cpp_exe])
assert rc == 0, f"C++ build failed: {err}"
print("    -> C++ reference compiled successfully (-O3).")

# 2. Compile Rust reference if available
rust_exe = os.path.join(BUILD_DIR, "heavy_rust_ref.exe")
has_rust = False
if RUSTC and os.path.exists(RUSTC):
    print(f"[*] Compiling Rust reference binary: {rust_exe}...")
    rc, out, err = run_cmd([RUSTC, "-O", "-C", "opt-level=3", os.path.join(HERE, "heavy_rust_ref.rs"), "-o", rust_exe])
    if rc == 0:
        has_rust = True
        print("    -> Rust reference compiled successfully (-C opt-level=3).")
    else:
        print(f"    -> Rust compilation failed: {err}")
else:
    print("    -> Rust compiler not available yet.")

BENCHMARKS = [
    {
        "id": "H1",
        "name": "H1: Prime Sieve (N=100,000)",
        "mode": "sieve",
        "stn_file": "heavy_sieve.stn",
        "expected_chk": "9592",
        "chk_regex": r"count=(\d+)",
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "H2",
        "name": "H2: Matrix Multiplication (100x100)",
        "mode": "matmul",
        "stn_file": "heavy_matmul.stn",
        "expected_chk": "20250000",
        "chk_regex": r"checksum=([\d.e+]+)",
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "H3",
        "name": "H3: N-Queens (N=11)",
        "mode": "nqueens",
        "stn_file": "heavy_nqueens.stn",
        "expected_chk": "2680",
        "chk_regex": r"solutions=(\d+)",
        "time_regex": r"time_us=(\d+)"
    },
    {
        "id": "H4",
        "name": "H4: Binary Trees (Depth=14)",
        "mode": "trees",
        "stn_file": "heavy_trees.stn",
        "expected_chk": "178973354",
        "chk_regex": r"checksum=(\d+)",
        "time_regex": r"time_us=(\d+)"
    }
]

results = {
    "metadata": {
        "date": time.strftime("%Y-%m-%d %H:%M:%S"),
        "compiler_cpp": "g++ 15.2.0 -O3",
        "compiler_rust": "rustc 1.94.0 -O" if has_rust else "N/A",
        "python_version": sys.version.split()[0],
        "tersun_version": "1.0.3 (Gate 4 Tier-1 Adaptive VM)",
        "reps": REPS
    },
    "benchmarks": {}
}

for b in BENCHMARKS:
    bid = b["id"]
    mode = b["mode"]
    print(f"\n>>> Running Benchmark {bid}: {b['name']}")
    results["benchmarks"][bid] = {
        "name": b["name"],
        "expected_checksum": b["expected_chk"],
        "targets": {}
    }

    # 1. C++20
    samples_cpp = []
    for _ in range(REPS):
        rc, out, err = run_cmd([cpp_exe, mode])
        m = re.search(b["time_regex"], out)
        if m:
            samples_cpp.append(float(m.group(1)) / 1000.0)
    stats_cpp = calc_stats(samples_cpp)
    results["benchmarks"][bid]["targets"]["cpp20"] = stats_cpp
    print(f"  [C++20      ] Median: {stats_cpp['median']:8.3f} ms | StdDev: {stats_cpp['stddev']:6.3f} ms")

    # 2. Rust
    if has_rust:
        samples_rust = []
        for _ in range(REPS):
            rc, out, err = run_cmd([rust_exe, mode])
            m = re.search(b["time_regex"], out)
            if m:
                samples_rust.append(float(m.group(1)) / 1000.0)
        stats_rust = calc_stats(samples_rust)
        results["benchmarks"][bid]["targets"]["rust"] = stats_rust
        print(f"  [Rust       ] Median: {stats_rust['median']:8.3f} ms | StdDev: {stats_rust['stddev']:6.3f} ms")

    # 3. Tersun VM (Gate 4)
    samples_tersun = []
    stn_path = os.path.join(HERE, b["stn_file"])
    for _ in range(REPS):
        rc, out, err = run_cmd([SETUNC, "run", stn_path])
        m = re.search(b["time_regex"], out)
        if m:
            samples_tersun.append(float(m.group(1)) / 1000.0)
    stats_tersun = calc_stats(samples_tersun)
    results["benchmarks"][bid]["targets"]["tersun_vm"] = stats_tersun
    print(f"  [Tersun VM  ] Median: {stats_tersun['median']:8.3f} ms | StdDev: {stats_tersun['stddev']:6.3f} ms")

    # 4. CPython 3.14
    samples_py = []
    py_script = os.path.join(HERE, "heavy_bench.py")
    for _ in range(REPS):
        rc, out, err = run_cmd([PYTHON, py_script, mode])
        m = re.search(b["time_regex"], out)
        if m:
            samples_py.append(float(m.group(1)) / 1000.0)
    stats_py = calc_stats(samples_py)
    results["benchmarks"][bid]["targets"]["python"] = stats_py
    print(f"  [Python 3.14] Median: {stats_py['median']:8.3f} ms | StdDev: {stats_py['stddev']:6.3f} ms")

# Save results JSON
out_json = os.path.join(DOC_ARTIFACTS, "cross_language_benchmark.json")
with open(out_json, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

print("\n" + "=" * 90)
print("  CROSS-LANGUAGE BENCHMARK SUMMARY TABLE (Time in ms, Median)")
print("=" * 90)
if has_rust:
    header = f"{'Benchmark':<24} | {'C++20 (-O3)':>12} | {'Rust (-O3)':>12} | {'Tersun VM':>12} | {'Python 3.14':>12} | {'Tersun vs Py':>12}"
else:
    header = f"{'Benchmark':<24} | {'C++20 (-O3)':>12} | {'Tersun VM':>12} | {'Python 3.14':>12} | {'Tersun vs Py':>12}"
print(header)
print("-" * len(header))

for b in BENCHMARKS:
    bid = b["id"]
    t = results["benchmarks"][bid]["targets"]
    c_med = t["cpp20"]["median"]
    vm_med = t["tersun_vm"]["median"]
    py_med = t["python"]["median"]
    speedup_py = (py_med / vm_med) if vm_med > 0 else 0.0

    if has_rust:
        r_med = t["rust"]["median"]
        print(f"{b['name']:<24} | {c_med:12.3f} | {r_med:12.3f} | {vm_med:12.3f} | {py_med:12.3f} | {speedup_py:11.2f}x")
    else:
        print(f"{b['name']:<24} | {c_med:12.3f} | {vm_med:12.3f} | {py_med:12.3f} | {speedup_py:11.2f}x")

print("=" * 90)
print(f"Results saved to: {out_json}")
