#!/usr/bin/env python3
# ============================================================================
# Heavy Benchmark Suite Runner: N=5 Repetitions, Median, StdDev
# Evaluates H1-H4 across Tersun VM, Tersun Native AOT, CPython 3.14, and C++20
# ============================================================================

import os
import sys
import subprocess
import time
import re
import statistics
import json

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
ROOT = os.path.dirname(CODE)
SETUNC = os.path.join(CODE, "setunc.exe")
BUILD = os.path.join(HERE, "build")
DOC_ARTIFACTS = os.path.join(ROOT, "Doc", "artifacts", "heavy_benchmarks")

os.makedirs(BUILD, exist_ok=True)
os.makedirs(DOC_ARTIFACTS, exist_ok=True)

N_REPS = 5

def sh(cmd, cwd=HERE, timeout=300):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return r.returncode, r.stdout.strip(), r.stderr.strip()

def calc_stats(samples_ms):
    if not samples_ms:
        return {"median": 0.0, "mean": 0.0, "stddev": 0.0}
    med = statistics.median(samples_ms)
    mean = statistics.mean(samples_ms)
    stdev = statistics.stdev(samples_ms) if len(samples_ms) > 1 else 0.0
    return {
        "median": round(med, 3),
        "mean": round(mean, 3),
        "stddev": round(stdev, 4),
        "min": round(min(samples_ms), 3),
        "max": round(max(samples_ms), 3)
    }

print("================================================================================")
print("  TERSUN NEXT-GEN HEAVY BENCHMARK EVALUATION SUITE (N = 5)")
print("================================================================================")
print(f"Host C++ Compiler : g++ 15.2.0 (-std=c++20 -O3)")
print(f"Python Engine     : CPython {sys.version.split()[0]}")
print(f"Repetitions       : {N_REPS}")
print("--------------------------------------------------------------------------------")

# Compile C++ Reference
cpp_exe = os.path.join(BUILD, "heavy_cpp_ref.exe")
rc, o, e = sh(["g++", "-std=c++20", "-O3", "heavy_cpp_ref.cpp", "-o", cpp_exe])
assert rc == 0, f"Failed to build C++ reference: {e}"

workloads = [
    ("H1 Prime Sieve (100k)", "heavy_sieve", "sieve", r"HEAVY_SIEVE count=(\d+) time_us=(\d+)"),
    ("H2 Matmul (100x100)", "heavy_matmul", "matmul", r"HEAVY_MATMUL checksum=([\d.e+]+) time_us=(\d+)"),
    ("H3 N-Queens (N=11)", "heavy_nqueens", "nqueens", r"HEAVY_NQUEENS solutions=(\d+) time_us=(\d+)"),
    ("H4 Binary Trees (D=14)", "heavy_trees", "trees", r"HEAVY_TREES checksum=(\d+) time_us=(\d+)")
]

results = {
    "metadata": {
        "compiler": "g++ (GCC) 15.2.0 -O3",
        "python": sys.version.split()[0],
        "repetitions": N_REPS,
        "date": time.strftime("%Y-%m-%d %H:%M:%S")
    },
    "workloads": {}
}

# Compile .tbc and native .exe for all Tersun workloads
for title, key, mode, pattern in workloads:
    stn_path = f"{key}.stn"
    tbc_path = os.path.join(BUILD, f"{key}.tbc")
    native_exe = os.path.join(BUILD, f"{key}.exe")
    
    # Compile VM Bytecode
    rc, o, e = sh([SETUNC, "compile", stn_path, "-o", tbc_path])
    if rc != 0:
        print(f"[WARN] Failed to compile VM {stn_path}: {e}")
        
    # Compile Native AOT (except H4 trees if class ARC is VM-only)
    if key != "heavy_trees":
        rc, o, e = sh([SETUNC, "compile", stn_path, "--native", "-o", native_exe])
        if rc != 0:
            print(f"[WARN] Failed to compile Native {stn_path}: {e}")

print(f"{'Workload':<24}{'Engine':<24}{'Median':>12}{'Mean':>12}{'StdDev':>12}")
print("-" * 84)

table_rows = []

for title, key, mode, pattern in workloads:
    results["workloads"][key] = {"title": title, "engines": {}}
    tbc_path = os.path.join(BUILD, f"{key}.tbc")
    native_exe = os.path.join(BUILD, f"{key}.exe")

    # 1. Tersun VM
    vm_samples = []
    if os.path.exists(tbc_path):
        for _ in range(N_REPS):
            rc, o, e = sh([SETUNC, "run", tbc_path])
            m = re.search(r"time_us=(\d+)", o)
            if m:
                vm_samples.append(int(m.group(1)) / 1000.0)
    if vm_samples:
        st = calc_stats(vm_samples)
        results["workloads"][key]["engines"]["Tersun_VM"] = st
        print(f"{title:<24}{'Tersun VM (.tbc)':<24}{st['median']:>10.2f} ms{st['mean']:>10.2f} ms{st['stddev']:>10.3f}")
        table_rows.append((title, "Tersun VM (.tbc)", st['median'], f"{st['stddev']:.2f} ms"))

    # 2. Tersun Native AOT
    if os.path.exists(native_exe):
        nat_samples = []
        for _ in range(N_REPS):
            rc, o, e = sh([native_exe])
            m = re.search(r"time_us=(\d+)", o)
            if m:
                nat_samples.append(int(m.group(1)) / 1000.0)
        if nat_samples:
            st = calc_stats(nat_samples)
            results["workloads"][key]["engines"]["Tersun_Native"] = st
            print(f"{'':<24}{'Tersun Native AOT':<24}{st['median']:>10.2f} ms{st['mean']:>10.2f} ms{st['stddev']:>10.3f}")
            table_rows.append((title, "Tersun Native AOT", st['median'], f"{st['stddev']:.2f} ms"))

    # 3. CPython 3.14
    py_samples = []
    for _ in range(N_REPS):
        rc, o, e = sh([sys.executable, "heavy_bench.py", mode])
        m = re.search(r"time_us=(\d+)", o)
        if m:
            py_samples.append(int(m.group(1)) / 1000.0)
    if py_samples:
        st = calc_stats(py_samples)
        results["workloads"][key]["engines"]["CPython_3.14"] = st
        print(f"{'':<24}{'CPython 3.14':<24}{st['median']:>10.2f} ms{st['mean']:>10.2f} ms{st['stddev']:>10.3f}")
        table_rows.append((title, "CPython 3.14", st['median'], f"{st['stddev']:.2f} ms"))

    # 4. C++20 (g++ -O3)
    cpp_samples = []
    for _ in range(N_REPS):
        rc, o, e = sh([cpp_exe, mode])
        m = re.search(r"time_us=([\d.]+)", o)
        if m:
            cpp_samples.append(float(m.group(1)) / 1000.0)
    if cpp_samples:
        st = calc_stats(cpp_samples)
        results["workloads"][key]["engines"]["CPP_O3"] = st
        print(f"{'':<24}{'C++20 (g++ -O3)':<24}{st['median']:>10.3f} ms{st['mean']:>10.3f} ms{st['stddev']:>10.4f}")
        table_rows.append((title, "C++20 (g++ -O3)", st['median'], f"{st['stddev']:.3f} ms"))

    print("-" * 84)

# Save JSON artifact
json_path = os.path.join(DOC_ARTIFACTS, "heavy_baseline_metrics.json")
with open(json_path, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2)

print(f"\n[Artifact Saved] Metrics archived to: {json_path}")
print("================================================================================")
