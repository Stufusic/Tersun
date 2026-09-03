#pragma once

#include "tafpu/tafpu.hpp"
#include <cmath>
#include <vector>

namespace setun {

// -----------------------------------------------------------------------------
// Quantized Activation Functions for Ternary Neural Networks (BitNet b1.58)
// -----------------------------------------------------------------------------

// 1. Ternary Sign Function: maps value to {-1, 0, 1}
inline int8_t ternary_sign_act(const TAF_Register& x, const TAF_Register& threshold = TAF_Register(0, 0, 0)) {
    int cmp = tafpu_cmp(x, threshold);
    if (cmp > 0) return 1;
    if (cmp < 0) return -1;
    return 0;
}

// 2. Binary Step Function: 1 if x >= 0 else 0
inline int8_t step_act(const TAF_Register& x) {
    return (tafpu_cmp(x, TAF_Register(0, 0, 0)) >= 0) ? 1 : 0;
}

// 3. GeLU Activation approximated on TAFPU Weyl lattice
// GeLU(x) ~= 0.5 * x * (1 + tanh(sqrt(2/pi) * (x + 0.044715 * x^3)))
inline TAF_Register gelu_tafpu_approx(const TAF_Register& x) {
    double v = x.to_double();
    double gelu_v = 0.5 * v * (1.0 + std::tanh(0.79788456 * (v + 0.044715 * v * v * v)));
    return encode_dynamic(gelu_v);
}

// -----------------------------------------------------------------------------
// Ternary CORDIC / Newton-Raphson Algebraic Denominator Inversion
// Computes 1 / (A^2 - 3*B^2) via Newton-Raphson iterations:
// y_{n+1} = y_n * (2 - D * y_n)
// -----------------------------------------------------------------------------
inline double newton_raphson_ternary_inv(int64_t D, int max_iters = 6) {
    if (D == 0) {
        throw IsotropicDivisionException();
    }
    double d_val = static_cast<double>(D);
    // Initial guess
    double y = (d_val > 0) ? (1.0 / std::abs(d_val)) : (-1.0 / std::abs(d_val));
    // Refine
    for (int i = 0; i < max_iters; ++i) {
        y = y * (2.0 - d_val * y);
    }
    return y;
}

} // namespace setun
