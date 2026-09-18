// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Unit Tests: Tier Cost Model & Economics
// Tests ROI calculation, short script JIT avoidance, confidence thresholding,
// and OSR trigger policy.
// ==============================================================================

#include "vm/tier_cost_model.hpp"
#include <cassert>
#include <iostream>

using namespace setun;

static void test_tier_cost_model() {
    std::cout << "[TEST] TierCostModel ROI, Confidence & Policy...\n";

    // 1. Short CLI script (bytecode size 10, 1 invocation, 0 backedges) -> NO JIT!
    TierDecision dec_short = TierCostModel::evaluate_tier1_promotion(1, 0, 10, 0);
    assert(!dec_short.should_promote);
    assert(dec_short.target_tier == 0);

    // 2. Cold function (10 invocations, 0 backedges) -> NO JIT!
    TierDecision dec_cold = TierCostModel::evaluate_tier1_promotion(10, 0, 100, 0);
    assert(!dec_cold.should_promote);

    // 3. Hot loop function (100 invocations, 500 backedges, size 64) -> JIT Tier 1!
    TierDecision dec_hot = TierCostModel::evaluate_tier1_promotion(100, 500, 64, 0);
    assert(dec_hot.should_promote);
    assert(dec_hot.target_tier == 1);
    assert(dec_hot.confidence >= 0.85);
    assert(dec_hot.expected_gain_ms > TierCostModel::kSafetyMarginMs);

    // 4. Deopt thrashing (3 deopts already occurred) -> confidence drops, NO JIT!
    TierDecision dec_thrashing = TierCostModel::evaluate_tier1_promotion(100, 500, 64, 3);
    assert(!dec_thrashing.should_promote);

    // 5. Tier 2 Optimizing JIT with stable types (stability = 0.98) -> Promote to Tier 2!
    TierDecision dec_tier2 = TierCostModel::evaluate_tier2_promotion(1000, 5000, 128, 0.98, 0);
    assert(dec_tier2.should_promote);
    assert(dec_tier2.target_tier == 2);

    // 6. Tier 2 with unstable types (stability = 0.70) -> Denied Tier 2!
    TierDecision dec_unstable = TierCostModel::evaluate_tier2_promotion(1000, 5000, 128, 0.70, 0);
    assert(!dec_unstable.should_promote);
    assert(dec_unstable.target_tier == 1);

    // 7. OSR Loop promotion (10,000 backedges in single invocation) -> Promote!
    TierDecision dec_osr = TierCostModel::evaluate_osr_loop_promotion(10000, 32, 0);
    assert(dec_osr.should_promote);
    assert(dec_osr.target_tier == 1);

    std::cout << "  -> PASS: TierCostModel economic decisions 100% verified.\n";
}

int main() {
    test_tier_cost_model();
    return 0;
}
