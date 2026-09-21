#pragma once

#include "compiler/ast.hpp"
#include "compiler/types.hpp"
#include <string>
#include <vector>
#include <cstdint>
#include <cstddef>
#include <memory>
#include <variant>
#include <unordered_set>

namespace setun::compiler {

// -------------------------------------------------------------
// Canonical Ternary IR Target Architecture
// -------------------------------------------------------------
enum class TernaryLoweringTarget {
    SCALAR_ORACLE,
    AVX2_SIMD_SELECT,
    AVX2_PACKED_SELECT,
    NEON_SIMD_SELECT,
    NATIVE_TERNARY_ISA
};

inline const char* ternary_target_name(TernaryLoweringTarget target) {
    switch (target) {
        case TernaryLoweringTarget::SCALAR_ORACLE:     return "ScalarOracle";
        case TernaryLoweringTarget::AVX2_SIMD_SELECT:  return "AVX2_SimdSelect";
        case TernaryLoweringTarget::AVX2_PACKED_SELECT:return "AVX2_PackedSelect";
        case TernaryLoweringTarget::NEON_SIMD_SELECT:  return "NEON_SimdSelect";
        case TernaryLoweringTarget::NATIVE_TERNARY_ISA:return "NativeTernaryISA";
        default:                                       return "Unknown";
    }
}

// -------------------------------------------------------------
// Weight Storage Representation Layout (Decoupled from Semantics)
// -------------------------------------------------------------
enum class WeightLayout : uint8_t {
    LOGICAL_TRIT,      // High-level source trit {-1, 0, +1}
    DENSE_TRIT8,       // 1 byte per trit (int8)
    PACKED_TRIT2,      // 2 bits per trit (4 trits/byte, Little-Endian)
    BIT_PLANE_MASK     // Positive and negative bit planes
};

inline const char* weight_layout_name(WeightLayout l) {
    switch (l) {
        case WeightLayout::LOGICAL_TRIT:   return "LogicalTrit";
        case WeightLayout::DENSE_TRIT8:    return "DenseTrit8";
        case WeightLayout::PACKED_TRIT2:   return "PackedTrit2";
        case WeightLayout::BIT_PLANE_MASK: return "BitPlaneMask";
        default:                           return "Unknown";
    }
}

// -------------------------------------------------------------
// Value Identifier for Strongly-Typed IR (No "Stringly-Typed" reliance)
// -------------------------------------------------------------
struct ValueId {
    uint32_t id{0};
    std::string name;

    bool operator==(const ValueId& o) const { return id == o.id && name == o.name; }
    bool operator!=(const ValueId& o) const { return !(*this == o); }
};

// Extent represents a dimension size: compile-time constant or dynamic value.
using Extent = std::variant<size_t, ValueId>;

inline bool is_static_extent(const Extent& e) {
    return std::holds_alternative<size_t>(e);
}

inline bool is_dynamic_extent(const Extent& e) {
    return std::holds_alternative<ValueId>(e);
}

inline size_t get_static_extent(const Extent& e, size_t default_val = 0) {
    return std::holds_alternative<size_t>(e) ? std::get<size_t>(e) : default_val;
}

// -------------------------------------------------------------
// Gate 7.3.3: Epilogue Fusion Operations & Stages
// -------------------------------------------------------------
enum class EpilogueOp : uint8_t {
    BIAS_ADD,
    RELU,
    SQUARED_RELU,
    CLAMP,
    SCALE_SHIFT
};

inline const char* epilogue_op_name(EpilogueOp op) {
    switch (op) {
        case EpilogueOp::BIAS_ADD:     return "BiasAdd";
        case EpilogueOp::RELU:         return "ReLU";
        case EpilogueOp::SQUARED_RELU: return "SquaredReLU";
        case EpilogueOp::CLAMP:        return "Clamp";
        case EpilogueOp::SCALE_SHIFT:  return "ScaleShift";
        default:                       return "Unknown";
    }
}

// Strongly-typed epilogue payloads (Gate 7.3.3 Rev 2 & Rev 3)
struct BiasAddPayload    { ValueId bias_tensor; };
struct ActivationPayload { bool is_squared{false}; };
struct ClampPayload      { int32_t min_val{0}; int32_t max_val{0}; };
struct ScalePayload      { int32_t multiplier{1}; int32_t shift{0}; };

using TypedEpiloguePayload = std::variant<
    std::monostate,      // Default / empty
    BiasAddPayload,      // BIAS_ADD
    ActivationPayload,   // RELU / SQUARED_RELU
    ClampPayload,        // CLAMP
    ScalePayload         // SCALE_SHIFT
>;

// Backward-compatible flat payload (used by existing GEMM engine code)
struct EpiloguePayload {
    ValueId bias{0, ""};
    int32_t clamp_min{0};
    int32_t clamp_max{0};
    int32_t scale{1};
    int32_t shift{0};
};

struct EpilogueStage {
    EpilogueOp op{EpilogueOp::RELU};
    EpiloguePayload payload{};             // Flat accessor (backward-compatible)
    TypedEpiloguePayload typed_payload{};  // Strongly-typed variant
};

// -------------------------------------------------------------
// Canonical 1D Ternary Accumulate Node
// acc = bias + \sum_{i=0}^{N-1} (weights[i] * inputs[i])
// -------------------------------------------------------------
struct CanonicalTernaryAccumulateNode {
    std::string func_name;
    ValueId input;
    ValueId weights;
    ValueId bias;
    ValueId acc;

    // P4B Optimization Metadata
    bool bce_hoisted{false};
    bool alias_free{true};
    bool fused_load_decode_accumulate{true};

    TernaryLoweringTarget target{TernaryLoweringTarget::AVX2_SIMD_SELECT};
    WeightLayout layout{WeightLayout::DENSE_TRIT8};
    size_t vector_width{8};
};

// -------------------------------------------------------------
// Canonical 2D Ternary GEMV Node
// out[r] = bias[r] + \sum_{c=0}^{K-1} (W[r, c] * x[c])
// -------------------------------------------------------------
struct CanonicalTernaryGEMVNode {
    std::string func_name;
    ValueId input;         // x: &[int] (cols elements)
    ValueId weights;       // W: &[trit] or &[packed_trit2] (rows * cols trits)
    ValueId bias;          // bias: &[int] (rows elements)
    ValueId output;        // out: &mut [int] (rows elements)

    size_t rows{0};        // N
    size_t cols{0};        // K
    WeightLayout layout{WeightLayout::DENSE_TRIT8};

    bool bounds_proven{false};
    bool noalias_proven{false};
    size_t unroll_factor{4}; // Optimal row unrolling (1, 2, 4, 8)
};

// -------------------------------------------------------------
// Structured Compiler Proofs (MemoryFacts for Contraction Nodes)
// Query-able disjointness, noalias, readonly facts for the IR
// -------------------------------------------------------------
struct ContractionMemoryFacts {
    std::vector<std::pair<ValueId, ValueId>> disjoint_regions;
    std::vector<std::pair<ValueId, ValueId>> noalias_pairs;
    std::unordered_set<uint32_t> readonly_value_ids;
    std::unordered_set<uint32_t> unique_mutable_ids;

    bool has_disjoint(const ValueId& a, const ValueId& b) const {
        for (const auto& [l, r] : disjoint_regions) {
            if ((l == a && r == b) || (l == b && r == a)) return true;
        }
        return false;
    }

    bool has_noalias(const ValueId& a, const ValueId& b) const {
        for (const auto& [l, r] : noalias_pairs) {
            if ((l == a && r == b) || (l == b && r == a)) return true;
        }
        return false;
    }

    bool is_readonly(const ValueId& v) const {
        return readonly_value_ids.count(v.id) > 0;
    }

    bool is_unique_mutable(const ValueId& v) const {
        return unique_mutable_ids.count(v.id) > 0;
    }
};

// -------------------------------------------------------------
// Canonical Ternary Contraction Node (Decoupled from Physical Scheduling)
// Y[m, n] = Epilogue(\sum_{k=0}^{K-1} A[m, k] * B[k, n] + Bias[n])
// -------------------------------------------------------------
struct TernaryContractionNode {
    std::string func_name;
    ValueId lhs_a; // A: TensorView<int, 2> or &[int]
    ValueId rhs_b; // B: TensorView<trit, 2> or &[trit] or &[packed_trit2]
    ValueId bias;  // Optional bias: &[int] (length N)
    ValueId out_y; // Y: TensorView<int, 2> or &mut [int]

    Extent M{0ULL};
    Extent N{0ULL};
    Extent K{0ULL};

    WeightLayout layout{WeightLayout::DENSE_TRIT8};
    std::vector<EpilogueStage> epilogue_chain;

    // Backward-compatible boolean flags
    bool bounds_proven{false};
    bool alias_free{false};

    // Structured compiler proofs (Gate 7.3.3 Rev 2)
    ContractionMemoryFacts memory_facts;

    // Note: ZERO physical scheduling parameters (tile_m, tile_n, tile_k) are stored here!
};

// -------------------------------------------------------------
// Physical Contraction Execution Schedule
// -------------------------------------------------------------
struct ContractionSchedule {
    size_t tile_m{32};
    size_t tile_n{64};
    size_t tile_k{128};
    size_t unroll_m{4};      // Micro-kernel register unroll M (4 rows)
    size_t unroll_n{8};      // Micro-kernel register unroll N (8 cols = 256 bits)
    size_t vector_width{8};  // 8 int32 lanes per AVX2 register
    bool use_avx2{true};
    bool mask_tails{true};
};

// -------------------------------------------------------------
// Target-Independent Vector IR Representation (Gate 7.3.3 P5)
// Bridge between Canonical Contraction IR, JIT Engine, and LLVM AOT
// -------------------------------------------------------------
struct TargetIndependentVectorIR {
    std::string kernel_name;
    size_t vector_width{8};    // e.g. 8 for AVX2 (<8 x i32>), 16 for AVX-512, 4 for NEON
    size_t unroll_m{4};        // Micro-kernel register unroll M
    size_t unroll_n{8};        // Micro-kernel register unroll N
    bool is_dynamic_m{true};
    size_t static_m{0};
    size_t static_n{0};
    size_t static_k{0};
    WeightLayout layout{WeightLayout::DENSE_TRIT8};
    std::vector<EpilogueStage> epilogue_chain;
    ContractionMemoryFacts memory_facts;

    static TargetIndependentVectorIR lower_from_node(
        const TernaryContractionNode& node,
        const ContractionSchedule& schedule
    );
};

// -------------------------------------------------------------
// Contraction Cost Model & Heuristics
// -------------------------------------------------------------
class ContractionCostModel {
public:
    static ContractionSchedule derive_schedule(
        size_t m, size_t n, size_t k,
        WeightLayout layout = WeightLayout::DENSE_TRIT8,
        TernaryLoweringTarget target = TernaryLoweringTarget::AVX2_SIMD_SELECT
    );
};

// -------------------------------------------------------------
// Fusion Legality Planner (6-Point Verification Checklist)
// -------------------------------------------------------------
class FusionPlanner {
public:
    static bool can_fuse_epilogue(const Stmt& stmt, EpilogueStage& out_stage);
    static bool can_fuse_loop(const WhileStmt& loop, EpilogueStage& out_stage);

    static bool verify_fusion_legality(
        const TernaryContractionNode& node,
        const EpilogueStage& stage,
        std::string* failure_reason = nullptr
    );
};

// -------------------------------------------------------------
// Canonical Ternary Engine
// -------------------------------------------------------------
class CanonicalTernaryEngine {
public:
    // P4A: Semantic Canonicalization
    static bool can_canonicalize_loop(const WhileStmt& loop, CanonicalTernaryAccumulateNode& out_node);
    static bool can_canonicalize_call(const CallExpr& call, CanonicalTernaryAccumulateNode& out_node);

    // Gate 7.3.2: 2D GEMV Pattern Matching
    static bool can_canonicalize_gemv(const WhileStmt& loop, CanonicalTernaryGEMVNode& out_node);

    // P4B: 1D Checked BCE & Alias Verification
    static bool verify_and_hoist_bce(size_t input_len, size_t weight_len);

    // Gate 7.3.2: Checked 2D BCE (With Checked Multiplication to prevent integer overflow)
    static bool verify_gemv_bce(
        size_t rows, size_t cols,
        size_t x_len, size_t b_len, size_t out_len, size_t w_len,
        WeightLayout layout
    );

    // ---------------------------------------------------------
    // 1D Lowering Implementations
    // ---------------------------------------------------------
    static int32_t execute_scalar_oracle(
        const int32_t* inputs,
        const int8_t* weights,
        size_t count,
        int32_t bias = 0
    );

    static int32_t execute_avx2_vector(
        const int32_t* inputs,
        const int8_t* weights,
        size_t count,
        int32_t bias = 0
    );

    static int32_t execute_canonical(
        const int32_t* inputs,
        const int8_t* weights,
        size_t count,
        int32_t bias = 0,
        TernaryLoweringTarget target = TernaryLoweringTarget::AVX2_SIMD_SELECT
    );

    // ---------------------------------------------------------
    // Gate 7.3.2: 2D GEMV Lowering Implementations
    // ---------------------------------------------------------
    static void execute_scalar_gemv(
        const int32_t* x,
        const int8_t* w,
        const int32_t* bias,
        int32_t* out,
        size_t rows,
        size_t cols
    );

    static void execute_scalar_packed_gemv(
        const int32_t* x,
        const uint8_t* packed_w,
        const int32_t* bias,
        int32_t* out,
        size_t rows,
        size_t cols
    );

    static void execute_avx2_dense_gemv(
        const int32_t* x,
        const int8_t* w,
        const int32_t* bias,
        int32_t* out,
        size_t rows,
        size_t cols,
        size_t unroll_factor = 4
    );

    static void execute_avx2_packed_gemv(
        const int32_t* x,
        const uint8_t* packed_w,
        const int32_t* bias,
        int32_t* out,
        size_t rows,
        size_t cols,
        size_t unroll_factor = 4
    );

    static void execute_canonical_gemv(
        const int32_t* x,
        const void* w,
        const int32_t* bias,
        int32_t* out,
        size_t rows,
        size_t cols,
        WeightLayout layout = WeightLayout::DENSE_TRIT8,
        TernaryLoweringTarget target = TernaryLoweringTarget::AVX2_SIMD_SELECT
    );

    // ---------------------------------------------------------
    // Gate 7.3.3: Hierarchical Matrix Contraction (GEMM) Execution
    // ---------------------------------------------------------
    static bool can_canonicalize_contraction(
        const WhileStmt& loop,
        TernaryContractionNode& out_node
    );

    static bool can_canonicalize_contraction(
        const CallExpr& call,
        TernaryContractionNode& out_node
    );

    static bool verify_gemm_bce(
        size_t m, size_t n, size_t k,
        size_t a_len, size_t b_len, size_t out_len,
        WeightLayout layout
    );

    static void execute_scalar_gemm(
        const int32_t* A,
        const int8_t* B,
        const int32_t* bias,
        int32_t* Y,
        size_t M,
        size_t N,
        size_t K,
        const std::vector<EpilogueStage>& epilogue = {}
    );

    static void execute_scalar_packed_gemm(
        const int32_t* A,
        const uint8_t* packed_B,
        const int32_t* bias,
        int32_t* Y,
        size_t M,
        size_t N,
        size_t K,
        const std::vector<EpilogueStage>& epilogue = {}
    );

    static void execute_avx2_dense_gemm(
        const int32_t* A,
        const int8_t* B,
        const int32_t* bias,
        int32_t* Y,
        size_t M,
        size_t N,
        size_t K,
        const ContractionSchedule& schedule,
        const std::vector<EpilogueStage>& epilogue = {}
    );

    static void execute_avx2_packed_gemm(
        const int32_t* A,
        const uint8_t* packed_B,
        const int32_t* bias,
        int32_t* Y,
        size_t M,
        size_t N,
        size_t K,
        const ContractionSchedule& schedule,
        const std::vector<EpilogueStage>& epilogue = {}
    );

    static void execute_canonical_contraction(
        const int32_t* A,
        const void* B,
        const int32_t* bias,
        int32_t* Y,
        size_t M,
        size_t N,
        size_t K,
        WeightLayout layout = WeightLayout::DENSE_TRIT8,
        const ContractionSchedule* optional_schedule = nullptr,
        const std::vector<EpilogueStage>& epilogue = {},
        TernaryLoweringTarget target = TernaryLoweringTarget::AVX2_SIMD_SELECT
    );
};

} // namespace setun::compiler
