#!/usr/bin/env python3
# ============================================================================
# Gate 5 Deterministic Benchmark Harness & Cryptographic Milestone Seal
# Evaluates Workloads H1–H8 across N=5 repetitions, verifies semantic invariants,
# and computes SHA-256 Hash Seals for Milestone Checkpoints.
# ============================================================================

import os
import sys
import subprocess
import time
import re
import statistics
import hashlib
import json
import platform

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
ROOT = os.path.dirname(CODE)
SETUNC = os.path.join(CODE, "setunc.exe")
EXHAUSTIVE_VERIFY = os.path.join(HERE, "exhaustive_verify.exe")
WORKLOADS_DIR = os.path.join(HERE, "gate5_workloads")
REGISTRY_DIR = os.path.join(ROOT, "test_registry")
MILESTONES_FILE = os.path.join(REGISTRY_DIR, "gate5_milestones.json")

os.makedirs(REGISTRY_DIR, exist_ok=True)

N_REPS = 5

WORKLOADS = [
    ("H1_sieve", "H1 Prime Sieve (100k)", os.path.join(WORKLOADS_DIR, "H1_sieve.stn"), r"checksum=(\d+)", 9592),
    ("H2_matmul", "H2 Matmul (100x100)", os.path.join(WORKLOADS_DIR, "H2_matmul.stn"), r"checksum=(\d+)", 20250000),
    ("H3_fibonacci", "H3 Fibonacci (N=28)", os.path.join(WORKLOADS_DIR, "H3_fibonacci.stn"), r"checksum=(\d+)", 317811),
    ("H4_mandelbrot", "H4 Mandelbrot (200x200)", os.path.join(WORKLOADS_DIR, "H4_mandelbrot.stn"), r"checksum=(\d+)", 842053),
    ("H5_numeric_loop", "H5 Numeric Loop (5M)", os.path.join(WORKLOADS_DIR, "H5_numeric_loop.stn"), r"checksum=(\d+)", 5000000),
    ("H6_call_heavy", "H6 Call Heavy (750k)", os.path.join(WORKLOADS_DIR, "H6_call_heavy.stn"), r"checksum=(\d+)", 125875000),
    ("H7_alloc_heavy", "H7 Alloc Heavy (10k)", os.path.join(WORKLOADS_DIR, "H7_alloc_heavy.stn"), r"checksum=(\d+)", 5900000),
    ("H8_object_heavy", "H8 Object Heavy (200k)", os.path.join(WORKLOADS_DIR, "H8_object_heavy.stn"), r"checksum=(\d+)", 541096364)
]

def sh(cmd, cwd=CODE, timeout=120):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return r.returncode, r.stdout.strip(), r.stderr.strip()

def run_exhaustive_verification():
    print("\n[VERIFY] Executing 2.13M Semantic Invariant Tests...")
    if not os.path.exists(EXHAUSTIVE_VERIFY):
        print(f"Building exhaustive_verify.exe...")
        rc, o, e = sh(["g++", "-std=c++20", "-O3", "-Iinclude", "bench/exhaustive_verify.cpp", "src/tafpu/trit.cpp", "-o", "bench/exhaustive_verify.exe"])
        if rc != 0:
            raise RuntimeError(f"Failed to build exhaustive_verify: {e}")
    
    rc, out, err = sh([EXHAUSTIVE_VERIFY], cwd=CODE)
    if rc != 0:
        raise RuntimeError(f"Exhaustive verify failed: {err}")
    
    m = re.search(r"Total Mathematical Invariants Verified\s*:\s*(\d+)\s*/\s*(\d+)", out)
    if not m:
        raise RuntimeError("Could not parse exhaustive verification output!")
    
    passed, total = int(m.group(1)), int(m.group(2))
    assert passed == total, f"Invariant verification failure: {passed}/{total}"
    print(f"  -> SUCCESS: {passed:,} / {total:,} Invariants 100.000% Verified.")
    return passed, total

def run_workload(w_id, w_name, w_path, regex, expected_checksum):
    times_ms = []
    observed_checksum = None

    for rep in range(N_REPS):
        rc, out, err = sh([SETUNC, "run", w_path])
        if rc != 0:
            raise RuntimeError(f"Workload {w_id} failed on rep {rep}: {err}")
        
        m_chk = re.search(regex, out)
        if not m_chk:
            raise RuntimeError(f"Workload {w_id} did not produce expected regex {regex}: {out}")
        
        chk = int(m_chk.group(1))
        if observed_checksum is None:
            observed_checksum = chk
            if expected_checksum is not None and chk != expected_checksum:
                raise ValueError(f"Checksum mismatch on {w_id}: got {chk}, expected {expected_checksum}")
        else:
            if chk != observed_checksum:
                raise ValueError(f"Non-deterministic checksum drift on {w_id}: {chk} vs {observed_checksum}")
        
        m_time = re.search(r"time_us=(\d+)", out)
        if m_time:
            t_ms = int(m_time.group(1)) / 1000.0
            times_ms.append(t_ms)
    
    med = statistics.median(times_ms)
    mean = statistics.mean(times_ms)
    stdev = statistics.stdev(times_ms) if len(times_ms) > 1 else 0.0
    
    return {
        "id": w_id,
        "name": w_name,
        "checksum": observed_checksum,
        "expected": expected_checksum,
        "valid": (observed_checksum == expected_checksum) if expected_checksum is not None else True,
        "median_ms": round(med, 2),
        "mean_ms": round(mean, 2),
        "min_ms": round(min(times_ms), 2),
        "max_ms": round(max(times_ms), 2),
        "stddev_ms": round(stdev, 3),
        "reps": N_REPS
    }

def compute_checkpoint_hash(stage_name, invariant_count, workload_results):
    payload = f"STAGE:{stage_name}|INVARIANTS:{invariant_count}|"
    for w in sorted(workload_results, key=lambda x: x["id"]):
        payload += f"{w['id']}:{w['checksum']}|"
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()

def execute_benchmark_suite(stage="CP0_BASELINE"):
    print("================================================================================")
    print(f"  TERSUN GATE 5 DETERMINISTIC BENCHMARK HARNESS (Stage: {stage})")
    print("================================================================================")
    print(f"Host System       : {platform.system()} {platform.release()} ({platform.machine()})")
    print(f"Repetitions (N)   : {N_REPS}")
    print(f"Setunc Executable : {SETUNC}")
    print("--------------------------------------------------------------------------------")

    # Step 1: 2.13M Semantic Invariants
    passed_invariants, total_invariants = run_exhaustive_verification()

    # Step 2: 8 Standard Workloads H1-H8
    print("\n[BENCHMARK] Running 8 Workloads H1–H8 (N = 5 repetitions each)...")
    workload_results = []
    
    for w_id, w_name, w_path, regex, expected in WORKLOADS:
        sys.stdout.write(f"  -> Running {w_name:<30} ... ")
        sys.stdout.flush()
        res = run_workload(w_id, w_name, w_path, regex, expected)
        workload_results.append(res)
        print(f"DONE. Median: {res['median_ms']:>8.2f} ms | Checksum: {res['checksum']}")

    # Step 3: Compute Cryptographic Hash Seal
    seal_hash = compute_checkpoint_hash(stage, passed_invariants, workload_results)
    
    print("\n================================================================================")
    print(f"  MILESTONE HASH SEAL COMPUTATION: {stage}")
    print("================================================================================")
    print(f"  Cryptographic Hash (SHA-256) : {seal_hash}")
    print("--------------------------------------------------------------------------------")
    print(f"  {'Workload':<28} | {'Median (ms)':>12} | {'Min (ms)':>10} | {'Max (ms)':>10} | {'Status':>8}")
    print("  " + "-" * 76)
    for w in workload_results:
        print(f"  {w['name']:<28} | {w['median_ms']:>12.2f} | {w['min_ms']:>10.2f} | {w['max_ms']:>10.2f} | {'PASS':>8}")
    print("================================================================================")

    # Step 4: Record into registry
    milestones = {}
    if os.path.exists(MILESTONES_FILE):
        try:
            with open(MILESTONES_FILE, "r") as f:
                milestones = json.load(f)
        except Exception:
            milestones = {}

    milestones[stage] = {
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
        "stage": stage,
        "hash_seal": seal_hash,
        "system": platform.platform(),
        "invariants_passed": passed_invariants,
        "invariants_total": total_invariants,
        "workloads": workload_results
    }

    with open(MILESTONES_FILE, "w") as f:
        json.dump(milestones, f, indent=2)

    print(f"\n[REGISTRY] Milestone checkpoint '{stage}' saved to:\n  -> {MILESTONES_FILE}\n")
    return seal_hash

if __name__ == "__main__":
    stage = sys.argv[1] if len(sys.argv) > 1 else "CP0_BASELINE"
    execute_benchmark_suite(stage)
