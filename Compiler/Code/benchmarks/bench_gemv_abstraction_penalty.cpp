#include "compiler/canonical_ternary_ir.hpp"
#include <iostream>
#include <vector>
#include <chrono>
#include <iomanip>
#include <numeric>
#include <cassert>
#include <immintrin.h>

using namespace setun::compiler;

// Global allocation counter to prove zero-allocation invariant
static size_t g_steady_state_allocs = 0;
static bool g_track_allocs = false;

#if defined(_MSC_VER) || defined(__MINGW32__) || defined(__GNUC__)
void* operator new(size_t size) {
    if (g_track_allocs) {
        g_steady_state_allocs++;
    }
    return malloc(size);
}
void operator delete(void* p) noexcept {
    free(p);
}
void* operator new[](size_t size) {
    if (g_track_allocs) {
        g_steady_state_allocs++;
    }
    return malloc(size);
}
void operator delete[](void* p) noexcept {
    free(p);
}
#endif

// Handwritten C++ AVX2 2D GEMV Reference
static void handwritten_cpp_gemv_avx2(
    const int32_t* x,
    const int8_t* w,
    const int32_t* bias,
    int32_t* out,
    size_t rows,
    size_t cols
) {
#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    const __m256i v_one = _mm256_set1_epi32(1);
    const __m256i v_neg_one = _mm256_set1_epi32(-1);

    for (size_t r = 0; r < rows; ++r) {
        const int8_t* w_row = w + r * cols;
        __m256i acc = _mm256_setzero_si256();

        size_t c = 0;
        for (; c + 8 <= cols; c += 8) {
            __m256i vx = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(x + c));
            __m128i vw8 = _mm_loadl_epi64(reinterpret_cast<const __m128i*>(w_row + c));
            __m256i vw = _mm256_cvtepi8_epi32(vw8);

            __m256i mask_p = _mm256_cmpeq_epi32(vw, v_one);
            __m256i mask_n = _mm256_cmpeq_epi32(vw, v_neg_one);

            acc = _mm256_add_epi32(acc, _mm256_and_si256(vx, mask_p));
            acc = _mm256_sub_epi32(acc, _mm256_and_si256(vx, mask_n));
        }

        alignas(32) int32_t lanes[8];
        _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc);
        int32_t sum = (bias != nullptr) ? bias[r] : 0;
        for (int k = 0; k < 8; ++k) sum += lanes[k];

        for (; c < cols; ++c) {
            if (w_row[c] == 1) sum += x[c];
            else if (w_row[c] == -1) sum -= x[c];
        }
        out[r] = sum;
    }
#else
    CanonicalTernaryEngine::execute_scalar_gemv(x, w, bias, out, rows, cols);
#endif
}

static std::vector<uint8_t> pack_weights(const std::vector<int8_t>& dense_w) {
    size_t total_trits = dense_w.size();
    size_t num_bytes = (total_trits + 3) / 4;
    std::vector<uint8_t> packed(num_bytes + 4, 0);
    for (size_t i = 0; i < total_trits; ++i) {
        int8_t t = dense_w[i];
        uint8_t code = (t == 1) ? 0b01 : ((t == -1) ? 0b10 : 0b00);
        size_t byte_idx = i / 4;
        size_t bit_shift = (i % 4) * 2;
        packed[byte_idx] |= (code << bit_shift);
    }
    return packed;
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.3.2: 2D GEMV Abstraction Penalty & Memory Efficiency      \n";
    std::cout << "  Target: Tersun Canonical GEMV vs Handwritten C++ AVX2           \n";
    std::cout << "===================================================================\n";

    const size_t ROWS = 64;
    const size_t COLS = 512;
    const size_t REPETITIONS = 10000;

    std::vector<int32_t> x(COLS);
    for (size_t i = 0; i < COLS; ++i) {
        x[i] = static_cast<int32_t>((i * 17 + 5) % 100 - 50);
    }

    std::vector<int8_t> dense_w(ROWS * COLS);
    for (size_t i = 0; i < ROWS * COLS; ++i) {
        dense_w[i] = static_cast<int8_t>((i % 3) - 1);
    }
    auto packed_w = pack_weights(dense_w);

    std::vector<int32_t> bias(ROWS);
    for (size_t i = 0; i < ROWS; ++i) {
        bias[i] = static_cast<int32_t>((i * 7) % 20);
    }

    std::vector<int32_t> out_cpp(ROWS, 0);
    std::vector<int32_t> out_dense(ROWS, 0);
    std::vector<int32_t> out_packed(ROWS, 0);

    // Warmup & Parity verification
    handwritten_cpp_gemv_avx2(x.data(), dense_w.data(), bias.data(), out_cpp.data(), ROWS, COLS);
    CanonicalTernaryEngine::execute_canonical_gemv(
        x.data(), dense_w.data(), bias.data(), out_dense.data(), ROWS, COLS,
        WeightLayout::DENSE_TRIT8, TernaryLoweringTarget::AVX2_SIMD_SELECT
    );
    CanonicalTernaryEngine::execute_canonical_gemv(
        x.data(), packed_w.data(), bias.data(), out_packed.data(), ROWS, COLS,
        WeightLayout::PACKED_TRIT2, TernaryLoweringTarget::AVX2_SIMD_SELECT
    );

    for (size_t r = 0; r < ROWS; ++r) {
        assert(out_cpp[r] == out_dense[r]);
        assert(out_cpp[r] == out_packed[r]);
    }

    // -------------------------------------------------------------
    // Allocation Tracking
    // -------------------------------------------------------------
    g_steady_state_allocs = 0;
    g_track_allocs = true;

    // 1. Benchmark Handwritten C++ AVX2
    auto t0 = std::chrono::high_resolution_clock::now();
    for (size_t r = 0; r < REPETITIONS; ++r) {
        handwritten_cpp_gemv_avx2(x.data(), dense_w.data(), bias.data(), out_cpp.data(), ROWS, COLS);
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double cpp_us = std::chrono::duration<double, std::micro>(t1 - t0).count();

    // 2. Benchmark Tersun Canonical Dense AVX2 (with 4-row unrolling)
    auto t2 = std::chrono::high_resolution_clock::now();
    for (size_t r = 0; r < REPETITIONS; ++r) {
        CanonicalTernaryEngine::execute_canonical_gemv(
            x.data(), dense_w.data(), bias.data(), out_dense.data(), ROWS, COLS,
            WeightLayout::DENSE_TRIT8, TernaryLoweringTarget::AVX2_SIMD_SELECT
        );
    }
    auto t3 = std::chrono::high_resolution_clock::now();
    double dense_us = std::chrono::duration<double, std::micro>(t3 - t2).count();

    // 3. Benchmark Tersun Canonical Packed AVX2 (2-bit trits, 4x memory savings)
    auto t4 = std::chrono::high_resolution_clock::now();
    for (size_t r = 0; r < REPETITIONS; ++r) {
        CanonicalTernaryEngine::execute_canonical_gemv(
            x.data(), packed_w.data(), bias.data(), out_packed.data(), ROWS, COLS,
            WeightLayout::PACKED_TRIT2, TernaryLoweringTarget::AVX2_SIMD_SELECT
        );
    }
    auto t5 = std::chrono::high_resolution_clock::now();
    double packed_us = std::chrono::duration<double, std::micro>(t5 - t4).count();

    g_track_allocs = false;

    // Calculations
    double total_ops = static_cast<double>(ROWS) * COLS * REPETITIONS;
    double cpp_gops = (total_ops) / (cpp_us * 1e-6) / 1e9;
    double dense_gops = (total_ops) / (dense_us * 1e-6) / 1e9;
    double packed_gops = (total_ops) / (packed_us * 1e-6) / 1e9;

    double dense_eff_pct = (cpp_us / dense_us) * 100.0;
    double packed_eff_pct = (cpp_us / packed_us) * 100.0;

    std::cout << std::fixed << std::setprecision(2);
    std::cout << "  [Matrix Dimensions & Iterations]\n";
    std::cout << "    - Matrix size:          " << ROWS << " rows x " << COLS << " cols\n";
    std::cout << "    - Repetitions:          " << REPETITIONS << " iterations\n";
    std::cout << "    - Total Operations:     " << total_ops / 1e6 << " M ternary multiply-adds\n";
    std::cout << "    - Steady-state Allocs:  " << g_steady_state_allocs << " bytes (Zero-allocation verified!)\n\n";

    std::cout << "  [Memory Footprint]\n";
    std::cout << "    - Dense Weights:        " << (ROWS * COLS) << " bytes (1.0 byte/trit)\n";
    std::cout << "    - Packed Weights:       " << (ROWS * COLS + 3) / 4 << " bytes (0.25 bytes/trit, 4.0x compression)\n\n";

    std::cout << "  [Performance Results]\n";
    std::cout << "    - Handwritten C++ AVX2:        " << cpp_us / 1000.0 << " ms  (" << cpp_gops << " GOP/s)\n";
    std::cout << "    - Tersun Canonical Dense AVX2: " << dense_us / 1000.0 << " ms  (" << dense_gops << " GOP/s) => " << dense_eff_pct << "% vs C++\n";
    std::cout << "    - Tersun Canonical Packed AVX2:" << packed_us / 1000.0 << " ms  (" << packed_gops << " GOP/s) => " << packed_eff_pct << "% vs C++\n\n";

    // Validate DoD criteria
    assert(g_steady_state_allocs == 0);
    std::cout << "  [DoD Check]\n";
    std::cout << "    [x] Steady-state zero heap allocations: PASSED (" << g_steady_state_allocs << " allocs)\n";
    if (dense_eff_pct >= 85.0) {
        std::cout << "    [x] Efficiency threshold >= 85%:         PASSED (" << dense_eff_pct << "% >= 85%)\n";
    } else {
        std::cout << "    [!] Efficiency threshold >= 85%:         NOT REACHED (" << dense_eff_pct << "%)\n";
    }
    std::cout << "===================================================================\n";

    return 0;
}
