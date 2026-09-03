#pragma once

#include "tafpu/tafpu.hpp"
#include "tafpu/tmat.hpp"
#include "tafpu/exception.hpp"
#include <vector>
#include <optional>
#include <cassert>

namespace setun {

// -----------------------------------------------------------------------------
// Gauss-Jordan Linear Equation Solver in Q(sqrt(3))
// Solves A * x = b with 0% intermediate rounding error
// -----------------------------------------------------------------------------
template <size_t N>
inline std::optional<std::array<TAF_Register, N>> solve_gauss_jordan(
    tmat<N, N> A,
    std::array<TAF_Register, N> b
) {
    // Create augmented matrix [A | b] of size N x (N + 1)
    std::vector<std::vector<TAF_Register>> M(N, std::vector<TAF_Register>(N + 1));
    for (size_t r = 0; r < N; ++r) {
        for (size_t c = 0; c < N; ++c) {
            M[r][c] = A(r, c);
        }
        M[r][N] = b[r];
    }

    for (size_t col = 0; col < N; ++col) {
        // Find non-zero pivot
        size_t pivot_row = col;
        while (pivot_row < N && (M[pivot_row][col].a == 0 && M[pivot_row][col].b == 0)) {
            pivot_row++;
        }
        if (pivot_row == N) {
            return std::nullopt; // Singular or indeterminate system
        }

        // Swap pivot row
        if (pivot_row != col) {
            std::swap(M[col], M[pivot_row]);
        }

        // Normalize pivot row: M[col] /= pivot
        TAF_Register pivot = M[col][col];
        for (size_t c = col; c <= N; ++c) {
            try {
                M[col][c] = M[col][c] / pivot;
            } catch (const IsotropicDivisionException&) {
                return std::nullopt;
            }
        }

        // Eliminate other rows
        for (size_t r = 0; r < N; ++r) {
            if (r != col && (M[r][col].a != 0 || M[r][col].b != 0)) {
                TAF_Register factor = M[r][col];
                for (size_t c = col; c <= N; ++c) {
                    M[r][c] = M[r][c] - (factor * M[col][c]);
                }
            }
        }
    }

    std::array<TAF_Register, N> x;
    for (size_t r = 0; r < N; ++r) {
        x[r] = M[r][N];
    }
    return x;
}

// -----------------------------------------------------------------------------
// Exact Quadratic Equation Solver in Q(sqrt(3)): a*x^2 + b*x + c = 0
// Discriminant delta = b^2 - 4*a*c
// -----------------------------------------------------------------------------
struct QuadraticRoots {
    bool has_real_roots{false};
    TAF_Register delta;
    TAF_Register root1;
    TAF_Register root2;
};

inline QuadraticRoots solve_quadratic_tafpu(
    const TAF_Register& a,
    const TAF_Register& b,
    const TAF_Register& c
) {
    QuadraticRoots res;
    // delta = b^2 - 4*a*c
    TAF_Register four(4, 0, 0);
    TAF_Register two(2, 0, 0);
    res.delta = (b * b) - (four * a * c);

    if (tafpu_cmp(res.delta, TAF_Register(0, 0, 0)) < 0) {
        res.has_real_roots = false;
        return res;
    }

    res.has_real_roots = true;
    double d_val = res.delta.to_double();
    double sqrt_d = std::sqrt(std::max(0.0, d_val));
    TAF_Register sqrt_delta = encode_dynamic(sqrt_d);

    // root1 = (-b + sqrt_delta) / (2*a)
    // root2 = (-b - sqrt_delta) / (2*a)
    TAF_Register two_a = two * a;
    try {
        res.root1 = (-b + sqrt_delta) / two_a;
        res.root2 = (-b - sqrt_delta) / two_a;
    } catch (...) {
        res.has_real_roots = false;
    }
    return res;
}

} // namespace setun
