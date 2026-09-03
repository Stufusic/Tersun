#pragma once

#include "compiler/native_runtime.hpp"
#include "compiler/packed_tensor.hpp"
#include "tafpu/normalization.hpp"
#include <vector>
#include <cmath>
#include <string>
#include <iostream>
#include <cassert>

namespace setun {
namespace std_lib {

// ============================================================================
// 1. Exact Algebraic Trigonometric Table in Q(sqrt(3))
// ============================================================================

enum class SpecialAngle {
    DEG_0,   // 0 rad
    DEG_30,  // pi / 6
    DEG_45,  // pi / 4
    DEG_60,  // pi / 3
    DEG_90,  // pi / 2
    DEG_180, // pi
    DEG_270, // 3*pi / 2
    DEG_360  // 2*pi
};

// Returns exact algebraic 0% error result for field angles in Q(sqrt(3))
inline std::pair<runtime::TafpuNum_C, runtime::TafpuNum_C> sincos_algebraic_exact(SpecialAngle angle) {
    switch (angle) {
        case SpecialAngle::DEG_0:
        case SpecialAngle::DEG_360:
            return { runtime::TafpuNum_C(0, 0, 0), runtime::TafpuNum_C(1, 0, 0) };
        case SpecialAngle::DEG_30: // sin(30) = 1/2, cos(30) = sqrt(3)/2
            return { runtime::TafpuNum_C(1, 0, -2), runtime::TafpuNum_C(0, 1, -1) };
        case SpecialAngle::DEG_60: // sin(60) = sqrt(3)/2, cos(60) = 1/2
            return { runtime::TafpuNum_C(0, 1, -1), runtime::TafpuNum_C(1, 0, -2) };
        case SpecialAngle::DEG_90:
            return { runtime::TafpuNum_C(1, 0, 0), runtime::TafpuNum_C(0, 0, 0) };
        case SpecialAngle::DEG_180:
            return { runtime::TafpuNum_C(0, 0, 0), runtime::TafpuNum_C(-1, 0, 0) };
        case SpecialAngle::DEG_270:
            return { runtime::TafpuNum_C(-1, 0, 0), runtime::TafpuNum_C(0, 0, 0) };
        default:
            return { runtime::TafpuNum_C(0, 0, 0), runtime::TafpuNum_C(1, 0, 0) };
    }
}

// ============================================================================
// 2. Deterministic Bounded CORDIC (Bit-Exact Across x86/ARM/Wasm)
// ============================================================================

inline std::pair<runtime::TafpuNum_C, runtime::TafpuNum_C> sincos_deterministic_cordic(double rad) {
    // Standardize rad to [-pi, pi]
    constexpr double PI = 3.14159265358979323846;
    while (rad > PI) rad -= 2.0 * PI;
    while (rad < -PI) rad += 2.0 * PI;

    // Check if close to special algebraic angle (< 1e-12)
    if (std::abs(rad) < 1e-12) return sincos_algebraic_exact(SpecialAngle::DEG_0);
    if (std::abs(rad - PI / 6.0) < 1e-12) return sincos_algebraic_exact(SpecialAngle::DEG_30);
    if (std::abs(rad - PI / 3.0) < 1e-12) return sincos_algebraic_exact(SpecialAngle::DEG_60);
    if (std::abs(rad - PI / 2.0) < 1e-12) return sincos_algebraic_exact(SpecialAngle::DEG_90);

    // Fixed 32-step CORDIC for bit-exact reproducibility across CPUs
    double x = 0.6072529350088812561694; // CORDIC gain K
    double y = 0.0;
    double z = rad;

    static const double atan_table[32] = {
        0.7853981633974483, 0.4636476090008061, 0.24497866312686414, 0.12435499454676144,
        0.06241880999595735, 0.031239833430268277, 0.015623728620476831, 0.007812341060101111,
        0.0039062301319669718, 0.0019531225164788188, 0.0009765621895593195, 0.0004882812111948983,
        0.00024414062014936177, 0.00012207031189367021, 6.103515617420877e-05, 3.0517578115526096e-05,
        1.5258789061315762e-05, 7.62939453110197e-06, 3.814697265606496e-06, 1.907348632810187e-06,
        9.536743164059608e-07, 4.7683715820308884e-07, 2.3841857910155798e-07, 1.1920928955078069e-07,
        5.960464477539055e-08, 2.9802322387695303e-08, 1.4901161193847653e-08, 7.450580596923828e-09,
        3.725290298461914e-09, 1.862645149230957e-09, 9.313225746154785e-10, 4.656612873077393e-10
    };

    for (int i = 0; i < 32; ++i) {
        double d = (z >= 0.0) ? 1.0 : -1.0;
        double next_x = x - d * (y / (1ULL << i));
        double next_y = y + d * (x / (1ULL << i));
        z -= d * atan_table[i];
        x = next_x;
        y = next_y;
    }

    int64_t sin_scaled = static_cast<int64_t>(std::round(y * 10000.0));
    int64_t cos_scaled = static_cast<int64_t>(std::round(x * 10000.0));

    return { runtime::TafpuNum_C(sin_scaled, 0, 0), runtime::TafpuNum_C(cos_scaled, 0, 0) };
}

// ============================================================================
// 3. High-Performance Standard Tensor Class
// ============================================================================

class Tensor {
public:
    Tensor(size_t rows, size_t cols, memory::TensorPrecision prec = memory::TensorPrecision::PACKED_TAFPU_16)
        : storage_(rows, cols, prec) {}

    size_t rows() const { return storage_.rows(); }
    size_t cols() const { return storage_.cols(); }
    size_t size() const { return storage_.size(); }

    void set(size_t r, size_t c, const runtime::TafpuNum_C& val) {
        storage_.set(r, c, val);
    }

    runtime::TafpuNum_C get(size_t r, size_t c) const {
        return storage_.get(r, c);
    }

    // Multiplication-free MatMul (@ operator) on Packed Tensor
    Tensor matmul_bitnet(const std::vector<int8_t>& weights) const {
        assert(weights.size() == rows() * cols());
        Tensor result(rows(), 1, memory::TensorPrecision::PACKED_TAFPU_32);

        for (size_t r = 0; r < rows(); ++r) {
            int64_t acc_a = 0;
            int64_t acc_b = 0;
            for (size_t c = 0; c < cols(); ++c) {
                int8_t w = weights[r * cols() + c];
                runtime::TafpuNum_C val = get(r, c);
                if (w == 1) {
                    acc_a += val.a;
                    acc_b += val.b;
                } else if (w == -1) {
                    acc_a -= val.a;
                    acc_b -= val.b;
                }
            }
            result.set(r, 0, runtime::TafpuNum_C(acc_a, acc_b, 0));
        }
        return result;
    }

    // Slice operation: tensor.slice(start_row, end_row)
    Tensor slice(size_t start_r, size_t end_r) const {
        assert(start_r < end_r && end_r <= rows());
        Tensor sub(end_r - start_r, cols(), storage_.precision());
        for (size_t r = start_r; r < end_r; ++r) {
            for (size_t c = 0; c < cols(); ++c) {
                sub.set(r - start_r, c, get(r, c));
            }
        }
        return sub;
    }

    const memory::PackedTensor& storage() const { return storage_; }

private:
    memory::PackedTensor storage_;
};

// 3D Euclidean Distance / Norm without coordinate drift
inline runtime::TafpuNum_C norm3d_taf(const runtime::TafpuNum_C& x, const runtime::TafpuNum_C& y, const runtime::TafpuNum_C& z) {
    runtime::TafpuNum_C x2 = runtime::tafpu_mul_c(x, x);
    runtime::TafpuNum_C y2 = runtime::tafpu_mul_c(y, y);
    runtime::TafpuNum_C z2 = runtime::tafpu_mul_c(z, z);
    return runtime::tafpu_add_c(runtime::tafpu_add_c(x2, y2), z2); // d^2 exact 0% error
}

} // namespace std_lib
} // namespace setun
