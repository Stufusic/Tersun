import os
import sys
import shutil
import zipfile
import tarfile

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    code_dir = os.path.dirname(script_dir)
    bundle_dir = os.path.join(code_dir, "android_bundle")
    zip_path = os.path.join(code_dir, "tersun_android_bundle.zip")

    if os.path.exists(bundle_dir):
        shutil.rmtree(bundle_dir)
    os.makedirs(bundle_dir, exist_ok=True)

    print("===================================================================")
    print("  Packaging Minimalist Tersun AI Runtime Bundle for Android/Termux  ")
    print("===================================================================")

    # 1. Source files list
    files_to_copy = [
        # CLI
        "include/cli/ai_options.hpp",
        "src/cli/ai_options.cpp",
        "src/cli/ai_runner_main.cpp",
        # Runtime
        "include/runtime/target_capabilities.hpp",
        "include/runtime/kernel_registry.hpp",
        "include/runtime/kernel_abi.hpp",
        "src/runtime/target_capabilities.cpp",
        "src/runtime/kernel_registry.cpp",
        # Tensor & Compiler IR
        "include/compiler/tensor_ir.hpp",
        "src/compiler/tensor_ir.cpp",
        "include/tensor/tensor.hpp",
        "include/tensor/tensor_shape.hpp",
        "include/tensor/tensor_view.hpp",
        "include/tensor/tensor_dtype.hpp",
        "include/tensor/packed_ternary_layout.hpp",
        "include/tensor/edge_arena.hpp",
        "include/tensor/safetensors_loader.hpp",
        "include/tensor/bitnet_model.hpp",
        "include/tensor/kernels/microkernels.hpp",
        "src/tensor/tensor.cpp",
        "src/tensor/edge_arena.cpp",
        "src/tensor/safetensors_loader.cpp",
        "src/tensor/bitnet_model.cpp",
        "src/tensor/kernels/bitnet_scalar_ladder.cpp",
        "src/tensor/kernels/bitnet_avx2.cpp",
        "src/tensor/kernels/bitnet_neon.cpp",
        # Model
        "mnist_bitnet.safetensors",
        # Canonical Vector Suite
        "tests/g7_1/test_canonical_replay.cpp",
        "test_registry/g7_1/vectors/corpus_manifest.json"
    ]

    for rel_path in files_to_copy:
        src = os.path.join(code_dir, rel_path)
        dst = os.path.join(bundle_dir, rel_path)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        if os.path.exists(src):
            shutil.copy2(src, dst)
            print(f"  + Added: {rel_path}")
        else:
            print(f"  ! Warning: {rel_path} not found!")

    # 2. Add minimal Android CMakeLists.txt
    cmake_content = """cmake_minimum_required(VERSION 3.20)
project(TersunAIRunner VERSION 1.0.3 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

# 1. Scalar Kernel Reference (G7.1-SOC: strictly scalar flags)
add_library(tersun_kernel_scalar STATIC
    src/tensor/kernels/bitnet_scalar_ladder.cpp
)
target_include_directories(tersun_kernel_scalar PUBLIC include)
target_compile_options(tersun_kernel_scalar PRIVATE -O3 -fno-tree-vectorize)

# 2. NEON Microkernels (ARM64)
add_library(tersun_kernel_neon STATIC
    src/tensor/kernels/bitnet_neon.cpp
)
target_include_directories(tersun_kernel_neon PUBLIC include)

# 3. Core Tensor & AI Runtime
add_library(tersun_ai_core STATIC
    src/tensor/tensor.cpp
    src/tensor/edge_arena.cpp
    src/tensor/safetensors_loader.cpp
    src/tensor/bitnet_model.cpp
    src/compiler/tensor_ir.cpp
    src/runtime/target_capabilities.cpp
    src/runtime/kernel_registry.cpp
)
target_include_directories(tersun_ai_core PUBLIC include)
target_link_libraries(tersun_ai_core PUBLIC
    tersun_kernel_scalar
    tersun_kernel_neon
)

# 4. CLI Options
add_library(tersun_cli_options STATIC
    src/cli/ai_options.cpp
)
target_include_directories(tersun_cli_options PUBLIC include)

# 5. Standalone Minimalist Executable
add_executable(tersun_ai_runner
    src/cli/ai_runner_main.cpp
)
target_include_directories(tersun_ai_runner PUBLIC include)
target_link_libraries(tersun_ai_runner PRIVATE
    tersun_ai_core
    tersun_cli_options
)

# 6. Canonical Vector Replay Runner
add_executable(test_canonical_replay
    tests/g7_1/test_canonical_replay.cpp
)
target_include_directories(test_canonical_replay PUBLIC include)
target_link_libraries(test_canonical_replay PRIVATE
    tersun_ai_core
)
"""
    with open(os.path.join(bundle_dir, "CMakeLists.txt"), "w", encoding="utf-8") as f:
        f.write(cmake_content)
    print("  + Created: CMakeLists.txt (Minimalist Android Termux configuration)")

    # 3. Add 1-line build and run script for Termux
    build_sh_content = """#!/bin/bash
set -e

echo "=== Building Tersun AI Runner on Android Termux ==="
mkdir -p build
cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release
ninja

echo ""
echo "=== Step 1: Inspect Target Hardware Capabilities ==="
./tersun_ai_runner profile

echo ""
echo "=== Step 2: Run Forward Inference with Scalar Oracle ==="
./tersun_ai_runner run ../mnist_bitnet.safetensors --target=scalar

echo ""
echo "=== Step 3: Run Cross-Architecture Parity Verification ==="
./tersun_ai_runner cross-check ../mnist_bitnet.safetensors

echo ""
echo "=== Step 4: Run High-Load Benchmark (10,000 inferences) ==="
./tersun_ai_runner benchmark ../mnist_bitnet.safetensors --iterations=10000 --export=android_bench.json

echo ""
echo "=== Step 5: Run 64 Canonical Vector Replay on NEON & Scalar ==="
./test_canonical_replay --backend=scalar --manifest=../test_registry/g7_1/vectors/corpus_manifest.json --out=../result_arm64_scalar.json
./test_canonical_replay --backend=neon --manifest=../test_registry/g7_1/vectors/corpus_manifest.json --out=../result_arm64_neon.json

echo ""
echo "==================================================================="
echo "  All 5 steps completed successfully on Physical Android ARM64!   "
echo "==================================================================="
"""
    build_sh_path = os.path.join(bundle_dir, "build_termux.sh")
    with open(build_sh_path, "w", encoding="utf-8", newline='\n') as f:
        f.write(build_sh_content)
    print("  + Created: build_termux.sh (Automatic 1-command build & test)")

    # 4. Create zip bundle
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
        for root, dirs, files in os.walk(bundle_dir):
            for file in files:
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, bundle_dir)
                zf.write(full_path, rel_path)

    print(f"\n[SUCCESS] Android Bundle created at:\n  - Directory: {bundle_dir}\n  - Zip Archive: {zip_path}")
    print(f"  - Size: {os.path.getsize(zip_path)} bytes (~{os.path.getsize(zip_path)/1024.0:.2f} KB)")
    print("===================================================================")

if __name__ == "__main__":
    main()
