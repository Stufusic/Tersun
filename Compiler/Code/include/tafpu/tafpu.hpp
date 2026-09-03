#pragma once

#include "tafpu/exception.hpp"
#include <cstdint>
#include <cmath>
#include <string>
#include <tuple>
#include <iostream>

namespace setun {

// sqrt(3) constant
constexpr double SQRT_3 = 1.7320508075688772935274463415058723669428;

// TAFPU Register / Number Structure
// Represents X = (A + B * sqrt(3)) * 3^(S / 2) in field Q(sqrt(3))
// Size: 24 bytes (8 bytes A, 8 bytes B, 4 bytes S, 4 bytes padding)
struct alignas(8) TafpuNum {
    int64_t a{0}; // Coefficient of 1 in Q(sqrt(3))
    int64_t b{0}; // Coefficient of sqrt(3) in Q(sqrt(3))
    int32_t s{0}; // Scaling exponent step (power of 3^(1/2))
    int32_t _padding{0};

    constexpr TafpuNum() = default;
    constexpr TafpuNum(int64_t a_val, int64_t b_val, int32_t s_val = 0)
        : a(a_val), b(b_val), s(s_val), _padding(0) {}

    // Convert to standard IEEE 754 double
    double to_double() const {
        double base = static_cast<double>(a) + static_cast<double>(b) * SQRT_3;
        return base * std::pow(3.0, s / 2.0);
    }

    // Convert to string for debugging and printing
    std::string to_string(bool show_approx = true) const;

    // Shift right: S <- S + 1, A' = B, B' = A / 3.
    // Returns true if exact (A % 3 == 0), false if truncation would occur.
    // GĐ1: callers must check the return value; lossy shifts are rejected by align_tafpu.
    bool shift_right();

    // Shift left (Exact scale by sqrt(3)): S <- S - 1, A' = 3*B, B' = A.
    // Returns true if exact, false if 3*B overflows int64 (state left unchanged).
    bool shift_left();

    // Normalization / Reduction: if A % 3 == 0 and B can shift, or magnitude adjustment
    void normalize();

    // Equality operator
    bool operator==(const TafpuNum& other) const {
        return a == other.a && b == other.b && s == other.s;
    }
    bool operator!=(const TafpuNum& other) const {
        return !(*this == other);
    }
};

// Alias matching Plan_part1.md
using TAF_Register = TafpuNum;

// Align two TAFPU numbers to a common exponent using exact shifts only.
// Returns true if alignment is exact, false if exponents differ too much to
// align without truncation/overflow (operands left unchanged).
// GĐ1: tafpu_add/sub use the exact path; on false they fall back to a
// scale-aware exact compare/add via wider arithmetic instead of lossy shifts.
bool align_tafpu(TafpuNum& r1, TafpuNum& r2);
inline bool align(TafpuNum& r1, TafpuNum& r2) { return align_tafpu(r1, r2); }

// Dynamic Encoding Algorithm (Paper 3.1)
// Converts any real value to [A, B, S] minimizing error: |A + B*sqrt(3) - V|
TafpuNum encode_dynamic(double val, int b_search_range = 1000);

// TAFPU Exact Algebraic Arithmetic Operations
TafpuNum tafpu_add(const TafpuNum& x1, const TafpuNum& x2);
TafpuNum tafpu_sub(const TafpuNum& x1, const TafpuNum& x2);
TafpuNum tafpu_mul(const TafpuNum& x1, const TafpuNum& x2);
TafpuNum tafpu_div(const TafpuNum& x1, const TafpuNum& x2, int32_t scale_L = 0);
TafpuNum tafpu_neg(const TafpuNum& x);

// C++ Operator Overloading for TAF_Register / TafpuNum
inline TafpuNum operator+(const TafpuNum& a, const TafpuNum& b) { return tafpu_add(a, b); }
inline TafpuNum operator-(const TafpuNum& a, const TafpuNum& b) { return tafpu_sub(a, b); }
inline TafpuNum operator*(const TafpuNum& a, const TafpuNum& b) { return tafpu_mul(a, b); }
inline TafpuNum operator/(const TafpuNum& a, const TafpuNum& b) { return tafpu_div(a, b); }
inline TafpuNum operator-(const TafpuNum& a) { return tafpu_neg(a); }

// 3D Vector Distance Squared in TAFPU (Combat & Physics calculation)
inline TafpuNum distance_squared_3d(const TafpuNum& x1, const TafpuNum& y1, const TafpuNum& z1,
                                    const TafpuNum& x2, const TafpuNum& y2, const TafpuNum& z2) {
    TafpuNum dx = x1 - x2;
    TafpuNum dy = y1 - y2;
    TafpuNum dz = z1 - z2;
    return (dx * dx) + (dy * dy) + (dz * dz);
}

// Comparison between two TAFPU numbers: -1 if x1 < x2, 0 if x1 == x2, 1 if x1 > x2
int tafpu_cmp(const TafpuNum& x1, const TafpuNum& x2);

} // namespace setun
