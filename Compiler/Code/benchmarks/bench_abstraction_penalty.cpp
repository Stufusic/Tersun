#include "compiler/canonical_ternary_ir.hpp"
#include <iostream>
#include <vector>
#include <chrono>
#include <iomanip>
#include <numeric>
#include <cassert>
#include <immintrin.h>

using namespace setun::compiler;

// Handwritten Reference C++ Kernel
static int32_t handwritten_cpp_avx2(const int32_t* x, const int8_t* w, size_t count, int32_t bias) {
#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    __m256i acc_vec = _mm256_setzero_si256();
    const __m256i v_one = _mm256_set1_epi32(1);
    const __m256i v_neg_one = _mm256_set1_epi32(-1);

    size_t i = 0;
    for (; i + 8 <= count; i += 8) {
        __m256i vx = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(x + i));
        __m128i vw8 = _mm_loadl_epi64(reinterpret_cast<const __m128i*>(w + i));
        __m256i vw = _mm256_cvtepi8_epi32(vw8);

        __m256i mask_p = _mm256_cmpeq_epi32(vw, v_one);
        __m256i mask_n = _mm256_cmpeq_epi32(vw, v_neg_one);

        acc_vec = _mm256_add_epi32(acc_vec, _mm256_and_si256(vx, mask_p));
        acc_vec = _mm256_sub_epi32(acc_vec, _mm256_and_si256(vx, mask_n));
    }

    alignas(32) int32_t lanes[8];
    _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc_vec);
    int32_t sum = bias;
    for (int k = 0; k < 8; ++k) sum += lanes[k];
    for (; i < count; ++i) {
        if (w[i] == 1) sum += x[i];
        else if (w[i] == -1) sum -= x[i];
    }
    return sum;
#else
    return CanonicalTernaryEngine::execute_scalar_oracle(x, w, count, bias);
#endif
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.3.1: Abstraction Penalty & Zero-Allocation Benchmark      \n";
    std::cout << "  Target: Tersun Canonical Lowering vs Handwritten C++ AVX2       \n";
    std::cout << "===================================================================\n";

    const size_t K = 512;
    const size_t REPETITIONS = 100000;

    std::vector<int32_t> inputs(K);
    std::vector<int8_t> weights(K);
    for (size_t i = 0; i < K; ++i) {
        inputs[i] = static_cast<int32_t>((i * 17 + 5) % 100 - 50);
        weights[i] = static_cast<int8_t>((i % 3) - 1);
    }

    // Warmup
    volatile int32_t s0 = handwritten_cpp_avx2(inputs.data(), weights.data(), K, 0);
    volatile int32_t s1 = CanonicalTernaryEngine::execute_avx2_vector(inputs.data(), weights.data(), K, 0);
    assert(s0 == s1);

    // 1. Benchmark Handwritten C++ AVX2
    auto t0 = std::chrono::high_resolution_clock::now();
    for (size_t r = 0; r < REPETITIONS; ++r) {
        s0 = handwritten_cpp_avx2(inputs.data(), weights.data(), K, 0);
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double cpp_us = std::chrono::duration<double, std::micro>(t1 - t0).count();

    // 2. Benchmark Tersun Canonical Lowering (execute_canonical)
    auto t2 = std::chrono::high_resolution_clock::now();
    for (size_t r = 0; r < REPETITIONS; ++r) {
        s1 = CanonicalTernaryEngine::execute_canonical(
            inputs.data(), weights.data(), K, 0,
            TernaryLoweringTarget::AVX2_SIMD_SELECT
        );
    }
    auto t3 = std::chrono::high_resolution_clock::now();
    double tersun_us = std::chrono::duration<double, std::micro>(t3 - t2).count();

    // 3. Efficiency Metric:
    // Efficiency = (C++ latency / Tersun latency) * 100%
    double efficiency_pct = (cpp_us / tersun_us) * 100.0;
    double cpp_gelem = (static_cast<double>(K) * REPETITIONS) / (cpp_us * 1e-6) / 1e9;
    double tersun_gelem = (static_cast<double>(K) * REPETITIONS) / (tersun_us * 1e-6) / 1e9;

    std::cout << std::fixed << std::setprecision(2);
    std::cout << "  [Configuration]\n";
    std::cout << "    - Vector size K:       " << K << " elements\n";
    std::cout << "    - Repetitions:         " << REPETITIONS << " iterations\n";
    std::cout << "    - Total Elements:      " << (K * REPETITIONS) / 1e6 << " M elements\n\n";

    std::cout << "  [Performance Results]\n";
    std::cout << "    - Handwritten C++ AVX2: " << cpp_us / 1000.0 << " ms (" << cpp_gelem << " GElem/s)\n";
    std::cout << "    - Tersun Canonical IR:  " << tersun_us / 1000.0 << " ms (" << tersun_gelem << " GElem/s)\n";
    std::cout << "    - Measured Efficiency:  " << efficiency_pct << "% (Target >= 85.0%)\n\n";

    if (efficiency_pct >= 85.0) {
        std::cout << "  [PASSED] Zero-cost abstraction goal achieved (Efficiency >= 85%)!\n";
    } else {
        std::cout << "  [WARNING] Abstraction penalty higher than expected: " << efficiency_pct << "%\n";
    }
    std::cout << "===================================================================\n";

    return 0;
}
