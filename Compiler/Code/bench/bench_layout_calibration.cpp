#include "tensor/kernels/microkernels.hpp"
#include "tensor/packed_ternary_layout.hpp"
#include "tensor/tensor.hpp"
#include "runtime/target_capabilities.hpp"
#include "runtime/kernel_registry.hpp"

#include <iostream>
#include <vector>
#include <chrono>
#include <iomanip>
#include <numeric>
#include <random>
#include <cstring>

using namespace setun::tensor;
using namespace setun::tensor::kernels;
using namespace setun::runtime;

static double measure_ms(std::function<void()> fn, size_t repeats = 5) {
    // Warm up
    fn();
    
    double best = 1e9;
    for (size_t r = 0; r < repeats; ++r) {
        auto t0 = std::chrono::high_resolution_clock::now();
        fn();
        auto t1 = std::chrono::high_resolution_clock::now();
        double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
        if (ms < best) best = ms;
    }
    return best;
}

int main() {
    register_all_bitnet_kernels();

    std::cout << "===================================================================\n";
    std::cout << "        TERSUN G7.35: MICROKERNEL LADDER & LAYOUT CALIBRATION       \n";
    std::cout << "===================================================================\n";

    const size_t K = 784;       // MNIST input features
    const size_t N = 128;       // Hidden layer neurons
    const size_t ITERS = 10000; // Repetitions for stable timing

    // Prepare test vectors
    std::vector<int32_t> vec_x(K, 2);
    size_t packed_bytes_per_row = calc_packed_bytes(K);
    std::vector<uint8_t> weights(N * packed_bytes_per_row, 0x55); // Alternating +1s
    std::vector<int32_t> bias(N, 1);
    std::vector<int32_t> out_scalar(N, 0);
    std::vector<int32_t> out_avx2(N, 0);

    // K0: Decode Trits
    std::vector<int8_t> decoded_scalar(K, 0);
    std::vector<int8_t> decoded_avx2(K, 0);
    double ms_k0_scalar = measure_ms([&]() {
        for (size_t i = 0; i < ITERS * 10; ++i) {
            decode_trits_scalar(weights.data(), decoded_scalar.data(), K);
        }
    });
    double ms_k0_avx2 = measure_ms([&]() {
        for (size_t i = 0; i < ITERS * 10; ++i) {
            decode_trits_avx2(weights.data(), decoded_avx2.data(), K);
        }
    });

    // K2: Dot Product
    double ms_k2_scalar = measure_ms([&]() {
        volatile int32_t s = 0;
        for (size_t i = 0; i < ITERS * 10; ++i) {
            s += dot_product_packed_scalar(vec_x.data(), weights.data(), K);
        }
    });
    double ms_k2_avx2 = measure_ms([&]() {
        volatile int32_t s = 0;
        for (size_t i = 0; i < ITERS * 10; ++i) {
            s += dot_product_packed_avx2(vec_x.data(), weights.data(), K);
        }
    });

    // K3: GEMV (1 x 128 x 784)
    double ms_k3_scalar = measure_ms([&]() {
        for (size_t i = 0; i < ITERS; ++i) {
            gemv_packed_scalar(vec_x.data(), weights.data(), out_scalar.data(), N, K);
        }
    });
    double ms_k3_avx2 = measure_ms([&]() {
        for (size_t i = 0; i < ITERS; ++i) {
            gemv_packed_avx2(vec_x.data(), weights.data(), out_avx2.data(), N, K);
        }
    });

    // K5: GEMM + Bias (1 x 128 x 784)
    double ms_k5_scalar = measure_ms([&]() {
        for (size_t i = 0; i < ITERS; ++i) {
            gemm_packed_bias_scalar(vec_x.data(), weights.data(), bias.data(), out_scalar.data(), 1, N, K);
        }
    });
    double ms_k5_avx2 = measure_ms([&]() {
        for (size_t i = 0; i < ITERS; ++i) {
            gemm_packed_bias_avx2(vec_x.data(), weights.data(), bias.data(), out_avx2.data(), 1, N, K);
        }
    });

    // K6: Fused GEMM + Bias + ReLU (1 x 128 x 784)
    double ms_k6_scalar = measure_ms([&]() {
        for (size_t i = 0; i < ITERS; ++i) {
            gemm_packed_bias_relu_scalar(vec_x.data(), weights.data(), bias.data(), out_scalar.data(), 1, N, K);
        }
    });
    double ms_k6_avx2 = measure_ms([&]() {
        for (size_t i = 0; i < ITERS; ++i) {
            gemm_packed_bias_relu_avx2(vec_x.data(), weights.data(), bias.data(), out_avx2.data(), 1, N, K);
        }
    });

    std::cout << "\n--- Microkernel Ladder Performance Comparison ---\n";
    std::cout << std::left << std::setw(28) << "Kernel"
              << std::setw(16) << "Scalar (ms)"
              << std::setw(16) << "AVX2 (ms)"
              << std::setw(14) << "Speedup" << "\n";
    std::cout << std::string(74, '-') << "\n";

    auto print_row = [](const std::string& name, double s, double a) {
        double speedup = s / (a > 0.0001 ? a : 0.0001);
        std::cout << std::left << std::setw(28) << name
                  << std::setw(16) << std::fixed << std::setprecision(3) << s
                  << std::setw(16) << std::fixed << std::setprecision(3) << a
                  << std::setw(14) << std::fixed << std::setprecision(2) << (std::to_string(speedup).substr(0, 5) + "x") << "\n";
    };

    print_row("K0: Trit Decode", ms_k0_scalar, ms_k0_avx2);
    print_row("K2: Dot Product (K=784)", ms_k2_scalar, ms_k2_avx2);
    print_row("K3: GEMV (128 x 784)", ms_k3_scalar, ms_k3_avx2);
    print_row("K5: GEMM + Bias", ms_k5_scalar, ms_k5_avx2);
    print_row("K6: Fused GEMM + Bias + ReLU", ms_k6_scalar, ms_k6_avx2);
    std::cout << std::string(74, '-') << "\n\n";

    // JSON Machine-Readable Output
    std::cout << "JSON_RESULT_START\n";
    std::cout << "{\n";
    std::cout << "  \"k0_decode\": {\"scalar_ms\": " << ms_k0_scalar << ", \"avx2_ms\": " << ms_k0_avx2 << ", \"speedup\": " << (ms_k0_scalar / ms_k0_avx2) << "},\n";
    std::cout << "  \"k2_dot\": {\"scalar_ms\": " << ms_k2_scalar << ", \"avx2_ms\": " << ms_k2_avx2 << ", \"speedup\": " << (ms_k2_scalar / ms_k2_avx2) << "},\n";
    std::cout << "  \"k3_gemv\": {\"scalar_ms\": " << ms_k3_scalar << ", \"avx2_ms\": " << ms_k3_avx2 << ", \"speedup\": " << (ms_k3_scalar / ms_k3_avx2) << "},\n";
    std::cout << "  \"k5_gemm_bias\": {\"scalar_ms\": " << ms_k5_scalar << ", \"avx2_ms\": " << ms_k5_avx2 << ", \"speedup\": " << (ms_k5_scalar / ms_k5_avx2) << "},\n";
    std::cout << "  \"k6_fused\": {\"scalar_ms\": " << ms_k6_scalar << ", \"avx2_ms\": " << ms_k6_avx2 << ", \"speedup\": " << (ms_k6_scalar / ms_k6_avx2) << "}\n";
    std::cout << "}\n";
    std::cout << "JSON_RESULT_END\n";

    return 0;
}
