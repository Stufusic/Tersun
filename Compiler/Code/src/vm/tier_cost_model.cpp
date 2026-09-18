// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Tier Economics & Cost Model Implementation
// ==============================================================================

#include "vm/tier_cost_model.hpp"
#include <algorithm>

namespace setun {

TierDecision TierCostModel::evaluate_tier1_promotion(
    uint64_t invocations,
    uint64_t backedges,
    size_t bytecode_size,
    uint32_t deopt_count
) noexcept {
    TierDecision dec{};

    // Avoid compiling short, non-looping functions (JIT penalty avoidance)
    if (bytecode_size < 16 && backedges == 0) {
        dec.should_promote = false;
        dec.confidence = 0.99;
        dec.target_tier = 0;
        return dec;
    }

    // Hotness score
    uint64_t hotness = invocations + backedges * 5;
    if (hotness < 30) {
        dec.should_promote = false;
        dec.confidence = 0.90;
        dec.target_tier = 0;
        return dec;
    }

    // Estimate compile cost: ~0.005 ms per bytecode instruction in Baseline JIT
    double compile_cost_ms = static_cast<double>(bytecode_size) * 0.005;
    dec.compile_cost_ms = compile_cost_ms;

    // Estimate remaining iterations based on observed backedge activity
    uint64_t est_remaining_work = backedges > 0 ? (backedges * 2) : (invocations * 2);
    // Baseline JIT yields ~2.5x speedup over interpreter (saves ~0.0001 ms per bytecode dispatch)
    double time_saved_ms = static_cast<double>(est_remaining_work * bytecode_size) * 0.0001;

    // Deopt penalty estimation
    double deopt_risk = (deopt_count > 0) ? std::min(1.0, static_cast<double>(deopt_count) * 0.25) : 0.05;
    double expected_deopt_penalty_ms = deopt_risk * 1.5; // ~1.5ms per deopt unwind
    dec.deopt_risk = deopt_risk;

    double net_gain_ms = time_saved_ms - compile_cost_ms - expected_deopt_penalty_ms;
    dec.expected_gain_ms = net_gain_ms;

    // Confidence model
    double confidence = (hotness > 100) ? 0.95 : (static_cast<double>(hotness) / 100.0 * 0.95);
    if (deopt_count > 2) confidence *= 0.50; // Deopt thrashing drops confidence
    dec.confidence = confidence;

    if (net_gain_ms > kSafetyMarginMs && confidence >= kMinConfidence) {
        dec.should_promote = true;
        dec.target_tier = 1;
    } else {
        dec.should_promote = false;
        dec.target_tier = 0;
    }

    return dec;
}

TierDecision TierCostModel::evaluate_tier2_promotion(
    uint64_t invocations,
    uint64_t backedges,
    size_t mir_instructions,
    double type_feedback_stability,
    uint32_t deopt_count
) noexcept {
    TierDecision dec{};

    // Tier 2 requires high type stability
    if (type_feedback_stability < 0.90 || deopt_count > 1) {
        dec.should_promote = false;
        dec.confidence = 0.95;
        dec.target_tier = 1;
        return dec;
    }

    // High compile cost for Optimizing JIT (SSA, LSRA, MIR optimizations)
    double compile_cost_ms = static_cast<double>(mir_instructions) * 0.05;
    dec.compile_cost_ms = compile_cost_ms;

    uint64_t est_remaining_work = backedges * 5;
    double time_saved_ms = static_cast<double>(est_remaining_work * mir_instructions) * 0.0003;
    double deopt_risk = (1.0 - type_feedback_stability) * 2.0;
    dec.deopt_risk = deopt_risk;

    double net_gain_ms = time_saved_ms - compile_cost_ms - (deopt_risk * 2.0);
    dec.expected_gain_ms = net_gain_ms;
    dec.confidence = type_feedback_stability;

    if (net_gain_ms > kSafetyMarginMs && dec.confidence >= kMinConfidence) {
        dec.should_promote = true;
        dec.target_tier = 2;
    } else {
        dec.should_promote = false;
        dec.target_tier = 1;
    }

    return dec;
}

TierDecision TierCostModel::evaluate_osr_loop_promotion(
    uint64_t backedges,
    size_t loop_body_size,
    uint32_t deopt_count
) noexcept {
    TierDecision dec{};

    // OSR triggers on hot loop backedges
    if (backedges < 50 || deopt_count >= 3) {
        dec.should_promote = false;
        dec.confidence = 0.80;
        dec.target_tier = 0;
        return dec;
    }

    double compile_cost_ms = static_cast<double>(loop_body_size) * 0.01;
    double est_remaining = static_cast<double>(backedges) * 3.0;
    double time_saved_ms = est_remaining * static_cast<double>(loop_body_size) * 0.0002;
    double net_gain = time_saved_ms - compile_cost_ms;

    dec.compile_cost_ms = compile_cost_ms;
    dec.expected_gain_ms = net_gain;
    dec.confidence = 0.90;

    if (net_gain > kSafetyMarginMs) {
        dec.should_promote = true;
        dec.target_tier = 1;
    }

    return dec;
}

} // namespace setun
