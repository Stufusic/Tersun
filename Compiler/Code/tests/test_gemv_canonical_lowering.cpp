#include "compiler/canonical_ternary_ir.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/arena.hpp"
#include <iostream>
#include <vector>
#include <cassert>
#include <cstring>

namespace setun::test {

static std::vector<int8_t> generate_gemv_weights(size_t n, int pattern) {
    std::vector<int8_t> w(n);
    for (size_t i = 0; i < n; ++i) {
        switch (pattern) {
            case 0: w[i] = 1; break;                            // All +1
            case 1: w[i] = 0; break;                            // All 0
            case 2: w[i] = -1; break;                           // All -1
            case 3: w[i] = (i % 2 == 0) ? 1 : 0; break;         // Alt +1/0
            case 4: w[i] = (i % 2 == 0) ? -1 : 0; break;        // Alt -1/0
            default:                                            // Deterministic pseudo-random
                w[i] = static_cast<int8_t>((static_cast<int>(i * 13 + 7) % 3) - 1);
                break;
        }
    }
    return w;
}

static std::vector<uint8_t> pack_gemv_weights(const std::vector<int8_t>& dense_w) {
    size_t total_trits = dense_w.size();
    size_t num_bytes = (total_trits + 3) / 4;
    // Add extra padding bytes to ensure safe 16-bit loads at the end
    std::vector<uint8_t> packed(num_bytes + 4, 0);
    for (size_t i = 0; i < total_trits; ++i) {
        int8_t t = dense_w[i];
        uint8_t code = 0;
        if (t == 1) code = 0b01;
        else if (t == -1) code = 0b10;
        else code = 0b00;

        size_t byte_idx = i / 4;
        size_t bit_shift = (i % 4) * 2;
        packed[byte_idx] |= (code << bit_shift);
    }
    return packed;
}

static std::vector<int32_t> generate_gemv_inputs(size_t n) {
    std::vector<int32_t> x(n);
    for (size_t i = 0; i < n; ++i) {
        x[i] = static_cast<int32_t>((static_cast<int>(i * 29 + 17) % 256) - 128);
    }
    return x;
}

static std::vector<int32_t> generate_gemv_bias(size_t n) {
    std::vector<int32_t> b(n);
    for (size_t i = 0; i < n; ++i) {
        b[i] = static_cast<int32_t>((static_cast<int>(i * 19 + 5) % 100) - 50);
    }
    return b;
}

void test_gemv_canonical_lowering_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.2] Canonical 2D GEMV IR & Multi-Target Lowering         \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: Checked 2D BCE & Multiplication Overflow Safety
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-BCE] Checked 2D BCE with checked multiplication... ";
    {
        using compiler::CanonicalTernaryEngine;
        using compiler::WeightLayout;

        // Valid dimensions
        size_t rows = 16;
        size_t cols = 64;
        size_t x_len = cols;
        size_t b_len = rows;
        size_t out_len = rows;
        size_t dense_w_len = rows * cols;
        size_t packed_w_len = (rows * cols + 3) / 4;

        assert(CanonicalTernaryEngine::verify_gemv_bce(
            rows, cols, x_len, b_len, out_len, dense_w_len, WeightLayout::DENSE_TRIT8
        ));
        assert(CanonicalTernaryEngine::verify_gemv_bce(
            rows, cols, x_len, b_len, out_len, packed_w_len, WeightLayout::PACKED_TRIT2
        ));

        // Invalid: x_len too small
        assert(!CanonicalTernaryEngine::verify_gemv_bce(
            rows, cols, cols - 1, b_len, out_len, dense_w_len, WeightLayout::DENSE_TRIT8
        ));

        // Invalid: out_len too small
        assert(!CanonicalTernaryEngine::verify_gemv_bce(
            rows, cols, x_len, b_len, rows - 1, dense_w_len, WeightLayout::DENSE_TRIT8
        ));

        // Invalid: weight too small
        assert(!CanonicalTernaryEngine::verify_gemv_bce(
            rows, cols, x_len, b_len, out_len, dense_w_len - 1, WeightLayout::DENSE_TRIT8
        ));
        assert(!CanonicalTernaryEngine::verify_gemv_bce(
            rows, cols, x_len, b_len, out_len, packed_w_len - 1, WeightLayout::PACKED_TRIT2
        ));

        // Extreme overflow check: rows = 0xFFFFFFFF, cols = 0xFFFFFFFF
        // In unchecked multiplication, (rows * cols) overflows to 1, which might falsely pass!
        size_t huge_rows = 0xFFFFFFFFULL;
        size_t huge_cols = 0xFFFFFFFFULL;
        assert(!CanonicalTernaryEngine::verify_gemv_bce(
            huge_rows, huge_cols, 100, 100, 100, 100, WeightLayout::DENSE_TRIT8
        ));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: Cross-Target Bit-Exact Parity Grid across Boundary Matrix
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-Parity] Multi-Target Bit-Exact Grid Parity... ";
    {
        using compiler::CanonicalTernaryEngine;
        using compiler::WeightLayout;
        using compiler::TernaryLoweringTarget;

        const std::vector<size_t> row_sizes = {1, 2, 4, 7, 8, 15, 16, 31, 32};
        const std::vector<size_t> col_sizes = {8, 15, 16, 31, 32, 63, 64, 128, 255, 256};
        const std::vector<int> patterns = {0, 1, 2, 3, 4, 5};

        size_t tests_run = 0;

        for (size_t N : row_sizes) {
            for (size_t K : col_sizes) {
                auto x = generate_gemv_inputs(K);
                auto bias = generate_gemv_bias(N);

                for (int pat : patterns) {
                    auto dense_w = generate_gemv_weights(N * K, pat);
                    auto packed_w = pack_gemv_weights(dense_w);

                    std::vector<int32_t> out_scalar_dense(N, 0);
                    std::vector<int32_t> out_scalar_packed(N, 0);
                    std::vector<int32_t> out_avx2_dense(N, 0);
                    std::vector<int32_t> out_avx2_packed(N, 0);
                    std::vector<int32_t> out_canon_dense(N, 0);
                    std::vector<int32_t> out_canon_packed(N, 0);

                    // 1. Scalar Dense
                    CanonicalTernaryEngine::execute_scalar_gemv(
                        x.data(), dense_w.data(), bias.data(), out_scalar_dense.data(), N, K
                    );

                    // 2. Scalar Packed
                    CanonicalTernaryEngine::execute_scalar_packed_gemv(
                        x.data(), packed_w.data(), bias.data(), out_scalar_packed.data(), N, K
                    );

                    // 3. AVX2 Dense
                    CanonicalTernaryEngine::execute_avx2_dense_gemv(
                        x.data(), dense_w.data(), bias.data(), out_avx2_dense.data(), N, K
                    );

                    // 4. AVX2 Packed
                    CanonicalTernaryEngine::execute_avx2_packed_gemv(
                        x.data(), packed_w.data(), bias.data(), out_avx2_packed.data(), N, K
                    );

                    // 5. Canonical Dispatcher Dense
                    CanonicalTernaryEngine::execute_canonical_gemv(
                        x.data(), dense_w.data(), bias.data(), out_canon_dense.data(), N, K,
                        WeightLayout::DENSE_TRIT8, TernaryLoweringTarget::AVX2_SIMD_SELECT
                    );

                    // 6. Canonical Dispatcher Packed
                    CanonicalTernaryEngine::execute_canonical_gemv(
                        x.data(), packed_w.data(), bias.data(), out_canon_packed.data(), N, K,
                        WeightLayout::PACKED_TRIT2, TernaryLoweringTarget::AVX2_SIMD_SELECT
                    );

                    // Verify 100% bit-exact equivalence
                    for (size_t r = 0; r < N; ++r) {
                        int32_t expected = out_scalar_dense[r];
                        if (out_scalar_packed[r] != expected ||
                            out_avx2_dense[r] != expected ||
                            out_avx2_packed[r] != expected ||
                            out_canon_dense[r] != expected ||
                            out_canon_packed[r] != expected) {
                            std::cerr << "\n[MISMATCH] at N=" << N << ", K=" << K
                                      << ", row=" << r << ", pattern=" << pat << "\n"
                                      << "  Scalar Dense:  " << expected << "\n"
                                      << "  Scalar Packed: " << out_scalar_packed[r] << "\n"
                                      << "  AVX2 Dense:    " << out_avx2_dense[r] << "\n"
                                      << "  AVX2 Packed:   " << out_avx2_packed[r] << "\n"
                                      << "  Canon Dense:   " << out_canon_dense[r] << "\n"
                                      << "  Canon Packed:  " << out_canon_packed[r] << "\n";
                            assert(false);
                        }
                    }
                    tests_run++;
                }
            }
        }
        std::cout << "PASSED (" << tests_run << " matrix configurations verified bit-exact)\n";
    }

    // -------------------------------------------------------------
    // Test 3: AST 2D GEMV Loop Canonicalization
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-Canon] AST 2D GEMV canonicalization pattern matching... ";
    {
        using compiler::CanonicalTernaryEngine;
        using compiler::CanonicalTernaryGEMVNode;
        using compiler::WeightLayout;

        ArenaAllocator arena;
        SourceLocation dummy_loc{1, 1};

        // Create a synthetic while loop representing 2D GEMV
        auto* idx_w = arena.make<Expr>(IdentifierExpr{"weights", dummy_loc}, dummy_loc);
        auto* idx_c = arena.make<Expr>(IdentifierExpr{"c", dummy_loc}, dummy_loc);
        auto* idx_expr = arena.make<Expr>(IndexExpr{idx_w, idx_c, dummy_loc}, dummy_loc);

        Branch3Stmt b3{idx_expr, nullptr, nullptr, nullptr, dummy_loc};
        auto* b3_stmt = arena.make<Stmt>(StmtData{b3}, dummy_loc);
        std::vector<Stmt*> body_stmts = {b3_stmt};
        BlockStmt body_block{body_stmts, dummy_loc};
        auto* body_stmt = arena.make<Stmt>(StmtData{body_block}, dummy_loc);

        WhileStmt inner_while{nullptr, body_stmt, dummy_loc, ""};
        auto* inner_while_stmt = arena.make<Stmt>(StmtData{inner_while}, dummy_loc);
        std::vector<Stmt*> outer_body_stmts = {inner_while_stmt};
        BlockStmt outer_body_block{outer_body_stmts, dummy_loc};
        auto* outer_body_stmt = arena.make<Stmt>(StmtData{outer_body_block}, dummy_loc);

        WhileStmt outer_while{nullptr, outer_body_stmt, dummy_loc, ""};

        CanonicalTernaryGEMVNode gemv_node;
        bool canon_ok = CanonicalTernaryEngine::can_canonicalize_gemv(outer_while, gemv_node);
        assert(canon_ok);
        assert(gemv_node.weights.name == "weights");
        assert(gemv_node.bounds_proven == true);
        assert(gemv_node.noalias_proven == true);
    }
    std::cout << "PASSED\n";

    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.3.2: All GEMV Canonical Lowering Tests Passed (100%)!      \n";
    std::cout << "===================================================================\n";
}

} // namespace setun::test
