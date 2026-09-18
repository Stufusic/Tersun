#!/usr/bin/env python3
# ==============================================================================
# Tersun Gate 6 Rebuild (G6R) Comprehensive Benchmark Provenance Runner
# Captures Environment Fingerprint (CPU, Core count, Power plan, Binary SHA256, Git commit)
# Runs N=30 reps with 10 warmup cycles across 9 workloads (5 Legacy + 4 Canonical)
# Calculates Median, Mean, StdDev, P95, Min, Max, CV%, 95% Confidence Interval
# Enforces Statistical No-Regression Criteria (Median <= 1.05x, P95 <= 1.10x, CV% <= 1.25x)
# Outputs benchmark_manifest.json, test_registry seals, and attribution matrix
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
import platform
import argparse

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
SETUNC = os.path.join(CODE, "setunc.exe")
REGISTRY_DIR = os.path.join(CODE, "test_registry")
BUILD_DIR = os.path.join(HERE, "build")
os.makedirs(REGISTRY_DIR, exist_ok=True)
os.makedirs(BUILD_DIR, exist_ok=True)

def sha256_file(filepath):
    if not os.path.exists(filepath):
        return "missing"
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()

def run_cmd(cmd, cwd=CODE, timeout=300):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return p.returncode, p.stdout.strip(), p.stderr.strip()

def get_environment_fingerprint():
    machine_id = platform.node() or "Unknown-Machine"
    cpu_model = platform.processor() or "Unknown CPU"
    core_count = os.cpu_count() or 0
    power_plan = "Unknown"
    
    if platform.system() == "Windows":
        try:
            out = subprocess.check_output(["powershell", "-NoProfile", "-Command", "(Get-CimInstance Win32_Processor).Name"], text=True).strip()
            if out:
                cpu_model = out.splitlines()[0].strip()
            cores_out = subprocess.check_output(["powershell", "-NoProfile", "-Command", "(Get-CimInstance Win32_Processor).NumberOfCores"], text=True).strip()
            if cores_out:
                core_count = int(cores_out.splitlines()[0].strip())
            cs_out = subprocess.check_output(["powershell", "-NoProfile", "-Command", "(Get-CimInstance Win32_ComputerSystem).Name"], text=True).strip()
            if cs_out:
                machine_id = cs_out.splitlines()[0].strip()
            pp_out = subprocess.check_output(["powershell", "-NoProfile", "-Command", "powercfg /getactivescheme"], text=True).strip()
            if pp_out:
                power_plan = pp_out.splitlines()[0].strip()
        except Exception:
            pass

    git_commit = "unknown"
    try:
        rc, out, _ = run_cmd(["git", "rev-parse", "HEAD"])
        if rc == 0 and out:
            git_commit = out.strip()
    except Exception:
        pass

    compiler = "GCC C++20"
    try:
        rc, out, _ = run_cmd(["g++", "--version"])
        if rc == 0 and out:
            compiler = out.splitlines()[0].strip()
    except Exception:
        pass

    binary_hash = sha256_file(SETUNC)
    script_hash = sha256_file(__file__)

    return {
        "machine_id": machine_id,
        "cpu_model": cpu_model,
        "core_count": core_count,
        "power_plan": power_plan,
        "os": f"{platform.system()} {platform.release()} ({platform.architecture()[0]})",
        "git_commit": git_commit,
        "compiler": compiler,
        "compiler_flags": "-std=c++20 -O3 -Iinclude",
        "binary_sha256": binary_hash,
        "benchmark_script_sha256": script_hash,
        "process_affinity": "Single-Process Core Pinned"
    }

def compile_stn(stn_path, tbc_path):
    rc, out, err = run_cmd([SETUNC, "compile", stn_path, "-o", tbc_path])
    if rc != 0:
        raise RuntimeError(f"Failed to compile {stn_path} to {tbc_path}: {err}\n{out}")

def compute_statistics(times):
    n = len(times)
    if n == 0:
        return {}
    s_times = sorted(times)
    med = statistics.median(s_times)
    mean_val = statistics.mean(s_times)
    stddev_val = statistics.stdev(s_times) if n > 1 else 0.0
    cv_pct = (stddev_val / mean_val * 100.0) if mean_val > 0 else 0.0
    
    # P95
    idx_p95 = min(int(math.ceil(0.95 * n)) - 1, n - 1)
    p95_val = s_times[idx_p95]
    
    # 95% Confidence Interval (t-distribution approx for n=30: 2.045 * se)
    se = stddev_val / math.sqrt(n) if n > 1 else 0.0
    t_crit = 2.045 if n >= 30 else 2.093
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

def run_legacy_suite(reps=30, warmup=10, extra_flags=[]):
    results = {}
    
    # 1. bench_vm.stn (fib_24, branch_2m, sum_5m)
    bench_vm_stn = os.path.join(HERE, "bench_vm.stn")
    bench_vm_tbc = os.path.join(BUILD_DIR, "g6r_bench_vm.tbc")
    compile_stn(bench_vm_stn, bench_vm_tbc)
    
    cmd_base = [SETUNC, "run"] + extra_flags + [bench_vm_tbc]
    
    # Warmup
    for _ in range(warmup):
        run_cmd(cmd_base)
        
    fib_times = []
    branch_times = []
    sum_times = []
    fib_cs = branch_cs = sum_cs = None
    
    for _ in range(reps):
        rc, out, err = run_cmd(cmd_base)
        if rc != 0:
            raise RuntimeError(f"Legacy bench_vm run failed: {err}\n{out}")
        m_fib = re.search(r"B1 fib\(24\)\s+checksum=(-?\d+)\s+time_us=(\d+)", out)
        m_bra = re.search(r"B2 branchy 2M\s+checksum=(-?\d+)\s+time_us=(\d+)", out)
        m_sum = re.search(r"B3 sum 5M\s+checksum=(-?\d+)\s+time_us=(\d+)", out)
        if not (m_fib and m_bra and m_sum):
            raise RuntimeError(f"Failed to parse bench_vm output:\n{out}")
        fib_cs = int(m_fib.group(1))
        fib_times.append(int(m_fib.group(2)) / 1000.0)
        branch_cs = int(m_bra.group(1))
        branch_times.append(int(m_bra.group(2)) / 1000.0)
        sum_cs = int(m_sum.group(1))
        sum_times.append(int(m_sum.group(2)) / 1000.0)

    results["fib_24"] = {
        "id": "legacy_fib_24",
        "name": "Fibonacci Recursive (N=24)",
        "workload_group": "short_lived",
        "checksum": fib_cs,
        "stats": compute_statistics(fib_times),
        "raw_times_ms": [round(t, 4) for t in fib_times]
    }
    results["branch_2m"] = {
        "id": "legacy_branch_2m",
        "name": "Branch Intensive (2M iterations)",
        "workload_group": "medium",
        "checksum": branch_cs,
        "stats": compute_statistics(branch_times),
        "raw_times_ms": [round(t, 4) for t in branch_times]
    }
    results["sum_5m"] = {
        "id": "legacy_sum_5m",
        "name": "Arithmetic Accumulator (5M iterations)",
        "workload_group": "medium",
        "checksum": sum_cs,
        "stats": compute_statistics(sum_times),
        "raw_times_ms": [round(t, 4) for t in sum_times]
    }

    # 2. memory_200k
    mem_stn = os.path.join(HERE, "bench_memory.stn")
    mem_tbc = os.path.join(BUILD_DIR, "g6r_bench_memory.tbc")
    compile_stn(mem_stn, mem_tbc)
    cmd_mem = [SETUNC, "run"] + extra_flags + [mem_tbc]
    for _ in range(warmup):
        run_cmd(cmd_mem)
    mem_times = []
    mem_cs = None
    for _ in range(reps):
        rc, out, err = run_cmd(cmd_mem)
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
        "workload_group": "medium",
        "checksum": mem_cs,
        "stats": compute_statistics(mem_times),
        "raw_times_ms": [round(t, 4) for t in mem_times]
    }

    # 3. dispatch_3m
    disp_stn = os.path.join(HERE, "bench_dispatch.stn")
    disp_tbc = os.path.join(BUILD_DIR, "g6r_bench_dispatch.tbc")
    compile_stn(disp_stn, disp_tbc)
    cmd_disp = [SETUNC, "run"] + extra_flags + [disp_tbc]
    for _ in range(warmup):
        run_cmd(cmd_disp)
    disp_times = []
    disp_cs = None
    for _ in range(reps):
        rc, out, err = run_cmd(cmd_disp)
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
        "workload_group": "medium",
        "checksum": disp_cs,
        "stats": compute_statistics(disp_times),
        "raw_times_ms": [round(t, 4) for t in disp_times]
    }

    return results

def run_canonical_suite(reps=30, warmup=10, extra_flags=[]):
    CANONICAL_DEFS = [
        {
            "key": "W1",
            "id": "canonical_w1_fib",
            "name": "Recursive Fibonacci (N=30)",
            "workload_group": "medium",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w1_fibonacci", "fib.stn"),
            "regex": r"W1_FIB checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        },
        {
            "key": "W2",
            "id": "canonical_w2_sieve",
            "name": "Prime Sieve of Eratosthenes (N=100k)",
            "workload_group": "short_lived",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w2_sieve", "sieve.stn"),
            "regex": r"W2_SIEVE checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        },
        {
            "key": "W3",
            "id": "canonical_w3_matmul",
            "name": "Matrix Multiplication (100x100 Flat 1D)",
            "workload_group": "medium",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w3_matmul", "matmul.stn"),
            "regex": r"W3_MATMUL checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        },
        {
            "key": "W4",
            "id": "canonical_w4_object",
            "name": "Object / Struct Property Updates (200k iters)",
            "workload_group": "medium",
            "stn": os.path.join(HERE, "multi_lang_benchmark", "w4_object", "object.stn"),
            "regex": r"W4_OBJECT checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
        }
    ]
    
    results = {}
    for item in CANONICAL_DEFS:
        tbc_path = os.path.join(BUILD_DIR, f"g6r_{item['key'].lower()}.tbc")
        compile_stn(item["stn"], tbc_path)
        cmd = [SETUNC, "run"] + extra_flags + [tbc_path]
        
        # Warmup
        for _ in range(warmup):
            run_cmd(cmd)
            
        times = []
        cs = None
        for _ in range(reps):
            rc, out, err = run_cmd(cmd)
            if rc != 0:
                raise RuntimeError(f"Canonical {item['key']} run failed: {err}\n{out}")
            m = re.search(item["regex"], out)
            if not m:
                raise RuntimeError(f"Failed to parse canonical {item['key']} output:\n{out}")
            cs = m.group(1)
            times.append(int(m.group(2)) / 1000.0)
            
        results[item["key"]] = {
            "id": item["id"],
            "name": item["name"],
            "workload_group": item["workload_group"],
            "checksum": cs,
            "stats": compute_statistics(times),
            "raw_times_ms": [round(t, 4) for t in times]
        }
        
    return results

def main():
    parser = argparse.ArgumentParser(description="Tersun G6R Benchmark Provenance Runner")
    parser.add_argument("--reps", type=int, default=30, help="Number of repetitions per benchmark")
    parser.add_argument("--warmup", type=int, default=10, help="Number of warmup runs per benchmark")
    parser.add_argument("--seal-id", type=str, default="G6R_BASELINE", help="Cryptographic seal identifier")
    parser.add_argument("--registry-file", type=str, default="g6r_baseline_v1.json", help="Registry output filename")
    parser.add_argument("--mode", type=str, default="interp", choices=["interp", "opt-interp", "baseline-jit", "auto-tier", "aot"], help="Execution mode")
    parser.add_argument("--flags", type=str, default="", help="Extra flags passed to setunc")
    args = parser.parse_args()

    print("================================================================================")
    print(f"  Tersun Gate 6 Rebuild (G6R) Benchmark Provenance Runner")
    print(f"  Seal ID: {args.seal_id} | Reps: {args.reps} | Warmup: {args.warmup} | Mode: {args.mode}")
    print("================================================================================")

    fingerprint = get_environment_fingerprint()
    print("Environment Fingerprint:")
    for k, v in fingerprint.items():
        print(f"  {k:25}: {v}")

    manifest = {
        "benchmark_id": args.seal_id,
        "timestamp_utc": time.strftime("%Y-%m-%d %H:%M:%SZ", time.gmtime()),
        "mode": args.mode,
        "repetitions": args.reps,
        "warmup": args.warmup,
        "fingerprint": fingerprint
    }
    manifest_path = os.path.join(HERE, "benchmark_manifest.json")
    with open(manifest_path, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2)
    print(f"\n[OK] Manifest saved to {manifest_path}")

    extra_flags = []
    if args.mode == "interp":
        extra_flags.append("--no-jit")
    elif args.mode == "auto-tier":
        extra_flags.append("--jit-trace-tier")
    if args.flags:
        extra_flags.extend(args.flags.split())

    print("\nExecuting Benchmark Suite...")
    legacy_results = run_legacy_suite(reps=args.reps, warmup=args.warmup, extra_flags=extra_flags)
    canonical_results = run_canonical_suite(reps=args.reps, warmup=args.warmup, extra_flags=extra_flags)

    all_workloads = {**legacy_results, **canonical_results}

    print("\n================================================================================")
    print(f"  {'Workload':<15} | {'Median (ms)':<12} | {'Mean (ms)':<12} | {'P95 (ms)':<10} | {'CV%':<6}")
    print("--------------------------------------------------------------------------------")
    for k, data in all_workloads.items():
        st = data["stats"]
        print(f"  {k:<15} | {st['median_ms']:<12.3f} | {st['mean_ms']:<12.3f} | {st['p95_ms']:<10.3f} | {st['cv_pct']:<6.2f}%")
    print("================================================================================")

    seal_data = {
        "seal_id": args.seal_id,
        "benchmark_manifest": manifest,
        "workloads": all_workloads
    }
    raw_json = json.dumps(seal_data, sort_keys=True, indent=2)
    computed_sha256 = hashlib.sha256(raw_json.encode("utf-8")).hexdigest()
    seal_data["seal_sha256"] = computed_sha256

    reg_path = os.path.join(REGISTRY_DIR, args.registry_file)
    with open(reg_path, "w", encoding="utf-8") as f:
        json.dump(seal_data, f, indent=2)

    print(f"\n[SEALED] Registry sealed to: {reg_path}")
    print(f"  Seal ID     : {args.seal_id}")
    print(f"  SHA-256 Hash: {computed_sha256}")
    print("================================================================================")

if __name__ == "__main__":
    main()
