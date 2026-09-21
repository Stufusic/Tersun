#include <iostream>
#include <fstream>
#include <vector>
#include <random>
#include <cstdint>
#include <cassert>
#include <iomanip>
#include <sstream>
#include <filesystem>
#include "tensor/packed_ternary_layout.hpp"
#include "tensor/kernels/microkernels.hpp"
#include "tensor/bitnet_model.hpp"
#include "runtime/target_capabilities.hpp"

namespace fs = std::filesystem;
using namespace setun::tensor;
using namespace setun::tensor::kernels;
using namespace setun::runtime;

// DJB / 31-rolling hash
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

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.1: Canonical Vector Corpus Generator (A1 - A7)           \n";
    std::cout << "===================================================================\n";

    fs::create_directories("test_registry/g7_1/vectors");

    std::ostringstream manifest;
    manifest << "{\n"
             << "  \"gate\": \"7.1\",\n"
             << "  \"spec\": \"G7.1-SOC Canonical Vector Corpus\",\n"
             << "  \"version\": \"1.0.0\",\n"
             << "  \"oracle\": \"C++20 Scalar Ladder Reference (-fno-tree-vectorize)\",\n"
             << "  \"test_suites\": [\n";

    // -------------------------------------------------------------------------
    // A1: K0 Ternary Decode (Trits to int8 {-1, 0, +1})
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A1: K0 Decode Trits]...\n";
    std::vector<size_t> a1_counts = {1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 32, 33, 64, 128, 784};
    manifest << "    {\n      \"suite\": \"A1\",\n      \"kernel\": \"K0_decode\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a1_counts.size(); ++idx) {
        size_t count = a1_counts[idx];
        uint32_t seed = static_cast<uint32_t>(1000 + idx * 37);
        std::mt19937 rng(seed);
        size_t packed_bytes = calc_packed_bytes(count);
        std::vector<uint8_t> packed(packed_bytes, 0);
        for (size_t b = 0; b < packed_bytes; ++b) {
            packed[b] = static_cast<uint8_t>(rng() & 0xFF);
        }

        std::vector<int8_t> unpacked(count, 0);
        decode_trits_scalar(packed.data(), unpacked.data(), count);
        uint32_t chk = compute_checksum_i8(unpacked.data(), count);

        manifest << "        {\n"
                 << "          \"id\": \"A1-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"seed\": " << seed << ",\n"
                 << "          \"count\": " << count << ",\n"
                 << "          \"packed_bytes\": " << packed_bytes << ",\n"
                 << "          \"expected_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a1_counts.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    },\n";

    // -------------------------------------------------------------------------
    // A2: K2 Ternary Dot Product
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A2: K2 Dot Product]...\n";
    std::vector<size_t> a2_k_dims = {1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 32, 33, 64, 128, 784};
    manifest << "    {\n      \"suite\": \"A2\",\n      \"kernel\": \"K2_dot_product\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a2_k_dims.size(); ++idx) {
        size_t K = a2_k_dims[idx];
        uint32_t seed = static_cast<uint32_t>(2000 + idx * 43);
        std::mt19937 rng(seed);
        std::uniform_int_distribution<int32_t> act_dist(-128, 127);

        std::vector<int32_t> vec(K);
        for (size_t i = 0; i < K; ++i) vec[i] = act_dist(rng);

        size_t packed_bytes = calc_packed_bytes(K);
        std::vector<uint8_t> packed_w(packed_bytes, 0);
        for (size_t b = 0; b < packed_bytes; ++b) packed_w[b] = static_cast<uint8_t>(rng() & 0xFF);

        int32_t result = dot_product_packed_scalar(vec.data(), packed_w.data(), K);
        uint32_t chk = compute_checksum(&result, 1);

        manifest << "        {\n"
                 << "          \"id\": \"A2-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"seed\": " << seed << ",\n"
                 << "          \"K\": " << K << ",\n"
                 << "          \"expected_result\": " << result << ",\n"
                 << "          \"expected_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a2_k_dims.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    },\n";

    // -------------------------------------------------------------------------
    // A3: K3 GEMV (Matrix-Vector)
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A3: K3 GEMV]...\n";
    struct Shape2D { size_t N, K; };
    std::vector<Shape2D> a3_shapes = {
        {1, 1}, {1, 3}, {2, 5}, {4, 15}, {4, 16}, {4, 17},
        {8, 31}, {8, 32}, {8, 33}, {128, 784}, {10, 128}
    };
    manifest << "    {\n      \"suite\": \"A3\",\n      \"kernel\": \"K3_gemv\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a3_shapes.size(); ++idx) {
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

        std::vector<int32_t> out_y(N, 0);
        gemv_packed_scalar(vec.data(), packed_W.data(), out_y.data(), N, K);
        uint32_t chk = compute_checksum(out_y.data(), N);

        manifest << "        {\n"
                 << "          \"id\": \"A3-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"seed\": " << seed << ",\n"
                 << "          \"N\": " << N << ",\n"
                 << "          \"K\": " << K << ",\n"
                 << "          \"expected_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a3_shapes.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    },\n";

    // -------------------------------------------------------------------------
    // A4: K4 GEMM (Matrix-Matrix)
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A4: K4 GEMM]...\n";
    struct Shape3D { size_t M, N, K; };
    std::vector<Shape3D> a4_shapes = {
        {1, 1, 1}, {2, 4, 15}, {2, 4, 16}, {2, 4, 17}, {4, 8, 32}, {1, 10, 128}
    };
    manifest << "    {\n      \"suite\": \"A4\",\n      \"kernel\": \"K4_gemm\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a4_shapes.size(); ++idx) {
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

        std::vector<int32_t> C(M * N, 0);
        gemm_packed_scalar(A.data(), packed_B.data(), C.data(), M, N, K);
        uint32_t chk = compute_checksum(C.data(), M * N);

        manifest << "        {\n"
                 << "          \"id\": \"A4-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"seed\": " << seed << ",\n"
                 << "          \"M\": " << M << ",\n"
                 << "          \"N\": " << N << ",\n"
                 << "          \"K\": " << K << ",\n"
                 << "          \"expected_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a4_shapes.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    },\n";

    // -------------------------------------------------------------------------
    // A5: K5 GEMM + Bias
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A5: K5 GEMM + Bias]...\n";
    std::vector<Shape3D> a5_shapes = {
        {1, 4, 15}, {1, 4, 16}, {1, 4, 17}, {2, 4, 17}, {1, 128, 784}, {1, 10, 128}
    };
    manifest << "    {\n      \"suite\": \"A5\",\n      \"kernel\": \"K5_gemm_bias\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a5_shapes.size(); ++idx) {
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

        std::vector<int32_t> C(M * N, 0);
        gemm_packed_bias_scalar(A.data(), packed_B.data(), bias.data(), C.data(), M, N, K);
        uint32_t chk = compute_checksum(C.data(), M * N);

        manifest << "        {\n"
                 << "          \"id\": \"A5-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"seed\": " << seed << ",\n"
                 << "          \"M\": " << M << ",\n"
                 << "          \"N\": " << N << ",\n"
                 << "          \"K\": " << K << ",\n"
                 << "          \"expected_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a5_shapes.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    },\n";

    // -------------------------------------------------------------------------
    // A6: K6 Fused GEMM + Bias + ReLU
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A6: K6 Fused GEMM + Bias + ReLU]...\n";
    manifest << "    {\n      \"suite\": \"A6\",\n      \"kernel\": \"K6_gemm_bias_relu\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a5_shapes.size(); ++idx) {
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

        std::vector<int32_t> C(M * N, 0);
        gemm_packed_bias_relu_scalar(A.data(), packed_B.data(), bias.data(), C.data(), M, N, K);
        uint32_t chk = compute_checksum(C.data(), M * N);

        manifest << "        {\n"
                 << "          \"id\": \"A6-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"seed\": " << seed << ",\n"
                 << "          \"M\": " << M << ",\n"
                 << "          \"N\": " << N << ",\n"
                 << "          \"K\": " << K << ",\n"
                 << "          \"expected_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a5_shapes.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    },\n";

    // -------------------------------------------------------------------------
    // A7: End-to-End BitNet Forward Model Inferences
    // -------------------------------------------------------------------------
    std::cout << "  [Generating A7: End-to-End Model Inference]...\n";
    std::vector<uint32_t> a7_seeds = {42, 101, 777, 2026, 9999};
    manifest << "    {\n      \"suite\": \"A7\",\n      \"kernel\": \"BitNetMnist_forward\",\n      \"vectors\": [\n";
    for (size_t idx = 0; idx < a7_seeds.size(); ++idx) {
        uint32_t model_seed = a7_seeds[idx];
        BitNetMnistModel model;
        model.init_synthetic(model_seed);
        // Force model to use strictly scalar kernels for oracle generation
        setun::runtime::TargetCapabilities scalar_caps = setun::runtime::detect_host_capabilities();
        scalar_caps.has_avx2 = false;
        scalar_caps.has_neon = false;
        scalar_caps.is_overridden = true;
        setun::runtime::set_active_capabilities(scalar_caps);
        model.resolve_kernels();

        // Input 784
        uint32_t input_seed = model_seed + 12345;
        std::mt19937 rng(input_seed);
        std::uniform_int_distribution<int32_t> in_dist(0, 255);
        std::vector<int32_t> input(784);
        for (int i = 0; i < 784; ++i) input[i] = in_dist(rng);

        int32_t logits[10] = {0};
        int32_t pred = model.forward(input.data(), logits);
        uint32_t chk = compute_checksum(logits, 10);

        manifest << "        {\n"
                 << "          \"id\": \"A7-" << std::setw(3) << std::setfill('0') << (idx + 1) << "\",\n"
                 << "          \"model_seed\": " << model_seed << ",\n"
                 << "          \"input_seed\": " << input_seed << ",\n"
                 << "          \"expected_prediction\": " << pred << ",\n"
                 << "          \"expected_logits_checksum\": \"" << hex32(chk) << "\"\n"
                 << "        }" << (idx + 1 < a7_seeds.size() ? "," : "") << "\n";
    }
    manifest << "      ]\n    }\n  ]\n}\n";

    std::ofstream out("test_registry/g7_1/vectors/corpus_manifest.json");
    if (!out.is_open()) {
        std::cerr << "Failed to open output file: test_registry/g7_1/vectors/corpus_manifest.json\n";
        return 1;
    }
    out << manifest.str();
    out.close();

    std::cout << "  Successfully created: test_registry/g7_1/vectors/corpus_manifest.json\n";
    std::cout << "===================================================================\n";
    return 0;
}
