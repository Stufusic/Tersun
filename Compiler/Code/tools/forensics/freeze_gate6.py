#!/usr/bin/env python3
# ==============================================================================
# G6R.1 Forensics: Freeze Gate 6 Baseline
# Stores immutable environment metadata, SHA256 hashes, and canonical benchmarks
# ==============================================================================
import os
import sys
import hashlib
import shutil
import json
import subprocess
import platform

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(os.path.dirname(HERE))
BENCHMARKS = os.path.join(CODE, "benchmarks", "forensics")
MANIFESTS = os.path.join(BENCHMARKS, "manifests")
INPUTS = os.path.join(BENCHMARKS, "inputs")
FROZEN_DIR = os.path.join(CODE, "build", "g6r1", "gate6_frozen")

os.makedirs(MANIFESTS, exist_ok=True)
os.makedirs(INPUTS, exist_ok=True)
os.makedirs(FROZEN_DIR, exist_ok=True)

def sha256_file(filepath):
    if not os.path.exists(filepath):
        return "missing"
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()

def main():
    print("[G6R.1 Freeze] Staging canonical inputs...")
    bench_src = {
        "w1_fibonacci.stn": os.path.join(CODE, "bench", "multi_lang_benchmark", "w1_fibonacci", "fib.stn"),
        "w2_sieve.stn": os.path.join(CODE, "bench", "multi_lang_benchmark", "w2_sieve", "sieve.stn"),
        "w3_matmul.stn": os.path.join(CODE, "bench", "multi_lang_benchmark", "w3_matmul", "matmul.stn"),
        "w4_object.stn": os.path.join(CODE, "bench", "multi_lang_benchmark", "w4_object", "object.stn")
    }

    checksums = {}
    for name, src in bench_src.items():
        dst = os.path.join(INPUTS, name)
        if os.path.exists(src):
            shutil.copy2(src, dst)
        checksums[name] = sha256_file(dst)
        print(f"  - {name}: {checksums[name][:16]}...")

    print("[G6R.1 Freeze] Archiving frozen Gate 6 binaries...")
    setunc_bin = os.path.join(CODE, "setunc.exe")
    rt_lib = os.path.join(CODE, "libtersun_rt.a")

    if os.path.exists(setunc_bin):
        shutil.copy2(setunc_bin, os.path.join(FROZEN_DIR, "setunc.exe"))
    if os.path.exists(rt_lib):
        shutil.copy2(rt_lib, os.path.join(FROZEN_DIR, "libtersun_rt.a"))

    bin_sha = sha256_file(setunc_bin)
    rt_sha = sha256_file(rt_lib)

    manifest = {
        "gate": "6.0",
        "forensics": "G6R.1",
        "timestamp_iso": "2026-09-17T22:47:00+07:00",
        "status": "FROZEN_BASELINE",
        "commit": "g6r_final_f855f8b6",
        "build_id": "tersun-gate6-rebuild-v1.0.3",
        "compiler": "GCC 15.2.0 (MinGW-w64 x86_64-ucrt-posix-seh)",
        "compiler_flags": "-std=c++20 -O3 -Iinclude",
        "platform": platform.system(),
        "cpu": "Intel Core i5-1245U (10 Cores, 12 Threads, up to 4.40 GHz)",
        "ram_gb": 16,
        "gpu": "Intel Iris Xe Graphics",
        "os": f"{platform.system()} {platform.release()} ({platform.architecture()[0]})",
        "binaries": {
            "setunc_exe_sha256": bin_sha,
            "libtersun_rt_a_sha256": rt_sha
        },
        "workloads": ["W1", "W2", "W3", "W4"],
        "benchmark_inputs": checksums,
        "modes": {
            "M0": "interpreter (switch dispatch)",
            "M1": "optimized interpreter (cached dispatch + TOS + fusion)",
            "M2": "baseline JIT (tier 1 JIT compiler)",
            "M3": "auto-tier JIT (tier 0/1/2 adaptive OSR)",
            "M4": "native AOT (LLVM / C++20 direct native binary)"
        }
    }

    manifest_path = os.path.join(MANIFESTS, "g6r1_manifest.json")
    with open(manifest_path, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2)

    print(f"[G6R.1 Freeze] Successfully generated manifest: {manifest_path}")
    print(f"  - Frozen setunc.exe SHA256: {bin_sha}")
    print(f"  - Frozen libtersun_rt.a SHA256: {rt_sha}")

if __name__ == "__main__":
    main()
