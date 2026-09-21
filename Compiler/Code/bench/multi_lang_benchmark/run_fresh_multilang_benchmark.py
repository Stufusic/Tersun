#!/usr/bin/env python3
"""
Tersun Multi-Language Comparative Benchmark Suite
- Target Workloads: W1 (Fibonacci), W2 (Sieve), W3 (MatMul), W4 (Object Updates)
- Targets Evaluated:
  1. C++20 (GCC 15.2.0 -O3)
  2. Rust 1.98.1 (rustc -O -C opt-level=3)
  3. Java 25.0.2 (OpenJDK 64-Bit Server VM)
  4. Python 3.14.3 (CPython)
  5. Tersun Native AOT (setunc compile --native -O3)
  6. Tersun Tier-0 Pure Interpreter (Gate 6R.3 Converged Microarchitecture)
- Quantum Workloads:
  1. QFT (4 Qubits & 8 Qubits)
  2. Bell State (10,000 shots collapse)
  3. Grover Search (3 Qubits)
  Evaluated across Tersun QVM vs NumPy vs IBM Qiskit
"""

import os
import sys
import subprocess
import time
import re
import statistics
import json
import datetime

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(os.path.dirname(HERE))
SETUNC = os.path.join(CODE, "setunc.exe")

N_REPS = 10
WARMUP_REPS = 2

WORKLOADS = [
    {
        "id": "W1",
        "name": "Recursive Fibonacci (N=30)",
        "domain": "Call stack frames, pure recursion, branch prediction",
        "expected_checksum": 832040,
        "regex": r"W1_FIB checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w1_fibonacci", "fib.stn"),
        "stn_aot_bin": os.path.join(HERE, "w1_fibonacci", "fib_tersun_native.exe"),
        "cpp_bin": os.path.join(HERE, "w1_fibonacci", "fib_cpp.exe"),
        "rs_bin": os.path.join(HERE, "w1_fibonacci", "fib_rs.exe"),
        "java_dir": os.path.join(HERE, "w1_fibonacci"),
        "java_cls": "Fib",
        "py_src": os.path.join(HERE, "w1_fibonacci", "fib.py")
    },
    {
        "id": "W2",
        "name": "Prime Sieve (N=100k)",
        "domain": "Linear array buffer mutation, tight loop traversal",
        "expected_checksum": 9592,
        "regex": r"W2_SIEVE checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w2_sieve", "sieve.stn"),
        "stn_aot_bin": os.path.join(HERE, "w2_sieve", "sieve_tersun_native.exe"),
        "cpp_bin": os.path.join(HERE, "w2_sieve", "sieve_cpp.exe"),
        "rs_bin": os.path.join(HERE, "w2_sieve", "sieve_rs.exe"),
        "java_dir": os.path.join(HERE, "w2_sieve"),
        "java_cls": "Sieve",
        "py_src": os.path.join(HERE, "w2_sieve", "sieve.py")
    },
    {
        "id": "W3",
        "name": "Matrix Multiply (100x100 Flat 1D)",
        "domain": "1M MAC ops, cache locality, nested loops",
        "expected_checksum": 20250000,
        "regex": r"W3_MATMUL checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w3_matmul", "matmul.stn"),
        "stn_aot_bin": os.path.join(HERE, "w3_matmul", "matmul_tersun_native.exe"),
        "cpp_bin": os.path.join(HERE, "w3_matmul", "matmul_cpp.exe"),
        "rs_bin": os.path.join(HERE, "w3_matmul", "matmul_rs.exe"),
        "java_dir": os.path.join(HERE, "w3_matmul"),
        "java_cls": "Matmul",
        "py_src": os.path.join(HERE, "w3_matmul", "matmul.py")
    },
    {
        "id": "W4",
        "name": "Object Updates (200k iters)",
        "domain": "Object lifecycle, property mutation, method dispatch",
        "expected_checksum": 541096364,
        "regex": r"W4_OBJECT checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w4_object", "object.stn"),
        "stn_aot_bin": os.path.join(HERE, "w4_object", "object_tersun_native.exe"),
        "cpp_bin": os.path.join(HERE, "w4_object", "object_cpp.exe"),
        "rs_bin": os.path.join(HERE, "w4_object", "object_rs.exe"),
        "java_dir": os.path.join(HERE, "w4_object"),
        "java_cls": "ObjectBench",
        "py_src": os.path.join(HERE, "w4_object", "object.py")
    }
]

def sh(cmd, cwd=CODE, timeout=120):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd, encoding="utf-8", errors="replace")
    return r.returncode, r.stdout.strip(), r.stderr.strip()

def run_bench(cmd, regex, expected_checksum, cwd=CODE):
    # Warmup
    for _ in range(WARMUP_REPS):
        rc, out, err = sh(cmd, cwd=cwd)
        if rc != 0:
            raise RuntimeError(f"Warmup failed for {cmd}: {err}\n{out}")

    times_us = []
    checksum = None

    for _ in range(N_REPS):
        rc, out, err = sh(cmd, cwd=cwd)
        if rc != 0:
            raise RuntimeError(f"Run failed for {cmd}: {err}\n{out}")

        m = re.search(regex, out)
        if not m:
            raise RuntimeError(f"Could not parse output for {cmd}:\n{out}")

        cs_val = float(m.group(1))
        us = int(m.group(2))

        if abs(cs_val - expected_checksum) > 1e-4 * expected_checksum:
            raise RuntimeError(f"Checksum mismatch for {cmd}: expected {expected_checksum}, got {cs_val}")

        checksum = cs_val
        times_us.append(us)

    times_ms = [t / 1000.0 for t in times_us]
    return {
        "n": len(times_ms),
        "median_ms": round(statistics.median(times_ms), 3),
        "mean_ms": round(statistics.mean(times_ms), 3),
        "stddev_ms": round(statistics.stdev(times_ms), 3) if len(times_ms) > 1 else 0.0,
        "min_ms": round(min(times_ms), 3),
        "max_ms": round(max(times_ms), 3),
        "checksum": checksum,
        "raw_times_ms": [round(x, 3) for x in times_ms]
    }

def main():
    print("=" * 80)
    print("  TERSUN FRESH MULTI-LANGUAGE BENCHMARK SUITE")
    print(f"  Date: {datetime.datetime.now().isoformat()}")
    print("  Compiler Versions:")
    print("    - C++20: GCC 15.2.0 (-O3)")
    print("    - Rust: 1.98.1 (-O -C opt-level=3)")
    print("    - Java: OpenJDK 25.0.2 Server VM")
    print("    - Python: CPython 3.14.3")
    print("    - Tersun Native AOT: Tersun 1.0.3 (-O3 native)")
    print("    - Tersun Interpreter: Gate 6R.3 Converged Pure Interpreter (--interp)")
    print("=" * 80)

    results = {}

    for w in WORKLOADS:
        w_id = w["id"]
        w_name = w["name"]
        print(f"\n>>> Running Workload {w_id}: {w_name}")
        results[w_id] = {
            "name": w_name,
            "domain": w["domain"],
            "expected_checksum": w["expected_checksum"],
            "targets": {}
        }

        # 1. C++
        sys.stdout.write("  [1/6] C++ (GCC 15.2 -O3)                ... ")
        sys.stdout.flush()
        res_cpp = run_bench([w["cpp_bin"]], w["regex"], w["expected_checksum"])
        results[w_id]["targets"]["cpp_gcc"] = res_cpp
        print(f"{res_cpp['median_ms']:>8.3f} ms (min: {res_cpp['min_ms']:>8.3f} ms)")

        # 2. Rust
        sys.stdout.write("  [2/6] Rust (rustc 1.98.1 -O3)           ... ")
        sys.stdout.flush()
        res_rs = run_bench([w["rs_bin"]], w["regex"], w["expected_checksum"])
        results[w_id]["targets"]["rust"] = res_rs
        print(f"{res_rs['median_ms']:>8.3f} ms (min: {res_rs['min_ms']:>8.3f} ms)")

        # 3. Java
        sys.stdout.write("  [3/6] Java (OpenJDK 25 Server VM)       ... ")
        sys.stdout.flush()
        res_java = run_bench(["java", "-cp", w["java_dir"], w["java_cls"]], w["regex"], w["expected_checksum"])
        results[w_id]["targets"]["java_openjdk"] = res_java
        print(f"{res_java['median_ms']:>8.3f} ms (min: {res_java['min_ms']:>8.3f} ms)")

        # 4. Python
        sys.stdout.write("  [4/6] Python (CPython 3.14.3)           ... ")
        sys.stdout.flush()
        res_py = run_bench(["python", w["py_src"]], w["regex"], w["expected_checksum"])
        results[w_id]["targets"]["python_cpython"] = res_py
        print(f"{res_py['median_ms']:>8.3f} ms (min: {res_py['min_ms']:>8.3f} ms)")

        # 5. Tersun Native AOT
        sys.stdout.write("  [5/6] Tersun Native AOT (-O3)           ... ")
        sys.stdout.flush()
        res_aot = run_bench([w["stn_aot_bin"]], w["regex"], w["expected_checksum"])
        results[w_id]["targets"]["tersun_native_aot"] = res_aot
        print(f"{res_aot['median_ms']:>8.3f} ms (min: {res_aot['min_ms']:>8.3f} ms)")

        # 6. Tersun Pure Interpreter (G6R.3 Converged)
        sys.stdout.write("  [6/6] Tersun G6R.3 Interp (--interp)    ... ")
        sys.stdout.flush()
        res_interp = run_bench([SETUNC, "run", "--interp", w["stn"]], w["regex"], w["expected_checksum"])
        results[w_id]["targets"]["tersun_g6r3_interp"] = res_interp
        print(f"{res_interp['median_ms']:>8.3f} ms (min: {res_interp['min_ms']:>8.3f} ms)")

    # Quantum simulation suite
    print("\n" + "=" * 80)
    print("  RUNNING QUANTUM SIMULATION SUITE (QVM vs NUMPY vs QISKIT)")
    print("=" * 80)
    qvm_bin = os.path.join(HERE, "quantum", "bench_qvm.exe")
    py_q_script = os.path.join(HERE, "quantum", "bench_python_quantum.py")

    print("  Executing Tersun QVM Standalone...")
    rc, out_qvm, err = sh([qvm_bin])
    if rc != 0: raise RuntimeError(f"QVM failed: {err}")

    print("  Executing Python NumPy & Qiskit...")
    rc, out_py, err = sh(["python", py_q_script])
    if rc != 0: raise RuntimeError(f"Python quantum failed: {err}")

    def parse_kv(text):
        data = {}
        for line in text.splitlines():
            line = line.strip()
            if not line or line.startswith("["): continue
            parts = line.split()
            if not parts: continue
            k = parts[0]
            kvs = {}
            for p in parts[1:]:
                if "=" in p:
                    kv = p.split("=")
                    try:
                        kvs[kv[0]] = float(kv[1])
                    except ValueError:
                        kvs[kv[0]] = kv[1]
            data[k] = kvs
        return data

    qvm_data = parse_kv(out_qvm)
    py_data = parse_kv(out_py)

    quantum_results = {
        "tersun_qvm": qvm_data,
        "python_quantum": py_data
    }

    # Historical comparisons
    historical_baselines = {
        "B0_gate6_legacy": {
            "W1": 145.2,
            "W2": 48.6,
            "W3": 62.1,  # N=128
            "W4": 18.4
        },
        "B1_g6r24_baseline_interp": {
            "W1": 103.65,
            "W2": 32.46,
            "W3": 202.30,
            "W4": 105.69
        },
        "B2_g6r3_converged_interp": {
            "W1": 87.97,
            "W2": 27.99,
            "W3": 150.06,
            "W4": 105.74
        },
        "seal_20260913_interp": {
            "W1": 111.28,
            "W2": 30.53,
            "W3": 205.01,
            "W4": 106.16
        }
    }

    output_payload = {
        "metadata": {
            "timestamp": datetime.datetime.now().isoformat(),
            "cpu": "12th Gen Intel(R) Core(TM) i5-1245U (10 cores, 12 threads)",
            "os": "Windows 11 Pro 64-bit",
            "n_reps": N_REPS,
            "warmup_reps": WARMUP_REPS,
            "compilers": {
                "cpp": "GCC 15.2.0 -O3 -std=c++20",
                "rust": "rustc 1.98.1 -O -C opt-level=3",
                "java": "OpenJDK 25.0.2 Server VM",
                "python": "CPython 3.14.3",
                "tersun": "Tersun 1.0.3 (G6R.3 Pinned Registers)"
            }
        },
        "classical_workloads": results,
        "quantum_workloads": quantum_results,
        "historical_baselines": historical_baselines
    }

    out_file = os.path.join(HERE, "FRESH_CROSS_LANGUAGE_RESULTS_20260920.json")
    with open(out_file, "w", encoding="utf-8") as f:
        json.dump(output_payload, f, indent=2)

    print(f"\n[OK] Fresh multi-language results saved to: {out_file}")

if __name__ == "__main__":
    main()
