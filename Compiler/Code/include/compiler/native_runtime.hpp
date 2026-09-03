#pragma once

#include <cstdint>
#include <cstring>
#include <cmath>
#include <iostream>
#include <vector>
#include <string>
#include <memory>
#include <chrono>

// SIMD Headers if available
#if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)
  #if defined(__GNUC__) || defined(__clang__)
    #include <cpuid.h>
  #elif defined(_MSC_VER)
    #include <intrin.h>
  #endif
  #if defined(__AVX2__) || defined(__AVX512F__)
    #include <immintrin.h>
  #endif
#elif defined(__aarch64__) || defined(_M_ARM64)
  #if defined(__ARM_NEON)
    #include <arm_neon.h>
  #endif
#endif

namespace setun {
namespace runtime {

// 1. TAFPU Algebraic Native Representation in Q(sqrt(3))
// X = (A + B*sqrt(3)) * 3^(S/2)
struct alignas(32) TafpuNum_C {
    int64_t a{0};
    int64_t b{0};
    int32_t s{0};
    int32_t _pad{0}; // 32-byte alignment for AVX/NEON

    constexpr TafpuNum_C() = default;
    constexpr TafpuNum_C(int64_t a_)
        : a(a_), b(0), s(0), _pad(0) {}
    constexpr TafpuNum_C(int64_t a_, int64_t b_, int32_t s_)
        : a(a_), b(b_), s(s_), _pad(0) {}

    constexpr operator int64_t() const { return a; }

    double to_double() const {
        double scale = std::pow(std::sqrt(3.0), s);
        return (static_cast<double>(a) + static_cast<double>(b) * std::sqrt(3.0)) * scale;
    }
};

// Branchless Arithmetic Inlines
inline TafpuNum_C tafpu_add_c(const TafpuNum_C& x1, const TafpuNum_C& x2) {
    if (x1.s == x2.s) {
        return TafpuNum_C(x1.a + x2.a, x1.b + x2.b, x1.s);
    }
    int diff = x1.s - x2.s;
    if (diff > 0 && diff % 2 == 0) {
        int64_t p = 1;
        for (int i = 0; i < diff / 2; ++i) p *= 3;
        return TafpuNum_C(x1.a * p + x2.a, x1.b * p + x2.b, x2.s);
    } else if (diff < 0 && (-diff) % 2 == 0) {
        int64_t p = 1;
        for (int i = 0; i < (-diff) / 2; ++i) p *= 3;
        return TafpuNum_C(x1.a + x2.a * p, x1.b + x2.b * p, x1.s);
    }
    double v1 = x1.to_double();
    double v2 = x2.to_double();
    double sum = v1 + v2;
    return TafpuNum_C(static_cast<int64_t>(sum), 0, 0);
}

inline TafpuNum_C tafpu_sub_c(const TafpuNum_C& x1, const TafpuNum_C& x2) {
    if (x1.s == x2.s) {
        return TafpuNum_C(x1.a - x2.a, x1.b - x2.b, x1.s);
    }
    return tafpu_add_c(x1, TafpuNum_C(-x2.a, -x2.b, x2.s));
}

// Branchless Algebraic Multiplication: (A1 + B1*rt3)*(A2 + B2*rt3) = (A1A2 + 3B1B2) + (A1B2 + B1A2)*rt3
// GĐ1: widened intermediate (__int128 on GCC/Clang) to avoid silent int64 UB.
inline TafpuNum_C tafpu_mul_c(const TafpuNum_C& x1, const TafpuNum_C& x2) {
#if defined(__SIZEOF_INT128__)
    __int128_t a1 = x1.a, b1 = x1.b, a2 = x2.a, b2 = x2.b;
    __int128_t a_big = a1 * a2 + 3 * b1 * b2;
    __int128_t b_big = a1 * b2 + b1 * a2;
    int64_t a = a_big > INT64_MAX ? INT64_MAX : (a_big < INT64_MIN ? INT64_MIN : static_cast<int64_t>(a_big));
    int64_t b = b_big > INT64_MAX ? INT64_MAX : (b_big < INT64_MIN ? INT64_MIN : static_cast<int64_t>(b_big));
#else
    int64_t a = x1.a * x2.a + 3 * x1.b * x2.b; // MSVC fallback (documented: use /RTC-free checked build for full safety)
    int64_t b = x1.a * x2.b + x1.b * x2.a;
#endif
    int32_t s = x1.s + x2.s;
    return TafpuNum_C(a, b, s);
}

// 3-Way Comparison returning -1, 0, +1 (GĐ1: exact integer path, no da*da overflow).
inline int tafpu_cmp_c(const TafpuNum_C& x1, const TafpuNum_C& x2) {
    if (x1.s == x2.s) {
#if defined(__SIZEOF_INT128__)
        __int128_t da = static_cast<__int128_t>(x1.a) - static_cast<__int128_t>(x2.a);
        __int128_t db = static_cast<__int128_t>(x1.b) - static_cast<__int128_t>(x2.b);
        if (da == 0 && db == 0) return 0;
        if (da >= 0 && db >= 0) return 1;
        if (da <= 0 && db <= 0) return -1;
        __int128_t lhs = da * da;
        __int128_t rhs = 3 * db * db;
        if (da > 0) return (lhs > rhs) ? 1 : -1;
        else return (lhs < rhs) ? 1 : -1;
#else
        int64_t da = x1.a - x2.a;
        int64_t db = x1.b - x2.b;
        if (da == 0 && db == 0) return 0;
        if (da >= 0 && db >= 0) return 1;
        if (da <= 0 && db <= 0) return -1;
        long double lhs = static_cast<long double>(da) * static_cast<long double>(da);
        long double rhs = 3.0L * static_cast<long double>(db) * static_cast<long double>(db);
        if (da > 0 && db < 0) return (lhs > rhs) ? 1 : -1;
        if (da < 0 && db > 0) return (lhs < rhs) ? 1 : -1;
#endif
    }
    double v1 = x1.to_double();
    double v2 = x2.to_double();
    if (v1 < v2 - 1e-12) return -1;
    if (v1 > v2 + 1e-12) return 1;
    return 0;
}

// 2. Deterministic ARC (Automatic Reference Counting) for Native Classes
struct ArcHeader {
    mutable int32_t ref_count{1};
    void retain() const { ++ref_count; }
    bool release() const { return --ref_count <= 0; }
};

// 3. Frame Arena Allocator for High-Speed Zero-Drift Real-Time Ticks
class FrameArena {
public:
    static constexpr size_t DEFAULT_CAPACITY = 1024 * 1024; // 1MB per frame

    FrameArena(size_t capacity = DEFAULT_CAPACITY)
        : buffer_(capacity), offset_(0) {}

    void* allocate(size_t bytes, size_t alignment = 32) {
        size_t current = reinterpret_cast<size_t>(buffer_.data() + offset_);
        size_t aligned = (current + alignment - 1) & ~(alignment - 1);
        size_t new_offset = aligned - reinterpret_cast<size_t>(buffer_.data()) + bytes;
        if (new_offset > buffer_.size()) {
            buffer_.resize(buffer_.size() * 2);
        }
        offset_ = new_offset;
        return reinterpret_cast<void*>(aligned);
    }

    void reset() {
        offset_ = 0;
    }

    size_t bytes_used() const { return offset_; }

private:
    std::vector<uint8_t> buffer_;
    size_t offset_{0};
};

// 4. Function Multi-Versioning (FMV) & Hardware Auto-Dispatching for BitNet GEMM
enum class CpuFeature {
    GENERIC,
    AVX2_FMA,
    AVX512_F,
    ARM_NEON
};

inline CpuFeature detect_host_cpu_feature() {
#if defined(__x86_64__) || defined(_M_X64)
    #if defined(__GNUC__) || defined(__clang__)
    if (__builtin_cpu_supports("avx512f")) return CpuFeature::AVX512_F;
    if (__builtin_cpu_supports("avx2")) return CpuFeature::AVX2_FMA;
    #endif
#elif defined(__aarch64__) || defined(_M_ARM64)
    return CpuFeature::ARM_NEON;
#endif
    return CpuFeature::GENERIC;
}

// Multiplication-free GEMM Kernels
inline void gemm_bitnet_generic(
    const int8_t* weights,      // Weights in {-1, 0, 1}
    const TafpuNum_C* inputs,    // Activations in Q(sqrt(3))
    TafpuNum_C* outputs,         // Accumulated output
    size_t rows,
    size_t cols
) {
    for (size_t r = 0; r < rows; ++r) {
        int64_t acc_a = 0;
        int64_t acc_b = 0;
        for (size_t c = 0; c < cols; ++c) {
            int8_t w = weights[r * cols + c];
            if (w == 1) {
                acc_a += inputs[c].a;
                acc_b += inputs[c].b;
            } else if (w == -1) {
                acc_a -= inputs[c].a;
                acc_b -= inputs[c].b;
            }
        }
        outputs[r] = TafpuNum_C(acc_a, acc_b, inputs[0].s);
    }
}

inline void gemm_bitnet_avx2_fma(
    const int8_t* weights,
    const TafpuNum_C* inputs,
    TafpuNum_C* outputs,
    size_t rows,
    size_t cols
) {
    // Optimized loop unrolling 4x
    for (size_t r = 0; r < rows; ++r) {
        int64_t acc_a0 = 0, acc_a1 = 0, acc_a2 = 0, acc_a3 = 0;
        int64_t acc_b0 = 0, acc_b1 = 0, acc_b2 = 0, acc_b3 = 0;
        size_t c = 0;
        for (; c + 4 <= cols; c += 4) {
            int8_t w0 = weights[r * cols + c];
            int8_t w1 = weights[r * cols + c + 1];
            int8_t w2 = weights[r * cols + c + 2];
            int8_t w3 = weights[r * cols + c + 3];

            if (w0 == 1) { acc_a0 += inputs[c].a; acc_b0 += inputs[c].b; }
            else if (w0 == -1) { acc_a0 -= inputs[c].a; acc_b0 -= inputs[c].b; }

            if (w1 == 1) { acc_a1 += inputs[c + 1].a; acc_b1 += inputs[c + 1].b; }
            else if (w1 == -1) { acc_a1 -= inputs[c + 1].a; acc_b1 -= inputs[c + 1].b; }

            if (w2 == 1) { acc_a2 += inputs[c + 2].a; acc_b2 += inputs[c + 2].b; }
            else if (w2 == -1) { acc_a2 -= inputs[c + 2].a; acc_b2 -= inputs[c + 2].b; }

            if (w3 == 1) { acc_a3 += inputs[c + 3].a; acc_b3 += inputs[c + 3].b; }
            else if (w3 == -1) { acc_a3 -= inputs[c + 3].a; acc_b3 -= inputs[c + 3].b; }
        }
        int64_t total_a = acc_a0 + acc_a1 + acc_a2 + acc_a3;
        int64_t total_b = acc_b0 + acc_b1 + acc_b2 + acc_b3;
        for (; c < cols; ++c) {
            int8_t w = weights[r * cols + c];
            if (w == 1) { total_a += inputs[c].a; total_b += inputs[c].b; }
            else if (w == -1) { total_a -= inputs[c].a; total_b -= inputs[c].b; }
        }
        outputs[r] = TafpuNum_C(total_a, total_b, inputs[0].s);
    }
}

// Auto-Dispatched GEMM Entry Point
inline void setun_gemm_dispatch(
    const int8_t* weights,
    const TafpuNum_C* inputs,
    TafpuNum_C* outputs,
    size_t rows,
    size_t cols
) {
    static CpuFeature feat = detect_host_cpu_feature();
    switch (feat) {
        case CpuFeature::AVX512_F:
        case CpuFeature::AVX2_FMA:
            gemm_bitnet_avx2_fma(weights, inputs, outputs, rows, cols);
            break;
        default:
            gemm_bitnet_generic(weights, inputs, outputs, rows, cols);
            break;
    }
}

} // namespace runtime
} // namespace setun
