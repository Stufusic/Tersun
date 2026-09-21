#include "compiler/canonical_ternary_ir.hpp"
#include <iostream>
#include <cassert>
#include <algorithm>
#include <cstring>

#if defined(__x86_64__) || defined(_M_X64)
#include <immintrin.h>
#endif

namespace setun::compiler {

// Lookup table for decoding PackedTernaryLayout v1 (4 trits/byte, Little-Endian):
// 00b (0) -> 0, 01b (1) -> +1, 10b (2) -> -1, 11b (3) -> 0 (padding)
alignas(16) static const int32_t TRIT_LUT_INT32[4] = {0, 1, -1, 0};

bool CanonicalTernaryEngine::can_canonicalize_call(
    const CallExpr& call,
    CanonicalTernaryAccumulateNode& out_node
) {
    if (call.callee == "ternary_dot" || call.callee == "ternary_dot_accumulate") {
        if (call.args.size() >= 2) {
            out_node.func_name = call.callee;
            out_node.target = TernaryLoweringTarget::AVX2_SIMD_SELECT;
            out_node.layout = WeightLayout::DENSE_TRIT8;
            out_node.bce_hoisted = true;
            out_node.alias_free = true;
            out_node.fused_load_decode_accumulate = true;

            if (std::holds_alternative<IdentifierExpr>(call.args[0]->data)) {
                out_node.input = ValueId{0, std::get<IdentifierExpr>(call.args[0]->data).name};
            }
            if (std::holds_alternative<IdentifierExpr>(call.args[1]->data)) {
                out_node.weights = ValueId{1, std::get<IdentifierExpr>(call.args[1]->data).name};
            }
            if (call.args.size() >= 3 && std::holds_alternative<IdentifierExpr>(call.args[2]->data)) {
                out_node.bias = ValueId{2, std::get<IdentifierExpr>(call.args[2]->data).name};
            }
            return true;
        }
    }
    return false;
}

bool CanonicalTernaryEngine::can_canonicalize_loop(
    const WhileStmt& loop,
    CanonicalTernaryAccumulateNode& out_node
) {
    if (!loop.body) return false;

    const BlockStmt* block = nullptr;
    if (std::holds_alternative<BlockStmt>(loop.body->data)) {
        block = &std::get<BlockStmt>(loop.body->data);
    } else {
        return false;
    }

    for (const auto* stmt : block->statements) {
        if (stmt && std::holds_alternative<Branch3Stmt>(stmt->data)) {
            const auto& b3 = std::get<Branch3Stmt>(stmt->data);
            if (b3.condition && std::holds_alternative<IndexExpr>(b3.condition->data)) {
                const auto& idx_expr = std::get<IndexExpr>(b3.condition->data);
                if (idx_expr.object && std::holds_alternative<IdentifierExpr>(idx_expr.object->data)) {
                    out_node.weights = ValueId{1, std::get<IdentifierExpr>(idx_expr.object->data).name};
                    out_node.func_name = "dendrite_loop_canonical";
                    out_node.bce_hoisted = true;
                    out_node.alias_free = true;
                    out_node.fused_load_decode_accumulate = true;
                    out_node.target = TernaryLoweringTarget::AVX2_SIMD_SELECT;
                    out_node.layout = WeightLayout::DENSE_TRIT8;
                    return true;
                }
            }
        }
    }
    return false;
}

bool CanonicalTernaryEngine::can_canonicalize_gemv(
    const WhileStmt& loop,
    CanonicalTernaryGEMVNode& out_node
) {
    if (!loop.body) return false;

    const BlockStmt* block = nullptr;
    if (std::holds_alternative<BlockStmt>(loop.body->data)) {
        block = &std::get<BlockStmt>(loop.body->data);
    } else {
        return false;
    }

    for (const auto* stmt : block->statements) {
        if (!stmt) continue;
        if (std::holds_alternative<IndexAssignStmt>(stmt->data)) {
            const auto& assign = std::get<IndexAssignStmt>(stmt->data);
            if (assign.object && std::holds_alternative<IdentifierExpr>(assign.object->data)) {
                out_node.output = ValueId{3, std::get<IdentifierExpr>(assign.object->data).name};
            }
            if (assign.value && std::holds_alternative<CallExpr>(assign.value->data)) {
                const auto& call = std::get<CallExpr>(assign.value->data);
                if (call.callee == "ternary_dot" && call.args.size() >= 2) {
                    if (std::holds_alternative<IdentifierExpr>(call.args[0]->data)) {
                        out_node.input = ValueId{0, std::get<IdentifierExpr>(call.args[0]->data).name};
                    }
                    if (call.args.size() >= 2 && std::holds_alternative<IdentifierExpr>(call.args[1]->data)) {
                        out_node.weights = ValueId{1, std::get<IdentifierExpr>(call.args[1]->data).name};
                    }
                    out_node.func_name = "bit_linear_gemv_canonical";
                    out_node.bounds_proven = true;
                    out_node.noalias_proven = true;
                    out_node.unroll_factor = 4;
                    out_node.layout = WeightLayout::DENSE_TRIT8;
                    return true;
                }
            }
        } else if (std::holds_alternative<WhileStmt>(stmt->data)) {
            // Pattern 2: Nested while loop containing dendritic accumulate
            CanonicalTernaryAccumulateNode inner_acc;
            if (can_canonicalize_loop(std::get<WhileStmt>(stmt->data), inner_acc)) {
                out_node.func_name = "bit_linear_gemv_canonical";
                out_node.weights = inner_acc.weights;
                out_node.input = inner_acc.input;
                out_node.bias = inner_acc.bias;
                out_node.bounds_proven = true;
                out_node.noalias_proven = true;
                out_node.unroll_factor = 4;
                out_node.layout = WeightLayout::DENSE_TRIT8;
                return true;
            }
        }
    }
    return false;
}

bool CanonicalTernaryEngine::verify_and_hoist_bce(size_t input_len, size_t weight_len) {
    return (input_len == weight_len);
}

bool CanonicalTernaryEngine::verify_gemv_bce(
    size_t rows, size_t cols,
    size_t x_len, size_t b_len, size_t out_len, size_t w_len,
    WeightLayout layout
) {
    if (x_len != cols) return false;
    if (b_len != rows || out_len != rows) return false;
    if (cols == 0) return true;

    // Checked multiplication to avoid integer overflow
    if (rows > SIZE_MAX / cols) return false;
    size_t total_trits = rows * cols;

    if (layout == WeightLayout::PACKED_TRIT2) {
        // 4 trits per byte: required bytes = ceil(total_trits / 4)
        size_t required_bytes = (total_trits + 3) / 4;
        return (w_len >= required_bytes);
    } else {
        // Dense int8: required elements = rows * cols
        return (rows <= w_len / cols);
    }
}

// -------------------------------------------------------------
// 1D Lowering Implementations
// -------------------------------------------------------------
int32_t CanonicalTernaryEngine::execute_scalar_oracle(
    const int32_t* inputs,
    const int8_t* weights,
    size_t count,
    int32_t bias
) {
    if (!inputs || !weights) return bias;

    int64_t acc = bias;
    for (size_t i = 0; i < count; ++i) {
        int8_t w = weights[i];
        if (w == 1) {
            acc += inputs[i];
        } else if (w == -1) {
            acc -= inputs[i];
        }
    }
    return static_cast<int32_t>(acc);
}

int32_t CanonicalTernaryEngine::execute_avx2_vector(
    const int32_t* inputs,
    const int8_t* weights,
    size_t count,
    int32_t bias
) {
    if (!inputs || !weights) return bias;

#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    __m256i acc_vec = _mm256_setzero_si256();
    const __m256i v_one = _mm256_set1_epi32(1);
    const __m256i v_neg_one = _mm256_set1_epi32(-1);

    size_t i = 0;
    for (; i + 8 <= count; i += 8) {
        __m256i x = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(inputs + i));
        __m128i w8 = _mm_loadl_epi64(reinterpret_cast<const __m128i*>(weights + i));
        __m256i w = _mm256_cvtepi8_epi32(w8);

        __m256i mask_pos = _mm256_cmpeq_epi32(w, v_one);
        __m256i mask_neg = _mm256_cmpeq_epi32(w, v_neg_one);

        acc_vec = _mm256_add_epi32(acc_vec, _mm256_and_si256(x, mask_pos));
        acc_vec = _mm256_sub_epi32(acc_vec, _mm256_and_si256(x, mask_neg));
    }

    alignas(32) int32_t lanes[8];
    _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc_vec);
    int32_t sum = bias;
    for (int k = 0; k < 8; ++k) sum += lanes[k];

    for (; i < count; ++i) {
        int8_t w = weights[i];
        if (w == 1) sum += inputs[i];
        else if (w == -1) sum -= inputs[i];
    }
    return sum;
#else
    return execute_scalar_oracle(inputs, weights, count, bias);
#endif
}

int32_t CanonicalTernaryEngine::execute_canonical(
    const int32_t* inputs,
    const int8_t* weights,
    size_t count,
    int32_t bias,
    TernaryLoweringTarget target
) {
    switch (target) {
        case TernaryLoweringTarget::AVX2_SIMD_SELECT:
        case TernaryLoweringTarget::AVX2_PACKED_SELECT:
            return execute_avx2_vector(inputs, weights, count, bias);
        case TernaryLoweringTarget::SCALAR_ORACLE:
        default:
            return execute_scalar_oracle(inputs, weights, count, bias);
    }
}

// -------------------------------------------------------------
// Gate 7.3.2: 2D GEMV Lowering Implementations
// -------------------------------------------------------------
void CanonicalTernaryEngine::execute_scalar_gemv(
    const int32_t* x,
    const int8_t* w,
    const int32_t* bias,
    int32_t* out,
    size_t rows,
    size_t cols
) {
    if (!x || !w || !out) return;

    for (size_t r = 0; r < rows; ++r) {
        int64_t acc = bias ? bias[r] : 0;
        const int8_t* w_row = w + r * cols;
        for (size_t c = 0; c < cols; ++c) {
            int8_t weight = w_row[c];
            if (weight == 1) acc += x[c];
            else if (weight == -1) acc -= x[c];
        }
        out[r] = static_cast<int32_t>(acc);
    }
}

void CanonicalTernaryEngine::execute_scalar_packed_gemv(
    const int32_t* x,
    const uint8_t* packed_w,
    const int32_t* bias,
    int32_t* out,
    size_t rows,
    size_t cols
) {
    if (!x || !packed_w || !out) return;

    for (size_t r = 0; r < rows; ++r) {
        int64_t acc = bias ? bias[r] : 0;
        size_t base_trit = r * cols;
        for (size_t c = 0; c < cols; ++c) {
            size_t trit_idx = base_trit + c;
            uint8_t byte = packed_w[trit_idx / 4];
            uint8_t code = (byte >> ((trit_idx % 4) * 2)) & 0b11;
            // 00b -> 0, 01b -> +1, 10b -> -1, 11b -> 0
            if (code == 1) acc += x[c];
            else if (code == 2) acc -= x[c];
        }
        out[r] = static_cast<int32_t>(acc);
    }
}

void CanonicalTernaryEngine::execute_avx2_dense_gemv(
    const int32_t* x,
    const int8_t* w,
    const int32_t* bias,
    int32_t* out,
    size_t rows,
    size_t cols,
    size_t unroll_factor
) {
    if (!x || !w || !out) return;

#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    const __m256i v_one = _mm256_set1_epi32(1);
    const __m256i v_neg_one = _mm256_set1_epi32(-1);

    size_t r = 0;
    if (unroll_factor >= 4) {
        for (; r + 4 <= rows; r += 4) {
            __m256i acc0 = _mm256_setzero_si256();
            __m256i acc1 = _mm256_setzero_si256();
            __m256i acc2 = _mm256_setzero_si256();
            __m256i acc3 = _mm256_setzero_si256();

            const int8_t* w0 = w + (r + 0) * cols;
            const int8_t* w1 = w + (r + 1) * cols;
            const int8_t* w2 = w + (r + 2) * cols;
            const int8_t* w3 = w + (r + 3) * cols;

            size_t c = 0;
            for (; c + 8 <= cols; c += 8) {
                __m256i vx = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(x + c));

                __m256i vw0 = _mm256_cvtepi8_epi32(_mm_loadl_epi64(reinterpret_cast<const __m128i*>(w0 + c)));
                __m256i vw1 = _mm256_cvtepi8_epi32(_mm_loadl_epi64(reinterpret_cast<const __m128i*>(w1 + c)));
                __m256i vw2 = _mm256_cvtepi8_epi32(_mm_loadl_epi64(reinterpret_cast<const __m128i*>(w2 + c)));
                __m256i vw3 = _mm256_cvtepi8_epi32(_mm_loadl_epi64(reinterpret_cast<const __m128i*>(w3 + c)));

                acc0 = _mm256_add_epi32(acc0, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw0, v_one)));
                acc0 = _mm256_sub_epi32(acc0, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw0, v_neg_one)));

                acc1 = _mm256_add_epi32(acc1, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw1, v_one)));
                acc1 = _mm256_sub_epi32(acc1, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw1, v_neg_one)));

                acc2 = _mm256_add_epi32(acc2, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw2, v_one)));
                acc2 = _mm256_sub_epi32(acc2, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw2, v_neg_one)));

                acc3 = _mm256_add_epi32(acc3, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw3, v_one)));
                acc3 = _mm256_sub_epi32(acc3, _mm256_and_si256(vx, _mm256_cmpeq_epi32(vw3, v_neg_one)));
            }

            alignas(32) int32_t lanes[8];
            auto reduce_row = [&](__m256i acc, int32_t b, const int8_t* rw) -> int32_t {
                _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc);
                int32_t s = b;
                for (int k = 0; k < 8; ++k) s += lanes[k];
                for (size_t rc = c; rc < cols; ++rc) {
                    if (rw[rc] == 1) s += x[rc];
                    else if (rw[rc] == -1) s -= x[rc];
                }
                return s;
            };

            out[r + 0] = reduce_row(acc0, bias ? bias[r + 0] : 0, w0);
            out[r + 1] = reduce_row(acc1, bias ? bias[r + 1] : 0, w1);
            out[r + 2] = reduce_row(acc2, bias ? bias[r + 2] : 0, w2);
            out[r + 3] = reduce_row(acc3, bias ? bias[r + 3] : 0, w3);
        }
    }

    // Remainder rows
    for (; r < rows; ++r) {
        out[r] = execute_avx2_vector(x, w + r * cols, cols, bias ? bias[r] : 0);
    }
#else
    execute_scalar_gemv(x, w, bias, out, rows, cols);
#endif
}

static inline uint16_t load_8_packed_trits(const uint8_t* packed_w, size_t flat_idx) {
    size_t byte_idx = flat_idx / 4;
    size_t bit_shift = (flat_idx % 4) * 2;
    uint32_t val32 = 0;
    std::memcpy(&val32, packed_w + byte_idx, sizeof(uint32_t));
    return static_cast<uint16_t>(val32 >> bit_shift);
}

void CanonicalTernaryEngine::execute_avx2_packed_gemv(
    const int32_t* x,
    const uint8_t* packed_w,
    const int32_t* bias,
    int32_t* out,
    size_t rows,
    size_t cols,
    size_t unroll_factor
) {
    if (!x || !packed_w || !out) return;

#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    size_t r = 0;

    // 4-row unrolling: loads vx once and broadcasts across 4 row accumulators
    if (unroll_factor >= 4) {
        for (; r + 4 <= rows; r += 4) {
            __m256i acc0 = _mm256_setzero_si256();
            __m256i acc1 = _mm256_setzero_si256();
            __m256i acc2 = _mm256_setzero_si256();
            __m256i acc3 = _mm256_setzero_si256();

            size_t base_t0 = (r + 0) * cols;
            size_t base_t1 = (r + 1) * cols;
            size_t base_t2 = (r + 2) * cols;
            size_t base_t3 = (r + 3) * cols;

            size_t c = 0;
            // 8 elements per vector iteration (2 bytes of packed weights per row)
            for (; c + 8 <= cols; c += 8) {
                __m256i vx = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(x + c));

                // Row 0
                uint16_t w0 = load_8_packed_trits(packed_w, base_t0 + c);
                __m256i s0 = _mm256_setr_epi32(
                    TRIT_LUT_INT32[(w0 >> 0) & 3],  TRIT_LUT_INT32[(w0 >> 2) & 3],
                    TRIT_LUT_INT32[(w0 >> 4) & 3],  TRIT_LUT_INT32[(w0 >> 6) & 3],
                    TRIT_LUT_INT32[(w0 >> 8) & 3],  TRIT_LUT_INT32[(w0 >> 10) & 3],
                    TRIT_LUT_INT32[(w0 >> 12) & 3], TRIT_LUT_INT32[(w0 >> 14) & 3]
                );
                acc0 = _mm256_add_epi32(acc0, _mm256_sign_epi32(vx, s0));

                // Row 1
                uint16_t w1 = load_8_packed_trits(packed_w, base_t1 + c);
                __m256i s1 = _mm256_setr_epi32(
                    TRIT_LUT_INT32[(w1 >> 0) & 3],  TRIT_LUT_INT32[(w1 >> 2) & 3],
                    TRIT_LUT_INT32[(w1 >> 4) & 3],  TRIT_LUT_INT32[(w1 >> 6) & 3],
                    TRIT_LUT_INT32[(w1 >> 8) & 3],  TRIT_LUT_INT32[(w1 >> 10) & 3],
                    TRIT_LUT_INT32[(w1 >> 12) & 3], TRIT_LUT_INT32[(w1 >> 14) & 3]
                );
                acc1 = _mm256_add_epi32(acc1, _mm256_sign_epi32(vx, s1));

                // Row 2
                uint16_t w2 = load_8_packed_trits(packed_w, base_t2 + c);
                __m256i s2 = _mm256_setr_epi32(
                    TRIT_LUT_INT32[(w2 >> 0) & 3],  TRIT_LUT_INT32[(w2 >> 2) & 3],
                    TRIT_LUT_INT32[(w2 >> 4) & 3],  TRIT_LUT_INT32[(w2 >> 6) & 3],
                    TRIT_LUT_INT32[(w2 >> 8) & 3],  TRIT_LUT_INT32[(w2 >> 10) & 3],
                    TRIT_LUT_INT32[(w2 >> 12) & 3], TRIT_LUT_INT32[(w2 >> 14) & 3]
                );
                acc2 = _mm256_add_epi32(acc2, _mm256_sign_epi32(vx, s2));

                // Row 3
                uint16_t w3 = load_8_packed_trits(packed_w, base_t3 + c);
                __m256i s3 = _mm256_setr_epi32(
                    TRIT_LUT_INT32[(w3 >> 0) & 3],  TRIT_LUT_INT32[(w3 >> 2) & 3],
                    TRIT_LUT_INT32[(w3 >> 4) & 3],  TRIT_LUT_INT32[(w3 >> 6) & 3],
                    TRIT_LUT_INT32[(w3 >> 8) & 3],  TRIT_LUT_INT32[(w3 >> 10) & 3],
                    TRIT_LUT_INT32[(w3 >> 12) & 3], TRIT_LUT_INT32[(w3 >> 14) & 3]
                );
                acc3 = _mm256_add_epi32(acc3, _mm256_sign_epi32(vx, s3));
            }

            alignas(32) int32_t lanes[8];
            auto reduce_packed_row = [&](__m256i acc, int32_t b, size_t base_t) -> int32_t {
                _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc);
                int32_t s = b;
                for (int k = 0; k < 8; ++k) s += lanes[k];
                for (size_t rc = c; rc < cols; ++rc) {
                    size_t trit_idx = base_t + rc;
                    uint8_t byte = packed_w[trit_idx / 4];
                    uint8_t code = (byte >> ((trit_idx % 4) * 2)) & 0b11;
                    if (code == 1) s += x[rc];
                    else if (code == 2) s -= x[rc];
                }
                return s;
            };

            out[r + 0] = reduce_packed_row(acc0, bias ? bias[r + 0] : 0, base_t0);
            out[r + 1] = reduce_packed_row(acc1, bias ? bias[r + 1] : 0, base_t1);
            out[r + 2] = reduce_packed_row(acc2, bias ? bias[r + 2] : 0, base_t2);
            out[r + 3] = reduce_packed_row(acc3, bias ? bias[r + 3] : 0, base_t3);
        }
    }

    // Single-row remainder loop
    for (; r < rows; ++r) {
        __m256i acc = _mm256_setzero_si256();
        size_t base_t = r * cols;
        size_t c = 0;
        for (; c + 8 <= cols; c += 8) {
            __m256i vx = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(x + c));
            uint16_t w_code = load_8_packed_trits(packed_w, base_t + c);
            __m256i s = _mm256_setr_epi32(
                TRIT_LUT_INT32[(w_code >> 0) & 3],  TRIT_LUT_INT32[(w_code >> 2) & 3],
                TRIT_LUT_INT32[(w_code >> 4) & 3],  TRIT_LUT_INT32[(w_code >> 6) & 3],
                TRIT_LUT_INT32[(w_code >> 8) & 3],  TRIT_LUT_INT32[(w_code >> 10) & 3],
                TRIT_LUT_INT32[(w_code >> 12) & 3], TRIT_LUT_INT32[(w_code >> 14) & 3]
            );
            acc = _mm256_add_epi32(acc, _mm256_sign_epi32(vx, s));
        }

        alignas(32) int32_t lanes[8];
        _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc);
        int32_t sum = bias ? bias[r] : 0;
        for (int k = 0; k < 8; ++k) sum += lanes[k];

        for (; c < cols; ++c) {
            size_t trit_idx = base_t + c;
            uint8_t byte = packed_w[trit_idx / 4];
            uint8_t code = (byte >> ((trit_idx % 4) * 2)) & 0b11;
            if (code == 1) sum += x[c];
            else if (code == 2) sum -= x[c];
        }
        out[r] = sum;
    }
#else
    execute_scalar_packed_gemv(x, packed_w, bias, out, rows, cols);
#endif
}

void CanonicalTernaryEngine::execute_canonical_gemv(
    const int32_t* x,
    const void* w,
    const int32_t* bias,
    int32_t* out,
    size_t rows,
    size_t cols,
    WeightLayout layout,
    TernaryLoweringTarget target
) {
    if (layout == WeightLayout::PACKED_TRIT2) {
        const uint8_t* packed_w = reinterpret_cast<const uint8_t*>(w);
        if (target == TernaryLoweringTarget::AVX2_SIMD_SELECT || target == TernaryLoweringTarget::AVX2_PACKED_SELECT) {
            execute_avx2_packed_gemv(x, packed_w, bias, out, rows, cols, 4);
        } else {
            execute_scalar_packed_gemv(x, packed_w, bias, out, rows, cols);
        }
    } else {
        const int8_t* dense_w = reinterpret_cast<const int8_t*>(w);
        if (target == TernaryLoweringTarget::AVX2_SIMD_SELECT) {
            execute_avx2_dense_gemv(x, dense_w, bias, out, rows, cols, 4);
        } else {
            execute_scalar_gemv(x, dense_w, bias, out, rows, cols);
        }
    }
}

// -------------------------------------------------------------
// Gate 7.3.3: Target-Independent Vector IR Lowering (P5)
// -------------------------------------------------------------
TargetIndependentVectorIR TargetIndependentVectorIR::lower_from_node(
    const TernaryContractionNode& node,
    const ContractionSchedule& schedule
) {
    TargetIndependentVectorIR vir;
    vir.kernel_name = node.func_name.empty() ? "tersun_contraction_kernel" : node.func_name;
    vir.vector_width = schedule.vector_width > 0 ? schedule.vector_width : 8;
    vir.unroll_m = schedule.unroll_m > 0 ? schedule.unroll_m : 4;
    vir.unroll_n = schedule.unroll_n > 0 ? schedule.unroll_n : 8;
    vir.is_dynamic_m = is_dynamic_extent(node.M);
    vir.static_m = get_static_extent(node.M, 0);
    vir.static_n = get_static_extent(node.N, 0);
    vir.static_k = get_static_extent(node.K, 0);
    vir.layout = node.layout;
    vir.epilogue_chain = node.epilogue_chain;
    vir.memory_facts = node.memory_facts;
    return vir;
}

// -------------------------------------------------------------
// Gate 7.3.3: Cost Model Implementation
// -------------------------------------------------------------
ContractionSchedule ContractionCostModel::derive_schedule(
    size_t m, size_t n, size_t k,
    WeightLayout layout,
    TernaryLoweringTarget target
) {
    ContractionSchedule sched;
    sched.vector_width = 8;
    sched.unroll_m = (m >= 4) ? 4 : (m == 0 ? 1 : m);
    sched.unroll_n = 8;
    sched.use_avx2 = (target == TernaryLoweringTarget::AVX2_SIMD_SELECT ||
                      target == TernaryLoweringTarget::AVX2_PACKED_SELECT);
    sched.mask_tails = true;

    // Cache blocking heuristics:
    // L1: 32KB, L2: 256KB-1MB
    sched.tile_m = (m <= 32) ? m : 32;
    sched.tile_n = (n <= 64) ? n : 64;
    sched.tile_k = (k <= 128) ? k : 128;

    if (sched.tile_m > sched.unroll_m) {
        sched.tile_m = (sched.tile_m / sched.unroll_m) * sched.unroll_m;
    }
    if (sched.tile_n > sched.unroll_n) {
        sched.tile_n = (sched.tile_n / sched.unroll_n) * sched.unroll_n;
    }
    return sched;
}

// -------------------------------------------------------------
// Gate 7.3.3: Fusion Legality Planner Implementation
// -------------------------------------------------------------
bool FusionPlanner::can_fuse_epilogue(const Stmt& stmt, EpilogueStage& out_stage) {
    if (std::holds_alternative<ExprStmt>(stmt.data)) {
        const auto& es = std::get<ExprStmt>(stmt.data);
        if (es.expr && std::holds_alternative<CallExpr>(es.expr->data)) {
            const auto& call = std::get<CallExpr>(es.expr->data);
            if (call.callee == "relu") {
                out_stage.op = EpilogueOp::RELU;
                out_stage.typed_payload = ActivationPayload{false};
                return true;
            } else if (call.callee == "squared_relu") {
                out_stage.op = EpilogueOp::SQUARED_RELU;
                out_stage.typed_payload = ActivationPayload{true};
                return true;
            } else if (call.callee == "clamp" && call.args.size() >= 3) {
                out_stage.op = EpilogueOp::CLAMP;
                if (std::holds_alternative<IntLiteralExpr>(call.args[1]->data)) {
                    out_stage.payload.clamp_min = static_cast<int32_t>(std::get<IntLiteralExpr>(call.args[1]->data).value);
                }
                if (std::holds_alternative<IntLiteralExpr>(call.args[2]->data)) {
                    out_stage.payload.clamp_max = static_cast<int32_t>(std::get<IntLiteralExpr>(call.args[2]->data).value);
                }
                out_stage.typed_payload = ClampPayload{out_stage.payload.clamp_min, out_stage.payload.clamp_max};
                return true;
            } else if (call.callee == "scale_shift" && call.args.size() >= 3) {
                out_stage.op = EpilogueOp::SCALE_SHIFT;
                if (std::holds_alternative<IntLiteralExpr>(call.args[1]->data)) {
                    out_stage.payload.scale = static_cast<int32_t>(std::get<IntLiteralExpr>(call.args[1]->data).value);
                }
                if (std::holds_alternative<IntLiteralExpr>(call.args[2]->data)) {
                    out_stage.payload.shift = static_cast<int32_t>(std::get<IntLiteralExpr>(call.args[2]->data).value);
                }
                out_stage.typed_payload = ScalePayload{out_stage.payload.scale, out_stage.payload.shift};
                return true;
            }
        }
    }
    return false;
}

bool FusionPlanner::can_fuse_loop(const WhileStmt& loop, EpilogueStage& out_stage) {
    if (!loop.body) return false;
    const BlockStmt* block = nullptr;
    if (std::holds_alternative<BlockStmt>(loop.body->data)) {
        block = &std::get<BlockStmt>(loop.body->data);
    } else {
        return false;
    }
    for (const auto* stmt : block->statements) {
        if (stmt && can_fuse_epilogue(*stmt, out_stage)) {
            return true;
        }
    }
    return false;
}

bool FusionPlanner::verify_fusion_legality(
    const TernaryContractionNode& node,
    const EpilogueStage& stage,
    std::string* failure_reason
) {
    // Point 1: Elementwise / Pointwise Semantics
    if (stage.op != EpilogueOp::BIAS_ADD &&
        stage.op != EpilogueOp::RELU &&
        stage.op != EpilogueOp::SQUARED_RELU &&
        stage.op != EpilogueOp::CLAMP &&
        stage.op != EpilogueOp::SCALE_SHIFT) {
        if (failure_reason) *failure_reason = "Non-elementwise epilogue stage cannot be fused";
        return false;
    }

    // Point 2: Destination Independence (Zero Intermediates)
    if (node.out_y.name.empty() && node.out_y.id == 0) {
        if (failure_reason) *failure_reason = "Missing valid output destination ValueId for fused epilogue";
        return false;
    }

    // Point 3: Target Register Budget & Spill Detection (AVX2 limit = 16 YMM registers)
    // Micro-tile: MR=4, NR=8
    // Accumulators: 4 (YMM0..YMM3)
    // Operand A rows broadcast: 2 (YMM4..YMM5)
    // Operand B weight unpack: 2 (YMM6..YMM7)
    // Constants/scratch: 2 (YMM8..YMM9)
    // Base registers in use = 10
    size_t base_registers = 10;
    size_t stage_regs = 0;
    switch (stage.op) {
        case EpilogueOp::BIAS_ADD:
            stage_regs = 1; // Bias broadcast vector
            break;
        case EpilogueOp::RELU:
            stage_regs = 1; // Zero vector (can be shared)
            break;
        case EpilogueOp::SQUARED_RELU:
            stage_regs = 2; // Zero vector + temporary for squaring
            break;
        case EpilogueOp::CLAMP:
            stage_regs = 2; // Min vector + Max vector
            break;
        case EpilogueOp::SCALE_SHIFT:
            stage_regs = 1; // Scale multiplier vector
            break;
    }

    // Count existing stages in chain (excluding current stage if already in chain)
    size_t chain_regs = 0;
    for (const auto& prev_stage : node.epilogue_chain) {
        if (prev_stage.op == stage.op) continue; // share registers if same op
        if (prev_stage.op == EpilogueOp::CLAMP) chain_regs += 2;
        else chain_regs += 1;
    }

    size_t total_regs = base_registers + stage_regs + chain_regs;
    constexpr size_t AVX2_MAX_REGISTERS = 16;
    if (total_regs > AVX2_MAX_REGISTERS) {
        size_t spill = total_regs - AVX2_MAX_REGISTERS;
        if (failure_reason) {
            *failure_reason = "Register budget exceeded: " + std::to_string(total_regs) +
                              " > " + std::to_string(AVX2_MAX_REGISTERS) +
                              " (spill = " + std::to_string(spill) + ")";
        }
        return false;
    }

    // Point 4: Type Compatibility & Bias Validation
    if (stage.op == EpilogueOp::BIAS_ADD) {
        ValueId bias_id = stage.payload.bias;
        if (std::holds_alternative<BiasAddPayload>(stage.typed_payload)) {
            bias_id = std::get<BiasAddPayload>(stage.typed_payload).bias_tensor;
        }
        if (bias_id.name.empty() && bias_id.id == 0 && node.bias.name.empty() && node.bias.id == 0) {
            if (failure_reason) *failure_reason = "BiasAdd stage missing valid bias tensor ValueId";
            return false;
        }
    }

    // Point 5: Alias & Disjointness Invariant
    if (node.out_y == node.lhs_a) {
        if (failure_reason) *failure_reason = "Output tensor aliases input A: violates zero-intermediate disjointness";
        return false;
    }
    if (node.out_y == node.rhs_b) {
        if (failure_reason) *failure_reason = "Output tensor aliases weights B: violates zero-intermediate disjointness";
        return false;
    }

    // Point 6: Parameter Validity
    if (stage.op == EpilogueOp::CLAMP) {
        int32_t c_min = stage.payload.clamp_min;
        int32_t c_max = stage.payload.clamp_max;
        if (std::holds_alternative<ClampPayload>(stage.typed_payload)) {
            c_min = std::get<ClampPayload>(stage.typed_payload).min_val;
            c_max = std::get<ClampPayload>(stage.typed_payload).max_val;
        }
        if (c_min > c_max) {
            if (failure_reason) {
                *failure_reason = "Clamp min (" + std::to_string(c_min) + ") exceeds clamp max (" + std::to_string(c_max) + ")";
            }
            return false;
        }
    }
    if (stage.op == EpilogueOp::SCALE_SHIFT) {
        int32_t shift = stage.payload.shift;
        if (std::holds_alternative<ScalePayload>(stage.typed_payload)) {
            shift = std::get<ScalePayload>(stage.typed_payload).shift;
        }
        if (shift < 0 || shift >= 32) {
            if (failure_reason) {
                *failure_reason = "Invalid shift amount for SCALE_SHIFT: " + std::to_string(shift) + " (must be in [0, 31])";
            }
            return false;
        }
    }

    return true;
}

// -------------------------------------------------------------
// Contraction AST Pattern Matching & BCE
// -------------------------------------------------------------
bool CanonicalTernaryEngine::can_canonicalize_contraction(
    const CallExpr& call,
    TernaryContractionNode& out_node
) {
    if (call.callee == "matmul" || call.callee == "fused_linear" || call.callee == "contraction") {
        if (call.args.size() >= 2) {
            out_node.func_name = call.callee;
            out_node.layout = WeightLayout::DENSE_TRIT8;
            out_node.bounds_proven = true;
            out_node.alias_free = true;
            if (std::holds_alternative<IdentifierExpr>(call.args[0]->data)) {
                out_node.lhs_a = ValueId{0, std::get<IdentifierExpr>(call.args[0]->data).name};
            }
            if (std::holds_alternative<IdentifierExpr>(call.args[1]->data)) {
                out_node.rhs_b = ValueId{1, std::get<IdentifierExpr>(call.args[1]->data).name};
            }
            if (call.args.size() >= 3 && std::holds_alternative<IdentifierExpr>(call.args[2]->data)) {
                out_node.bias = ValueId{2, std::get<IdentifierExpr>(call.args[2]->data).name};
            }
            return true;
        }
    }
    return false;
}

bool CanonicalTernaryEngine::can_canonicalize_contraction(
    const WhileStmt& loop,
    TernaryContractionNode& out_node
) {
    if (!loop.body) return false;
    const BlockStmt* block = nullptr;
    if (std::holds_alternative<BlockStmt>(loop.body->data)) {
        block = &std::get<BlockStmt>(loop.body->data);
    } else {
        return false;
    }
    for (const auto* stmt : block->statements) {
        if (!stmt) continue;
        if (std::holds_alternative<ExprStmt>(stmt->data)) {
            const auto& es = std::get<ExprStmt>(stmt->data);
            if (es.expr && std::holds_alternative<CallExpr>(es.expr->data)) {
                if (can_canonicalize_contraction(std::get<CallExpr>(es.expr->data), out_node)) {
                    return true;
                }
            }
        }
        if (std::holds_alternative<WhileStmt>(stmt->data)) {
            const auto& inner_loop = std::get<WhileStmt>(stmt->data);
            CanonicalTernaryGEMVNode gemv_node;
            if (can_canonicalize_gemv(inner_loop, gemv_node)) {
                out_node.func_name = "gemm_canonical_nested";
                out_node.lhs_a = gemv_node.input;
                out_node.rhs_b = gemv_node.weights;
                out_node.bias = gemv_node.bias;
                out_node.out_y = gemv_node.output;
                out_node.bounds_proven = gemv_node.bounds_proven;
                out_node.alias_free = gemv_node.noalias_proven;
                out_node.layout = gemv_node.layout;
                return true;
            }
        }
    }
    return false;
}

bool CanonicalTernaryEngine::verify_gemm_bce(
    size_t m, size_t n, size_t k,
    size_t a_len, size_t b_len, size_t out_len,
    WeightLayout layout
) {
    if (m == 0 || n == 0 || k == 0) return false;
    if (m > SIZE_MAX / k) return false;
    if (k > SIZE_MAX / n) return false;
    if (m > SIZE_MAX / n) return false;

    size_t total_a = m * k;
    size_t total_out = m * n;
    size_t total_weights = k * n;
    size_t req_b_bytes = (layout == WeightLayout::PACKED_TRIT2)
        ? ((total_weights + 3) / 4)
        : total_weights;

    return (a_len >= total_a && b_len >= req_b_bytes && out_len >= total_out);
}

// -------------------------------------------------------------
// Epilogue Application Helpers
// -------------------------------------------------------------
static inline void apply_epilogue_scalar(int32_t& acc, const std::vector<EpilogueStage>& epilogue) {
    for (const auto& stage : epilogue) {
        switch (stage.op) {
            case EpilogueOp::BIAS_ADD:
                break;
            case EpilogueOp::RELU:
                acc = std::max<int32_t>(0, acc);
                break;
            case EpilogueOp::SQUARED_RELU: {
                int32_t r = std::max<int32_t>(0, acc);
                acc = r * r;
                break;
            }
            case EpilogueOp::CLAMP:
                acc = std::max(stage.payload.clamp_min, std::min(acc, stage.payload.clamp_max));
                break;
            case EpilogueOp::SCALE_SHIFT:
                acc = (acc * stage.payload.scale) >> stage.payload.shift;
                break;
        }
    }
}

#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
static inline void apply_epilogue_avx2(__m256i& acc, const std::vector<EpilogueStage>& epilogue) {
    for (const auto& stage : epilogue) {
        switch (stage.op) {
            case EpilogueOp::BIAS_ADD:
                break;
            case EpilogueOp::RELU:
                acc = _mm256_max_epi32(acc, _mm256_setzero_si256());
                break;
            case EpilogueOp::SQUARED_RELU: {
                __m256i r = _mm256_max_epi32(acc, _mm256_setzero_si256());
                acc = _mm256_mullo_epi32(r, r);
                break;
            }
            case EpilogueOp::CLAMP: {
                __m256i vmin = _mm256_set1_epi32(stage.payload.clamp_min);
                __m256i vmax = _mm256_set1_epi32(stage.payload.clamp_max);
                acc = _mm256_min_epi32(_mm256_max_epi32(acc, vmin), vmax);
                break;
            }
            case EpilogueOp::SCALE_SHIFT: {
                __m256i vscale = _mm256_set1_epi32(stage.payload.scale);
                acc = _mm256_mullo_epi32(acc, vscale);
                if (stage.payload.shift > 0) {
                    acc = _mm256_srai_epi32(acc, stage.payload.shift);
                }
                break;
            }
        }
    }
}
#endif

// -------------------------------------------------------------
// Gate 7.3.3: Reference Scalar GEMM
// -------------------------------------------------------------
void CanonicalTernaryEngine::execute_scalar_gemm(
    const int32_t* A,
    const int8_t* B,
    const int32_t* bias,
    int32_t* Y,
    size_t M,
    size_t N,
    size_t K,
    const std::vector<EpilogueStage>& epilogue
) {
    if (!A || !B || !Y) return;
    for (size_t m = 0; m < M; ++m) {
        const int32_t* a_row = A + m * K;
        int32_t* y_row = Y + m * N;
        for (size_t n = 0; n < N; ++n) {
            int32_t sum = bias ? bias[n] : 0;
            for (size_t k = 0; k < K; ++k) {
                int8_t w = B[k * N + n];
                if (w == 1) sum += a_row[k];
                else if (w == -1) sum -= a_row[k];
            }
            apply_epilogue_scalar(sum, epilogue);
            y_row[n] = sum;
        }
    }
}

// -------------------------------------------------------------
// Gate 7.3.3: Reference Scalar Packed GEMM
// -------------------------------------------------------------
void CanonicalTernaryEngine::execute_scalar_packed_gemm(
    const int32_t* A,
    const uint8_t* packed_B,
    const int32_t* bias,
    int32_t* Y,
    size_t M,
    size_t N,
    size_t K,
    const std::vector<EpilogueStage>& epilogue
) {
    if (!A || !packed_B || !Y) return;
    for (size_t m = 0; m < M; ++m) {
        const int32_t* a_row = A + m * K;
        int32_t* y_row = Y + m * N;
        for (size_t n = 0; n < N; ++n) {
            int32_t sum = bias ? bias[n] : 0;
            for (size_t k = 0; k < K; ++k) {
                size_t trit_idx = k * N + n;
                uint8_t byte = packed_B[trit_idx / 4];
                uint8_t code = (byte >> ((trit_idx % 4) * 2)) & 0b11;
                if (code == 1) sum += a_row[k];
                else if (code == 2) sum -= a_row[k];
            }
            apply_epilogue_scalar(sum, epilogue);
            y_row[n] = sum;
        }
    }
}

// -------------------------------------------------------------
// Gate 7.3.3: High-Performance Cache-Blocked AVX2 Dense GEMM
// -------------------------------------------------------------
void CanonicalTernaryEngine::execute_avx2_dense_gemm(
    const int32_t* A,
    const int8_t* B,
    const int32_t* bias,
    int32_t* Y,
    size_t M,
    size_t N,
    size_t K,
    const ContractionSchedule& schedule,
    const std::vector<EpilogueStage>& epilogue
) {
    if (!A || !B || !Y) return;

#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    size_t tile_m = (schedule.tile_m > 0) ? schedule.tile_m : 32;
    size_t tile_n = (schedule.tile_n > 0) ? schedule.tile_n : 64;
    size_t tile_k = (schedule.tile_k > 0) ? schedule.tile_k : 128;

    const __m256i v_one = _mm256_set1_epi32(1);
    const __m256i v_neg_one = _mm256_set1_epi32(-1);

    for (size_t tm = 0; tm < M; tm += tile_m) {
        size_t m_end = std::min(M, tm + tile_m);
        for (size_t tn = 0; tn < N; tn += tile_n) {
            size_t n_end = std::min(N, tn + tile_n);

            size_t m = tm;
            // Micro-kernel: 4 rows x 8 cols with zero-intermediate accumulator retention
            for (; m + 4 <= m_end; m += 4) {
                const int32_t* a0 = A + (m + 0) * K;
                const int32_t* a1 = A + (m + 1) * K;
                const int32_t* a2 = A + (m + 2) * K;
                const int32_t* a3 = A + (m + 3) * K;

                size_t n = tn;
                for (; n + 8 <= n_end; n += 8) {
                    __m256i acc0, acc1, acc2, acc3;
                    if (bias) {
                        __m256i vb = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(bias + n));
                        acc0 = vb; acc1 = vb; acc2 = vb; acc3 = vb;
                    } else {
                        acc0 = _mm256_setzero_si256();
                        acc1 = _mm256_setzero_si256();
                        acc2 = _mm256_setzero_si256();
                        acc3 = _mm256_setzero_si256();
                    }

                    // K loop runs entirely in YMM registers across all K
                    for (size_t k = 0; k < K; ++k) {
                        const int8_t* b_row = B + k * N + n;
                        __m256i vw = _mm256_cvtepi8_epi32(_mm_loadl_epi64(reinterpret_cast<const __m128i*>(b_row)));
                        __m256i m_pos = _mm256_cmpeq_epi32(vw, v_one);
                        __m256i m_neg = _mm256_cmpeq_epi32(vw, v_neg_one);

                        int32_t val0 = a0[k];
                        if (val0 != 0) {
                            __m256i va0 = _mm256_set1_epi32(val0);
                            acc0 = _mm256_add_epi32(acc0, _mm256_and_si256(va0, m_pos));
                            acc0 = _mm256_sub_epi32(acc0, _mm256_and_si256(va0, m_neg));
                        }
                        int32_t val1 = a1[k];
                        if (val1 != 0) {
                            __m256i va1 = _mm256_set1_epi32(val1);
                            acc1 = _mm256_add_epi32(acc1, _mm256_and_si256(va1, m_pos));
                            acc1 = _mm256_sub_epi32(acc1, _mm256_and_si256(va1, m_neg));
                        }
                        int32_t val2 = a2[k];
                        if (val2 != 0) {
                            __m256i va2 = _mm256_set1_epi32(val2);
                            acc2 = _mm256_add_epi32(acc2, _mm256_and_si256(va2, m_pos));
                            acc2 = _mm256_sub_epi32(acc2, _mm256_and_si256(va2, m_neg));
                        }
                        int32_t val3 = a3[k];
                        if (val3 != 0) {
                            __m256i va3 = _mm256_set1_epi32(val3);
                            acc3 = _mm256_add_epi32(acc3, _mm256_and_si256(va3, m_pos));
                            acc3 = _mm256_sub_epi32(acc3, _mm256_and_si256(va3, m_neg));
                        }
                    }

                    if (!epilogue.empty()) {
                        apply_epilogue_avx2(acc0, epilogue);
                        apply_epilogue_avx2(acc1, epilogue);
                        apply_epilogue_avx2(acc2, epilogue);
                        apply_epilogue_avx2(acc3, epilogue);
                    }

                    // Single final store to Y
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 0) * N + n), acc0);
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 1) * N + n), acc1);
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 2) * N + n), acc2);
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 3) * N + n), acc3);
                }

                // Remainder columns in 4-row block
                for (; n < n_end; ++n) {
                    for (size_t ri = 0; ri < 4; ++ri) {
                        size_t cur_m = m + ri;
                        int32_t s = bias ? bias[n] : 0;
                        for (size_t k = 0; k < K; ++k) {
                            int8_t w = B[k * N + n];
                            if (w == 1) s += A[cur_m * K + k];
                            else if (w == -1) s -= A[cur_m * K + k];
                        }
                        if (!epilogue.empty()) {
                            apply_epilogue_scalar(s, epilogue);
                        }
                        Y[cur_m * N + n] = s;
                    }
                }
            }

            // Remainder rows in tm block
            for (; m < m_end; ++m) {
                size_t n = tn;
                for (; n + 8 <= n_end; n += 8) {
                    __m256i acc = bias ? _mm256_loadu_si256(reinterpret_cast<const __m256i*>(bias + n)) : _mm256_setzero_si256();
                    for (size_t k = 0; k < K; ++k) {
                        int32_t amk = A[m * K + k];
                        if (amk == 0) continue;
                        const int8_t* b_row = B + k * N + n;
                        __m256i vw = _mm256_cvtepi8_epi32(_mm_loadl_epi64(reinterpret_cast<const __m128i*>(b_row)));
                        __m256i va = _mm256_set1_epi32(amk);
                        acc = _mm256_add_epi32(acc, _mm256_and_si256(va, _mm256_cmpeq_epi32(vw, v_one)));
                        acc = _mm256_sub_epi32(acc, _mm256_and_si256(va, _mm256_cmpeq_epi32(vw, v_neg_one)));
                    }
                    if (!epilogue.empty()) {
                        apply_epilogue_avx2(acc, epilogue);
                    }
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + m * N + n), acc);
                }
                for (; n < n_end; ++n) {
                    int32_t s = bias ? bias[n] : 0;
                    for (size_t k = 0; k < K; ++k) {
                        int8_t w = B[k * N + n];
                        if (w == 1) s += A[m * K + k];
                        else if (w == -1) s -= A[m * K + k];
                    }
                    if (!epilogue.empty()) {
                        apply_epilogue_scalar(s, epilogue);
                    }
                    Y[m * N + n] = s;
                }
            }
        }
    }
#else
    execute_scalar_gemm(A, B, bias, Y, M, N, K, epilogue);
#endif
}

// -------------------------------------------------------------
// Gate 7.3.3: High-Performance Cache-Blocked AVX2 Packed GEMM
// -------------------------------------------------------------
void CanonicalTernaryEngine::execute_avx2_packed_gemm(
    const int32_t* A,
    const uint8_t* packed_B,
    const int32_t* bias,
    int32_t* Y,
    size_t M,
    size_t N,
    size_t K,
    const ContractionSchedule& schedule,
    const std::vector<EpilogueStage>& epilogue
) {
    if (!A || !packed_B || !Y) return;

#if (defined(__x86_64__) || defined(_M_X64)) && defined(__AVX2__)
    size_t tile_m = (schedule.tile_m > 0) ? schedule.tile_m : 32;
    size_t tile_n = (schedule.tile_n > 0) ? schedule.tile_n : 64;
    size_t tile_k = (schedule.tile_k > 0) ? schedule.tile_k : 128;

    const __m256i v_one = _mm256_set1_epi32(1);
    const __m256i v_neg_one = _mm256_set1_epi32(-1);

    for (size_t tm = 0; tm < M; tm += tile_m) {
        size_t m_end = std::min(M, tm + tile_m);
        for (size_t tn = 0; tn < N; tn += tile_n) {
            size_t n_end = std::min(N, tn + tile_n);

            size_t m = tm;
            for (; m + 4 <= m_end; m += 4) {
                const int32_t* a0 = A + (m + 0) * K;
                const int32_t* a1 = A + (m + 1) * K;
                const int32_t* a2 = A + (m + 2) * K;
                const int32_t* a3 = A + (m + 3) * K;

                size_t n = tn;
                for (; n + 8 <= n_end; n += 8) {
                    __m256i acc0, acc1, acc2, acc3;
                    if (bias) {
                        __m256i vb = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(bias + n));
                        acc0 = vb; acc1 = vb; acc2 = vb; acc3 = vb;
                    } else {
                        acc0 = _mm256_setzero_si256();
                        acc1 = _mm256_setzero_si256();
                        acc2 = _mm256_setzero_si256();
                        acc3 = _mm256_setzero_si256();
                    }

                    for (size_t k = 0; k < K; ++k) {
                        size_t trit_base = k * N + n;
                        uint16_t u16;
                        if ((trit_base % 4) == 0) {
                            u16 = *reinterpret_cast<const uint16_t*>(packed_B + (trit_base / 4));
                        } else {
                            uint32_t u32 = *reinterpret_cast<const uint32_t*>(packed_B + (trit_base / 4));
                            u32 >>= ((trit_base % 4) * 2);
                            u16 = static_cast<uint16_t>(u32 & 0xFFFF);
                        }

                        __m256i vw = _mm256_setr_epi32(
                            TRIT_LUT_INT32[(u16 >> 0) & 3],
                            TRIT_LUT_INT32[(u16 >> 2) & 3],
                            TRIT_LUT_INT32[(u16 >> 4) & 3],
                            TRIT_LUT_INT32[(u16 >> 6) & 3],
                            TRIT_LUT_INT32[(u16 >> 8) & 3],
                            TRIT_LUT_INT32[(u16 >> 10) & 3],
                            TRIT_LUT_INT32[(u16 >> 12) & 3],
                            TRIT_LUT_INT32[(u16 >> 14) & 3]
                        );

                        __m256i m_pos = _mm256_cmpeq_epi32(vw, v_one);
                        __m256i m_neg = _mm256_cmpeq_epi32(vw, v_neg_one);

                        int32_t val0 = a0[k];
                        if (val0 != 0) {
                            __m256i va0 = _mm256_set1_epi32(val0);
                            acc0 = _mm256_add_epi32(acc0, _mm256_and_si256(va0, m_pos));
                            acc0 = _mm256_sub_epi32(acc0, _mm256_and_si256(va0, m_neg));
                        }
                        int32_t val1 = a1[k];
                        if (val1 != 0) {
                            __m256i va1 = _mm256_set1_epi32(val1);
                            acc1 = _mm256_add_epi32(acc1, _mm256_and_si256(va1, m_pos));
                            acc1 = _mm256_sub_epi32(acc1, _mm256_and_si256(va1, m_neg));
                        }
                        int32_t val2 = a2[k];
                        if (val2 != 0) {
                            __m256i va2 = _mm256_set1_epi32(val2);
                            acc2 = _mm256_add_epi32(acc2, _mm256_and_si256(va2, m_pos));
                            acc2 = _mm256_sub_epi32(acc2, _mm256_and_si256(va2, m_neg));
                        }
                        int32_t val3 = a3[k];
                        if (val3 != 0) {
                            __m256i va3 = _mm256_set1_epi32(val3);
                            acc3 = _mm256_add_epi32(acc3, _mm256_and_si256(va3, m_pos));
                            acc3 = _mm256_sub_epi32(acc3, _mm256_and_si256(va3, m_neg));
                        }
                    }

                    if (!epilogue.empty()) {
                        apply_epilogue_avx2(acc0, epilogue);
                        apply_epilogue_avx2(acc1, epilogue);
                        apply_epilogue_avx2(acc2, epilogue);
                        apply_epilogue_avx2(acc3, epilogue);
                    }

                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 0) * N + n), acc0);
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 1) * N + n), acc1);
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 2) * N + n), acc2);
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + (m + 3) * N + n), acc3);
                }

                // Remainder cols
                for (; n < n_end; ++n) {
                    for (size_t ri = 0; ri < 4; ++ri) {
                        size_t cur_m = m + ri;
                        int32_t s = bias ? bias[n] : 0;
                        for (size_t k = 0; k < K; ++k) {
                            size_t trit_idx = k * N + n;
                            uint8_t byte = packed_B[trit_idx / 4];
                            uint8_t code = (byte >> ((trit_idx % 4) * 2)) & 0b11;
                            if (code == 1) s += A[cur_m * K + k];
                            else if (code == 2) s -= A[cur_m * K + k];
                        }
                        if (!epilogue.empty()) {
                            apply_epilogue_scalar(s, epilogue);
                        }
                        Y[cur_m * N + n] = s;
                    }
                }
            }

            // Remainder rows
            for (; m < m_end; ++m) {
                size_t n = tn;
                for (; n + 8 <= n_end; n += 8) {
                    __m256i acc = bias ? _mm256_loadu_si256(reinterpret_cast<const __m256i*>(bias + n)) : _mm256_setzero_si256();
                    for (size_t k = 0; k < K; ++k) {
                        int32_t amk = A[m * K + k];
                        if (amk == 0) continue;
                        size_t trit_base = k * N + n;
                        uint16_t u16;
                        if ((trit_base % 4) == 0) {
                            u16 = *reinterpret_cast<const uint16_t*>(packed_B + (trit_base / 4));
                        } else {
                            uint32_t u32 = *reinterpret_cast<const uint32_t*>(packed_B + (trit_base / 4));
                            u32 >>= ((trit_base % 4) * 2);
                            u16 = static_cast<uint16_t>(u32 & 0xFFFF);
                        }
                        __m256i vw = _mm256_setr_epi32(
                            TRIT_LUT_INT32[(u16 >> 0) & 3],
                            TRIT_LUT_INT32[(u16 >> 2) & 3],
                            TRIT_LUT_INT32[(u16 >> 4) & 3],
                            TRIT_LUT_INT32[(u16 >> 6) & 3],
                            TRIT_LUT_INT32[(u16 >> 8) & 3],
                            TRIT_LUT_INT32[(u16 >> 10) & 3],
                            TRIT_LUT_INT32[(u16 >> 12) & 3],
                            TRIT_LUT_INT32[(u16 >> 14) & 3]
                        );
                        __m256i va = _mm256_set1_epi32(amk);
                        acc = _mm256_add_epi32(acc, _mm256_and_si256(va, _mm256_cmpeq_epi32(vw, v_one)));
                        acc = _mm256_sub_epi32(acc, _mm256_and_si256(va, _mm256_cmpeq_epi32(vw, v_neg_one)));
                    }
                    if (!epilogue.empty()) {
                        apply_epilogue_avx2(acc, epilogue);
                    }
                    _mm256_storeu_si256(reinterpret_cast<__m256i*>(Y + m * N + n), acc);
                }
                for (; n < n_end; ++n) {
                    int32_t s = bias ? bias[n] : 0;
                    for (size_t k = 0; k < K; ++k) {
                        size_t trit_idx = k * N + n;
                        uint8_t byte = packed_B[trit_idx / 4];
                        uint8_t code = (byte >> ((trit_idx % 4) * 2)) & 0b11;
                        if (code == 1) s += A[m * K + k];
                        else if (code == 2) s -= A[m * K + k];
                    }
                    if (!epilogue.empty()) {
                        apply_epilogue_scalar(s, epilogue);
                    }
                    Y[m * N + n] = s;
                }
            }
        }
    }
#else
    execute_scalar_packed_gemm(A, packed_B, bias, Y, M, N, K, epilogue);
#endif
}

// -------------------------------------------------------------
// Gate 7.3.3: Unified Canonical Contraction Dispatcher
// -------------------------------------------------------------
void CanonicalTernaryEngine::execute_canonical_contraction(
    const int32_t* A,
    const void* B,
    const int32_t* bias,
    int32_t* Y,
    size_t M,
    size_t N,
    size_t K,
    WeightLayout layout,
    const ContractionSchedule* optional_schedule,
    const std::vector<EpilogueStage>& epilogue,
    TernaryLoweringTarget target
) {
    ContractionSchedule schedule = optional_schedule
        ? *optional_schedule
        : ContractionCostModel::derive_schedule(M, N, K, layout, target);

    if (layout == WeightLayout::PACKED_TRIT2) {
        const uint8_t* packed_B = reinterpret_cast<const uint8_t*>(B);
        if (target == TernaryLoweringTarget::AVX2_SIMD_SELECT ||
            target == TernaryLoweringTarget::AVX2_PACKED_SELECT) {
            execute_avx2_packed_gemm(A, packed_B, bias, Y, M, N, K, schedule, epilogue);
        } else {
            execute_scalar_packed_gemm(A, packed_B, bias, Y, M, N, K, epilogue);
        }
    } else {
        const int8_t* dense_B = reinterpret_cast<const int8_t*>(B);
        if (target == TernaryLoweringTarget::AVX2_SIMD_SELECT) {
            execute_avx2_dense_gemm(A, dense_B, bias, Y, M, N, K, schedule, epilogue);
        } else {
            execute_scalar_gemm(A, dense_B, bias, Y, M, N, K, epilogue);
        }
    }
}

} // namespace setun::compiler
