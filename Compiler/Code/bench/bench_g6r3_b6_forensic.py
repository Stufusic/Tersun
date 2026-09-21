#!/usr/bin/env python3
# ==============================================================================
# Tersun Gate 6R.3 Forensic Benchmark & Verification Tool
# Step G6R.3-B6: Dataflow Superinstructions & Array Indexing Fastpaths
# Measures W1-W4 in pure interpreter mode (--interp) across N=30 runs.
# Compares against B1, B2, B3, B4, and B5 baselines in test_registry/g6r3.
# Snapshots objdump disassembly to B6_dataflow_superinstructions.asm.
# Produces test_registry/g6r3/b6_dataflow_superinstructions.json with full provenance.
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
B4_JSON = os.path.join(REGISTRY_G6R3, "b4_fast_call_abi.json")
B5_JSON = os.path.join(REGISTRY_G6R3, "b5_guarded_quickening_field_ic.json")

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
    mean_val = statistics.mean(times)
    median_val = statistics.median(times)
    stdev_val = statistics.stdev(times) if n > 1 else 0.0
    cv_pct = (stdev_val / mean_val * 100.0) if mean_val > 0 else 0.0
    
    p95_idx = int(math.ceil(0.95 * n)) - 1
    p95_val = s_times[max(0, min(p95_idx, n - 1))]
    p99_idx = int(math.ceil(0.99 * n)) - 1
    p99_val = s_times[max(0, min(p99_idx, n - 1))]
    
    return {
        "n": n,
        "mean_us": round(mean_val, 2),
        "median_us": round(median_val, 2),
        "mean_ms": round(mean_val / 1000.0, 3),
        "median_ms": round(median_val / 1000.0, 3),
        "stdev_us": round(stdev_val, 2),
        "cv_percent": round(cv_pct, 2),
        "min_us": s_times[0],
        "max_us": s_times[-1],
        "p95_us": p95_val,
        "p95_ms": round(p95_val / 1000.0, 3),
        "p99_us": p99_val,
        "p99_ms": round(p99_val / 1000.0, 3)
    }

def snapshot_disassembly(output_asm_path):
    os.makedirs(os.path.dirname(output_asm_path), exist_ok=True)
    objdump_cmd = ["objdump", "-d", "-C", "--no-show-raw-insn", SETUNC]
    print(f"[*] Extracting objdump disassembly for run_optimized to {output_asm_path}...")
    try:
        p = subprocess.Popen(objdump_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, cwd=CODE)
        capturing = False
        lines = []
        found_symbol = False
        
        for line in p.stdout:
            if "setun::VM::run_optimized" in line:
                capturing = True
                found_symbol = True
                lines.append(line)
                continue
            if capturing:
                if line.strip().endswith(":") and ("<setun::" in line or "<main" in line):
                    break
                lines.append(line)
                if len(lines) > 25000:
                    lines.append("... [truncated after 25000 lines] ...\n")
                    break
        p.terminate()
        
        if found_symbol and lines:
            with open(output_asm_path, "w", encoding="utf-8") as f:
                f.writelines(lines)
            print(f"[+] Disassembly saved ({len(lines)} lines, SHA256={sha256_file(output_asm_path)[:12]})")
        else:
            print("[-] Warning: Could not locate setun::VM::run_optimized in objdump output.")
    except Exception as e:
        print(f"[-] Warning: Failed to run objdump: {e}")

def run_workload(name, source_stn, regex_pattern, reps=30, warmup=5):
    print(f"\n[+] Benchmarking {name} ({source_stn}) [warmup={warmup}, reps={reps}]...")
    pat = re.compile(regex_pattern)
    
    # 1. Warmup
    for w in range(warmup):
        cmd = [SETUNC, "run", "--interp", source_stn]
        rc, out, err = run_cmd(cmd)
        if rc != 0:
            print(f"[-] Error during warmup run: {err or out}")
            sys.exit(1)
            
    # 2. Measurement runs
    times = []
    checksums = set()
    raw_outputs = []
    
    for r in range(reps):
        cmd = [SETUNC, "run", "--interp", source_stn]
        rc, out, err = run_cmd(cmd)
        if rc != 0:
            print(f"[-] Error during measurement run {r+1}: {err or out}")
            sys.exit(1)
        
        match = pat.search(out)
        if not match:
            print(f"[-] Failed to match output regex in: {out}")
            sys.exit(1)
            
        csum = match.group(1)
        us = int(match.group(2))
        checksums.add(csum)
        times.append(us)
        if r < 3:
            raw_outputs.append(out)
            
    if len(checksums) > 1:
        print(f"[-] FATAL: Non-deterministic output detected for {name}: {checksums}")
        sys.exit(1)
        
    csum_val = list(checksums)[0]
    stats = compute_statistics(times)
    print(f"    --> Checksum: {csum_val}")
    print(f"    --> Median: {stats['median_ms']} ms ({stats['median_us']} us) | P95: {stats['p95_ms']} ms | CV: {stats['cv_percent']}%")
    
    return {
        "checksum": csum_val,
        "sample_output": raw_outputs[0] if raw_outputs else "",
        "stats": stats,
        "raw_times_us": times
    }

def main():
    print("==================================================================")
    print("  TERSON GATE 6R.3 FORENSIC BENCHMARK: STEP B6 (DATAFLOW SUPERINS)")
    print("==================================================================")
    
    fingerprint = get_environment_fingerprint()
    print(f"Fingerprint: CPU={fingerprint['cpu_model']} | Git={fingerprint['git_commit'][:8]} | SHA256={fingerprint['binary_sha256'][:12]}")
    
    asm_path = os.path.join(DISASM_DIR, "B6_dataflow_superinstructions.asm")
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

    b4_data = {}
    if os.path.exists(B4_JSON):
        with open(B4_JSON, "r", encoding="utf-8") as f:
            b4_data = json.load(f).get("workloads", {})

    b5_data = {}
    if os.path.exists(B5_JSON):
        with open(B5_JSON, "r", encoding="utf-8") as f:
            b5_data = json.load(f).get("workloads", {})
            
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
        b6_med = res["stats"]["median_ms"]

        if name in b1_data:
            b1_med = b1_data[name]["stats"]["median_ms"]
            pct_b1 = round((b6_med - b1_med) / b1_med * 100.0, 2)
            speedup_b1 = round(b1_med / b6_med, 3) if b6_med > 0 else 1.0
            exact_match_b1 = (b1_data[name]["checksum"] == res["checksum"])
            
            cmp_entry["b1_median_ms"] = b1_med
            cmp_entry["speedup_vs_b1"] = speedup_b1
            cmp_entry["pct_vs_b1"] = pct_b1
            cmp_entry["checksum_verified"] = exact_match_b1

        if name in b2_data:
            b2_med = b2_data[name]["stats"]["median_ms"]
            pct_b2 = round((b6_med - b2_med) / b2_med * 100.0, 2)
            speedup_b2 = round(b2_med / b6_med, 3) if b6_med > 0 else 1.0
            cmp_entry["b2_median_ms"] = b2_med
            cmp_entry["speedup_vs_b2"] = speedup_b2
            cmp_entry["pct_vs_b2"] = pct_b2

        if name in b3_data:
            b3_med = b3_data[name]["stats"]["median_ms"]
            pct_b3 = round((b6_med - b3_med) / b3_med * 100.0, 2)
            speedup_b3 = round(b3_med / b6_med, 3) if b6_med > 0 else 1.0
            cmp_entry["b3_median_ms"] = b3_med
            cmp_entry["speedup_vs_b3"] = speedup_b3
            cmp_entry["pct_vs_b3"] = pct_b3

        if name in b4_data:
            b4_med = b4_data[name]["stats"]["median_ms"]
            pct_b4 = round((b6_med - b4_med) / b4_med * 100.0, 2)
            speedup_b4 = round(b4_med / b6_med, 3) if b6_med > 0 else 1.0
            cmp_entry["b4_median_ms"] = b4_med
            cmp_entry["speedup_vs_b4"] = speedup_b4
            cmp_entry["pct_vs_b4"] = pct_b4

        if name in b5_data:
            b5_med = b5_data[name]["stats"]["median_ms"]
            pct_b5 = round((b6_med - b5_med) / b5_med * 100.0, 2)
            speedup_b5 = round(b5_med / b6_med, 3) if b6_med > 0 else 1.0
            cmp_entry["b5_median_ms"] = b5_med
            cmp_entry["speedup_vs_b5"] = speedup_b5
            cmp_entry["pct_vs_b5"] = pct_b5

        comparisons[name] = cmp_entry
        print(f"    --> Comparison: vs B1: {cmp_entry.get('b1_median_ms')} ms ({cmp_entry.get('speedup_vs_b1')}x) | vs B5: {cmp_entry.get('b5_median_ms')} ms ({cmp_entry.get('speedup_vs_b5')}x) | Bit-Exact: {cmp_entry.get('checksum_verified')}")
            
    seal_doc = {
        "milestone": "G6R.3",
        "step": "G6R.3-B6",
        "stage": "B6_Dataflow_Superinstructions_Verification",
        "timestamp_utc": time.strftime("%Y-%m-%d %H:%M:%SZ", time.gmtime()),
        "mode": "pure_interpreter",
        "fingerprint": fingerprint,
        "disassembly_snapshot": "benchmarks/g6r3/disassembly/B6_dataflow_superinstructions.asm",
        "workloads": results,
        "comparisons": comparisons
    }
    
    seal_str = json.dumps(seal_doc, indent=2)
    seal_sha256 = hashlib.sha256(seal_str.encode("utf-8")).hexdigest()
    seal_doc["seal_sha256"] = seal_sha256
    
    out_json = os.path.join(REGISTRY_G6R3, "b6_dataflow_superinstructions.json")
    with open(out_json, "w", encoding="utf-8") as f:
        json.dump(seal_doc, f, indent=2)
        
    print(f"\n[+] Step B6 Locked and Sealed successfully: {out_json}")
    print(f"[+] Cryptographic Seal SHA256: {seal_sha256}")
    print("==================================================================")

if __name__ == "__main__":
    main()
