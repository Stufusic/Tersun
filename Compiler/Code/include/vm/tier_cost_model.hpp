#pragma once
// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Tier Economics & Cost Model Estimator
// Implements economic ROI:
//   E[T_saved] = E[N_remaining] * (C_interp - C_jit)
//   ROI = E[T_saved] - T_compile - E[T_deopt]
// TierDecision requires confidence >= 0.85 and positive ROI before promoting.
// ==============================================================================

#include <cstdint>
#include <cstddef>

namespace setun {

enum class ExecutionMode : uint8_t {
    Interpreter = 0,
    OptimizedInterpreter = 1,
    BaselineJIT = 2,
    AutoTier = 3,
    AOT = 4
};

struct TierDecision {
    bool should_promote{false};
    double expected_gain_ms{0.0};
    double compile_cost_ms{0.0};
    double deopt_risk{0.0};
    double confidence{0.0}; // 0.0 to 1.0
    uint8_t target_tier{0}; // 0 = Interp, 1 = Baseline, 2 = Optimizing
};

struct FeatureToggles {
    bool opt_tos{true};
    bool opt_callstack{true};
    bool opt_fusion{true};
    bool opt_flatarray{true};
    bool opt_fieldic{true};
    bool opt_typed_locals{true};
    bool opt_tiering{true};
    bool opt_osr{true};
};

class TierCostModel {
public:
    static constexpr double kSafetyMarginMs = 0.50; // Minimum 0.5ms projected net gain
    static constexpr double kMinConfidence = 0.85;   // 85% confidence threshold

    static TierDecision evaluate_tier1_promotion(
        uint64_t invocations,
        uint64_t backedges,
        size_t bytecode_size,
        uint32_t deopt_count = 0
    ) noexcept;

    static TierDecision evaluate_tier2_promotion(
        uint64_t invocations,
        uint64_t backedges,
        size_t mir_instructions,
        double type_feedback_stability,
        uint32_t deopt_count = 0
    ) noexcept;

    static TierDecision evaluate_osr_loop_promotion(
        uint64_t backedges,
        size_t loop_body_size,
        uint32_t deopt_count = 0
    ) noexcept;
};

} // namespace setun
