#!/bin/bash
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
