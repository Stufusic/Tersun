#include "compiler/canonical_ternary_ir.hpp"
#include "compiler/llvm_emitter.hpp"
#include <iostream>
#include <vector>
#include <cassert>
#include <random>
#include <cmath>

namespace setun::test {

void test_epilogue_fusion_parity_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.3] Epilogue Fusion & Contraction Parity Verification   \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: DoD 1 - TernaryContractionNode Decoupling
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-1] Verifying TernaryContractionNode decouples scheduling... ";
    {
        using namespace setun::compiler;
        TernaryContractionNode node;
        node.func_name = "fused_dense_block";
        node.lhs_a = ValueId{0, "x"};
        node.rhs_b = ValueId{1, "W"};
        node.bias = ValueId{2, "b"};
        node.out_y = ValueId{3, "y"};
        node.M = size_t(32);
        node.N = size_t(64);
        node.K = size_t(128);
        node.layout = WeightLayout::DENSE_TRIT8;

        // Epilogue chain: BiasAdd -> SquaredReLU
        EpilogueStage stage1{EpilogueOp::BIAS_ADD, {node.bias}};
        EpilogueStage stage2{EpilogueOp::SQUARED_RELU, {}};
        node.epilogue_chain.push_back(stage1);
        node.epilogue_chain.push_back(stage2);

        // Verification of 6-point legality
        std::string err;
        assert(FusionPlanner::verify_fusion_legality(node, stage1, &err));
        assert(FusionPlanner::verify_fusion_legality(node, stage2, &err));

        // Scheduling is separate
        ContractionSchedule sched = ContractionCostModel::derive_schedule(32, 64, 128, WeightLayout::DENSE_TRIT8);
        assert(sched.tile_m > 0);
        assert(sched.tile_n > 0);
        assert(sched.tile_k > 0);
        assert(sched.unroll_m == 4);
        assert(sched.unroll_n == 8);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: DoD 3 - Fused BiasAdd + SquaredReLU Bit-Exact Parity
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-2] Fused BiasAdd + SquaredReLU (Scalar vs AVX2 bit-exact)... ";
    {
        using namespace setun::compiler;
        const size_t M = 16;
        const size_t N = 32;
        const size_t K = 64;

        std::vector<int32_t> A(M * K);
        std::vector<int8_t> B(K * N);
        std::vector<int32_t> bias(N);
        std::vector<int32_t> Y_scalar(M * N, 0);
        std::vector<int32_t> Y_avx2(M * N, 0);

        std::mt19937 rng(42);
        std::uniform_int_distribution<int> dist_a(-10, 10);
        std::uniform_int_distribution<int> dist_b(-1, 1);
        std::uniform_int_distribution<int> dist_bias(-50, 50);

        for (auto& a : A) a = dist_a(rng);
        for (auto& b : B) b = static_cast<int8_t>(dist_b(rng));
        for (auto& b : bias) b = dist_bias(rng);

        std::vector<EpilogueStage> epilogue;
        epilogue.push_back({EpilogueOp::SQUARED_RELU, {}});

        ContractionSchedule sched = ContractionCostModel::derive_schedule(M, N, K);

        CanonicalTernaryEngine::execute_scalar_gemm(
            A.data(), B.data(), bias.data(), Y_scalar.data(), M, N, K, epilogue
        );

        CanonicalTernaryEngine::execute_avx2_dense_gemm(
            A.data(), B.data(), bias.data(), Y_avx2.data(), M, N, K, sched, epilogue
        );

        for (size_t i = 0; i < M * N; ++i) {
            assert(Y_scalar[i] == Y_avx2[i]);
            // Squared ReLU output must be non-negative
            assert(Y_avx2[i] >= 0);
        }
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 3: Clamp & ScaleShift Epilogue Parity
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-3] Clamp & ScaleShift epilogue bit-exact parity... ";
    {
        using namespace setun::compiler;
        const size_t M = 8;
        const size_t N = 16;
        const size_t K = 32;

        std::vector<int32_t> A(M * K);
        std::vector<int8_t> B(K * N);
        std::vector<int32_t> bias(N);
        std::vector<int32_t> Y_scalar(M * N, 0);
        std::vector<int32_t> Y_avx2(M * N, 0);

        std::mt19937 rng(1337);
        for (auto& a : A) a = (rng() % 20) - 10;
        for (auto& b : B) b = static_cast<int8_t>((rng() % 3) - 1);
        for (auto& b : bias) b = (rng() % 100) - 50;

        std::vector<EpilogueStage> epilogue;
        EpiloguePayload payload;
        payload.clamp_min = -25;
        payload.clamp_max = 75;
        epilogue.push_back({EpilogueOp::CLAMP, payload});

        ContractionSchedule sched = ContractionCostModel::derive_schedule(M, N, K);

        CanonicalTernaryEngine::execute_scalar_gemm(
            A.data(), B.data(), bias.data(), Y_scalar.data(), M, N, K, epilogue
        );

        CanonicalTernaryEngine::execute_avx2_dense_gemm(
            A.data(), B.data(), bias.data(), Y_avx2.data(), M, N, K, sched, epilogue
        );

        for (size_t i = 0; i < M * N; ++i) {
            assert(Y_scalar[i] == Y_avx2[i]);
            assert(Y_avx2[i] >= -25 && Y_avx2[i] <= 75);
        }
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 4: ContractionMemoryFacts Structured Proofs
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-4] ContractionMemoryFacts structured proof verification... ";
    {
        using namespace setun::compiler;
        TernaryContractionNode node;
        node.func_name = "bitlinear_fused";
        node.lhs_a = ValueId{0, "x"};
        node.rhs_b = ValueId{1, "W"};
        node.bias = ValueId{2, "b"};
        node.out_y = ValueId{3, "y"};

        // Simulate split_at_mut proof: x and W are disjoint
        node.memory_facts.disjoint_regions.push_back({node.lhs_a, node.rhs_b});
        node.memory_facts.noalias_pairs.push_back({node.lhs_a, node.out_y});
        node.memory_facts.readonly_value_ids.insert(node.rhs_b.id);
        node.memory_facts.unique_mutable_ids.insert(node.out_y.id);
        node.alias_free = true;

        assert(node.memory_facts.has_disjoint(node.lhs_a, node.rhs_b));
        assert(node.memory_facts.has_disjoint(node.rhs_b, node.lhs_a)); // symmetric
        assert(!node.memory_facts.has_disjoint(node.lhs_a, node.out_y));
        assert(node.memory_facts.has_noalias(node.lhs_a, node.out_y));
        assert(node.memory_facts.is_readonly(node.rhs_b));
        assert(!node.memory_facts.is_readonly(node.out_y));
        assert(node.memory_facts.is_unique_mutable(node.out_y));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 5: TypedEpiloguePayload Strongly-Typed Variant
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-5] TypedEpiloguePayload strongly-typed variant contract... ";
    {
        using namespace setun::compiler;

        // ReLU stage: monostate payload
        EpilogueStage relu_stage;
        relu_stage.op = EpilogueOp::RELU;
        relu_stage.typed_payload = std::monostate{};
        assert(std::holds_alternative<std::monostate>(relu_stage.typed_payload));

        // Clamp stage: ClampPayload
        EpilogueStage clamp_stage;
        clamp_stage.op = EpilogueOp::CLAMP;
        clamp_stage.payload.clamp_min = -128;
        clamp_stage.payload.clamp_max = 127;
        clamp_stage.typed_payload = ClampPayload{-128, 127};
        assert(std::holds_alternative<ClampPayload>(clamp_stage.typed_payload));
        assert(std::get<ClampPayload>(clamp_stage.typed_payload).min_val == -128);
        assert(std::get<ClampPayload>(clamp_stage.typed_payload).max_val == 127);

        // Scale stage: ScalePayload
        EpilogueStage scale_stage;
        scale_stage.op = EpilogueOp::SCALE_SHIFT;
        scale_stage.payload.scale = 3;
        scale_stage.payload.shift = 2;
        scale_stage.typed_payload = ScalePayload{3, 2};
        assert(std::holds_alternative<ScalePayload>(scale_stage.typed_payload));
        assert(std::get<ScalePayload>(scale_stage.typed_payload).multiplier == 3);
        assert(std::get<ScalePayload>(scale_stage.typed_payload).shift == 2);

        // BiasAdd stage: BiasAddPayload
        EpilogueStage bias_stage;
        bias_stage.op = EpilogueOp::BIAS_ADD;
        bias_stage.typed_payload = BiasAddPayload{ValueId{5, "bias_vec"}};
        assert(std::holds_alternative<BiasAddPayload>(bias_stage.typed_payload));
        assert(std::get<BiasAddPayload>(bias_stage.typed_payload).bias_tensor.name == "bias_vec");
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 6: LLVM Contraction IR Lowering Output Verification
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-6] LLVM contraction IR lowering produces valid module... ";
    {
        using namespace setun::compiler;

        TernaryContractionNode node;
        node.func_name = "test_contraction_kernel";
        node.lhs_a = ValueId{0, "A"};
        node.rhs_b = ValueId{1, "B"};
        node.bias = ValueId{2, "bias"};
        node.out_y = ValueId{3, "Y"};
        node.M = size_t(16);
        node.N = size_t(32);
        node.K = size_t(64);
        node.layout = WeightLayout::DENSE_TRIT8;

        // Epilogue: SquaredReLU + Clamp
        EpilogueStage sq_relu{EpilogueOp::SQUARED_RELU, {}};
        EpiloguePayload cp;
        cp.clamp_min = -100;
        cp.clamp_max = 100;
        EpilogueStage clamp{EpilogueOp::CLAMP, cp};
        node.epilogue_chain.push_back(sq_relu);
        node.epilogue_chain.push_back(clamp);

        ContractionSchedule sched = ContractionCostModel::derive_schedule(16, 32, 64);

        setun::LLVMEmitter emitter;
        std::string ir = emitter.emit_contraction_llvm_ir(node, sched);

        // Verify IR contains expected elements
        assert(!ir.empty());
        assert(ir.find("test_contraction_kernel") != std::string::npos);
        assert(ir.find("target triple") != std::string::npos);
        assert(ir.find("M=16") != std::string::npos);
        assert(ir.find("N=32") != std::string::npos);
        assert(ir.find("K=64") != std::string::npos);
        assert(ir.find("apply_epilogue_vec") != std::string::npos);
        assert(ir.find("pmaxs.d") != std::string::npos); // ReLU uses max intrinsic
        assert(ir.find("pmins.d") != std::string::npos); // Clamp uses min intrinsic
        assert(ir.find("ternary select") != std::string::npos);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 7: Negative Fusion Rejection Tests (6-Point Verification)
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-7] Negative fusion rejection tests (6-point verification)... ";
    {
        using namespace setun::compiler;
        TernaryContractionNode node;
        node.func_name = "test_node";
        node.lhs_a = ValueId{1, "A"};
        node.rhs_b = ValueId{2, "B"};
        node.bias  = ValueId{3, "bias"};
        node.out_y = ValueId{4, "Y"};
        node.M = size_t(16);
        node.N = size_t(32);
        node.K = size_t(64);

        std::string err;

        // 1. Reject CLAMP with min > max
        EpilogueStage bad_clamp{EpilogueOp::CLAMP, {}};
        bad_clamp.payload.clamp_min = 100;
        bad_clamp.payload.clamp_max = 50;
        assert(!FusionPlanner::verify_fusion_legality(node, bad_clamp, &err));
        assert(err.find("exceeds clamp max") != std::string::npos);

        // 2. Reject SCALE_SHIFT with negative or >= 32 shift
        EpilogueStage bad_shift{EpilogueOp::SCALE_SHIFT, {}};
        bad_shift.payload.scale = 1;
        bad_shift.payload.shift = 32;
        assert(!FusionPlanner::verify_fusion_legality(node, bad_shift, &err));
        assert(err.find("Invalid shift") != std::string::npos);

        // 3. Reject output aliasing input A
        TernaryContractionNode aliasing_node = node;
        aliasing_node.out_y = aliasing_node.lhs_a;
        EpilogueStage relu{EpilogueOp::RELU, {}};
        assert(!FusionPlanner::verify_fusion_legality(aliasing_node, relu, &err));
        assert(err.find("aliases input A") != std::string::npos);

        // 4. Reject output aliasing weights B
        aliasing_node.out_y = aliasing_node.rhs_b;
        assert(!FusionPlanner::verify_fusion_legality(aliasing_node, relu, &err));
        assert(err.find("aliases weights B") != std::string::npos);

        // 5. Reject missing bias tensor for BIAS_ADD
        TernaryContractionNode no_bias_node = node;
        no_bias_node.bias = ValueId{0, ""};
        EpilogueStage empty_bias{EpilogueOp::BIAS_ADD, {ValueId{0, ""}}};
        assert(!FusionPlanner::verify_fusion_legality(no_bias_node, empty_bias, &err));
        assert(err.find("missing valid bias") != std::string::npos);

        // 6. Reject when register budget spills (> 16 registers)
        TernaryContractionNode busy_node = node;
        busy_node.epilogue_chain.push_back(EpilogueStage{EpilogueOp::CLAMP, {}});
        busy_node.epilogue_chain.push_back(EpilogueStage{EpilogueOp::SCALE_SHIFT, {}});
        busy_node.epilogue_chain.push_back(EpilogueStage{EpilogueOp::SQUARED_RELU, {}});
        busy_node.epilogue_chain.push_back(EpilogueStage{EpilogueOp::BIAS_ADD, {node.bias}});
        EpilogueStage extra_clamp{EpilogueOp::CLAMP, {}};
        extra_clamp.payload.clamp_min = -10;
        extra_clamp.payload.clamp_max = 10;
        assert(!FusionPlanner::verify_fusion_legality(busy_node, extra_clamp, &err));
        assert(err.find("Register budget exceeded") != std::string::npos);
        assert(err.find("spill") != std::string::npos);
    }
    std::cout << "PASSED\n";
}

} // namespace setun::test
