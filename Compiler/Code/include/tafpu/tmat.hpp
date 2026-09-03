#pragma once

#include "tafpu/tafpu.hpp"
#include <array>
#include <vector>
#include <cassert>
#include <iostream>
#include <sstream>
#include <iomanip>

namespace setun {

// -----------------------------------------------------------------------------
// tmat<Rows, Cols>: TAFPU Exact Algebraic Matrix in Q(sqrt(3))
// -----------------------------------------------------------------------------
template <size_t Rows, size_t Cols>
struct tmat {
    std::array<TAF_Register, Rows * Cols> data{};

    tmat() {
        data.fill(TAF_Register(0, 0, 0));
    }

    static tmat identity() {
        static_assert(Rows == Cols, "Identity matrix must be square.");
        tmat res;
        for (size_t i = 0; i < Rows; ++i) {
            res(i, i) = TAF_Register(1, 0, 0);
        }
        return res;
    }

    TAF_Register& operator()(size_t r, size_t c) {
        assert(r < Rows && c < Cols);
        return data[r * Cols + c];
    }

    const TAF_Register& operator()(size_t r, size_t c) const {
        assert(r < Rows && c < Cols);
        return data[r * Cols + c];
    }

    tmat<Cols, Rows> transpose() const {
        tmat<Cols, Rows> res;
        for (size_t r = 0; r < Rows; ++r) {
            for (size_t c = 0; c < Cols; ++c) {
                res(c, r) = (*this)(r, c);
            }
        }
        return res;
    }

    tmat<Rows, Cols> operator+(const tmat<Rows, Cols>& other) const {
        tmat<Rows, Cols> res;
        for (size_t i = 0; i < Rows * Cols; ++i) {
            res.data[i] = data[i] + other.data[i];
        }
        return res;
    }

    tmat<Rows, Cols> operator-(const tmat<Rows, Cols>& other) const {
        tmat<Rows, Cols> res;
        for (size_t i = 0; i < Rows * Cols; ++i) {
            res.data[i] = data[i] - other.data[i];
        }
        return res;
    }

    template <size_t OtherCols>
    tmat<Rows, OtherCols> operator*(const tmat<Cols, OtherCols>& other) const {
        tmat<Rows, OtherCols> res;
        for (size_t r = 0; r < Rows; ++r) {
            for (size_t k = 0; k < Cols; ++k) {
                TAF_Register val = (*this)(r, k);
                if (val.a == 0 && val.b == 0) continue; // Zero-skip optimization
                for (size_t c = 0; c < OtherCols; ++c) {
                    res(r, c) = res(r, c) + (val * other(k, c));
                }
            }
        }
        return res;
    }

    std::string to_string() const {
        std::ostringstream oss;
        oss << "tmat<" << Rows << "x" << Cols << ">:\n";
        for (size_t r = 0; r < Rows; ++r) {
            oss << "  [ ";
            for (size_t c = 0; c < Cols; ++c) {
                oss << (*this)(r, c).to_string(false) << " ";
            }
            oss << "]\n";
        }
        return oss.str();
    }
};

// Determinant for 2x2
inline TAF_Register det2x2(const tmat<2, 2>& m) {
    return (m(0, 0) * m(1, 1)) - (m(0, 1) * m(1, 0));
}

// Determinant for 3x3
inline TAF_Register det3x3(const tmat<3, 3>& m) {
    TAF_Register c0 = m(0, 0) * ((m(1, 1) * m(2, 2)) - (m(1, 2) * m(2, 1)));
    TAF_Register c1 = m(0, 1) * ((m(1, 0) * m(2, 2)) - (m(1, 2) * m(2, 0)));
    TAF_Register c2 = m(0, 2) * ((m(1, 0) * m(2, 1)) - (m(1, 1) * m(2, 0)));
    return c0 - c1 + c2;
}

// -----------------------------------------------------------------------------
// Multiplication-Free GEMM (1.58-bit / BitNet Ternary Weights {-1, 0, 1})
// Output Y = W * X where W in {-1, 0, 1}^(M x K), X in Q(sqrt(3))^K
// Completely avoids hardware multipliers by using zero-skip and additions/subtractions!
// -----------------------------------------------------------------------------
inline std::vector<TAF_Register> gemm_ternary_weights(
    const int8_t* W,                      // Flattened ternary weights {-1, 0, 1}
    const TAF_Register* X,                // TAFPU activation vector of size K
    size_t M,                             // Number of output rows
    size_t K                              // Number of input columns
) {
    std::vector<TAF_Register> Y(M, TAF_Register(0, 0, 0));

    for (size_t r = 0; r < M; ++r) {
        TAF_Register accum(0, 0, 0);
        const int8_t* row_w = W + r * K;
        for (size_t c = 0; c < K; ++c) {
            int8_t w = row_w[c];
            if (w == 0) continue; // Zero-skip: zero compute cost!
            if (w == 1) {
                accum = accum + X[c];
            } else if (w == -1) {
                accum = accum - X[c];
            }
        }
        Y[r] = accum;
    }
    return Y;
}

// -----------------------------------------------------------------------------
// Exact Affine Transformation 4x4 with Q(sqrt(3)) Rotations
// -----------------------------------------------------------------------------
struct AffineTransform4x4 {
    tmat<4, 4> matrix;

    AffineTransform4x4() : matrix(tmat<4, 4>::identity()) {}

    static AffineTransform4x4 translation(const TAF_Register& tx, const TAF_Register& ty, const TAF_Register& tz) {
        AffineTransform4x4 res;
        res.matrix(0, 3) = tx;
        res.matrix(1, 3) = ty;
        res.matrix(2, 3) = tz;
        return res;
    }

    // Exact rotation around Z-axis by pi/6 (30 degrees):
    // cos(pi/6) = sqrt(3)/2 = [0, 1, 0] / 2 -> scaled: [0, 1, -2] (since 3^(-2/2) / 3 ? No, [0, 1, 0] * 3^(0/2) = sqrt(3))
    // In TAFPU: cos(pi/6) = [0, 1, 0] * 3^(0/2) / 2 = [0, 1, 0] / 2
    // Or exact coefficients with scale: [0, 1, 0] / [2, 0, 0]
    static AffineTransform4x4 rotation_z_pi_6() {
        // cos(30 deg) = sqrt(3)/2, sin(30 deg) = 1/2
        TAF_Register half(1, 0, 0); // 1/2 handled by fractional representation or exact division
        TAF_Register cos_val = TAF_Register(0, 1, 0) / TAF_Register(2, 0, 0); // sqrt(3)/2
        TAF_Register sin_val = TAF_Register(1, 0, 0) / TAF_Register(2, 0, 0); // 1/2

        AffineTransform4x4 res;
        res.matrix(0, 0) = cos_val;
        res.matrix(0, 1) = -sin_val;
        res.matrix(1, 0) = sin_val;
        res.matrix(1, 1) = cos_val;
        return res;
    }

    static AffineTransform4x4 rotation_z_pi_3() {
        // cos(60 deg) = 1/2, sin(60 deg) = sqrt(3)/2
        TAF_Register cos_val = TAF_Register(1, 0, 0) / TAF_Register(2, 0, 0);
        TAF_Register sin_val = TAF_Register(0, 1, 0) / TAF_Register(2, 0, 0);

        AffineTransform4x4 res;
        res.matrix(0, 0) = cos_val;
        res.matrix(0, 1) = -sin_val;
        res.matrix(1, 0) = sin_val;
        res.matrix(1, 1) = cos_val;
        return res;
    }
};

} // namespace setun
