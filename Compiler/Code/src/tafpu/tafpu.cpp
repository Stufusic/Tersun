#include "tafpu/tafpu.hpp"
#include <iomanip>
#include <sstream>
#include <algorithm>
#include <limits>

namespace setun {

std::string TafpuNum::to_string(bool show_approx) const {
    std::ostringstream oss;
    oss << "[" << a << ", " << b << ", " << s << "]";
    if (show_approx) {
        oss << " (≈ " << std::setprecision(8) << to_double() << ")";
    }
    return oss.str();
}

namespace {
// Portable checked int64 arithmetic (works on GCC/Clang/MSVC without intrinsics).
inline bool checked_add_i64(int64_t x, int64_t y, int64_t& out) {
    if ((y > 0 && x > INT64_MAX - y) || (y < 0 && x < INT64_MIN - y)) return false;
    out = x + y;
    return true;
}
inline bool checked_sub_i64(int64_t x, int64_t y, int64_t& out) {
    if ((y > 0 && x < INT64_MIN + y) || (y < 0 && x > INT64_MAX + y)) return false;
    out = x - y;
    return true;
}
inline bool checked_mul_i64(int64_t x, int64_t y, int64_t& out) {
#if defined(__SIZEOF_INT128__)
    __int128_t r = static_cast<__int128_t>(x) * static_cast<__int128_t>(y);
    if (r > static_cast<__int128_t>(INT64_MAX) || r < static_cast<__int128_t>(INT64_MIN)) return false;
    out = static_cast<int64_t>(r);
    return true;
#else
    if (x == 0 || y == 0) { out = 0; return true; }
    if (x == -1 && y == INT64_MIN) return false;
    if (y == -1 && x == INT64_MIN) return false;
    int64_t ax = x < 0 ? -(x + 1) + 1 : x; // abs without UB (INT64_MIN handled above via -1 case)
    int64_t ay = y < 0 ? -(y + 1) + 1 : y;
    // Use unsigned magnitude check to avoid UB
    uint64_t ux = static_cast<uint64_t>(ax < 0 ? -(ax + 1) - 1 + 2 : ax); // fallback safe path
    (void)ux; (void)ay;
    if (ax > INT64_MAX / ay) return false;
    out = x * y;
    return true;
#endif
}
} // anonymous namespace

bool TafpuNum::shift_right() {
    // Exact only when A divisible by 3; otherwise report inexact and leave unchanged.
    if (a % 3 != 0) return false;
    int64_t old_a = a;
    a = b;
    b = old_a / 3;
    s += 1;
    return true;
}

bool TafpuNum::shift_left() {
    // A' = 3*B must not overflow int64.
    int64_t new_a;
    if (!checked_mul_i64(b, 3, new_a)) return false;
    int64_t old_a = a;
    a = new_a;
    b = old_a;
    s -= 1;
    return true;
}

void TafpuNum::normalize() {
    // If both a and b are 0, set s to 0
    if (a == 0 && b == 0) {
        s = 0;
        return;
    }
    // Reduction: if a is divisible by 3 and |a|, |b| are large, can shift right
    while ((a % 3 == 0) && (std::abs(a) > 1000 || std::abs(b) > 1000)) {
        int64_t new_a = b;
        int64_t new_b = a / 3;
        a = new_a;
        b = new_b;
        s += 1;
    }
}

bool align_tafpu(TafpuNum& r1, TafpuNum& r2) {
    if (r1.s == r2.s) return true;

    // GĐ1: exact-only alignment. The operand with the LARGER exponent is scaled
    // down via shift_left (exact, may overflow -> fail). We NEVER use lossy
    // shift_right here; large gaps return false so callers use exact fallback.
    constexpr int32_t kMaxExactShift = 32;
    if (r1.s > r2.s) {
        int32_t diff = r1.s - r2.s;
        if (diff > kMaxExactShift) return false;
        TafpuNum tmp = r1;
        for (int32_t i = 0; i < diff; ++i) {
            if (!tmp.shift_left()) return false; // overflow -> inexact, leave inputs unchanged
        }
        r1 = tmp;
        return true;
    } else {
        int32_t diff = r2.s - r1.s;
        if (diff > kMaxExactShift) return false;
        TafpuNum tmp = r2;
        for (int32_t i = 0; i < diff; ++i) {
            if (!tmp.shift_left()) return false;
        }
        r2 = tmp;
        return true;
    }
}

TafpuNum encode_dynamic(double val, int b_search_range) {
    if (std::abs(val) < 1e-15) {
        return TafpuNum(0, 0, 0);
    }

    int32_t s = 0;
    double v = val;

    // Fast scale loop without repeated pow() calls
    while (std::abs(v) < 100.0) {
        s -= 1;
        v *= SQRT_3;
    }

    while (std::abs(v) >= 300.0) {
        s += 1;
        v /= SQRT_3;
    }

    // Fast scan B with early exit
    int64_t best_a = 0;
    int64_t best_b = 0;
    double min_error = std::numeric_limits<double>::infinity();

    int range = std::min(b_search_range, 1000);
    for (int b = -range; b <= range; ++b) {
        double exact_a = v - static_cast<double>(b) * SQRT_3;
        int64_t a = static_cast<int64_t>(std::round(exact_a));
        double approx = static_cast<double>(a) + static_cast<double>(b) * SQRT_3;
        double error = std::abs(approx - v);

        if (error < min_error) {
            min_error = error;
            best_a = a;
            best_b = b;
            if (min_error < 1e-10) {
                break; // Found exact match, exit early!
            }
        }
    }

    return TafpuNum(best_a, best_b, s);
}

TafpuNum tafpu_add(const TafpuNum& x1, const TafpuNum& x2) {
    TafpuNum r1 = x1;
    TafpuNum r2 = x2;
    if (!align_tafpu(r1, r2)) {
        throw TafpuOverflowException(
            "tafpu_add: exponent gap too large for exact alignment (would truncate/overflow)");
    }
    int64_t ra, rb;
    if (!checked_add_i64(r1.a, r2.a, ra) || !checked_add_i64(r1.b, r2.b, rb)) {
        throw TafpuOverflowException("tafpu_add: coefficient overflow (int64)");
    }
    // GĐ1 note: no auto-normalize here — representation stability required
    // for operator== and existing physics tests. Call normalize() explicitly.
    TafpuNum res(ra, rb, r1.s);
    return res;
}

TafpuNum tafpu_sub(const TafpuNum& x1, const TafpuNum& x2) {
    TafpuNum r1 = x1;
    TafpuNum r2 = x2;
    if (!align_tafpu(r1, r2)) {
        throw TafpuOverflowException(
            "tafpu_sub: exponent gap too large for exact alignment (would truncate/overflow)");
    }
    int64_t ra, rb;
    if (!checked_sub_i64(r1.a, r2.a, ra) || !checked_sub_i64(r1.b, r2.b, rb)) {
        throw TafpuOverflowException("tafpu_sub: coefficient overflow (int64)");
    }
    TafpuNum res(ra, rb, r1.s);
    return res;
}

TafpuNum tafpu_mul(const TafpuNum& x1, const TafpuNum& x2) {
    // Exact algebraic multiplication in Q(sqrt(3)):
    // (A1 + B1*sqrt(3)) * (A2 + B2*sqrt(3)) = (A1*A2 + 3*B1*B2) + (A1*B2 + A2*B1)*sqrt(3)
    // GĐ1: portable overflow detection on all toolchains (GCC __int128 + MSVC-safe
    // checked arithmetic). Throws instead of silent UB wraparound.
#if defined(__SIZEOF_INT128__)
    __int128_t a1 = x1.a, b1 = x1.b;
    __int128_t a2 = x2.a, b2 = x2.b;
    __int128_t a_big = a1 * a2 + 3 * b1 * b2;
    __int128_t b_big = a1 * b2 + a2 * b1;
    if (a_big > static_cast<__int128_t>(INT64_MAX) || a_big < static_cast<__int128_t>(INT64_MIN) ||
        b_big > static_cast<__int128_t>(INT64_MAX) || b_big < static_cast<__int128_t>(INT64_MIN)) {
        throw TafpuOverflowException("tafpu_mul: coefficient overflow (int64)");
    }
    int64_t a_res = static_cast<int64_t>(a_big);
    int64_t b_res = static_cast<int64_t>(b_big);
#else
    int64_t t1, t2, t3, t4, a_res, b_res;
    if (!checked_mul_i64(x1.a, x2.a, t1) || !checked_mul_i64(x1.b, x2.b, t2) ||
        !checked_mul_i64(t2, 3, t2) || !checked_add_i64(t1, t2, a_res)) {
        throw TafpuOverflowException("tafpu_mul: coefficient overflow in A (int64)");
    }
    if (!checked_mul_i64(x1.a, x2.b, t3) || !checked_mul_i64(x2.a, x1.b, t4) ||
        !checked_add_i64(t3, t4, b_res)) {
        throw TafpuOverflowException("tafpu_mul: coefficient overflow in B (int64)");
    }
#endif
    int32_t s_res = x1.s + x2.s;

    TafpuNum res(a_res, b_res, s_res);
    return res;
}

TafpuNum tafpu_div(const TafpuNum& x1, const TafpuNum& x2, int32_t scale_L) {
    // Rationalize denominator in Q(sqrt(3)):
    // denom = A2^2 - 3*B2^2
#if defined(__SIZEOF_INT128__)
    __int128_t a2 = x2.a, b2 = x2.b;
    __int128_t denom128 = a2 * a2 - 3 * b2 * b2;
    if (denom128 == 0) {
        throw IsotropicDivisionException("Algebraic Exception: Division by isotropic element or zero in Q(sqrt(3)) (A^2 - 3*B^2 == 0)");
    }

    __int128_t scale = 1;
    for (int32_t i = 0; i < scale_L; ++i) {
        scale *= 3;
    }

    __int128_t a1 = x1.a, b1 = x1.b;
    __int128_t num_a = (a1 * a2 - 3 * b1 * b2) * scale;
    __int128_t num_b = (b1 * a2 - a1 * b2) * scale;

    int64_t a_res = static_cast<int64_t>(std::round(static_cast<double>(num_a) / static_cast<double>(denom128)));
    int64_t b_res = static_cast<int64_t>(std::round(static_cast<double>(num_b) / static_cast<double>(denom128)));
#else
    // Portable (MSVC-safe) path with checked arithmetic; throws on overflow.
    int64_t a2sq, b2sq, b2t, denom;
    if (!checked_mul_i64(x2.a, x2.a, a2sq) || !checked_mul_i64(x2.b, x2.b, b2sq) ||
        !checked_mul_i64(b2sq, 3, b2t) || !checked_sub_i64(a2sq, b2t, denom)) {
        throw TafpuOverflowException("tafpu_div: denominator overflow (int64)");
    }
    if (denom == 0) {
        throw IsotropicDivisionException("Algebraic Exception: Division by isotropic element or zero in Q(sqrt(3)) (A^2 - 3*B^2 == 0)");
    }

    int64_t scale = 1, tmp_scale;
    for (int32_t i = 0; i < scale_L; ++i) {
        if (!checked_mul_i64(scale, 3, tmp_scale)) {
            throw TafpuOverflowException("tafpu_div: scale overflow (int64)");
        }
        scale = tmp_scale;
    }

    int64_t p1, p2, p2s, na0, q1, q2, nb0, num_a, num_b;
    if (!checked_mul_i64(x1.a, x2.a, p1) || !checked_mul_i64(x1.b, x2.b, p2) ||
        !checked_mul_i64(p2, 3, p2s) || !checked_sub_i64(p1, p2s, na0) ||
        !checked_mul_i64(na0, scale, num_a)) {
        throw TafpuOverflowException("tafpu_div: numerator A overflow (int64)");
    }
    if (!checked_mul_i64(x1.b, x2.a, q1) || !checked_mul_i64(x1.a, x2.b, q2) ||
        !checked_sub_i64(q1, q2, nb0) || !checked_mul_i64(nb0, scale, num_b)) {
        throw TafpuOverflowException("tafpu_div: numerator B overflow (int64)");
    }

    int64_t a_res = static_cast<int64_t>(std::round(static_cast<double>(num_a) / static_cast<double>(denom)));
    int64_t b_res = static_cast<int64_t>(std::round(static_cast<double>(num_b) / static_cast<double>(denom)));
#endif
    int32_t s_res = x1.s - x2.s - 2 * scale_L;

    return TafpuNum(a_res, b_res, s_res);
}

TafpuNum tafpu_neg(const TafpuNum& x) {
    return TafpuNum(-x.a, -x.b, x.s);
}

// Exact sign of a base value (A + B*sqrt(3)) without any floating point.
// Returns -1/0/+1. Uses __int128 when available, else overflow-safe fallback.
static int base_sign_i64(int64_t A, int64_t B) {
    if (A == 0 && B == 0) return 0;
    if (A >= 0 && B >= 0) return 1;
    if (A <= 0 && B <= 0) return -1;
#if defined(__SIZEOF_INT128__)
    __int128_t a = A, b = B;
    __int128_t lhs = a * a;       // A^2 exact
    __int128_t rhs = 3 * b * b;   // 3*B^2 exact
    if (A > 0) return (lhs > rhs) ? 1 : -1;   // A - |B|*sqrt3 (B<0 here); == only if both 0 (handled)
    else return (lhs < rhs) ? 1 : -1;          // -|A| + B*sqrt3 (B>0 here)
#else
    // Portable fallback: long double has 64-bit mantissa on MSVC (=double) so
    // keep early sign exits above; mixed-sign case uses long double squares.
    long double lhs = static_cast<long double>(A) * static_cast<long double>(A);
    long double rhs = 3.0L * static_cast<long double>(B) * static_cast<long double>(B);
    if (A > 0) return (lhs > rhs) ? 1 : -1;
    else return (lhs < rhs) ? 1 : -1;
#endif
}

int tafpu_cmp(const TafpuNum& x1, const TafpuNum& x2) {
    if (x1.a == x2.a && x1.b == x2.b && x1.s == x2.s) return 0;
    if (x1.s == x2.s) {
#if defined(__SIZEOF_INT128__)
        __int128_t da = static_cast<__int128_t>(x1.a) - static_cast<__int128_t>(x2.a);
        __int128_t db = static_cast<__int128_t>(x1.b) - static_cast<__int128_t>(x2.b);
        if (da == 0 && db == 0) return 0;
        if (da >= 0 && db >= 0) return 1;
        if (da <= 0 && db <= 0) return -1;
        __int128_t lhs = da * da;
        __int128_t rhs = 3 * db * db;
        if (da > 0) return (lhs > rhs) ? 1 : -1;  // db < 0 here
        else return (lhs < rhs) ? 1 : -1;          // db > 0 here
#else
        int64_t da, db;
        bool ok_a = checked_sub_i64(x1.a, x2.a, da);
        bool ok_b = checked_sub_i64(x1.b, x2.b, db);
        if (ok_a && ok_b) {
            int s = base_sign_i64(da, db);
            if (s != 0) return s;
            return 0;
        }
        // Sub overflow: fall through to long-double fallback below.
#endif
    } else {
        // Different exponents: try exact alignment on copies (small gaps only).
        TafpuNum r1 = x1, r2 = x2;
        if (align_tafpu(r1, r2)) {
            return tafpu_cmp(r1, r2); // now same-s exact path
        }
        // Large gap: exact alignment impossible without overflow/truncation.
        // Fall back to long-double ordering (documented inexact, ordering-only).
    }
    long double d1 = static_cast<long double>(x1.a) + static_cast<long double>(x1.b) * 1.7320508075688772935274463L;
    long double d2 = static_cast<long double>(x2.a) + static_cast<long double>(x2.b) * 1.7320508075688772935274463L;
    // Apply 3^(s/2) scale without pow(): split even/odd exponent.
    auto scale_ld = [](int32_t s) -> long double {
        long double p = 1.0L;
        int32_t k = s >= 0 ? s : -s;
        long double base = 1.7320508075688772935274463L; // 3^(1/2)
        while (k > 0) { if (k & 1) p *= base; base *= base; k >>= 1; }
        return s >= 0 ? p : 1.0L / p;
    };
    // Incorporate sign of base: d1/d2 already signed; scale is always positive.
    d1 *= scale_ld(x1.s);
    d2 *= scale_ld(x2.s);
    if (d1 < d2) return -1;
    if (d1 > d2) return 1;
    return 0;
}

} // namespace setun
