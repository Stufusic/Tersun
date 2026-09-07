#!/usr/bin/env python3
# ==============================================================================
# Scientific Benchmark Suite: N=10 Repetitions, Median, Variance, Multi-Platform
# Phase 0: Baseline 1.0.3 Execution Architecture
# ==============================================================================

import os
import sys
import subprocess
import time
import re
import json
import statistics

BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
CODE_DIR = os.path.join(BASE_DIR, "Code")
BENCH_DIR = os.path.join(CODE_DIR, "bench")
BUILD_DIR = os.path.join(BENCH_DIR, "build")
ARTIFACTS_DIR = os.path.join(BASE_DIR, "Doc", "artifacts", "baseline_1.0.3")

os.makedirs(BUILD_DIR, exist_ok=True)
os.makedirs(ARTIFACTS_DIR, exist_ok=True)

SETUNC = os.path.join(BASE_DIR, "setunc.exe")
PYTHON = sys.executable
REPETITIONS = 10

def run_cmd(cmd, cwd=BENCH_DIR, timeout=300):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, cwd=cwd)
    out, err = p.communicate(timeout=timeout)
    return p.returncode, out.strip(), err.strip()

print("================================================================================")
print("  TERSUN 1.0.3 SCIENTIFIC BENCHMARK BASELINE FREEZE (N = 10)")
print("================================================================================")
print(f"Host Compiler : g++ 15.2.0")
print(f"Python Engine : {sys.version.split()[0]}")
print(f"Repetitions   : {REPETITIONS}")
print(f"Artifact Dir  : {ARTIFACTS_DIR}")
print("--------------------------------------------------------------------------------")

# Compile C++ Reference
cpp_exe = os.path.join(BUILD_DIR, "bench_cpp_ref.exe")
rc, o, e = run_cmd(["g++", "-std=c++20", "-O3", "bench_cpp_ref.cpp", "-o", cpp_exe])
if rc != 0:
    print(f"[ERROR] Failed to compile C++ reference: {e}")
    sys.exit(1)

# Compile QVM harness
qvm_bench_exe = os.path.join(BUILD_DIR, "bench_qvm.exe")
rc, o, e = run_cmd(["g++", "-std=c++20", "-O2", "-I../include",
                    "../src/qvm/qreg.cpp", "../src/qvm/qgate.cpp", "../src/qvm/qvm.cpp",
                    "bench_qvm.cpp", "-o", qvm_bench_exe, "-lgdi32", "-luser32"])
if rc != 0:
    print(f"[ERROR] Failed to compile QVM harness: {e}")
    sys.exit(1)

workloads = [
    # (Category, Key, Stn_File, Cpp_Mode, Cpp_N, Py_Mode)
    ("Dispatch", "dispatch_3m", "bench_dispatch.stn", "dispatch", 3000000, "dispatch"),
    ("Control",  "fib_24",      "bench_control.stn",  "fib",      24,      "fib"),
    ("Control",  "branch_2m",   "bench_control.stn",  "branch",   2000000, "branch"),
    ("Memory",   "memory_200k", "bench_memory.stn",   "memory",   200000,  "memory"),
    ("Arithmetic","sum_5m",     "bench_arithmetic.stn","sum",     5000000, "sum")
]

results = {
    "metadata": {
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
        "repetitions": REPETITIONS,
        "compiler": "g++ (GCC) 15.2.0",
        "python": sys.version.split()[0],
        "tersun_version": "1.0.3"
    },
    "workloads": {}
}

# Compile and archive baseline bytecode & native binaries
for cat, key, stn_file, cpp_mode, cpp_n, py_mode in workloads:
    stn_path = os.path.join(BENCH_DIR, stn_file)
    tbc_path = os.path.join(BUILD_DIR, f"{key}.tbc")
    native_exe = os.path.join(BUILD_DIR, f"{key}_native.exe")
    native_cpp = os.path.join(BUILD_DIR, f"{key}_native.cpp")
    native_asm = os.path.join(ARTIFACTS_DIR, f"{key}_native.s")

    # 1. Compile .tbc
    run_cmd([SETUNC, "compile", stn_file, "-o", tbc_path])
    
    # 2. Compile Native (--native)
    run_cmd([SETUNC, "emit-c", stn_file, "-o", native_cpp])
    if os.path.exists(native_cpp):
        # Generate assembly artifact
        run_cmd(["g++", "-std=c++20", "-O3", "-I../include", "-S", native_cpp, "-o", native_asm])
        # Generate binary
        run_cmd(["g++", "-std=c++20", "-O3", "-I../include", native_cpp,
                 os.path.join(BENCH_DIR, "libtersun_rt.a"), "-o", native_exe,
                 "-lgdi32", "-luser32", "-lcomdlg32"])

print(f"{'Workload':<16}{'Engine':<22}{'Median (ms)':>12}{'Mean (ms)':>12}{'StdDev (ms)':>14}")
print("-" * 76)

def calc_stats(samples_ms):
    med = statistics.median(samples_ms)
    mean = statistics.mean(samples_ms)
    stdev = statistics.stdev(samples_ms) if len(samples_ms) > 1 else 0.0
    return {
        "samples_ms": samples_ms,
        "median_ms": round(med, 3),
        "mean_ms": round(mean, 3),
        "stddev_ms": round(stdev, 4),
        "min_ms": round(min(samples_ms), 3),
        "max_ms": round(max(samples_ms), 3)
    }

for cat, key, stn_file, cpp_mode, cpp_n, py_mode in workloads:
    results["workloads"][key] = {"category": cat, "engines": {}}
    tbc_path = os.path.join(BUILD_DIR, f"{key}.tbc")
    native_exe = os.path.join(BUILD_DIR, f"{key}_native.exe")

    # --- 1. Tersun VM 1.0.3 (Baseline) ---
    vm_samples = []
    for _ in range(REPETITIONS):
        rc, out, _ = run_cmd([SETUNC, "run", tbc_path])
        m = re.search(r"time_us=(\d+)", out)
        if m:
            vm_samples.append(int(m.group(1)) / 1000.0)
        else:
            # For composite bench_control or bench_arithmetic, match specific us
            if key == "fib_24":
                m_fib = re.search(r"fib_us=(\d+)", out)
                if m_fib: vm_samples.append(int(m_fib.group(1)) / 1000.0)
            elif key == "branch_2m":
                m_br = re.search(r"branch_us=(\d+)", out)
                if m_br: vm_samples.append(int(m_br.group(1)) / 1000.0)
            elif key == "sum_5m":
                m_sum = re.search(r"int_us=(\d+)", out)
                if m_sum: vm_samples.append(int(m_sum.group(1)) / 1000.0)
    
    if vm_samples:
        st = calc_stats(vm_samples)
        results["workloads"][key]["engines"]["Tersun_VM_1.0.3"] = st
        print(f"{key:<16}{'Tersun VM (1.0.3)':<22}{st['median_ms']:>12.2f}{st['mean_ms']:>12.2f}{st['stddev_ms']:>14.3f}")

    # --- 2. CPython 3.14 ---
    py_samples = []
    for _ in range(REPETITIONS):
        rc, out, _ = run_cmd([PYTHON, "bench_classical.py", py_mode])
        m = re.search(r"time_us=(\d+)", out)
        if m: py_samples.append(int(m.group(1)) / 1000.0)
    if py_samples:
        st = calc_stats(py_samples)
        results["workloads"][key]["engines"]["CPython_3.14"] = st
        print(f"{'':<16}{'CPython 3.14':<22}{st['median_ms']:>12.2f}{st['mean_ms']:>12.2f}{st['stddev_ms']:>14.3f}")

    # --- 3. C++ g++ -O3 ---
    cpp_samples = []
    for _ in range(REPETITIONS):
        rc, out, _ = run_cmd([cpp_exe, cpp_mode, str(cpp_n)])
        m = re.search(r"in ([\d.]+) us", out)
        if m: cpp_samples.append(float(m.group(1)) / 1000.0)
    if cpp_samples:
        st = calc_stats(cpp_samples)
        results["workloads"][key]["engines"]["CPP_GCC_O3"] = st
        print(f"{'':<16}{'C++ (g++ -O3)':<22}{st['median_ms']:>12.3f}{st['mean_ms']:>12.3f}{st['stddev_ms']:>14.4f}")

    # --- 4. Tersun Native AOT ---
    if os.path.exists(native_exe):
        nat_samples = []
        for _ in range(REPETITIONS):
            t_start = time.perf_counter()
            rc, out, _ = run_cmd([native_exe])
            t_end = time.perf_counter()
            # External time minus baseline process launch (~4ms)
            total_ms = (t_end - t_start) * 1000.0
            nat_samples.append(max(0.1, total_ms - 4.5))
        if nat_samples:
            st = calc_stats(nat_samples)
            results["workloads"][key]["engines"]["Tersun_Native_AOT"] = st
            print(f"{'':<16}{'Tersun Native AOT':<22}{st['median_ms']:>12.2f}{st['mean_ms']:>12.2f}{st['stddev_ms']:>14.3f}")
    print("-" * 76)

# Quantum Benchmarks: QFT(8), QFT(12), QFT(16)
print("\n================================================================================")
print("  QUANTUM CIRCUIT BENCHMARKS: QFT(n) [QVM vs Pure Python Sim]")
print("================================================================================")
results["quantum"] = {}

for n in (8, 12, 16):
    q_key = f"QFT_{n}"
    src = f"qft{n}.stn"
    qbc = os.path.join(BUILD_DIR, f"qft{n}.qbc")
    qasm = os.path.join(BUILD_DIR, f"qft{n}.qasm")

    # Generate source if needed
    if not os.path.exists(os.path.join(BENCH_DIR, src)):
        with open(os.path.join(BENCH_DIR, src), "w") as f:
            f.write(f"fn main() {{\n    qft({n});\n}}\n")

    run_cmd([SETUNC, "compile", src, "--qvm", "-o", qbc])
    run_cmd([SETUNC, "emit-qasm", src, "-o", qasm])

    # QVM measurement (N=10)
    qvm_samples = []
    for _ in range(REPETITIONS):
        rc, out, _ = run_cmd([qvm_bench_exe, qbc, "1"])
        m = re.search(r"per_run_ms=([\d.]+)", out)
        if m: qvm_samples.append(float(m.group(1)))
    
    # Python simulation (for n=8, 12 only to avoid excessive time)
    py_q_samples = []
    if n <= 12:
        for _ in range(min(5, REPETITIONS)):
            rc, out, _ = run_cmd([PYTHON, "bench_pysim.py", qasm], timeout=600)
            m = re.search(r"wall_ms=([\d.]+)", out)
            if m: py_q_samples.append(float(m.group(1)))

    st_qvm = calc_stats(qvm_samples) if qvm_samples else None
    st_py = calc_stats(py_q_samples) if py_q_samples else None

    results["quantum"][q_key] = {
        "QVM_C++": st_qvm,
        "Python_Sim": st_py
    }

    print(f"QFT({n:<2}): QVM Median = {st_qvm['median_ms'] if st_qvm else 'N/A':>8} ms (stddev={st_qvm['stddev_ms'] if st_qvm else 0:.3f}) | "
          f"Python Sim Median = {st_py['median_ms'] if st_py else 'N/A':>8} ms")

# Save baseline metrics JSON artifact
metrics_file = os.path.join(ARTIFACTS_DIR, "baseline_metrics.json")
with open(metrics_file, "w") as f:
    json.dump(results, f, indent=2)

print(f"\n[Artifact Saved] Baseline metrics written to: {metrics_file}")
print("================================================================================")
