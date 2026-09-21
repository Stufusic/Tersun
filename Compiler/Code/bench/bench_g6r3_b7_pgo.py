#!/usr/bin/env python3
# ==============================================================================
# Tersun Gate 6R.3 Forensic Benchmark & Verification Tool
# Step G6R.3-B7: Profile-Guided Optimization (PGO) Pipeline Integration
# 1. Compiles setunc with -fprofile-generate
# 2. Trains on canonical W1-W4 workloads
# 3. Compiles setunc with -fprofile-use
# 4. Measures W1-W4 in pure interpreter mode (--interp) across N=30 runs
# 5. Snapshots objdump disassembly to B7_pgo_pipeline.asm
# 6. Produces test_registry/g6r3/b7_pgo_pipeline.json with full attribution trail
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
import shutil

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
REGISTRY_G6R3 = os.path.join(CODE, "test_registry", "g6r3")
DISASM_DIR = os.path.join(CODE, "benchmarks", "g6r3", "disassembly")
PGO_DIR = os.path.join(CODE, "pgo_data")
SETUNC_PGO_GEN = os.path.join(CODE, "setunc_pgo_gen.exe")
SETUNC_PGO = os.path.join(CODE, "setunc_pgo.exe")
B1_JSON = os.path.join(REGISTRY_G6R3, "b1_baseline.json")
B5_JSON = os.path.join(REGISTRY_G6R3, "b5_guarded_quickening_field_ic.json")
B6_JSON = os.path.join(REGISTRY_G6R3, "b6_dataflow_superinstructions.json")

SRC_CORE = [
    "src/main.cpp", "src/tafpu/trit.cpp", "src/tafpu/tafpu.cpp", "src/tafpu/bitnet_engine.cpp",
    "src/compiler/lexer.cpp", "src/compiler/parser.cpp", "src/compiler/tree_canonicalize.cpp",
    "src/compiler/tree_optimizer.cpp", "src/compiler/opt_ir.cpp", "src/compiler/cfg.cpp",
    "src/compiler/ir_optimizer.cpp", "src/compiler/ir_to_bytecode.cpp", "src/compiler/module_resolver.cpp",
    "src/compiler/types.cpp", "src/compiler/type_checker.cpp", "src/compiler/monomorphizer.cpp",
    "src/compiler/emitter.cpp", "src/compiler/llvm_emitter.cpp", "src/compiler/llvm2qvm.cpp",
    "src/compiler/q_emitter.cpp", "src/qvm/qreg.cpp", "src/qvm/qgate.cpp", "src/qvm/qcircuit_opt.cpp",
    "src/qvm/qvm.cpp", "src/vm/vm.cpp", "src/vm/vm_profiler.cpp", "src/vm/vm_telemetry.cpp",
    "src/vm/vm_execution_state.cpp", "src/vm/tos_cache.cpp", "src/vm/field_ic.cpp",
    "src/vm/tier_cost_model.cpp", "src/vm/superinstruction.cpp", "src/vm/array_storage.cpp",
    "src/vm/gc.cpp", "src/vm/type_descriptor.cpp", "src/vm/gc_heap.cpp", "src/vm/gc_engine.cpp",
    "src/vm/gc_debug.cpp", "src/vm/jit_engine.cpp", "src/vm/x64_assembler.cpp", "src/vm/jit_buffer.cpp",
    "src/vm/jit_runtime_helpers.cpp", "src/vm/jit_lir.cpp", "src/vm/jit_safepoint.cpp",
    "src/vm/baseline_jit.cpp", "src/vm/jit_manager.cpp", "src/vm/jit_osr.cpp", "src/vm/jit_deopt.cpp",
    "src/vm/machine_ir.cpp", "src/vm/type_feedback.cpp", "src/vm/jit_materialization.cpp",
    "src/vm/linear_scan.cpp", "src/vm/escape_analysis.cpp", "src/vm/induction_variable.cpp",
    "src/vm/mir_optimizer.cpp", "src/vm/optimizing_jit.cpp", "src/vm/runtime_metadata.cpp",
    "src/vm/inline_cache.cpp", "src/ffi/libsetun_ffi.cpp", "src/hardware/verilog_emitter.cpp",
    "src/tools/tpm.cpp", "src/tools/bindgen.cpp", "src/tools/debugger.cpp", "src/tools/formatter.cpp",
    "src/tools/lsp_server.cpp", "src/tools/test_runner_stub.cpp", "src/game/game_engine_integration.cpp",
    "src/kernel/microkernel.cpp", "src/graphics/setun2d_bridge.cpp"
]

def sha256_file(filepath):
    if not os.path.exists(filepath):
        return "missing"
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()

def run_cmd(cmd, cwd=CODE, timeout=600):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)
    return p.returncode, p.stdout.strip(), p.stderr.strip()

def build_binary(extra_flags, out_bin):
    print(f"[*] Compiling {os.path.basename(out_bin)} with flags: {' '.join(extra_flags)}...")
    cmd = [
        "g++", "-std=c++20", "-O3", "-mavx2", "-mfma", "-fopenmp", "-Iinclude"
    ] + extra_flags + SRC_CORE + ["-lgdi32", "-luser32", "-lcomdlg32", "-o", out_bin]
    rc, out, err = run_cmd(cmd)
    if rc != 0:
        print(f"[-] Compilation error for {out_bin}:\n{err or out}")
        sys.exit(1)
    print(f"[+] Successfully built {out_bin} (SHA256={sha256_file(out_bin)[:12]})")

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

def snapshot_disassembly(binary_path, output_asm_path):
    os.makedirs(os.path.dirname(output_asm_path), exist_ok=True)
    objdump_cmd = ["objdump", "-d", "-C", "--no-show-raw-insn", binary_path]
    print(f"[*] Extracting objdump disassembly to {output_asm_path}...")
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
    except Exception as e:
        print(f"[-] Warning: Failed to run objdump: {e}")

def run_workload(binary, name, source_stn, regex_pattern, reps=30, warmup=5):
    print(f"\n[+] Benchmarking {name} ({source_stn}) [warmup={warmup}, reps={reps}]...")
    pat = re.compile(regex_pattern)
    for _ in range(warmup):
        rc, out, err = run_cmd([binary, "run", "--interp", source_stn])
        if rc != 0:
            print(f"[-] Error during warmup: {err or out}")
            sys.exit(1)
    times = []
    checksums = set()
    for r in range(reps):
        rc, out, err = run_cmd([binary, "run", "--interp", source_stn])
        if rc != 0:
            print(f"[-] Error during measurement {r+1}: {err or out}")
            sys.exit(1)
        m = pat.search(out)
        if not m:
            print(f"[-] Regex mismatch: {out}")
            sys.exit(1)
        checksums.add(m.group(1))
        times.append(int(m.group(2)))
    csum = list(checksums)[0]
    stats = compute_statistics(times)
    print(f"    --> Checksum: {csum}")
    print(f"    --> Median: {stats['median_ms']} ms ({stats['median_us']} us) | P95: {stats['p95_ms']} ms | CV: {stats['cv_percent']}%")
    return {"checksum": csum, "stats": stats, "raw_times_us": times}

def main():
    print("==================================================================")
    print("  TERSON GATE 6R.3 FORENSIC BENCHMARK: STEP B7 (PGO PIPELINE)")
    print("==================================================================")
    
    if os.path.exists(PGO_DIR):
        shutil.rmtree(PGO_DIR)
    os.makedirs(PGO_DIR, exist_ok=True)
    pgo_dir_esc = PGO_DIR.replace("\\", "/")

    # 1. Compile instrumented binary
    print("\n--- Phase 1: Compile Profile-Generating Binary ---")
    build_binary([f"-fprofile-generate={pgo_dir_esc}"], SETUNC_PGO_GEN)

    # 2. Train on workloads
    print("\n--- Phase 2: Training Profile Data on W1-W4 ---")
    workloads_def = [
        ("W1_FIB", os.path.join(HERE, "multi_lang_benchmark", "w1_fibonacci", "fib.stn"), r"W1_FIB checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"),
        ("W2_SIEVE", os.path.join(HERE, "multi_lang_benchmark", "w2_sieve", "sieve.stn"), r"W2_SIEVE checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"),
        ("W3_MATMUL", os.path.join(HERE, "multi_lang_benchmark", "w3_matmul", "matmul.stn"), r"W3_MATMUL checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)"),
        ("W4_OBJECT", os.path.join(HERE, "multi_lang_benchmark", "w4_object", "object.stn"), r"W4_OBJECT checksum=([0-9eE\.\+\-]+)\s+time_us=(\d+)")
    ]
    for name, stn, _ in workloads_def:
        print(f"[*] Training on {name}...")
        for _ in range(5):
            run_cmd([SETUNC_PGO_GEN, "run", "--interp", stn])
    print("[+] Training completed. Profile data generated in:", PGO_DIR)

    # 3. Compile optimized binary with profile-use
    print("\n--- Phase 3: Compile Profile-Optimized Binary (-fprofile-use) ---")
    build_binary([f"-fprofile-use={pgo_dir_esc}", "-fprofile-correction"], SETUNC_PGO)

    # 4. Snapshot disassembly
    asm_path = os.path.join(DISASM_DIR, "B7_pgo_pipeline.asm")
    snapshot_disassembly(SETUNC_PGO, asm_path)

    # 5. Measure W1-W4 across N=30
    print("\n--- Phase 4: N=30 Forensic Measurement on PGO Binary ---")
    results = {}
    comparisons = {}

    b1_data = json.load(open(B1_JSON, "r", encoding="utf-8")).get("workloads", {}) if os.path.exists(B1_JSON) else {}
    b6_data = json.load(open(B6_JSON, "r", encoding="utf-8")).get("workloads", {}) if os.path.exists(B6_JSON) else {}

    for name, stn, reg in workloads_def:
        res = run_workload(SETUNC_PGO, name, stn, reg, reps=30, warmup=5)
        results[name] = res
        cmp_entry = {}
        b7_med = res["stats"]["median_ms"]

        if name in b1_data:
            b1_med = b1_data[name]["stats"]["median_ms"]
            cmp_entry["b1_median_ms"] = b1_med
            cmp_entry["speedup_vs_b1"] = round(b1_med / b7_med, 3) if b7_med > 0 else 1.0
            cmp_entry["pct_vs_b1"] = round((b7_med - b1_med) / b1_med * 100.0, 2)
            cmp_entry["checksum_verified"] = (b1_data[name]["checksum"] == res["checksum"])

        if name in b6_data:
            b6_med = b6_data[name]["stats"]["median_ms"]
            cmp_entry["b6_median_ms"] = b6_med
            cmp_entry["speedup_vs_b6"] = round(b6_med / b7_med, 3) if b7_med > 0 else 1.0
            cmp_entry["pgo_isolated_speedup"] = round(b6_med / b7_med, 3) if b7_med > 0 else 1.0
            cmp_entry["pgo_delta_pct"] = round((b7_med - b6_med) / b6_med * 100.0, 2)

        comparisons[name] = cmp_entry
        print(f"    --> vs B1: {cmp_entry.get('speedup_vs_b1')}x | PGO Speedup vs B6: {cmp_entry.get('speedup_vs_b6')}x | Parity: {cmp_entry.get('checksum_verified')}")

    seal_doc = {
        "milestone": "G6R.3",
        "step": "G6R.3-B7",
        "stage": "B7_PGO_Pipeline_Verification",
        "timestamp_utc": time.strftime("%Y-%m-%d %H:%M:%SZ", time.gmtime()),
        "mode": "pure_interpreter",
        "compiler_flags": f"-std=c++20 -O3 -mavx2 -mfma -fopenmp -fprofile-use={pgo_dir_esc}",
        "binary_sha256": sha256_file(SETUNC_PGO),
        "disassembly_snapshot": "benchmarks/g6r3/disassembly/B7_pgo_pipeline.asm",
        "workloads": results,
        "comparisons": comparisons
    }
    seal_doc["seal_sha256"] = hashlib.sha256(json.dumps(seal_doc, indent=2).encode("utf-8")).hexdigest()

    out_json = os.path.join(REGISTRY_G6R3, "b7_pgo_pipeline.json")
    with open(out_json, "w", encoding="utf-8") as f:
        json.dump(seal_doc, f, indent=2)

    print(f"\n[+] Step B7 Locked and Sealed successfully: {out_json}")
    print(f"[+] Cryptographic Seal SHA256: {seal_doc['seal_sha256']}")
    print("==================================================================")

if __name__ == "__main__":
    main()
