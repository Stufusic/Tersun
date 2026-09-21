#include "tensor/kernels/microkernels.hpp"
#include "tensor/bitnet_model.hpp"
#include "tensor/edge_arena.hpp"
#include "tensor/safetensors_loader.hpp"
#include "runtime/target_capabilities.hpp"
#include <iostream>
#include <vector>
#include <cassert>
#include <random>
#include <cstring>
#include <cstdio>

namespace setun::test {

void test_portable_compute_suite() {
    std::cout << "\n[Gate 7.3 - 7.6 Evolution] Testing Portable Compute Runtime & BitNet Pipeline...\n";
    std::cout << "===================================================================\n";
    std::cout << "  [Gate 7] Portable Compute, Microkernel Ladder & BitNet Verification\n";
    std::cout << "===================================================================\n";

    using namespace setun::tensor;
    using namespace setun::tensor::kernels;
    using namespace setun::runtime;

    register_all_bitnet_kernels();

    // ------------------------------------------------------------------------
    // Test 1: Microkernel Ladder K0 - K6 Scalar Reference
    // ------------------------------------------------------------------------
    std::cout << "  [G7.3-1] Testing Microkernel Ladder K0 - K6 Functional Correctness...\n";
    {
        // K0: Decode trits
        // 8 trits: +1, -1, 0, +1, -1, -1, 0, 0
        // Byte 0: t0=+1 (01), t1=-1 (10), t2=0 (00), t3=+1 (01) -> 01 00 10 01b = 0x49
        // Byte 1: t4=-1 (10), t5=-1 (10), t6=0 (00), t7=0 (00) -> 00 00 10 10b = 0x0A
        uint8_t packed[2] = {0x49, 0x0A};
        int8_t unpacked[8] = {0};
        decode_trits_scalar(packed, unpacked, 8);
        assert(unpacked[0] == 1);
        assert(unpacked[1] == -1);
        assert(unpacked[2] == 0);
        assert(unpacked[3] == 1);
        assert(unpacked[4] == -1);
        assert(unpacked[5] == -1);
        assert(unpacked[6] == 0);
        assert(unpacked[7] == 0);

        // K1: Vector Ternary Accumulate
        int32_t accum[8] = {10, 10, 10, 10, 10, 10, 10, 10};
        vector_ternary_accum_scalar(accum, unpacked, 5, 8);
        assert(accum[0] == 15); // +5
        assert(accum[1] == 5);  // -5
        assert(accum[2] == 10); // 0
        assert(accum[3] == 15); // +5
        assert(accum[4] == 5);  // -5

        // K2: Dot Product (vec * packed_w)
        int32_t vec[8] = {2, 3, 100, 4, 1, 2, 999, 888};
        // Expected sum = 2*(1) + 3*(-1) + 100*(0) + 4*(1) + 1*(-1) + 2*(-1) + 0 + 0
        //              = 2 - 3 + 0 + 4 - 1 - 2 = 0
        int32_t dot = dot_product_packed_scalar(vec, packed, 8);
        assert(dot == 0);

        // K5 & K6: GEMM + Bias + ReLU
        int32_t A[8] = {2, 3, 100, 4, 1, 2, 999, 888}; // M=1, K=8
        int32_t bias[1] = {-5};
        int32_t out_c[1] = {-999};
        gemm_packed_bias_relu_scalar(A, packed, bias, out_c, 1, 1, 8);
        // dot was 0, bias is -5 -> 0 + (-5) = -5 -> ReLU(-5) = 0
        assert(out_c[0] == 0);

        bias[0] = 7;
        gemm_packed_bias_relu_scalar(A, packed, bias, out_c, 1, 1, 8);
        // dot was 0, bias is +7 -> 0 + 7 = 7 -> ReLU(7) = 7
        assert(out_c[0] == 7);

        std::cout << "    -> Microkernel ladder K0-K6 validated: all operations mathematically sound!\n";
    }

    // ------------------------------------------------------------------------
    // Test 2: SIMD Specialization & 100% Bit-Exact Parity (Scalar vs AVX2)
    // ------------------------------------------------------------------------
    std::cout << "  [G7.4-1] Testing AVX2 vs Scalar Reference 100% Bit-Exact Parity...\n";
    {
        const size_t K_dim = 128;
        const size_t N_dim = 64;

        std::vector<int32_t> vec_x(K_dim);
        std::vector<uint8_t> packed_w(calc_packed_bytes(K_dim) * N_dim);
        std::vector<int32_t> bias(N_dim);

        // Randomized test vector
        std::mt19937 rng(1337);
        for (size_t i = 0; i < K_dim; ++i) {
            vec_x[i] = static_cast<int32_t>((rng() % 200) - 100);
        }
        for (size_t i = 0; i < packed_w.size(); ++i) {
            packed_w[i] = static_cast<uint8_t>(rng() & 0xFF);
        }
        for (size_t i = 0; i < N_dim; ++i) {
            bias[i] = static_cast<int32_t>((rng() % 50) - 25);
        }

        // Test K2 Dot Product Parity
        int32_t dot_scalar = dot_product_packed_scalar(vec_x.data(), packed_w.data(), K_dim);
        int32_t dot_avx2 = dot_product_packed_avx2(vec_x.data(), packed_w.data(), K_dim);
        assert(dot_scalar == dot_avx2);

        // Test K3 GEMV Parity
        std::vector<int32_t> y_scalar(N_dim, 0);
        std::vector<int32_t> y_avx2(N_dim, 0);
        gemv_packed_scalar(vec_x.data(), packed_w.data(), y_scalar.data(), N_dim, K_dim);
        gemv_packed_avx2(vec_x.data(), packed_w.data(), y_avx2.data(), N_dim, K_dim);
        for (size_t n = 0; n < N_dim; ++n) {
            assert(y_scalar[n] == y_avx2[n]);
        }

        // Test K6 Fused GEMM + Bias + ReLU Parity
        std::vector<int32_t> out_scalar(N_dim, 0);
        std::vector<int32_t> out_avx2(N_dim, 0);
        gemm_packed_bias_relu_scalar(vec_x.data(), packed_w.data(), bias.data(), out_scalar.data(), 1, N_dim, K_dim);
        gemm_packed_bias_relu_avx2(vec_x.data(), packed_w.data(), bias.data(), out_avx2.data(), 1, N_dim, K_dim);
        for (size_t n = 0; n < N_dim; ++n) {
            assert(out_scalar[n] == out_avx2[n]);
        }

        std::cout << "    -> Verified K_dim=128, N_dim=64: Scalar == AVX2 [100% BIT-EXACT PARITY]!\n";
    }

    // ------------------------------------------------------------------------
    // Test 3: Edge Static Arena & Zero-Allocation Inference Guarantee
    // ------------------------------------------------------------------------
    std::cout << "  [G7.5-1] Testing Zero-Allocation Inference Contract (EdgeArena & AllocationProbe)...\n";
    {
        BitNetMnistModel model;
        model.init_synthetic(42);

        std::vector<int32_t> dummy_input(BitNetMnistModel::INPUT_DIM, 1);

        // Warm up run
        int32_t class_first = model.forward(dummy_input.data());

        // Probe active inference loop
        auto probe = AllocationProbe::start();
        int32_t class_pred = model.forward(dummy_input.data());
        size_t allocs = probe.alloc_count();
        size_t deallocs = probe.dealloc_count();
        size_t bytes = probe.allocated_bytes();

        assert(allocs == 0);
        assert(deallocs == 0);
        assert(bytes == 0);
        assert(class_pred == class_first);

        std::cout << "    -> Hot inference loop verified: malloc=0, free=0, new=0, delete=0 [0 ALLOCATIONS]!\n";
        std::cout << "    -> Model parameters: " << model.total_parameters() 
                  << " (Footprint: " << model.total_weight_bytes() << " bytes ~ "
                  << (model.total_weight_bytes() / 1024.0) << " KB)\n";
    }

    // ------------------------------------------------------------------------
    // Test 4: SafeTensors File Format Serialization & Hardening
    // ------------------------------------------------------------------------
    std::cout << "  [G7.6-1] Testing SafeTensors Serialization & Hardening...\n";
    {
        BitNetMnistModel model_orig;
        model_orig.init_synthetic(999);

        const std::string filename = "test_bitnet_mnist.safetensors";
        model_orig.save_safetensors(filename);

        // Load back into new model
        BitNetMnistModel model_loaded;
        model_loaded.load_safetensors(filename);

        std::vector<int32_t> test_input(BitNetMnistModel::INPUT_DIM, 2);
        int32_t logits_orig[10] = {0};
        int32_t logits_loaded[10] = {0};

        int32_t c_orig = model_orig.forward(test_input.data(), logits_orig);
        int32_t c_loaded = model_loaded.forward(test_input.data(), logits_loaded);

        assert(c_orig == c_loaded);
        for (size_t i = 0; i < 10; ++i) {
            assert(logits_orig[i] == logits_loaded[i]);
        }

        // Hardening / Malicious input test: Truncated buffer
        uint8_t malformed[4] = {0x01, 0x02, 0x03, 0x04};
        bool caught = false;
        try {
            SafeTensorsFile::load_from_memory(malformed, 4);
        } catch (const std::exception&) {
            caught = true;
        }
        assert(caught);

        // Clean up temporary test file
        std::remove(filename.c_str());

        std::cout << "    -> SafeTensors serialization, round-trip restoration & hardening passed!\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.3 - 7.6: Portable Compute Runtime Verification 100% Passed!\n";
    std::cout << "===================================================================\n";
}

} // namespace setun::test
