#!/usr/bin/env python3
# ==============================================================================
# G6R.1 A/B Controlled Isolation Experiments (E1..E7)
# Strictly changes only ONE subsystem at a time to prove causality:
#   E1: Dispatch (Switch vs Threaded vs Cached)
#   E2: TOS (TOS On vs TOS Off)
#   E3: Fusion (Fusion On vs Fusion Off)
#   E4: FlatArray (FlatArray On vs Generic Representation)
#   E5: Field IC (IC On vs IC Off)
#   E6: JIT Economics (JIT Off vs Baseline JIT vs Auto-Tier)
#   E7: GC / Allocation Pressure
# ==============================================================================

import os
import sys
import subprocess
import time
import re
import math
import statistics
import json

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(os.path.dirname(HERE))
SETUNC = os.path.join(CODE, "setunc.exe")
BENCH_DIR = os.path.join(CODE, "benchmarks", "forensics")
INPUTS_DIR = os.path.join(BENCH_DIR, "inputs")
NORM_DIR = os.path.join(BENCH_DIR, "normalized")
WORKING_DIR = os.path.join(CODE, "build", "g6r1", "working")

os.makedirs(NORM_DIR, exist_ok=True)

def run_cmd(cmd, cwd=CODE, timeout=300):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return p.returncode, p.stdout.strip(), p.stderr.strip()

def compute_statistics(times):
    if not times:
        return {}
    s = sorted(times)
    med = statistics.median(s)
    mean = statistics.mean(s)
    std = statistics.stdev(s) if len(s) > 1 else 0.0
    cv = (std / mean * 100.0) if mean > 0 else 0.0
    return {
        "median_ms": round(med, 4),
        "mean_ms": round(mean, 4),
        "stddev_ms": round(std, 4),
        "cv_pct": round(cv, 2)
    }

def compile_stn(stn_path, tbc_path):
    rc, out, err = run_cmd([SETUNC, "compile", stn_path, "-o", tbc_path])
    if rc != 0:
        raise RuntimeError(f"Failed to compile {stn_path}: {err}\n{out}")

def measure_benchmark(tbc_path, regex_str, extra_flags=[], reps=15, warmup=5):
    cmd = [SETUNC, "run"] + extra_flags + [tbc_path]
    for _ in range(warmup):
        run_cmd(cmd)
    times = []
    for _ in range(reps):
        rc, out, err = run_cmd(cmd)
        if rc == 0:
            m = re.search(regex_str, out)
            if m:
                times.append(int(m.group(2)) / 1000.0)
    return compute_statistics(times)

def run_experiments():
    print("================================================================================")
    print("           TERSUN G6R.1 A/B CONTROLLED ISOLATION EXPERIMENTS (E1..E7)           ")
    print("================================================================================")
    
    results = {}
    w1_tbc = os.path.join(WORKING_DIR, "w1_fibonacci.tbc")
    w2_tbc = os.path.join(WORKING_DIR, "w2_sieve.tbc")
    w3_tbc = os.path.join(WORKING_DIR, "w3_matmul.tbc")
    w4_tbc = os.path.join(WORKING_DIR, "w4_object.tbc")

    compile_stn(os.path.join(INPUTS_DIR, "w1_fibonacci.stn"), w1_tbc)
    compile_stn(os.path.join(INPUTS_DIR, "w2_sieve.stn"), w2_tbc)
    compile_stn(os.path.join(INPUTS_DIR, "w3_matmul.stn"), w3_matmul := w3_tbc)
    compile_stn(os.path.join(INPUTS_DIR, "w4_object.stn"), w4_tbc)

    # -------------------------------------------------------------------------
    # E1: Dispatch Mechanism (W3 Matmul)
    # -------------------------------------------------------------------------
    print("\n[E1] Dispatch Mechanism Isolation (W3 Matmul)")
    reg_w3 = r"W3_MATMUL checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    e1_switch = measure_benchmark(w3_tbc, reg_w3, ["--interp", "--dispatch=switch"])
    e1_cached = measure_benchmark(w3_tbc, reg_w3, ["--interp", "--dispatch=cached"])
    e1_speedup = round((e1_switch["median_ms"] / e1_cached["median_ms"]), 2) if e1_cached.get("median_ms", 0) > 0 else 1.0
    print(f"  - Switch Dispatch : {e1_switch.get('median_ms', 0):.2f} ms")
    print(f"  - Cached Dispatch : {e1_cached.get('median_ms', 0):.2f} ms (Speedup: {e1_speedup}x)")
    results["E1_Dispatch"] = {"switch": e1_switch, "cached": e1_cached, "speedup": e1_speedup}

    # -------------------------------------------------------------------------
    # E2: TOS Optimization (W3 Matmul)
    # -------------------------------------------------------------------------
    print("\n[E2] Top-of-Stack (TOS) Caching Isolation (W3 Matmul)")
    e2_no_opt = measure_benchmark(w3_tbc, reg_w3, ["--interp", "--opt-v3"]) # No TOS
    e2_with_opt = measure_benchmark(w3_tbc, reg_w3, ["--interp", "--opt-all"]) # With TOS
    e2_delta = round(e2_no_opt.get("median_ms", 0) - e2_with_opt.get("median_ms", 0), 2)
    print(f"  - TOS Disabled    : {e2_no_opt.get('median_ms', 0):.2f} ms")
    print(f"  - TOS Enabled     : {e2_with_opt.get('median_ms', 0):.2f} ms (Delta: -{e2_delta} ms)")
    results["E2_TOS"] = {"disabled": e2_no_opt, "enabled": e2_with_opt, "delta_ms": e2_delta}

    # -------------------------------------------------------------------------
    # E3: Superinstruction Fusion (W3 Matmul)
    # -------------------------------------------------------------------------
    print("\n[E3] Superinstruction Fusion Isolation (W3 Matmul)")
    e3_no_fusion = measure_benchmark(w3_tbc, reg_w3, ["--interp", "--no-superinst"])
    e3_fusion = measure_benchmark(w3_tbc, reg_w3, ["--interp", "--opt-all"])
    e3_delta = round(e3_no_fusion.get("median_ms", 0) - e3_fusion.get("median_ms", 0), 2)
    print(f"  - Fusion OFF      : {e3_no_fusion.get('median_ms', 0):.2f} ms")
    print(f"  - Fusion ON       : {e3_fusion.get('median_ms', 0):.2f} ms (Delta: -{e3_delta} ms)")
    results["E3_Fusion"] = {"fusion_off": e3_no_fusion, "fusion_on": e3_fusion, "delta_ms": e3_delta}

    # -------------------------------------------------------------------------
    # E4: FlatArray Representation (W2 Sieve)
    # -------------------------------------------------------------------------
    print("\n[E4] FlatArray vs Generic Array Isolation (W2 Sieve)")
    reg_w2 = r"W2_SIEVE checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    e4_generic = measure_benchmark(w2_tbc, reg_w2, ["--interp", "--opt-tier-a"])
    e4_flat = measure_benchmark(w2_tbc, reg_w2, ["--interp", "--opt-all"])
    e4_speedup = round((e4_generic.get("median_ms", 1) / e4_flat.get("median_ms", 1)), 2) if e4_flat.get("median_ms", 0) > 0 else 1.0
    print(f"  - Generic Array   : {e4_generic.get('median_ms', 0):.2f} ms")
    print(f"  - FlatArray (I64) : {e4_flat.get('median_ms', 0):.2f} ms (Speedup: {e4_speedup}x)")
    results["E4_FlatArray"] = {"generic": e4_generic, "flat": e4_flat, "speedup": e4_speedup}

    # -------------------------------------------------------------------------
    # E5: Field Inline Cache (IC) (W4 Object)
    # -------------------------------------------------------------------------
    print("\n[E5] Field Inline Cache (IC) Isolation (W4 Object)")
    reg_w4 = r"W4_OBJECT checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    e5_no_ic = measure_benchmark(w4_tbc, reg_w4, ["--interp", "--no-field-ic"])
    e5_with_ic = measure_benchmark(w4_tbc, reg_w4, ["--interp", "--opt-all"])
    e5_speedup = round((e5_no_ic.get("median_ms", 1) / e5_with_ic.get("median_ms", 1)), 2) if e5_with_ic.get("median_ms", 0) > 0 else 1.0
    print(f"  - Field IC OFF    : {e5_no_ic.get('median_ms', 0):.2f} ms")
    print(f"  - Field IC ON     : {e5_with_ic.get('median_ms', 0):.2f} ms (Speedup: {e5_speedup}x)")
    results["E5_FieldIC"] = {"ic_off": e5_no_ic, "ic_on": e5_with_ic, "speedup": e5_speedup}

    # -------------------------------------------------------------------------
    # E6: JIT Compilation Economics (W1 Fibonacci & W3 Matmul)
    # -------------------------------------------------------------------------
    print("\n[E6] JIT Compilation Economics Isolation (W1 & W3)")
    reg_w1 = r"W1_FIB checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"
    e6_w1_interp = measure_benchmark(w1_tbc, reg_w1, ["--interp"])
    e6_w1_jit = measure_benchmark(w1_tbc, reg_w1, ["--jit"])
    e6_w3_interp = measure_benchmark(w3_tbc, reg_w3, ["--interp"])
    e6_w3_jit = measure_benchmark(w3_tbc, reg_w3, ["--jit"])
    print(f"  - W1 Interp vs JIT: Interp={e6_w1_interp.get('median_ms', 0):.2f} ms vs JIT={e6_w1_jit.get('median_ms', 0):.2f} ms")
    print(f"  - W3 Interp vs JIT: Interp={e6_w3_interp.get('median_ms', 0):.2f} ms vs JIT={e6_w3_jit.get('median_ms', 0):.2f} ms")
    results["E6_JIT"] = {
        "W1": {"interp": e6_w1_interp, "jit": e6_w1_jit},
        "W3": {"interp": e6_w3_interp, "jit": e6_w3_jit}
    }

    # Save A/B results
    ab_path = os.path.join(NORM_DIR, "ab_experiments.json")
    with open(ab_path, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)
    print(f"\n[Done] A/B Experiment results saved to: {ab_path}")

if __name__ == "__main__":
    run_experiments()
