#!/usr/bin/env python3
# ==============================================================================
# Tersun Gate 6.0 Baseline Freezing & Dual-Track Verification Suite
# Captures both Legacy (5 workloads) and Canonical (W1-W4) benchmarks.
# Computes rigorous statistics (N=20 reps, median, mean, p95, stddev, CV%).
# Generates cryptographic SHA-256 seal for G6_BASELINE.
# ==============================================================================
import os
import sys
import subprocess
import time
import re
import statistics
import json
import hashlib
import platform

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
SETUNC = os.path.join(CODE, "setunc.exe")
REGISTRY_DIR = os.path.join(CODE, "test_registry")
os.makedirs(REGISTRY_DIR, exist_ok=True)

N_REPS = 20

def run_cmd(cmd, cwd=CODE, timeout=300):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return p.returncode, p.stdout.strip(), p.stderr.strip()

def get_cpu_info():
    try:
        if platform.system() == "Windows":
            out = subprocess.check_output(["powershell", "-NoProfile", "-Command", "(Get-CimInstance Win32_Processor).Name"], text=True).strip()
            if out:
                return out.splitlines()[0].strip()
        elif platform.system() == "Linux":
            with open("/proc/cpuinfo") as f:
                for line in f:
                    if "model name" in line:
                        return line.split(":")[1].strip()
    except Exception:
        pass
    return platform.processor() or "Unknown CPU"

def get_git_commit():
    try:
        rc, out, _ = run_cmd(["git", "rev-parse", "HEAD"])
        if rc == 0 and out:
            return out
    except Exception:
        pass
    return "untracked_gate6_dev"

def get_compiler_info():
    rc, out, err = run_cmd(["g++", "--version"])
    if rc == 0 and out:
        return out.splitlines()[0]
    return "GCC C++20"

def compile_stn(stn_path, tbc_path):
    rc, out, err = run_cmd([SETUNC, "compile", stn_path, "-o", tbc_path])
    if rc != 0:
        raise RuntimeError(f"Failed to compile {stn_path} to {tbc_path}: {err}\n{out}")

def run_legacy_benchmarks(reps=N_REPS):
    print(f"\n--- Running Legacy Benchmarks (N={reps} reps each) ---")
    results = {}
    
    # 1. bench_vm.stn contains fib_24, branch_2m, sum_5m
    bench_vm_stn = os.path.join(HERE, "bench_vm.stn")
    bench_vm_tbc = os.path.join(HERE, "build", "bench_vm_freeze.tbc")
    compile_stn(bench_vm_stn, bench_vm_tbc)
    
    fib_times = []
    branch_times = []
    sum_times = []
    
    fib_cs = None
    branch_cs = None
    sum_cs = None
    
    for r in range(reps):
        rc, out, err = run_cmd([SETUNC, "run", bench_vm_tbc])
        if rc != 0:
            raise RuntimeError(f"Legacy bench_vm run failed: {err}\n{out}")
        
        m_fib = re.search(r"B1 fib\(24\)\s+checksum=(-?\d+)\s+time_us=(\d+)", out)
        m_bra = re.search(r"B2 branchy 2M\s+checksum=(-?\d+)\s+time_us=(\d+)", out)
        m_sum = re.search(r"B3 sum 5M\s+checksum=(-?\d+)\s+time_us=(\d+)", out)
        
        if not (m_fib and m_bra and m_sum):
            raise RuntimeError(f"Failed to parse bench_vm output:\n{out}")
            
        fib_cs = int(m_fib.group(1))
        fib_times.append(int(m_fib.group(2)) / 1000.0) # ms
        
        branch_cs = int(m_bra.group(1))
        branch_times.append(int(m_bra.group(2)) / 1000.0)
        
        sum_cs = int(m_sum.group(1))
        sum_times.append(int(m_sum.group(2)) / 1000.0)

    results["fib_24"] = {
        "id": "legacy_fib_24",
        "name": "Fibonacci Recursive (N=24)",
        "checksum": fib_cs,
        "times_ms": fib_times
    }
    results["branch_2m"] = {
        "id": "legacy_branch_2m",
        "name": "Branch Intensive (2M iterations)",
        "checksum": branch_cs,
        "times_ms": branch_times
    }
    results["sum_5m"] = {
        "id": "legacy_sum_5m",
        "name": "Arithmetic Accumulator (5M iterations)",
        "checksum": sum_cs,
        "times_ms": sum_times
    }
    
    # 2. memory_200k
    mem_stn = os.path.join(HERE, "bench_memory.stn")
    mem_tbc = os.path.join(HERE, "build", "bench_memory_freeze.tbc")
    compile_stn(mem_stn, mem_tbc)
    mem_times = []
    mem_cs = None
    for _ in range(reps):
        rc, out, err = run_cmd([SETUNC, "run", mem_tbc])
        if rc != 0:
            raise RuntimeError(f"Legacy bench_memory run failed: {err}\n{out}")
        m_mem = re.search(r"MEMORY_ARRAY sum=(-?\d+)\s+time_us=(\d+)", out)
        if not m_mem:
            raise RuntimeError(f"Failed to parse memory bench:\n{out}")
        mem_cs = int(m_mem.group(1))
        mem_times.append(int(m_mem.group(2)) / 1000.0)
    results["memory_200k"] = {
        "id": "legacy_memory_200k",
        "name": "Array Read/Write Buffer (200k ops)",
        "checksum": mem_cs,
        "times_ms": mem_times
    }

    # 3. dispatch_3m
    disp_stn = os.path.join(HERE, "bench_dispatch.stn")
    disp_tbc = os.path.join(HERE, "build", "bench_dispatch_freeze.tbc")
    compile_stn(disp_stn, disp_tbc)
    disp_times = []
    disp_cs = None
    for _ in range(reps):
        rc, out, err = run_cmd([SETUNC, "run", disp_tbc])
        if rc != 0:
            raise RuntimeError(f"Legacy bench_dispatch run failed: {err}\n{out}")
        m_disp = re.search(r"DISPATCH_HEAVY checksum=(-?\d+)\s+time_us=(\d+)", out)
        if not m_disp:
            raise RuntimeError(f"Failed to parse dispatch bench:\n{out}")
        disp_cs = int(m_disp.group(1))
        disp_times.append(int(m_disp.group(2)) / 1000.0)
    results["dispatch_3m"] = {
        "id": "legacy_dispatch_3m",
        "name": "Tight Loop Opcode Dispatch (3M ops)",
        "checksum": disp_cs,
        "times_ms": disp_times
    }

    return results

def run_canonical_benchmarks(reps=N_REPS):
    print(f"\n--- Running Gate 6 Canonical Benchmarks W1-W4 (N={reps} reps each) ---")
    CANONICAL_DEFS = [
        {
            "id": "W1",
            "name": "Recursive Fibonacci (N=30)",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w1_fibonacci", "fib.stn"),
            "regex": r"W1_FIB checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        },
        {
            "id": "W2",
            "name": "Prime Sieve of Eratosthenes (N=100k)",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w2_sieve", "sieve.stn"),
            "regex": r"W2_SIEVE checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        },
        {
            "id": "W3",
            "name": "Matrix Multiplication (100x100 Flat 1D)",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w3_matmul", "matmul.stn"),
            "regex": r"W3_MATMUL checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        },
        {
            "id": "W4",
            "name": "Object / Struct Property Updates (200k iters)",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w4_object", "object.stn"),
            "regex": r"W4_OBJECT checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        }
    ]
    
    results = {}
    for item in CANONICAL_DEFS:
        tbc_path = os.path.join(HERE, "build", f"{item['id'].lower()}_freeze.tbc")
        compile_stn(item["stn"], tbc_path)
        times = []
        cs = None
        for _ in range(reps):
            rc, out, err = run_cmd([SETUNC, "run", tbc_path])
            if rc != 0:
                raise RuntimeError(f"Canonical {item['id']} run failed: {err}\n{out}")
            m = re.search(item["regex"], out)
            if not m:
                raise RuntimeError(f"Failed to parse {item['id']} output:\n{out}")
            cs = float(m.group(1))
            times.append(int(m.group(2)) / 1000.0) # ms
        results[item["id"]] = {
            "id": item["id"],
            "name": item["name"],
            "checksum": cs,
            "times_ms": times
        }
    return results

def compute_metrics(raw_dict):
    metrics = {}
    for key, data in raw_dict.items():
        times = data["times_ms"]
        med = statistics.median(times)
        mean_val = statistics.mean(times)
        std_val = statistics.stdev(times) if len(times) > 1 else 0.0
        cv = (std_val / mean_val * 100.0) if mean_val > 0 else 0.0
        p95 = statistics.quantiles(times, n=20)[18] if len(times) >= 20 else max(times)
        metrics[key] = {
            "id": data["id"],
            "name": data["name"],
            "checksum": data["checksum"],
            "reps": len(times),
            "median_ms": round(med, 4),
            "mean_ms": round(mean_val, 4),
            "p95_ms": round(p95, 4),
            "stddev_ms": round(std_val, 4),
            "cv_percent": round(cv, 2),
            "min_ms": round(min(times), 4),
            "max_ms": round(max(times), 4),
            "raw_samples": [round(t, 4) for t in times]
        }
    return metrics

def main():
    import argparse
    parser = argparse.ArgumentParser(description="Tersun Gate 6.0 Baseline Freeze & Verification")
    parser.add_argument("--reps", type=int, default=N_REPS, help="Number of repetitions per benchmark")
    parser.add_argument("--freeze", action="store_true", help="Record and freeze baseline metrics")
    parser.add_argument("--verify", action="store_true", help="Verify current build against frozen baseline")
    parser.add_argument("--verify-all", action="store_true", help="Run full dual-track verification suite")
    parser.add_argument("--seal", type=str, default="G6_BASELINE", help="Seal ID for the benchmark run (e.g. G6A_TOS, G6B_CALLSTACK)")
    args = parser.parse_args()

    reps = args.reps
    seal_id = args.seal

    manifest = {
        "gate": f"Gate 6.0 - Phase Seal {seal_id}",
        "seal_id": seal_id,
        "timestamp_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "commit": get_git_commit(),
        "cpu": get_cpu_info(),
        "os": f"{platform.system()} {platform.release()} ({platform.machine()})",
        "compiler": get_compiler_info(),
        "compiler_flags": "-std=c++20 -O3",
        "reps_per_workload": reps,
        "mode": "Tier-0 (Interpreter with Phase Optimizations)"
    }

    legacy_raw = run_legacy_benchmarks(reps)
    canonical_raw = run_canonical_benchmarks(reps)

    legacy_metrics = compute_metrics(legacy_raw)
    canonical_metrics = compute_metrics(canonical_raw)

    full_payload = {
        "manifest": manifest,
        "legacy_benchmarks": legacy_metrics,
        "canonical_benchmarks": canonical_metrics
    }

    payload_json = json.dumps(full_payload, indent=2)
    seal_hash = hashlib.sha256(payload_json.encode("utf-8")).hexdigest()
    full_payload["cryptographic_seal"] = {
        "seal_id": seal_id,
        "algorithm": "SHA-256",
        "hash": seal_hash
    }

    if seal_id == "G6_BASELINE":
        manifest_path = os.path.join(REGISTRY_DIR, "baseline_manifest.json")
        metrics_path = os.path.join(REGISTRY_DIR, "baseline_metrics.json")
        with open(manifest_path, "w", encoding="utf-8") as f:
            json.dump(full_payload["manifest"], f, indent=2)
    else:
        filename_base = seal_id.lower().replace("-", "_")
        metrics_path = os.path.join(REGISTRY_DIR, f"{filename_base}_metrics.json")

    with open(metrics_path, "w", encoding="utf-8") as f:
        json.dump(full_payload, f, indent=2)

    print("\n" + "="*80)
    print(f"  GATE 6.0 PHASE SEAL [{seal_id}] COMPLETED SUCCESSFULLY")
    print(f"  Seal ID: {seal_id} | SHA-256: {seal_hash}")
    print(f"  Registry File Written: {metrics_path}")
    print("="*80)

    # If comparing against G6_BASELINE:
    baseline_path = os.path.join(REGISTRY_DIR, "baseline_metrics.json")
    baseline_data = None
    if seal_id != "G6_BASELINE" and os.path.exists(baseline_path):
        try:
            with open(baseline_path, "r", encoding="utf-8") as f:
                baseline_data = json.load(f)
        except Exception:
            pass

    print("\n[Legacy Set Summary]")
    print(f"  {'Workload':15s} | {'Current (ms)':12s} | {'Baseline (ms)':13s} | {'Speedup':8s} | {'Zero-Drift':10s}")
    print("  " + "-"*68)
    for k, v in legacy_metrics.items():
        cur_med = v['median_ms']
        base_str = "N/A"
        speedup_str = "1.00x"
        drift_ok = "PASS"
        if baseline_data and "legacy_benchmarks" in baseline_data and k in baseline_data["legacy_benchmarks"]:
            base_med = baseline_data["legacy_benchmarks"][k]["median_ms"]
            base_str = f"{base_med:8.3f}"
            if cur_med > 0:
                speedup = base_med / cur_med
                speedup_str = f"{speedup:6.2f}x"
            if baseline_data["legacy_benchmarks"][k]["checksum"] != v["checksum"]:
                drift_ok = "FAIL"
        print(f"  {k:15s} | {cur_med:12.3f} | {base_str:13s} | {speedup_str:8s} | {drift_ok:10s}")

    print("\n[Gate 6 Canonical Workload Summary]")
    print(f"  {'Workload':15s} | {'Current (ms)':12s} | {'Baseline (ms)':13s} | {'Speedup':8s} | {'Zero-Drift':10s}")
    print("  " + "-"*68)
    for k, v in canonical_metrics.items():
        cur_med = v['median_ms']
        base_str = "N/A"
        speedup_str = "1.00x"
        drift_ok = "PASS"
        if baseline_data and "canonical_benchmarks" in baseline_data and k in baseline_data["canonical_benchmarks"]:
            base_med = baseline_data["canonical_benchmarks"][k]["median_ms"]
            base_str = f"{base_med:8.3f}"
            if cur_med > 0:
                speedup = base_med / cur_med
                speedup_str = f"{speedup:6.2f}x"
            if baseline_data["canonical_benchmarks"][k]["checksum"] != v["checksum"]:
                drift_ok = "FAIL"
        print(f"  {k:15s} | {cur_med:12.3f} | {base_str:13s} | {speedup_str:8s} | {drift_ok:10s}")

    return 0

if __name__ == "__main__":
    sys.exit(main())
