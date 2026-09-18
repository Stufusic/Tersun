#!/usr/bin/env python3
import os
import sys
import subprocess
import time
import re
import statistics
import json
import hashlib

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(os.path.dirname(HERE))
SETUNC = os.path.join(CODE, "setunc.exe")

N_REPS = 5

WORKLOADS = [
    {
        "id": "W1",
        "name": "Recursive Fibonacci (N=30)",
        "desc": "Call stack frames, pure recursion, branch prediction",
        "expected_checksum": 832040,
        "regex": r"W1_FIB checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w1_fibonacci", "fib.stn"),
        "stn_native_bin": os.path.join(HERE, "w1_fibonacci", "fib_tersun_native.exe")
    },
    {
        "id": "W2",
        "name": "Prime Sieve of Eratosthenes (N=100k)",
        "desc": "Linear array buffer mutation, tight loop traversal",
        "expected_checksum": 9592,
        "regex": r"W2_SIEVE checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w2_sieve", "sieve.stn"),
        "stn_native_bin": os.path.join(HERE, "w2_sieve", "sieve_tersun_native.exe")
    },
    {
        "id": "W3",
        "name": "Matrix Multiplication (100x100 Flat 1D)",
        "desc": "1M multiply-accumulates, cache locality, nested loops",
        "expected_checksum": 20250000,
        "regex": r"W3_MATMUL checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w3_matmul", "matmul.stn"),
        "stn_native_bin": os.path.join(HERE, "w3_matmul", "matmul_tersun_native.exe")
    },
    {
        "id": "W4",
        "name": "Object / Struct Updates (200k iters)",
        "desc": "Object lifecycle, property mutation, method dispatch",
        "expected_checksum": 541096364,
        "regex": r"W4_OBJECT checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w4_object", "object.stn"),
        "stn_native_bin": os.path.join(HERE, "w4_object", "object_tersun_native.exe")
    }
]

def sh(cmd, cwd=CODE, timeout=300):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return r.returncode, r.stdout.strip(), r.stderr.strip()

def run_single_benchmark(cmd, regex, expected_checksum, cwd=CODE):
    times_us = []
    checksum = None

    for _ in range(N_REPS):
        rc, out, err = sh(cmd, cwd=cwd)
        if rc != 0:
            raise RuntimeError(f"Run failed for {cmd}: {err}\n{out}")
        
        m = re.search(regex, out)
        if not m:
            raise RuntimeError(f"Could not parse output for {cmd}: {out}")
        
        cs_val = float(m.group(1))
        us = int(m.group(2))
        
        if abs(cs_val - expected_checksum) > 1e-4 * expected_checksum:
            raise RuntimeError(f"Checksum mismatch for {cmd}: expected {expected_checksum}, got {cs_val}")
        
        checksum = cs_val
        times_us.append(us)

    med_us = statistics.median(times_us)
    min_us = min(times_us)
    max_us = max(times_us)
    return {
        "median_ms": round(med_us / 1000.0, 2),
        "min_ms": round(min_us / 1000.0, 2),
        "max_ms": round(max_us / 1000.0, 2),
        "checksum": checksum,
        "valid": True
    }

def run_classical_tersun():
    print("\n" + "="*80)
    print("  [1/2] RUNNING TERSUN CLASSICAL BENCHMARK (NATIVE AOT & BYTECODE VM)")
    print("  (Preserving existing reference data for C++, Rust, Java, and Python)")
    print("="*80)

    # Load existing seal
    seal_path = os.path.join(HERE, "SEAL_BENCHMARK_CLASSICAL.json")
    with open(seal_path, "r", encoding="utf-8") as f:
        existing_seal = json.load(f)

    existing_workloads = {w["id"]: w for w in existing_seal["record"]["workloads"]}

    updated_workloads = []

    for w in WORKLOADS:
        w_id = w["id"]
        w_name = w["name"]
        print(f"\n>>> Workload {w_id}: {w_name}")
        ref_entry = existing_workloads.get(w_id, {})
        ref_results = ref_entry.get("results_ms", {})

        # 1. Compile Native AOT with -O3
        print(f"  [AOT] Compiling {w['stn']} -> {w['stn_native_bin']}...")
        rc, out, err = sh([SETUNC, "compile", w["stn"], "--native", "-o", w["stn_native_bin"]])
        if rc != 0:
            raise RuntimeError(f"Native compilation failed: {err}\n{out}")

        # 2. Run Native AOT
        sys.stdout.write("  [Run] Tersun Native AOT (-O3)  ... ")
        sys.stdout.flush()
        res_aot = run_single_benchmark([w["stn_native_bin"]], w["regex"], w["expected_checksum"])
        print(f"DONE. Median: {res_aot['median_ms']:>7.2f} ms (Min: {res_aot['min_ms']:>7.2f} ms, Max: {res_aot['max_ms']:>7.2f} ms)")

        # 3. Run VM Bytecode
        sys.stdout.write("  [Run] Tersun VM (Bytecode)     ... ")
        sys.stdout.flush()
        res_vm = run_single_benchmark([SETUNC, "run", w["stn"]], w["regex"], w["expected_checksum"])
        print(f"DONE. Median: {res_vm['median_ms']:>7.2f} ms (Min: {res_vm['min_ms']:>7.2f} ms, Max: {res_vm['max_ms']:>7.2f} ms)")

        # Merge results: update tersun_native_aot & tersun_vm_bytecode, keep others
        merged_results = dict(ref_results)
        merged_results["tersun_native_aot"] = res_aot["median_ms"]
        merged_results["tersun_vm_bytecode"] = res_vm["median_ms"]

        speedup_aot_vm = round(res_vm["median_ms"] / res_aot["median_ms"], 1) if res_aot["median_ms"] > 0 else 0
        py_time = merged_results.get("python_314", 1.0)
        speedup_aot_py = round(py_time / res_aot["median_ms"], 1) if res_aot["median_ms"] > 0 else 0

        updated_workload = {
            "id": w_id,
            "name": w_name,
            "expected_checksum": w["expected_checksum"],
            "results_ms": merged_results,
            "speedup_aot_vs_vm": speedup_aot_vm,
            "speedup_aot_vs_python": speedup_aot_py
        }
        updated_workloads.append(updated_workload)

    # Print summary table
    print("\n" + "="*95)
    print("  SUMMARY: TERSUN CLASSICAL MULTI-LANGUAGE COMPARISON TABLE (Measured & Reference)")
    print("="*95)
    print(f"{'Workload':<36} | {'C++ -O3':>8} | {'Rust -O':>8} | {'Java 25':>8} | {'Tersun AOT':>10} | {'Python':>8} | {'Tersun VM':>9}")
    print("-" * 95)
    for w in updated_workloads:
        r = w["results_ms"]
        print(f"{w['name']:<36} | {r.get('cpp_gcc_o3', 0):>7.2f}m | {r.get('rust_o', 0):>7.2f}m | {r.get('java_openjdk25', 0):>7.2f}m | {r.get('tersun_native_aot', 0):>9.2f}m | {r.get('python_314', 0):>7.2f}m | {r.get('tersun_vm_bytecode', 0):>8.2f}m")
    print("="*95)

    # Update seal JSON
    existing_seal["record"]["workloads"] = updated_workloads
    existing_seal["verified_at"] = time.strftime("%Y-%m-%dT%H:%M:%S+07:00")
    s_raw = json.dumps(existing_seal["record"], sort_keys=True, indent=2)
    new_hash = hashlib.sha256(s_raw.encode("utf-8")).hexdigest()
    existing_seal["seal_hash"] = new_hash

    with open(seal_path, "w", encoding="utf-8") as f:
        json.dump(existing_seal, f, indent=2)
    print(f"\n  [SEAL UPDATED] SEAL_BENCHMARK_CLASSICAL.json")
    print(f"  SHA-256 Hash Seal: {new_hash}")

    return updated_workloads

def run_quantum_tersun():
    print("\n" + "="*80)
    print("  [2/2] RUNNING TERSUN QUANTUM BENCHMARK (QVM STANDALONE & HARDWARE LIMITS)")
    print("  (Preserving existing reference data for Python Qiskit and Python NumPy)")
    print("="*80)

    # Load existing quantum seal
    seal_path = os.path.join(HERE, "SEAL_BENCHMARK_QUANTUM_LIMIT.json")
    with open(seal_path, "r", encoding="utf-8") as f:
        existing_seal = json.load(f)

    # 1. Run bench_qvm.exe (Task-based: QFT4, QFT8, Bell 10k shots, Grover 3-qubit)
    qvm_bin = os.path.join(HERE, "quantum", "bench_qvm.exe")
    print(f"\n>>> Running QVM Standalone Tasks ({qvm_bin})...")
    rc, out, err = sh([qvm_bin])
    if rc != 0:
        raise RuntimeError(f"bench_qvm.exe failed: {err}\n{out}")
    print(out)

    # 2. Run bench_qvm_limits.exe (Phase 1: QFT Scaling & Phase 2: Hardware Limits)
    qvm_limits_bin = os.path.join(HERE, "quantum", "bench_qvm_limits.exe")
    print(f"\n>>> Running QVM Hardware Limits & Scaling Stress ({qvm_limits_bin})...")
    rc, out, err = sh([qvm_limits_bin], timeout=600)
    if rc != 0:
        raise RuntimeError(f"bench_qvm_limits.exe failed: {err}\n{out}")
    print(out)

    # Parse Phase 1 QFT Scaling
    phase1_results = []
    for line in out.splitlines():
        line = line.strip()
        if line.startswith("QFT_SCALING"):
            parts = line.split()
            # QFT_SCALING N=4 dim=16 mem_mb=0.0 time_ms=0.028
            n = int(parts[1].split("=")[1])
            dim = int(parts[2].split("=")[1])
            mem_mb = float(parts[3].split("=")[1])
            time_ms = float(parts[4].split("=")[1])
            n_gates = n + (n * (n - 1)) // 2 + n // 2
            throughput = round((dim * n_gates) / (time_ms * 1000.0), 2) if time_ms > 0 else 0.0
            phase1_results.append({
                "qubits": n,
                "dim": dim,
                "mem_mb": mem_mb,
                "gates": n_gates,
                "time_ms": round(time_ms, 3),
                "throughput_mops": throughput
            })

    # Parse Phase 2 Hardware Limits
    phase2_results = []
    for line in out.splitlines():
        line = line.strip()
        if line.startswith("HW_LIMIT"):
            parts = line.split()
            # HW_LIMIT N=10 dim=1024 mem_mb=0.02 total_ms=0.72 status=SUCCESS
            n = int(parts[1].split("=")[1])
            dim = int(parts[2].split("=")[1])
            mem_mb = float(parts[3].split("=")[1])
            total_ms_str = parts[4].split("=")[1]
            status = parts[5].split("=")[1]
            total_ms = float(total_ms_str) if total_ms_str != "None" else None
            phase2_results.append({
                "qubits": n,
                "dim": dim,
                "mem_mb": mem_mb,
                "total_ms": round(total_ms, 2) if total_ms is not None else None,
                "status": status
            })

    # Compare with Python Reference Data
    py_comparisons = existing_seal["record"]["python_comparisons"]
    numpy_ref = {item["qubits"]: item["total_ms"] for item in py_comparisons.get("numpy", [])}
    qiskit_ref = {item["qubits"]: item["total_ms"] for item in py_comparisons.get("qiskit", [])}

    print("\n" + "="*95)
    print("  QUANTUM BENCHMARK COMPARISON: TERSUN QVM vs PYTHON (NUMPY & QISKIT)")
    print("="*95)
    print(f"{'Qubits':<8} | {'Dimension':<12} | {'RAM (MB)':<10} | {'Tersun QVM (ms)':>16} | {'NumPy (ms)':>12} | {'Qiskit (ms)':>12} | {'Speedup vs Py':>14}")
    print("-" * 95)

    for item in phase2_results:
        n = item["qubits"]
        dim = item["dim"]
        mem = item["mem_mb"]
        t_qvm = item["total_ms"]
        t_np = numpy_ref.get(n)
        t_qiskit = qiskit_ref.get(n)

        t_qvm_str = f"{t_qvm:.2f}" if t_qvm is not None else item["status"]
        t_np_str = f"{t_np:.2f}" if t_np is not None else "N/A"
        t_qiskit_str = f"{t_qiskit:.2f}" if t_qiskit is not None else "N/A"

        best_py = t_np if t_np is not None else t_qiskit
        if t_qvm is not None and best_py is not None and t_qvm > 0:
            speedup_str = f"{best_py / t_qvm:.1f}x"
        else:
            speedup_str = "-"

        print(f"{n:<8} | {dim:<12} | {mem:<10.2f} | {t_qvm_str:>16} | {t_np_str:>12} | {t_qiskit_str:>12} | {speedup_str:>14}")
    print("="*95)

    # Update quantum seal JSON
    if phase1_results:
        existing_seal["record"]["phase1_qft_scaling"] = phase1_results
    if phase2_results:
        # Preserve full structure if needed
        existing_seal["record"]["phase2_hardware_memory_limits"] = phase2_results

    existing_seal["verified_at"] = time.strftime("%Y-%m-%dT%H:%M:%S+07:00")
    s_raw = json.dumps(existing_seal["record"], sort_keys=True, indent=2)
    new_hash = hashlib.sha256(s_raw.encode("utf-8")).hexdigest()
    existing_seal["seal_hash"] = new_hash

    with open(seal_path, "w", encoding="utf-8") as f:
        json.dump(existing_seal, f, indent=2)
    print(f"\n  [SEAL UPDATED] SEAL_BENCHMARK_QUANTUM_LIMIT.json")
    print(f"  SHA-256 Hash Seal: {new_hash}")

    return phase1_results, phase2_results

if __name__ == "__main__":
    run_classical_tersun()
    run_quantum_tersun()
