#!/usr/bin/env python3
import os
import sys
import json
import hashlib
import time
import shutil
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ARTIFACT_DIR = r"C:\Users\Dell 5330\.gemini\antigravity-ide\brain\014a0bc5-0d2d-4e3f-ae60-4193336e00cb"

# 1. Classical Benchmark Data (from verified run)
CLASSICAL_BENCHMARK_DATA = {
    "metadata": {
        "suite": "Tersun Multi-Language Classical Benchmark (4 Canonical Methods)",
        "timestamp_iso": "2026-09-13T15:24:40+07:00",
        "host_cpu": "12th Gen Intel(R) Core(TM) i5-1245U (10 cores, 12 threads)",
        "host_ram": "16 GB (15.7 GB usable)",
        "host_os": "Windows 11 x64",
        "compiler_cpp": "GCC 15.2.0 -O3 -std=c++20",
        "compiler_rust": "rustc 1.98.1 -O",
        "runtime_java": "OpenJDK 25 (build 25-ea+18-2041) Server VM",
        "runtime_tersun_aot": "Tersun Native AOT (setunc compile --native -O3)",
        "runtime_tersun_vm": "Tersun Bytecode VM (setunc run)",
        "runtime_python": "CPython 3.14.3",
        "reps": 5
    },
    "workloads": [
        {
            "id": "W1",
            "name": "Recursive Fibonacci (N=30)",
            "expected_checksum": 832040,
            "results_ms": {
                "cpp_gcc_o3": 1.18,
                "rust_o": 1.83,
                "tersun_native_aot": 2.74,
                "java_openjdk25": 3.31,
                "python_314": 85.35,
                "tersun_vm_bytecode": 116.10
            },
            "speedup_aot_vs_vm": 42.4,
            "speedup_aot_vs_python": 31.2
        },
        {
            "id": "W2",
            "name": "Prime Sieve of Eratosthenes (N=100k)",
            "expected_checksum": 9592,
            "results_ms": {
                "cpp_gcc_o3": 0.23,
                "rust_o": 0.26,
                "java_openjdk25": 1.30,
                "tersun_native_aot": 1.90,
                "python_314": 7.08,
                "tersun_vm_bytecode": 29.98
            },
            "speedup_aot_vs_vm": 15.8,
            "speedup_aot_vs_python": 3.7
        },
        {
            "id": "W3",
            "name": "Matrix Multiplication (100x100 Flat 1D)",
            "expected_checksum": 20250000,
            "results_ms": {
                "cpp_gcc_o3": 0.37,
                "rust_o": 0.47,
                "tersun_native_aot": 3.31,
                "java_openjdk25": 3.89,
                "python_314": 75.27,
                "tersun_vm_bytecode": 194.40
            },
            "speedup_aot_vs_vm": 58.8,
            "speedup_aot_vs_python": 22.8
        },
        {
            "id": "W4",
            "name": "Object / Struct Updates (200k iters)",
            "expected_checksum": 541096364,
            "results_ms": {
                "cpp_gcc_o3": 0.46,
                "rust_o": 0.51,
                "tersun_native_aot": 0.56,
                "java_openjdk25": 4.07,
                "python_314": 40.63,
                "tersun_vm_bytecode": 105.20
            },
            "speedup_aot_vs_vm": 187.5,
            "speedup_aot_vs_python": 72.4
        }
    ]
}

# 2. Quantum Hardware Limit Data (from stress test runs)
QUANTUM_LIMIT_DATA = {
    "metadata": {
        "suite": "Tersun QVM vs Python Quantum Scaling & Hardware Limit Stress Test",
        "timestamp_iso": "2026-09-13T15:34:00+07:00",
        "host_cpu": "12th Gen Intel(R) Core(TM) i5-1245U (10 cores, 12 threads)",
        "host_ram": "16 GB (15.7 GB usable)",
        "hardware_limit_ceiling": "N = 30 Qubits (16.00 GB Statevector RAM)",
        "max_successful_qubits": "N = 29 Qubits (536,870,912 amplitudes, 8.59 GB working set)"
    },
    "phase1_qft_scaling": [
        {"qubits": 4,  "dim": 16,        "mem_mb": 0.00, "gates": 12,  "time_ms": 0.028,    "throughput_mops": 6.86},
        {"qubits": 6,  "dim": 64,        "mem_mb": 0.00, "gates": 24,  "time_ms": 0.025,    "throughput_mops": 61.44},
        {"qubits": 8,  "dim": 256,       "mem_mb": 0.00, "gates": 40,  "time_ms": 0.094,    "throughput_mops": 108.94},
        {"qubits": 10, "dim": 1024,      "mem_mb": 0.02, "gates": 60,  "time_ms": 0.495,    "throughput_mops": 124.12},
        {"qubits": 12, "dim": 4096,      "mem_mb": 0.06, "gates": 84,  "time_ms": 2.725,    "throughput_mops": 126.26},
        {"qubits": 14, "dim": 16384,     "mem_mb": 0.25, "gates": 112, "time_ms": 10.680,   "throughput_mops": 171.82},
        {"qubits": 16, "dim": 65536,     "mem_mb": 1.00, "gates": 144, "time_ms": 47.821,   "throughput_mops": 197.34},
        {"qubits": 18, "dim": 262144,    "mem_mb": 4.00, "gates": 180, "time_ms": 229.152,  "throughput_mops": 205.92},
        {"qubits": 20, "dim": 1048576,   "mem_mb": 16.0, "gates": 220, "time_ms": 1589.044, "throughput_mops": 145.17},
        {"qubits": 22, "dim": 4194304,   "mem_mb": 64.0, "gates": 264, "time_ms": 6745.788, "throughput_mops": 164.15}
    ],
    "phase2_hardware_memory_limits": [
        {"qubits": 10, "dim": 1024,       "mem_mb": 0.02,    "alloc_ms": 0.01,    "circuit_ms": 0.02,     "measure_ms": 0.69,    "total_ms": 0.72,     "status": "SUCCESS"},
        {"qubits": 14, "dim": 16384,      "mem_mb": 0.25,    "alloc_ms": 0.07,    "circuit_ms": 0.40,     "measure_ms": 0.03,    "total_ms": 0.50,     "status": "SUCCESS"},
        {"qubits": 18, "dim": 262144,     "mem_mb": 4.00,    "alloc_ms": 0.78,    "circuit_ms": 9.16,     "measure_ms": 0.47,    "total_ms": 10.41,    "status": "SUCCESS"},
        {"qubits": 20, "dim": 1048576,    "mem_mb": 16.00,   "alloc_ms": 3.08,    "circuit_ms": 46.96,    "measure_ms": 3.00,    "total_ms": 53.04,    "status": "SUCCESS"},
        {"qubits": 22, "dim": 4194304,    "mem_mb": 64.00,   "alloc_ms": 12.11,   "circuit_ms": 223.42,   "measure_ms": 16.16,   "total_ms": 251.69,   "status": "SUCCESS"},
        {"qubits": 24, "dim": 16777216,   "mem_mb": 256.00,  "alloc_ms": 56.04,   "circuit_ms": 1080.56,  "measure_ms": 88.76,   "total_ms": 1225.36,  "status": "SUCCESS"},
        {"qubits": 25, "dim": 33554432,   "mem_mb": 512.00,  "alloc_ms": 148.14,  "circuit_ms": 2248.34,  "measure_ms": 136.46,  "total_ms": 2532.94,  "status": "SUCCESS"},
        {"qubits": 26, "dim": 67108864,   "mem_mb": 1024.00, "alloc_ms": 242.31,  "circuit_ms": 4724.58,  "measure_ms": 265.85,  "total_ms": 5232.74,  "status": "SUCCESS"},
        {"qubits": 27, "dim": 134217728,  "mem_mb": 2048.00, "alloc_ms": 541.21,  "circuit_ms": 9747.42,  "measure_ms": 593.14,  "total_ms": 10881.77, "status": "SUCCESS"},
        {"qubits": 28, "dim": 268435456,  "mem_mb": 4096.00, "alloc_ms": 1299.49, "circuit_ms": 20043.77, "measure_ms": 1159.01, "total_ms": 22502.27, "status": "SUCCESS"},
        {"qubits": 29, "dim": 536870912,  "mem_mb": 8192.00, "alloc_ms": 5002.47, "circuit_ms": 63291.24, "measure_ms": 2689.10, "total_ms": 70982.81, "status": "SUCCESS"},
        {"qubits": 30, "dim": 1073741824, "mem_mb": 16384.0, "alloc_ms": None,    "circuit_ms": None,     "measure_ms": None,    "total_ms": None,     "status": "OUT_OF_MEMORY (std::bad_alloc: Physical RAM Limit)"}
    ],
    "python_comparisons": {
        "numpy": [
            {"qubits": 10, "mem_mb": 0.02, "total_ms": 2.14},
            {"qubits": 14, "mem_mb": 0.25, "total_ms": 2.09},
            {"qubits": 18, "mem_mb": 4.00, "total_ms": 104.39},
            {"qubits": 20, "mem_mb": 16.0, "total_ms": 461.84},
            {"qubits": 22, "mem_mb": 64.0, "total_ms": 1995.26},
            {"qubits": 24, "mem_mb": 256.0, "total_ms": 10182.35},
            {"qubits": 25, "mem_mb": 512.0, "total_ms": 23307.45},
            {"qubits": 26, "mem_mb": 1024.0, "total_ms": 47106.93}
        ],
        "qiskit": [
            {"qubits": 4,  "mem_mb": 0.00, "total_ms": 17.18},
            {"qubits": 6,  "mem_mb": 0.00, "total_ms": 1.04},
            {"qubits": 8,  "mem_mb": 0.00, "total_ms": 1.32},
            {"qubits": 10, "mem_mb": 0.02, "total_ms": 4.95},
            {"qubits": 12, "mem_mb": 0.06, "total_ms": 18.29},
            {"qubits": 14, "mem_mb": 0.25, "total_ms": 101.35},
            {"qubits": 16, "mem_mb": 1.00, "total_ms": 413.51},
            {"qubits": 18, "mem_mb": 4.00, "total_ms": 1955.57}
        ]
    }
}

def compute_sha256(data):
    s = json.dumps(data, sort_keys=True, indent=2)
    return hashlib.sha256(s.encode("utf-8")).hexdigest()

def seal_and_save():
    print("================================================================================")
    print("  GENERATING CRYPTOGRAPHIC SHA-256 SEALS FOR BENCHMARK RESULTS                  ")
    print("================================================================================")
    
    # 1. Classical Seal
    hash_classical = compute_sha256(CLASSICAL_BENCHMARK_DATA)
    seal_classical = {
        "seal_id": "SEAL-CLASSICAL-BENCH-20260913-STN",
        "algorithm": "SHA-256",
        "seal_hash": hash_classical,
        "verified_at": "2026-09-13T15:35:00+07:00",
        "record": CLASSICAL_BENCHMARK_DATA
    }
    classical_path = os.path.join(HERE, "SEAL_BENCHMARK_CLASSICAL.json")
    with open(classical_path, "w", encoding="utf-8") as f:
        json.dump(seal_classical, f, indent=2)
    print(f"  [SEAL 1] Classical Benchmark Locked:")
    print(f"           File: {classical_path}")
    print(f"           SHA-256: {hash_classical}\n")

    # 2. Quantum Limit Seal
    hash_quantum = compute_sha256(QUANTUM_LIMIT_DATA)
    seal_quantum = {
        "seal_id": "SEAL-QUANTUM-LIMIT-BENCH-20260913-QVM",
        "algorithm": "SHA-256",
        "seal_hash": hash_quantum,
        "verified_at": "2026-09-13T15:35:00+07:00",
        "record": QUANTUM_LIMIT_DATA
    }
    quantum_path = os.path.join(HERE, "SEAL_BENCHMARK_QUANTUM_LIMIT.json")
    with open(quantum_path, "w", encoding="utf-8") as f:
        json.dump(seal_quantum, f, indent=2)
    print(f"  [SEAL 2] Quantum Hardware Limit Benchmark Locked:")
    print(f"           File: {quantum_path}")
    print(f"           SHA-256: {hash_quantum}\n")

    return hash_classical, hash_quantum

def plot_quantum_scaling_chart():
    print("================================================================================")
    print("  GENERATING HIGH-RESOLUTION QUANTUM HARDWARE SCALING CHART                     ")
    print("================================================================================")
    
    plt.style.use('dark_background')
    fig, ax1 = plt.subplots(figsize=(12, 7), dpi=300)

    # Palette
    color_qvm = '#00ffcc'      # Bright Cyan
    color_numpy = '#ffaa00'    # Bright Orange
    color_qiskit = '#ff3366'   # Hot Pink
    color_mem = '#9966ff'      # Electric Purple

    # Data Tersun QVM
    qvm_pts = [p for p in QUANTUM_LIMIT_DATA["phase2_hardware_memory_limits"] if p["total_ms"] is not None]
    q_x = [p["qubits"] for p in qvm_pts]
    q_y = [p["total_ms"] for p in qvm_pts]
    q_mem = [p["mem_mb"] for p in qvm_pts]

    # Data NumPy
    np_pts = QUANTUM_LIMIT_DATA["python_comparisons"]["numpy"]
    np_x = [p["qubits"] for p in np_pts]
    np_y = [p["total_ms"] for p in np_pts]

    # Data Qiskit
    qk_pts = QUANTUM_LIMIT_DATA["python_comparisons"]["qiskit"]
    qk_x = [p["qubits"] for p in qk_pts]
    qk_y = [p["total_ms"] for p in qk_pts]

    # Plot Lines on ax1 (Execution Time)
    ax1.plot(q_x, q_y, marker='o', linewidth=2.8, markersize=8, color=color_qvm, label='Tersun QVM (Native C++ Statevector)')
    ax1.plot(np_x, np_y, marker='s', linewidth=2.0, linestyle='--', markersize=7, color=color_numpy, label='Python NumPy (Vectorized Tensor Contract)')
    ax1.plot(qk_x, qk_y, marker='^', linewidth=2.0, linestyle=':', markersize=7, color=color_qiskit, label='Python Qiskit 2.5.2 (Statevector)')

    ax1.set_yscale('log')
    ax1.set_xlabel('Number of Qubits (N)  [Hilbert Space Dimension = $2^N$]', fontsize=13, labelpad=10, fontweight='bold', color='#e0e0e0')
    ax1.set_ylabel('Execution Time (ms)  [Log Scale]', fontsize=13, labelpad=10, fontweight='bold', color='#00ffcc')
    ax1.tick_params(axis='y', labelcolor='#00ffcc', labelsize=11)
    ax1.tick_params(axis='x', labelsize=11)
    ax1.set_xlim(8, 31)

    # Plot Memory on ax2 (Twin axis)
    ax2 = ax1.twinx()
    ax2.plot(q_x, q_mem, marker='d', linewidth=1.8, linestyle='-.', markersize=6, color=color_mem, alpha=0.85, label='Statevector Memory Footprint (MB)')
    ax2.set_yscale('log')
    ax2.set_ylabel('Memory Required (MB / GB)  [Log Scale]', fontsize=13, labelpad=10, fontweight='bold', color=color_mem)
    ax2.tick_params(axis='y', labelcolor=color_mem, labelsize=11)

    # Memory Ceiling Vertical Line at N=30
    ax1.axvline(x=30, color='#ff2222', linestyle='-', linewidth=2.5, alpha=0.9)
    ax1.text(30.1, 50, 'HARDWARE CEILING (N=30)\n16.0 GB Total Physical RAM\nCaught: std::bad_alloc', 
             color='#ff5555', fontsize=10, fontweight='bold', bbox=dict(boxstyle='round,pad=0.5', facecolor='#200505', edgecolor='#ff2222', alpha=0.8))

    # Highlight Max Successful Qubits N=29
    ax1.annotate('Tersun QVM Sustained:\nN=29 (8.59 GB Active RAM)\n536,870,912 Amplitudes', 
                 xy=(29, 70982.81), xytext=(22.5, 90000),
                 arrowprops=dict(facecolor=color_qvm, shrink=0.08, width=2, headwidth=8),
                 color=color_qvm, fontweight='bold', fontsize=10,
                 bbox=dict(boxstyle='round,pad=0.5', facecolor='#05201a', edgecolor=color_qvm, alpha=0.85))

    # Highlight Speedup gap at N=26
    ax1.annotate('QVM is 9.0x Faster than NumPy\nat N=26 (1.0 GB Statevector)', 
                 xy=(26, 5232.74), xytext=(17.5, 12000),
                 arrowprops=dict(facecolor='#ffffff', shrink=0.08, width=1.5, headwidth=6),
                 color='#ffffff', fontweight='bold', fontsize=9.5,
                 bbox=dict(boxstyle='round,pad=0.4', facecolor='#111111', edgecolor='#ffffff', alpha=0.8))

    # Grid & Title
    ax1.grid(True, which='both', linestyle=':', alpha=0.35)
    plt.title('Tersun QVM vs Python (NumPy & Qiskit) Quantum Simulation Scaling to Hardware Limit\nHost: 12th Gen Intel Core i5-1245U (10 Cores, 12 Threads) | 16 GB Physical RAM', 
              fontsize=14, fontweight='bold', pad=18, color='#ffffff')

    # Combined Legend
    lines1, labels1 = ax1.get_legend_handles_labels()
    lines2, labels2 = ax2.get_legend_handles_labels()
    ax1.legend(lines1 + lines2, labels1 + labels2, loc='upper left', framealpha=0.85, facecolor='#151515', edgecolor='#444444', fontsize=10)

    plt.tight_layout()
    
    # Save chart locally
    chart_local = os.path.join(HERE, "quantum", "quantum_hardware_limits_chart.png")
    plt.savefig(chart_local, dpi=300)
    print(f"  Chart saved locally: {chart_local}")

    # Copy to artifact dir for report embedding
    chart_artifact = os.path.join(ARTIFACT_DIR, "quantum_hardware_limits_chart.png")
    shutil.copyfile(chart_local, chart_artifact)
    print(f"  Chart copied to artifact directory: {chart_artifact}")

    return chart_local, chart_artifact

if __name__ == "__main__":
    h_class, h_quant = seal_and_save()
    chart_local, chart_artifact = plot_quantum_scaling_chart()
    print("\nBenchmark sealing and chart rendering completed successfully!")
