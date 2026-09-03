#pragma once

#include "compiler/native_runtime.hpp"
#include <cstdint>
#include <cmath>
#include <cstdlib>

namespace setun {
namespace tafpu {

// ============================================================================
// 1. Branchless Binary GCD Algorithm
// ============================================================================

inline int64_t fast_binary_gcd(int64_t u, int64_t v) {
    if (u < 0) u = -u;
    if (v < 0) v = -v;
    if (u == 0) return v;
    if (v == 0) return u;

#if defined(__GNUC__) || defined(__clang__)
    int shift = __builtin_ctzll(u | v);
    u >>= __builtin_ctzll(u);
    do {
        v >>= __builtin_ctzll(v);
        if (u > v) {
            int64_t t = v;
            v = u;
            u = t;
        }
        v = v - u;
    } while (v != 0);
    return u << shift;
#else
    while (v != 0) {
        int64_t t = v;
        v = u % v;
        u = t;
    }
    return u;
#endif
}

// ============================================================================
// 2. 3-adic Exponent Reduction (Paper Algorithm 3.2)
// ============================================================================
// Identity: (3*A' + B*sqrt(3)) * 3^(S/2) = (B + A'*sqrt(3)) * 3^((S+1)/2)
// Effectively scales down integer coefficients by exchanging A and B and stepping S.

inline runtime::TafpuNum_C tafpu_3adic_shift(const runtime::TafpuNum_C& x) {
    int64_t a = x.a;
    int64_t b = x.b;
    int32_t s = x.s;

    // Shift while A is divisible by 3 and magnitude is large
    while (a != 0 && (a % 3 == 0) && (std::abs(a) > 9 || std::abs(b) > 9)) {
        int64_t new_a = b;
        int64_t new_b = a / 3;
        a = new_a;
        b = new_b;
        s += 1;
    }

    return runtime::TafpuNum_C(a, b, s);
}

// ============================================================================
// 3. Periodic Normalization Pass (AOT Loop Unrolling Optimized)
// ============================================================================

inline runtime::TafpuNum_C tafpu_normalize_periodic(
    const runtime::TafpuNum_C& x,
    uint32_t step_count,
    uint32_t stride = 16
) {
    constexpr int64_t OVERFLOW_THRESHOLD = (1LL << 48); // 2^48 threshold

    // Fast path: In 99.9% of iterations, if not at stride or below threshold, return immediately
#if defined(__GNUC__) || defined(__clang__)
    if (__builtin_expect(std::abs(x.a) < OVERFLOW_THRESHOLD && std::abs(x.b) < OVERFLOW_THRESHOLD && (step_count % stride != 0), 1)) {
        return x;
    }
#else
    if (std::abs(x.a) < OVERFLOW_THRESHOLD && std::abs(x.b) < OVERFLOW_THRESHOLD && (step_count % stride != 0)) {
        return x;
    }
#endif

    // Slow path: Apply 3-adic reduction and GCD factorization
    runtime::TafpuNum_C normalized = tafpu_3adic_shift(x);

    int64_t g = fast_binary_gcd(normalized.a, normalized.b);
    if (g > 1 && (g % 3 == 0)) {
        // Can factor out powers of 3
        while (g % 3 == 0) {
            normalized.a /= 3;
            normalized.b /= 3;
            normalized.s += 2;
            g /= 3;
        }
    }

    return normalized;
}

} // namespace tafpu
} // namespace setun
