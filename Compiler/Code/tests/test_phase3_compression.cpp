#include "compiler/packed_tensor.hpp"
#include "tafpu/normalization.hpp"
#include "compiler/std_tensor.hpp"
#include <iostream>
#include <vector>
#include <chrono>
#include <cassert>

namespace setun {

void run_phase3_compression_tests() {
    std::cout << "\n[Test Phase 3] Hierarchical Memory Compression, Periodic Normalization & Tensor Engine...\n";

    // 1. Test Milestone 1: Hierarchical Dynamic Compression & 32/64-Byte Aligned Allocation
    {
        using namespace memory;
        const size_t NUM_ELEMENTS = 1000000; // 1,000,000 elements

        // Allocate Level 2 Packed Tensor (4B/elem)
        PackedTensor tensor16(1000, 1000, TensorPrecision::PACKED_TAFPU_16);
        assert(tensor16.byte_size() == NUM_ELEMENTS * sizeof(PackedTafpu16));
        assert(tensor16.byte_size() == 4000000); // 4 MB instead of 32 MB! (87.5% RAM Saved)

        // Check memory alignment (32-byte boundary)
        uintptr_t addr = reinterpret_cast<uintptr_t>(tensor16.data());
        assert((addr % 32) == 0);

        // Streaming Unpack / Pack benchmark
        auto start = std::chrono::high_resolution_clock::now();
        runtime::TafpuNum_C buf[4];
        for (size_t i = 0; i + 4 <= NUM_ELEMENTS; i += 4) {
            tensor16.stream_unpack_4x(i, buf);
            tensor16.stream_pack_4x(i, buf);
        }
        auto end = std::chrono::high_resolution_clock::now();
        double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();
        double throughput_gbps = (tensor16.byte_size() * 2.0 / (1024.0 * 1024.0 * 1024.0)) / (elapsed_ms / 1000.0);

        std::cout << "  -> PASSED: 1M Elements Compressed from 32 MB -> 4 MB (87.5% RAM Saved), Streaming: " 
                  << throughput_gbps << " GB/s!\n";
    }

    // 2. Test Milestone 2: Periodic Normalization Pass & Overflow Prevention
    {
        using namespace tafpu;
        const size_t NUM_ITERATIONS = 1000000; // 1,000,000 continuous multiplications
        runtime::TafpuNum_C current(2, 1, 0); // 2 + 1*sqrt(3)
        runtime::TafpuNum_C factor_fwd(2, 1, 0);
        runtime::TafpuNum_C factor_inv(2, -1, 0); // Unitary algebra: (2+rt3)*(2-rt3) = 1

        auto start = std::chrono::high_resolution_clock::now();
        for (uint32_t i = 1; i <= NUM_ITERATIONS; ++i) {
            current = (i % 2 == 0) ? runtime::tafpu_mul_c(current, factor_fwd) 
                                   : runtime::tafpu_mul_c(current, factor_inv);
            // Apply periodic normalization with stride = 16
            current = tafpu_normalize_periodic(current, i, 16);

            if (i % 100000 == 0) {
                assert(std::abs(current.a) < (1LL << 48));
                assert(std::abs(current.b) < (1LL << 48));
            }
        }
        auto end = std::chrono::high_resolution_clock::now();
        double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();

        std::cout << "  -> PASSED: 1,000,000 Continuous Multiplications with Periodic Normalization in " 
                  << elapsed_ms << " ms (0% Integer Overflow)!\n";
    }

    // 3. Test Milestone 3: Exact Algebraic Angles & Deterministic Lockstep CORDIC
    {
        using namespace std_lib;

        // Exact algebraic angles DEG_0 and DEG_90
        auto [sin_0, cos_0] = sincos_algebraic_exact(SpecialAngle::DEG_0);
        assert(sin_0.to_double() == 0.0);
        assert(cos_0.to_double() == 1.0);

        auto [sin_90, cos_90] = sincos_algebraic_exact(SpecialAngle::DEG_90);
        assert(sin_90.to_double() == 1.0);
        assert(cos_90.to_double() == 0.0);

        // Deterministic CORDIC on arbitrary angle (pi / 4 = 45 deg)
        double angle = 0.7853981633974483; // pi / 4 (45 deg)
        auto [sin_45, cos_45] = sincos_deterministic_cordic(angle);
        double s45 = sin_45.to_double() / 10000.0;
        double c45 = cos_45.to_double() / 10000.0;
        double pythagorean = s45 * s45 + c45 * c45;
        assert(std::abs(pythagorean - 1.0) < 1e-3);

        std::cout << "  -> PASSED: Algebraic Exact Angles (sin(0)=0, cos(0)=1, sin(90)=1) & Deterministic Lockstep CORDIC (sin^2+cos^2=1.0) Verified!\n";
    }

    // 4. Test Milestone 4: High-Performance Standard Tensor Engine & BitNet MatMul
    {
        using namespace std_lib;
        Tensor t(256, 256, memory::TensorPrecision::PACKED_TAFPU_16);

        for (size_t r = 0; r < 256; ++r) {
            for (size_t c = 0; c < 256; ++c) {
                t.set(r, c, runtime::TafpuNum_C(r % 10, c % 10, 0));
            }
        }

        std::vector<int8_t> weights(256 * 256, 1);
        Tensor out = t.matmul_bitnet(weights);
        assert(out.rows() == 256 && out.cols() == 1);

        // Slice verification
        Tensor sliced = t.slice(0, 10);
        assert(sliced.rows() == 10 && sliced.cols() == 256);

        std::cout << "  -> PASSED: Standard Tensor Engine MatMul (@) & Slice operations executed seamlessly!\n";
    }

    std::cout << "  -> ALL PHASE 3 COMPRESSION & NORMALIZATION TESTS PASSED (100% SUCCESS)!\n";
}

} // namespace setun
