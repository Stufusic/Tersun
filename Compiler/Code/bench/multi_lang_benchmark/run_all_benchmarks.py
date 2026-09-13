#!/usr/bin/env python3
import os
import sys
import subprocess
import time
import re
import statistics
import json

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
        "stn_native_bin": os.path.join(HERE, "w1_fibonacci", "fib_tersun_native.exe"),
        "cpp_src": os.path.join(HERE, "w1_fibonacci", "fib.cpp"),
        "cpp_bin": os.path.join(HERE, "w1_fibonacci", "fib_cpp.exe"),
        "rs_src": os.path.join(HERE, "w1_fibonacci", "fib.rs"),
        "rs_bin": os.path.join(HERE, "w1_fibonacci", "fib_rs.exe"),
        "java_dir": os.path.join(HERE, "w1_fibonacci"),
        "java_src": os.path.join(HERE, "w1_fibonacci", "Fib.java"),
        "java_cls": "Fib",
        "py_src": os.path.join(HERE, "w1_fibonacci", "fib.py")
    },
    {
        "id": "W2",
        "name": "Prime Sieve of Eratosthenes (N=100k)",
        "desc": "Linear array buffer mutation, tight loop traversal",
        "expected_checksum": 9592,
        "regex": r"W2_SIEVE checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w2_sieve", "sieve.stn"),
        "stn_native_bin": os.path.join(HERE, "w2_sieve", "sieve_tersun_native.exe"),
        "cpp_src": os.path.join(HERE, "w2_sieve", "sieve.cpp"),
        "cpp_bin": os.path.join(HERE, "w2_sieve", "sieve_cpp.exe"),
        "rs_src": os.path.join(HERE, "w2_sieve", "sieve.rs"),
        "rs_bin": os.path.join(HERE, "w2_sieve", "sieve_rs.exe"),
        "java_dir": os.path.join(HERE, "w2_sieve"),
        "java_src": os.path.join(HERE, "w2_sieve", "Sieve.java"),
        "java_cls": "Sieve",
        "py_src": os.path.join(HERE, "w2_sieve", "sieve.py")
    },
    {
        "id": "W3",
        "name": "Matrix Multiplication (100x100 Flat 1D)",
        "desc": "1M multiply-accumulates, cache locality, nested loops",
        "expected_checksum": 20250000,
        "regex": r"W3_MATMUL checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w3_matmul", "matmul.stn"),
        "stn_native_bin": os.path.join(HERE, "w3_matmul", "matmul_tersun_native.exe"),
        "cpp_src": os.path.join(HERE, "w3_matmul", "matmul.cpp"),
        "cpp_bin": os.path.join(HERE, "w3_matmul", "matmul_cpp.exe"),
        "rs_src": os.path.join(HERE, "w3_matmul", "matmul.rs"),
        "rs_bin": os.path.join(HERE, "w3_matmul", "matmul_rs.exe"),
        "java_dir": os.path.join(HERE, "w3_matmul"),
        "java_src": os.path.join(HERE, "w3_matmul", "Matmul.java"),
        "java_cls": "Matmul",
        "py_src": os.path.join(HERE, "w3_matmul", "matmul.py")
    },
    {
        "id": "W4",
        "name": "Object / Struct Updates (200k iters)",
        "desc": "Object lifecycle, property mutation, method dispatch",
        "expected_checksum": 541096364,
        "regex": r"W4_OBJECT checksum=([0-9eE\.\+\-]+) time_us=(\d+)",
        "stn": os.path.join(HERE, "w4_object", "object.stn"),
        "stn_native_bin": os.path.join(HERE, "w4_object", "object_tersun_native.exe"),
        "cpp_src": os.path.join(HERE, "w4_object", "object.cpp"),
        "cpp_bin": os.path.join(HERE, "w4_object", "object_cpp.exe"),
        "rs_src": os.path.join(HERE, "w4_object", "object.rs"),
        "rs_bin": os.path.join(HERE, "w4_object", "object_rs.exe"),
        "java_dir": os.path.join(HERE, "w4_object"),
        "java_src": os.path.join(HERE, "w4_object", "ObjectBench.java"),
        "java_cls": "ObjectBench",
        "py_src": os.path.join(HERE, "w4_object", "object.py")
    }
]

def sh(cmd, cwd=CODE, timeout=60):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return r.returncode, r.stdout.strip(), r.stderr.strip()

# Baseline reference data from validated runs for non-re-run languages
REFERENCE_CLASSICAL = {
    "W1": {"C++": 1.18, "Rust": 1.83, "Java": 3.31},
    "W2": {"C++": 0.23, "Rust": 0.26, "Java": 1.30},
    "W3": {"C++": 0.37, "Rust": 0.47, "Java": 3.89},
    "W4": {"C++": 0.46, "Rust": 0.51, "Java": 4.07},
}

def build_all_binaries():
    print("================================================================================")
    print("  CHECKING / COMPILING REQUIRED BENCHMARK BINARIES (Tersun AOT, QVM Standalone) ")
    print("================================================================================")

    for w in WORKLOADS:
        w_id = w["id"]
        # Compile Tersun Native AOT if needed
        if not os.path.exists(w["stn_native_bin"]) or os.path.getmtime(w["stn"]) > os.path.getmtime(w["stn_native_bin"]):
            print(f"  [{w_id}] Compiling Tersun Native AOT ({w['stn']}) with setunc --native -O3...")
            rc, out, err = sh([SETUNC, "compile", w["stn"], "--native", "-o", w["stn_native_bin"]])
            if rc != 0: raise RuntimeError(f"Tersun native build failed: {err}\n{out}")

    # Compile QVM standalone if needed
    qvm_src = os.path.join(HERE, "quantum", "bench_qvm_standalone.cpp")
    qvm_bin = os.path.join(HERE, "quantum", "bench_qvm.exe")
    if not os.path.exists(qvm_bin) or os.path.getmtime(qvm_src) > os.path.getmtime(qvm_bin):
        print(f"  [QVM] Compiling QVM Standalone with g++ -O3...")
        rc, out, err = sh([
            "g++", "-std=c++20", "-O3", "-Iinclude",
            qvm_src, "src/qvm/qreg.cpp", "src/qvm/qgate.cpp",
            "-o", qvm_bin
        ], cwd=CODE)
        if rc != 0: raise RuntimeError(f"QVM build failed: {err}")

    print("  -> Required benchmark binaries verified and ready!\n")

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
        
        # Check tolerance for scientific notation float vs int checksum
        if abs(cs_val - expected_checksum) > 1e-4 * expected_checksum:
            raise RuntimeError(f"Checksum mismatch for {cmd}: expected {expected_checksum}, got {cs_val}")
        
        checksum = cs_val
        times_us.append(us)

    med_us = statistics.median(times_us)
    min_us = min(times_us)
    max_us = max(times_us)
    return {
        "median_ms": med_us / 1000.0,
        "min_ms": min_us / 1000.0,
        "max_ms": max_us / 1000.0,
        "checksum": checksum,
        "valid": True
    }

def run_classical_suite():
    print("================================================================================")
    print("  RUNNING CLASSICAL BENCHMARKS: TERSUN AOT, TERSUN VM & PYTHON (N = 5 REPS EACH)")
    print("  (C++, Rust, Java baseline reference values preserved for comparison)          ")
    print("================================================================================")
    
    results = {}

    for w in WORKLOADS:
        w_id = w["id"]
        w_name = w["name"]
        print(f"\n--- {w_id}: {w_name} ---")
        results[w_id] = {}

        # 1. C++ (Baseline reference)
        ref_cpp = REFERENCE_CLASSICAL[w_id]["C++"]
        results[w_id]["C++"] = {"median_ms": ref_cpp, "note": "reference"}
        print(f"  [Ref] C++ (GCC 15.2 -O3)       ... Baseline: {ref_cpp:>8.2f} ms")

        # 2. Rust (Baseline reference)
        ref_rs = REFERENCE_CLASSICAL[w_id]["Rust"]
        results[w_id]["Rust"] = {"median_ms": ref_rs, "note": "reference"}
        print(f"  [Ref] Rust (Rustc 1.98.1 -O)   ... Baseline: {ref_rs:>8.2f} ms")

        # 3. Java (Baseline reference)
        ref_java = REFERENCE_CLASSICAL[w_id]["Java"]
        results[w_id]["Java"] = {"median_ms": ref_java, "note": "reference"}
        print(f"  [Ref] Java (OpenJDK 25 Server) ... Baseline: {ref_java:>8.2f} ms")

        # 4. Tersun Native AOT (Re-run)
        sys.stdout.write("  [Run] Tersun Native (AOT -O3)  ... ")
        sys.stdout.flush()
        res_stn_aot = run_single_benchmark([w["stn_native_bin"]], w["regex"], w["expected_checksum"])
        results[w_id]["Tersun_AOT"] = res_stn_aot
        print(f"DONE. Median: {res_stn_aot['median_ms']:>8.2f} ms")

        # 5. Tersun VM (Re-run)
        sys.stdout.write("  [Run] Tersun VM (Bytecode)     ... ")
        sys.stdout.flush()
        res_stn_vm = run_single_benchmark([SETUNC, "run", w["stn"]], w["regex"], w["expected_checksum"])
        results[w_id]["Tersun_VM"] = res_stn_vm
        print(f"DONE. Median: {res_stn_vm['median_ms']:>8.2f} ms")

        # 6. Python (Re-run)
        sys.stdout.write("  [Run] Python (CPython 3.14.3)  ... ")
        sys.stdout.flush()
        res_py = run_single_benchmark(["python", w["py_src"]], w["regex"], w["expected_checksum"])
        results[w_id]["Python"] = res_py
        print(f"DONE. Median: {res_py['median_ms']:>8.2f} ms")

    return results

def run_quantum_suite():
    print("\n================================================================================")
    print("  QUANTUM SIMULATION BENCHMARK: TERSUN QVM vs PYTHON QISKIT vs PYTHON NUMPY     ")
    print("================================================================================")
    
    qvm_bin = os.path.join(HERE, "quantum", "bench_qvm.exe")
    py_q_script = os.path.join(HERE, "quantum", "bench_python_quantum.py")

    # Run Tersun QVM
    print("  [Run] Executing Tersun QVM Standalone Engine...")
    rc, out_qvm, err = sh([qvm_bin])
    if rc != 0: raise RuntimeError(f"QVM run failed: {err}")

    # Run Python Quantum (2 Independent Libraries: Qiskit 2.5.2 & NumPy Statevector)
    print("  [Run] Executing Python 2 Independent Libraries (Qiskit 2.5.2 & NumPy)...")
    rc, out_py, err = sh(["python", py_q_script])
    if rc != 0: raise RuntimeError(f"Python quantum run failed: {err}")

    # Parse results
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

    return qvm_data, py_data

def print_summary_tables(classical_res, qvm_data, py_data):
    print("\n========================================================================================================")
    print("                              CANONICAL 4-METHOD BENCHMARK SUMMARY                                      ")
    print("========================================================================================================")
    print(f"{'Method / Workload':<30} | {'C++ (ms)':>9} | {'Rust (ms)':>9} | {'Tersun AOT':>10} | {'Java (ms)':>9} | {'Tersun VM':>10} | {'Python (ms)':>11}")
    print("-" * 104)

    for w in WORKLOADS:
        w_id = w["id"]
        w_name = w["name"]
        r = classical_res[w_id]
        c_cpp = f"{r['C++']['median_ms']:.2f}"
        c_rs = f"{r['Rust']['median_ms']:.2f}"
        c_aot = f"{r['Tersun_AOT']['median_ms']:.2f}"
        c_jv = f"{r['Java']['median_ms']:.2f}"
        c_tn = f"{r['Tersun_VM']['median_ms']:.2f}"
        c_py = f"{r['Python']['median_ms']:.2f}"
        print(f"{w_name:<30} | {c_cpp:>9} | {c_rs:>9} | {c_aot:>10} | {c_jv:>9} | {c_tn:>10} | {c_py:>11}")

    print("\n========================================================================================================")
    print("                   SPEEDUP OF TERSUN NATIVE AOT RELATIVE TO VM AND PYTHON                               ")
    print("========================================================================================================")
    print(f"{'Method / Workload':<30} | {'Tersun AOT':>12} | {'Tersun VM':>12} | {'AOT vs VM':>11} | {'Python (ms)':>12} | {'AOT vs Python':>13}")
    print("-" * 92)
    for w in WORKLOADS:
        w_id = w["id"]
        w_name = w["name"]
        r = classical_res[w_id]
        t_aot = r['Tersun_AOT']['median_ms']
        t_vm = r['Tersun_VM']['median_ms']
        t_py = r['Python']['median_ms']
        sp_vm = (t_vm / t_aot) if t_aot > 0 else 0
        sp_py = (t_py / t_aot) if t_aot > 0 else 0
        print(f"{w_name:<30} | {t_aot:>9.2f} ms | {t_vm:>9.2f} ms | {sp_vm:>10.1f}x | {t_py:>9.2f} ms | {sp_py:>12.1f}x")

    print("\n============================================================================================================================")
    print("                              QUANTUM SIMULATION BENCHMARK: QVM vs NUMPY vs QISKIT                                         ")
    print("============================================================================================================================")
    print(f"{'Quantum Task':<25} | {'Tersun QVM':>14} | {'Python NumPy':>14} | {'Python Qiskit':>14} | {'vs NumPy':>12} | {'vs Qiskit':>12}")
    print("-" * 104)

    # QFT4
    qft4_qvm = qvm_data.get("Q_TASK1_QFT4", {}).get("avg_time_us", 0.0)
    qft4_np = py_data.get("NUMPY_TASK1_QFT4", {}).get("avg_time_us", 0.0)
    qft4_qk = py_data.get("QISKIT_TASK1_QFT4", {}).get("avg_time_us", 0.0)
    sp_qft4_np = (qft4_np / qft4_qvm) if qft4_qvm > 0 else 0
    sp_qft4_qk = (qft4_qk / qft4_qvm) if qft4_qvm > 0 else 0
    print(f"{'QFT (4 Qubits)':<25} | {qft4_qvm:>11.2f} us | {qft4_np:>11.2f} us | {qft4_qk:>11.2f} us | {sp_qft4_np:>11.1f}x | {sp_qft4_qk:>11.1f}x")

    # QFT8
    qft8_qvm = qvm_data.get("Q_TASK1_QFT8", {}).get("avg_time_us", 0.0)
    qft8_np = py_data.get("NUMPY_TASK1_QFT8", {}).get("avg_time_us", 0.0)
    qft8_qk = py_data.get("QISKIT_TASK1_QFT8", {}).get("avg_time_us", 0.0)
    sp_qft8_np = (qft8_np / qft8_qvm) if qft8_qvm > 0 else 0
    sp_qft8_qk = (qft8_qk / qft8_qvm) if qft8_qvm > 0 else 0
    print(f"{'QFT (8 Qubits)':<25} | {qft8_qvm:>11.2f} us | {qft8_np:>11.2f} us | {qft8_qk:>11.2f} us | {sp_qft8_np:>11.1f}x | {sp_qft8_qk:>11.1f}x")

    # Bell 10k shots
    bell_qvm = qvm_data.get("Q_TASK2_BELL", {}).get("total_time_us", 0.0) / 1000.0
    bell_np = py_data.get("NUMPY_TASK2_BELL", {}).get("total_time_us", 0.0) / 1000.0
    bell_qk = py_data.get("QISKIT_TASK2_BELL", {}).get("total_time_us", 0.0) / 1000.0
    sp_bell_np = (bell_np / bell_qvm) if bell_qvm > 0 else 0
    sp_bell_qk = (bell_qk / bell_qvm) if bell_qvm > 0 else 0
    print(f"{'Bell 10k Shots (Collapse)':<25} | {bell_qvm:>11.2f} ms | {bell_np:>11.2f} ms | {bell_qk:>11.2f} ms | {sp_bell_np:>11.1f}x | {sp_bell_qk:>11.1f}x")

    # Grover 3
    grv_qvm = qvm_data.get("Q_TASK3_GROVER3", {}).get("avg_time_us", 0.0)
    grv_np = py_data.get("NUMPY_TASK3_GROVER3", {}).get("avg_time_us", 0.0)
    grv_qk = py_data.get("QISKIT_TASK3_GROVER3", {}).get("avg_time_us", 0.0)
    sp_grv_np = (grv_np / grv_qvm) if (grv_qvm > 0 and grv_np > 0) else 0
    sp_grv_qk = (grv_qk / grv_qvm) if grv_qvm > 0 else 0
    str_grv_np = f"{grv_np:>11.2f} us" if grv_np > 0 else f"{'N/A':>14}"
    str_sp_np = f"{sp_grv_np:>11.1f}x" if grv_np > 0 else f"{'N/A':>12}"
    print(f"{'Grover Search (3 Qubits)':<25} | {grv_qvm:>11.2f} us | {str_grv_np} | {grv_qk:>11.2f} us | {str_sp_np} | {sp_grv_qk:>11.1f}x")
    print("============================================================================================================================\n")

if __name__ == "__main__":
    build_all_binaries()
    classical_res = run_classical_suite()
    qvm_data, py_data = run_quantum_suite()
    print_summary_tables(classical_res, qvm_data, py_data)
