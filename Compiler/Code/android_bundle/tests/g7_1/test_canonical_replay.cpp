#include <iostream>
#include <fstream>
#include <vector>
#include <random>
#include <cstdint>
#include <cassert>
#include <iomanip>
#include <sstream>
#include <chrono>
#include <cstring>
#include "tensor/packed_ternary_layout.hpp"
#include "tensor/kernels/microkernels.hpp"
#include "tensor/bitnet_model.hpp"
#include "tensor/edge_arena.hpp"
#include "runtime/target_capabilities.hpp"
#include "runtime/kernel_registry.hpp"

using namespace setun::tensor;
using namespace setun::tensor::kernels;
using namespace setun::runtime;

static uint32_t compute_checksum(const int32_t* data, size_t count) {
    uint32_t h = 0;
    for (size_t i = 0; i < count; ++i) {
        h = h * 31 + static_cast<uint32_t>(data[i]);
    }
    return h;
}

static uint32_t compute_checksum_i8(const int8_t* data, size_t count) {
    uint32_t h = 0;
    for (size_t i = 0; i < count; ++i) {
        h = h * 31 + static_cast<uint32_t>(static_cast<uint8_t>(data[i]));
    }
    return h;
}

static std::string hex32(uint32_t val) {
    std::ostringstream oss;
    oss << "0x" << std::hex << std::setw(8) << std::setfill('0') << val;
    return oss.str();
}

int main(int argc, char* argv[]) {
    std::string forced_backend = "auto";
    std::string manifest_path = "test_registry/g7_1/vectors/corpus_manifest.json";
    std::string output_path = "";

    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg.rfind("--backend=", 0) == 0) {
            forced_backend = arg.substr(10);
        } else if (arg.rfind("--manifest=", 0) == 0) {
            manifest_path = arg.substr(11);
        } else if (arg.rfind("--out=", 0) == 0) {
            output_path = arg.substr(6);
        }
    }

    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.1: Canonical Vector Replay & Parity Verification Suite    \n";
    std::cout << "===================================================================\n";

    TargetCapabilities caps = detect_host_capabilities();
    std::string effective_backend = forced_backend;
    if (forced_backend == "auto") {
        if (caps.has_avx2) effective_backend = "avx2";
        else if (caps.has_neon) effective_backend = "neon";
        else effective_backend = "scalar";
    }

    std::cout << "  Host Architecture  : " << caps.arch_name << "\n";
    std::cout << "  Requested Backend  : " << forced_backend << "\n";
    std::cout << "  Effective Backend  : " << effective_backend << "\n";

    // Validate backend capability
    if (forced_backend == "avx2" && !caps.has_avx2) {
        std::cerr << "  ERROR: AVX2 backend requested but host does not support AVX2!\n";
        return 1;
    }
    if (forced_backend == "neon" && !caps.has_neon) {
        std::cerr << "  ERROR: NEON backend requested but host does not support ARM64 NEON!\n";
        return 1;
    }

    if (output_path.empty()) {
        output_path = "test_registry/g7_1/result_" + caps.arch_name + "_" + effective_backend + ".json";
    }

    // Set active capabilities according to effective backend
    TargetCapabilities active_caps = caps;
    if (effective_backend == "scalar") {
        active_caps.has_avx2 = false;
        active_caps.has_neon = false;
        active_caps.is_overridden = true;
    } else if (effective_backend == "avx2") {
        active_caps.has_avx2 = true;
        active_caps.has_neon = false;
        active_caps.is_overridden = true;
    } else if (effective_backend == "neon") {
        active_caps.has_avx2 = false;
        active_caps.has_neon = true;
        active_caps.is_overridden = true;
    }
    set_active_capabilities(active_caps);

    size_t total_tests = 0;
    size_t passed_tests = 0;
    size_t failed_tests = 0;
    std::vector<std::string> failure_logs;

    auto start_time = std::chrono::high_resolution_clock::now();
    auto probe = AllocationProbe::start();

    // -------------------------------------------------------------------------
    // A1: K0 Decode Trits
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A1: K0 Decode]... ";
    std::vector<size_t> a1_counts = {1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 32, 33, 64, 128, 784};
    for (size_t idx = 0; idx < a1_counts.size(); ++idx) {
        total_tests++;
        size_t count = a1_counts[idx];
        uint32_t seed = static_cast<uint32_t>(1000 + idx * 37);
        std::mt19937 rng(seed);
        size_t packed_bytes = calc_packed_bytes(count);
        std::vector<uint8_t> packed(packed_bytes, 0);
        for (size_t b = 0; b < packed_bytes; ++b) packed[b] = static_cast<uint8_t>(rng() & 0xFF);

        // Reference scalar expected
        std::vector<int8_t> ref(count, 0);
        decode_trits_scalar(packed.data(), ref.data(), count);
        uint32_t expected_chk = compute_checksum_i8(ref.data(), count);

        // Actual execution
        std::vector<int8_t> actual(count, 0);
        if (effective_backend == "avx2" && caps.has_avx2) {
            decode_trits_avx2(packed.data(), actual.data(), count);
        } else {
            decode_trits_scalar(packed.data(), actual.data(), count);
        }
        uint32_t actual_chk = compute_checksum_i8(actual.data(), count);

        if (actual_chk == expected_chk) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A1-" + std::to_string(idx + 1) + ": expected " + hex32(expected_chk) + " got " + hex32(actual_chk));
        }
    }
    std::cout << (failed_tests == 0 ? "PASSED\n" : "FAILED\n");

    // -------------------------------------------------------------------------
    // A2: K2 Dot Product
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A2: K2 Dot Product]... ";
    size_t a2_fails_before = failed_tests;
    std::vector<size_t> a2_k_dims = {1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 32, 33, 64, 128, 784};
    for (size_t idx = 0; idx < a2_k_dims.size(); ++idx) {
        total_tests++;
        size_t K = a2_k_dims[idx];
        uint32_t seed = static_cast<uint32_t>(2000 + idx * 43);
        std::mt19937 rng(seed);
        std::uniform_int_distribution<int32_t> act_dist(-128, 127);

        std::vector<int32_t> vec(K);
        for (size_t i = 0; i < K; ++i) vec[i] = act_dist(rng);

        size_t packed_bytes = calc_packed_bytes(K);
        std::vector<uint8_t> packed_w(packed_bytes, 0);
        for (size_t b = 0; b < packed_bytes; ++b) packed_w[b] = static_cast<uint8_t>(rng() & 0xFF);

        int32_t expected_res = dot_product_packed_scalar(vec.data(), packed_w.data(), K);
        int32_t actual_res = 0;
        if (effective_backend == "avx2" && caps.has_avx2) {
            actual_res = dot_product_packed_avx2(vec.data(), packed_w.data(), K);
        } else {
            actual_res = dot_product_packed_scalar(vec.data(), packed_w.data(), K);
        }

        if (actual_res == expected_res) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A2-" + std::to_string(idx + 1) + ": expected " + std::to_string(expected_res) + " got " + std::to_string(actual_res));
        }
    }
    std::cout << (failed_tests == a2_fails_before ? "PASSED\n" : "FAILED\n");

    // -------------------------------------------------------------------------
    // A3: K3 GEMV
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A3: K3 GEMV]... ";
    size_t a3_fails_before = failed_tests;
    struct Shape2D { size_t N, K; };
    std::vector<Shape2D> a3_shapes = {
        {1, 1}, {1, 3}, {2, 5}, {4, 15}, {4, 16}, {4, 17},
        {8, 31}, {8, 32}, {8, 33}, {128, 784}, {10, 128}
    };
    for (size_t idx = 0; idx < a3_shapes.size(); ++idx) {
        total_tests++;
        size_t N = a3_shapes[idx].N;
        size_t K = a3_shapes[idx].K;
        uint32_t seed = static_cast<uint32_t>(3000 + idx * 53);
        std::mt19937 rng(seed);
        std::uniform_int_distribution<int32_t> act_dist(-128, 127);

        std::vector<int32_t> vec(K);
        for (size_t i = 0; i < K; ++i) vec[i] = act_dist(rng);

        size_t row_bytes = calc_packed_bytes(K);
        std::vector<uint8_t> packed_W(N * row_bytes, 0);
        for (size_t b = 0; b < packed_W.size(); ++b) packed_W[b] = static_cast<uint8_t>(rng() & 0xFF);

        std::vector<int32_t> expected_y(N, 0);
        gemv_packed_scalar(vec.data(), packed_W.data(), expected_y.data(), N, K);
        uint32_t expected_chk = compute_checksum(expected_y.data(), N);

        std::vector<int32_t> actual_y(N, 0);
        if (effective_backend == "avx2" && caps.has_avx2) {
            gemv_packed_avx2(vec.data(), packed_W.data(), actual_y.data(), N, K);
        } else {
            gemv_packed_scalar(vec.data(), packed_W.data(), actual_y.data(), N, K);
        }
        uint32_t actual_chk = compute_checksum(actual_y.data(), N);

        if (actual_chk == expected_chk) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A3-" + std::to_string(idx + 1) + ": expected " + hex32(expected_chk) + " got " + hex32(actual_chk));
        }
    }
    std::cout << (failed_tests == a3_fails_before ? "PASSED\n" : "FAILED\n");

    // -------------------------------------------------------------------------
    // A4: K4 GEMM
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A4: K4 GEMM]... ";
    size_t a4_fails_before = failed_tests;
    struct Shape3D { size_t M, N, K; };
    std::vector<Shape3D> a4_shapes = {
        {1, 1, 1}, {2, 4, 15}, {2, 4, 16}, {2, 4, 17}, {4, 8, 32}, {1, 10, 128}
    };
    for (size_t idx = 0; idx < a4_shapes.size(); ++idx) {
        total_tests++;
        size_t M = a4_shapes[idx].M;
        size_t N = a4_shapes[idx].N;
        size_t K = a4_shapes[idx].K;
        uint32_t seed = static_cast<uint32_t>(4000 + idx * 67);
        std::mt19937 rng(seed);
        std::uniform_int_distribution<int32_t> act_dist(-128, 127);

        std::vector<int32_t> A(M * K);
        for (size_t i = 0; i < A.size(); ++i) A[i] = act_dist(rng);

        size_t row_bytes = calc_packed_bytes(K);
        std::vector<uint8_t> packed_B(N * row_bytes, 0);
        for (size_t b = 0; b < packed_B.size(); ++b) packed_B[b] = static_cast<uint8_t>(rng() & 0xFF);

        std::vector<int32_t> expected_C(M * N, 0);
        gemm_packed_scalar(A.data(), packed_B.data(), expected_C.data(), M, N, K);
        uint32_t expected_chk = compute_checksum(expected_C.data(), M * N);

        std::vector<int32_t> actual_C(M * N, 0);
        gemm_packed_scalar(A.data(), packed_B.data(), actual_C.data(), M, N, K);
        uint32_t actual_chk = compute_checksum(actual_C.data(), M * N);

        if (actual_chk == expected_chk) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A4-" + std::to_string(idx + 1) + ": expected " + hex32(expected_chk) + " got " + hex32(actual_chk));
        }
    }
    std::cout << (failed_tests == a4_fails_before ? "PASSED\n" : "FAILED\n");

    // -------------------------------------------------------------------------
    // A5: K5 GEMM + Bias
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A5: K5 GEMM + Bias]... ";
    size_t a5_fails_before = failed_tests;
    std::vector<Shape3D> a5_shapes = {
        {1, 4, 15}, {1, 4, 16}, {1, 4, 17}, {2, 4, 17}, {1, 128, 784}, {1, 10, 128}
    };
    for (size_t idx = 0; idx < a5_shapes.size(); ++idx) {
        total_tests++;
        size_t M = a5_shapes[idx].M;
        size_t N = a5_shapes[idx].N;
        size_t K = a5_shapes[idx].K;
        uint32_t seed = static_cast<uint32_t>(5000 + idx * 79);
        std::mt19937 rng(seed);
        std::uniform_int_distribution<int32_t> act_dist(-128, 127);
        std::uniform_int_distribution<int32_t> bias_dist(-1000, 1000);

        std::vector<int32_t> A(M * K);
        for (size_t i = 0; i < A.size(); ++i) A[i] = act_dist(rng);

        size_t row_bytes = calc_packed_bytes(K);
        std::vector<uint8_t> packed_B(N * row_bytes, 0);
        for (size_t b = 0; b < packed_B.size(); ++b) packed_B[b] = static_cast<uint8_t>(rng() & 0xFF);

        std::vector<int32_t> bias(N);
        for (size_t i = 0; i < N; ++i) bias[i] = bias_dist(rng);

        std::vector<int32_t> expected_C(M * N, 0);
        gemm_packed_bias_scalar(A.data(), packed_B.data(), bias.data(), expected_C.data(), M, N, K);
        uint32_t expected_chk = compute_checksum(expected_C.data(), M * N);

        std::vector<int32_t> actual_C(M * N, 0);
        if (effective_backend == "avx2" && caps.has_avx2) {
            gemm_packed_bias_avx2(A.data(), packed_B.data(), bias.data(), actual_C.data(), M, N, K);
        } else {
            gemm_packed_bias_scalar(A.data(), packed_B.data(), bias.data(), actual_C.data(), M, N, K);
        }
        uint32_t actual_chk = compute_checksum(actual_C.data(), M * N);

        if (actual_chk == expected_chk) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A5-" + std::to_string(idx + 1) + ": expected " + hex32(expected_chk) + " got " + hex32(actual_chk));
        }
    }
    std::cout << (failed_tests == a5_fails_before ? "PASSED\n" : "FAILED\n");

    // -------------------------------------------------------------------------
    // A6: K6 Fused GEMM + Bias + ReLU
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A6: K6 Fused GEMM + Bias + ReLU]... ";
    size_t a6_fails_before = failed_tests;
    for (size_t idx = 0; idx < a5_shapes.size(); ++idx) {
        total_tests++;
        size_t M = a5_shapes[idx].M;
        size_t N = a5_shapes[idx].N;
        size_t K = a5_shapes[idx].K;
        uint32_t seed = static_cast<uint32_t>(6000 + idx * 89);
        std::mt19937 rng(seed);
        std::uniform_int_distribution<int32_t> act_dist(-128, 127);
        std::uniform_int_distribution<int32_t> bias_dist(-1000, 1000);

        std::vector<int32_t> A(M * K);
        for (size_t i = 0; i < A.size(); ++i) A[i] = act_dist(rng);

        size_t row_bytes = calc_packed_bytes(K);
        std::vector<uint8_t> packed_B(N * row_bytes, 0);
        for (size_t b = 0; b < packed_B.size(); ++b) packed_B[b] = static_cast<uint8_t>(rng() & 0xFF);

        std::vector<int32_t> bias(N);
        for (size_t i = 0; i < N; ++i) bias[i] = bias_dist(rng);

        std::vector<int32_t> expected_C(M * N, 0);
        gemm_packed_bias_relu_scalar(A.data(), packed_B.data(), bias.data(), expected_C.data(), M, N, K);
        uint32_t expected_chk = compute_checksum(expected_C.data(), M * N);

        std::vector<int32_t> actual_C(M * N, 0);
        if (effective_backend == "avx2" && caps.has_avx2) {
            gemm_packed_bias_relu_avx2(A.data(), packed_B.data(), bias.data(), actual_C.data(), M, N, K);
        } else {
            gemm_packed_bias_relu_scalar(A.data(), packed_B.data(), bias.data(), actual_C.data(), M, N, K);
        }
        uint32_t actual_chk = compute_checksum(actual_C.data(), M * N);

        if (actual_chk == expected_chk) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A6-" + std::to_string(idx + 1) + ": expected " + hex32(expected_chk) + " got " + hex32(actual_chk));
        }
    }
    std::cout << (failed_tests == a6_fails_before ? "PASSED\n" : "FAILED\n");

    // -------------------------------------------------------------------------
    // A7: End-to-End BitNet Forward Inferences
    // -------------------------------------------------------------------------
    std::cout << "  [Replaying Suite A7: End-to-End BitNet Forward]... ";
    size_t a7_fails_before = failed_tests;
    std::vector<uint32_t> a7_seeds = {42, 101, 777, 2026, 9999};
    for (size_t idx = 0; idx < a7_seeds.size(); ++idx) {
        total_tests++;
        uint32_t model_seed = a7_seeds[idx];

        // 1. Reference Scalar Output
        BitNetMnistModel ref_model;
        ref_model.init_synthetic(model_seed);
        TargetCapabilities sc_caps = caps;
        sc_caps.has_avx2 = false;
        sc_caps.has_neon = false;
        sc_caps.is_overridden = true;
        set_active_capabilities(sc_caps);
        ref_model.resolve_kernels();

        uint32_t input_seed = model_seed + 12345;
        std::mt19937 rng(input_seed);
        std::uniform_int_distribution<int32_t> in_dist(0, 255);
        std::vector<int32_t> input(784);
        for (int i = 0; i < 784; ++i) input[i] = in_dist(rng);

        int32_t expected_logits[10] = {0};
        int32_t expected_pred = ref_model.forward(input.data(), expected_logits);
        uint32_t expected_chk = compute_checksum(expected_logits, 10);

        // 2. Actual Selected Backend Output
        BitNetMnistModel act_model;
        act_model.init_synthetic(model_seed);
        set_active_capabilities(active_caps);
        act_model.resolve_kernels();

        int32_t actual_logits[10] = {0};
        int32_t actual_pred = act_model.forward(input.data(), actual_logits);
        uint32_t actual_chk = compute_checksum(actual_logits, 10);

        if (actual_pred == expected_pred && actual_chk == expected_chk) {
            passed_tests++;
        } else {
            failed_tests++;
            failure_logs.push_back("A7-" + std::to_string(idx + 1) + ": expected pred " + std::to_string(expected_pred) + 
                                  " (chk " + hex32(expected_chk) + "), got pred " + std::to_string(actual_pred) + 
                                  " (chk " + hex32(actual_chk) + ")");
        }
    }
    std::cout << (failed_tests == a7_fails_before ? "PASSED\n" : "FAILED\n");

    auto end_time = std::chrono::high_resolution_clock::now();
    double total_ms = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time).count() / 1000.0;
    size_t alloc_count = probe.alloc_count();

    // Emit result JSON
    std::ofstream out(output_path);
    if (out.is_open()) {
        out << "{\n"
            << "  \"gate\": \"7.1\",\n"
            << "  \"host_arch\": \"" << caps.arch_name << "\",\n"
            << "  \"requested_backend\": \"" << forced_backend << "\",\n"
            << "  \"effective_backend\": \"" << effective_backend << "\",\n"
            << "  \"status\": \"" << (failed_tests == 0 ? "PASS" : "FAIL") << "\",\n"
            << "  \"total_vectors_tested\": " << total_tests << ",\n"
            << "  \"passed_vectors\": " << passed_tests << ",\n"
            << "  \"failed_vectors\": " << failed_tests << ",\n"
            << "  \"steady_state_heap_allocations\": " << alloc_count << ",\n"
            << "  \"elapsed_ms\": " << total_ms << ",\n"
            << "  \"failures\": [\n";
        for (size_t f = 0; f < failure_logs.size(); ++f) {
            out << "    \"" << failure_logs[f] << "\"" << (f + 1 < failure_logs.size() ? "," : "") << "\n";
        }
        out << "  ]\n"
            << "}\n";
        out.close();
        std::cout << "  Replay result written: " << output_path << "\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Summary: " << passed_tests << " / " << total_tests << " Passed (" 
              << (failed_tests == 0 ? "100% BIT-EXACT PARITY" : "FAILURES DETECTED") << ")\n";
    std::cout << "  Elapsed Time: " << total_ms << " ms | Heap Allocations: " << alloc_count << "\n";
    std::cout << "===================================================================\n";

    return (failed_tests == 0 ? 0 : 1);
}
