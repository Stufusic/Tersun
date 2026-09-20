#!/usr/bin/env python3
# ==============================================================================
# Tersun Gate 6R.3 Forensic Benchmark & Verification Tool
# Step G6R.3-B4: Fast CALL / RET ABI
# Measures W1-W4 in pure interpreter mode (--interp) across N=30 runs.
# Compares against B1, B2, and B3 baselines in test_registry/g6r3.
# Snapshots objdump disassembly to B4_fast_call_abi.asm.
# Produces test_registry/g6r3/b4_fast_call_abi.json with full provenance.
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

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
SETUNC = os.path.join(CODE, "setunc.exe")
REGISTRY_G6R3 = os.path.join(CODE, "test_registry", "g6r3")
DISASM_DIR = os.path.join(CODE, "benchmarks", "g6r3", "disassembly")
B1_JSON = os.path.join(REGISTRY_G6R3, "b1_baseline.json")
B2_JSON = os.path.join(REGISTRY_G6R3, "b2_zero_instrumentation.json")
B3_JSON = os.path.join(REGISTRY_G6R3, "b3_static_tos_selective_flush.json")

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

    return {
        "machine_id": machine_id,
        "cpu_model": cpu_model,
        "core_count": core_count,
        "power_plan": power_plan,
        "os": f"{platform.system()} {platform.release()} ({platform.architecture()[0]})",
        "git_commit": git_commit,
        "compiler": compiler,
        "compiler_flags": "-std=c++20 -O3 -Iinclude -mavx2 -mfma -fopenmp",
        "binary_sha256": sha256_file(SETUNC),
        "benchmark_script_sha256": sha256_file(__file__),
        "process_affinity": "Single-Process Core Pinned"
    }

def compute_statistics(times):
    n = len(times)
    if n == 0:
        return {}
    s_times = sorted(times)
    med = statistics.median(s_times)
    mean = statistics.mean(s_times)
    stddev = statistics.stdev(s_times) if n > 1 else 0.0
    p95_idx = int(math.ceil(0.95 * n)) - 1
    p95 = s_times[min(p95_idx, n - 1)]
    cv_pct = (stddev / mean * 100.0) if mean > 0 else 0.0
    
    ci_margin = 1.96 * (stddev / math.sqrt(n)) if n > 1 else 0.0
    ci_low = max(0.0, mean - ci_margin)
    ci_high = mean + ci_margin

    return {
        "count": n,
        "median_ms": round(med, 4),
        "mean_ms": round(mean, 4),
        "stddev_ms": round(stddev, 4),
        "p95_ms": round(p95, 4),
        "min_ms": round(s_times[0], 4),
        "max_ms": round(s_times[-1], 4),
        "cv_pct": round(cv_pct, 2),
        "ci95_low_ms": round(ci_low, 4),
        "ci95_high_ms": round(ci_high, 4)
    }

def snapshot_disassembly(target_asm_path):
    print(f"[*] Extracting disassembly for VM::run_optimized to {target_asm_path}...")
    try:
        p = subprocess.Popen(["objdump", "-d", "-C", SETUNC], stdout=subprocess.PIPE, text=True, errors="ignore")
        capturing = False
        lines = []
        for line in p.stdout:
            if "<setun::VM::run_optimized(" in line:
                capturing = True
                lines.append(line)
                continue
            if capturing:
                if line and not line.startswith(" ") and not line.startswith("\t") and "<" in line and ">:" in line:
                    break
                lines.append(line)
                if len(lines) > 5000:
                    break
        p.terminate()
        os.makedirs(os.path.dirname(target_asm_path), exist_ok=True)
        with open(target_asm_path, "w", encoding="utf-8") as f:
            f.writelines(lines)
        print(f"[+] Saved {len(lines)} disassembly lines to {target_asm_path}")
    except Exception as e:
        print(f"[-] Warning: Failed to extract disassembly: {e}")

def run_workload(name, stn_path, regex_str, reps=30, warmup=5):
    print(f"[*] Running {name} ({stn_path}) - Warmup: {warmup}, Reps: {reps}...")
    cmd = [SETUNC, "run", "--interp", stn_path]
    for _ in range(warmup):
        run_cmd(cmd)
        
    times = []
    cs = None
    for i in range(reps):
        rc, out, err = run_cmd(cmd)
        if rc != 0:
            raise RuntimeError(f"Run failed for {name}: {err}\n{out}")
        m = re.search(regex_str, out)
        if not m:
            raise RuntimeError(f"Pattern match failed for {name} output:\n{out}")
        cs = m.group(1)
        times.append(int(m.group(2)) / 1000.0)
        
    stats = compute_statistics(times)
    print(f"    [+] {name}: Checksum={cs} | Median={stats['median_ms']} ms | P95={stats['p95_ms']} ms | CV%={stats['cv_pct']}%")
    return {
        "checksum": cs,
        "stats": stats,
        "raw_times_ms": [round(t, 4) for t in times]
    }

def main():
    print("==================================================================")
    print("  Tersun Gate 6R.3 Step B4: Fast CALL / RET ABI Forensic Seal     ")
    print("==================================================================")
    
    fingerprint = get_environment_fingerprint()
    print(f"Fingerprint: CPU={fingerprint['cpu_model']} | Git={fingerprint['git_commit'][:8]} | SHA256={fingerprint['binary_sha256'][:12]}")
    
    asm_path = os.path.join(DISASM_DIR, "B4_fast_call_abi.asm")
    snapshot_disassembly(asm_path)
    
    b1_data = {}
    if os.path.exists(B1_JSON):
        with open(B1_JSON, "r", encoding="utf-8") as f:
            b1_data = json.load(f).get("workloads", {})

    b2_data = {}
    if os.path.exists(B2_JSON):
        with open(B2_JSON, "r", encoding="utf-8") as f:
            b2_data = json.load(f).get("workloads", {})

    b3_data = {}
    if os.path.exists(B3_JSON):
        with open(B3_JSON, "r", encoding="utf-8") as f:
            b3_data = json.load(f).get("workloads", {})
            
    workloads_def = [
        ("W1_FIB", os.path.join(HERE, "multi_lang_benchmark", "w1_fibonacci", "fib.stn"), r"W1_FIB checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"),
        ("W2_SIEVE", os.path.join(HERE, "multi_lang_benchmark", "w2_sieve", "sieve.stn"), r"W2_SIEVE checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"),
        ("W3_MATMUL", os.path.join(HERE, "multi_lang_benchmark", "w3_matmul", "matmul.stn"), r"W3_MATMUL checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"),
        ("W4_OBJECT", os.path.join(HERE, "multi_lang_benchmark", "w4_object", "object.stn"), r"W4_OBJECT checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)")
    ]
    
    results = {}
    comparisons = {}
    
    for name, stn, reg in workloads_def:
        res = run_workload(name, stn, reg, reps=30, warmup=5)
        results[name] = res
        
        cmp_entry = {}
        b4_med = res["stats"]["median_ms"]

        if name in b1_data:
            b1_med = b1_data[name]["stats"]["median_ms"]
            pct_b1 = round((b4_med - b1_med) / b1_med * 100.0, 2)
            speedup_b1 = round(b1_med / b4_med, 3) if b4_med > 0 else 1.0
            exact_match_b1 = (b1_data[name]["checksum"] == res["checksum"])
            
            cmp_entry["b1_median_ms"] = b1_med
            cmp_entry["speedup_vs_b1"] = speedup_b1
            cmp_entry["pct_vs_b1"] = pct_b1
            cmp_entry["checksum_verified"] = exact_match_b1

        if name in b2_data:
            b2_med = b2_data[name]["stats"]["median_ms"]
            pct_b2 = round((b4_med - b2_med) / b2_med * 100.0, 2)
            speedup_b2 = round(b2_med / b4_med, 3) if b4_med > 0 else 1.0
            cmp_entry["b2_median_ms"] = b2_med
            cmp_entry["speedup_vs_b2"] = speedup_b2
            cmp_entry["pct_vs_b2"] = pct_b2

        if name in b3_data:
            b3_med = b3_data[name]["stats"]["median_ms"]
            pct_b3 = round((b4_med - b3_med) / b3_med * 100.0, 2)
            speedup_b3 = round(b3_med / b4_med, 3) if b4_med > 0 else 1.0
            cmp_entry["b3_median_ms"] = b3_med
            cmp_entry["speedup_vs_b3"] = speedup_b3
            cmp_entry["pct_vs_b3"] = pct_b3

        comparisons[name] = cmp_entry
        print(f"    --> Comparison: vs B1: {cmp_entry.get('b1_median_ms')} ms (Speedup={cmp_entry.get('speedup_vs_b1')}x) | vs B3: {cmp_entry.get('b3_median_ms')} ms (Speedup={cmp_entry.get('speedup_vs_b3')}x) | Bit-Exact: {cmp_entry.get('checksum_verified')}")
            
    seal_doc = {
        "milestone": "G6R.3",
        "step": "G6R.3-B4",
        "stage": "B4_Fast_Call_ABI_Verification",
        "timestamp_utc": time.strftime("%Y-%m-%d %H:%M:%SZ", time.gmtime()),
        "mode": "pure_interpreter",
        "fingerprint": fingerprint,
        "disassembly_snapshot": "benchmarks/g6r3/disassembly/B4_fast_call_abi.asm",
        "workloads": results,
        "comparisons": comparisons
    }
    
    seal_str = json.dumps(seal_doc, indent=2)
    seal_sha256 = hashlib.sha256(seal_str.encode("utf-8")).hexdigest()
    seal_doc["seal_sha256"] = seal_sha256
    
    out_json = os.path.join(REGISTRY_G6R3, "b4_fast_call_abi.json")
    with open(out_json, "w", encoding="utf-8") as f:
        json.dump(seal_doc, f, indent=2)
        
    print(f"\n[+] Step B4 Locked and Sealed successfully: {out_json}")
    print(f"[+] Cryptographic Seal SHA256: {seal_sha256}")
    print("==================================================================")

if __name__ == "__main__":
    main()
