import os
import sys
import subprocess
import json
import time

def main():
    code_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    bench_cpp = os.path.join(code_dir, "bench", "bench_layout_calibration.cpp")
    bench_exe = os.path.join(code_dir, "bench", "bench_layout_calibration.exe")
    registry_dir = os.path.join(code_dir, "test_registry", "g7")
    os.makedirs(registry_dir, exist_ok=True)
    out_json_path = os.path.join(registry_dir, "layout_calibration.json")

    print("[G7.35] Compiling bench_layout_calibration.cpp with -O3 -mavx2 -mfma...")
    src_files = [
        bench_cpp,
        os.path.join(code_dir, "src", "tensor", "tensor.cpp"),
        os.path.join(code_dir, "src", "tensor", "kernels", "bitnet_scalar_ladder.cpp"),
        os.path.join(code_dir, "src", "tensor", "kernels", "bitnet_avx2.cpp"),
        os.path.join(code_dir, "src", "tensor", "kernels", "bitnet_neon.cpp"),
        os.path.join(code_dir, "src", "runtime", "target_capabilities.cpp"),
        os.path.join(code_dir, "src", "runtime", "kernel_registry.cpp"),
    ]

    compile_cmd = [
        "g++", "-std=c++20", "-O3", "-mavx2", "-mfma",
        f"-I{os.path.join(code_dir, 'include')}",
        *src_files,
        "-o", bench_exe
    ]

    res = subprocess.run(compile_cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"[FAIL] Compilation error:\n{res.stderr}")
        sys.exit(1)
    print(f"[OK] Compiled successfully to {bench_exe}")

    print("[G7.35] Running Microkernel Ladder & Layout Calibration Benchmarks...")
    run_res = subprocess.run([bench_exe], capture_output=True, text=True)
    print(run_res.stdout)

    if "JSON_RESULT_START" in run_res.stdout:
        json_part = run_res.stdout.split("JSON_RESULT_START")[1].split("JSON_RESULT_END")[0].strip()
        data = json.loads(json_part)
        data["timestamp"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        data["workload"] = "BitNet MNIST 1.58-bit Layer Dimensions (M=1, N=128, K=784)"
        with open(out_json_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2)
        print(f"[OK] Calibration data sealed in: {out_json_path}")
    else:
        print("[WARN] JSON block not detected in benchmark output.")

if __name__ == "__main__":
    main()
