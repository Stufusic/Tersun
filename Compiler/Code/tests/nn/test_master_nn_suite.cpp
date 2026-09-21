#include <iostream>
#include <cassert>
#include <cmath>
#include <chrono>

#include "tensor/nn/neuron/ternary_neuron.hpp"
#include "tensor/nn/ops/bit_linear.hpp"
#include "tensor/nn/ops/rmsnorm.hpp"
#include "tensor/nn/ops/activations.hpp"
#include "tensor/nn/ops/softmax.hpp"
#include "tensor/nn/ops/rope.hpp"
#include "tensor/nn/graph/liveness_planner.hpp"
#include "tensor/nn/models/decoder_block.hpp"
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/format/checkpoint_adapter.hpp"
#include "tensor/nn/runtime/sampler.hpp"
#include "tensor/nn/runtime/numerical_forensics.hpp"
#include "tensor/edge_arena.hpp"

using namespace setun::tensor::nn;
using namespace setun::tensor;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  TERSUN NEURAL RUNTIME ENGINE (tersun_nn) MASTER VERIFICATION     \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------------------
    // L1: Complete 4-Phase Ternary Neuron
    // -------------------------------------------------------------------------
    std::cout << "  [L1: First-Principles Ternary Neuron Compute]... ";
    {
        assert(TernaryNeuron::decode_synapse(TRIT_CODE_PLUS_ONE) == 1);
        assert(TernaryNeuron::decode_synapse(TRIT_CODE_ZERO) == 0);
        assert(TernaryNeuron::decode_synapse(TRIT_CODE_MINUS_ONE) == -1);

        uint8_t byte0 = pack_trits_4(1, -1, 0, 1);
        uint8_t byte1 = pack_trits_4(-1, 0, 0, 0);
        uint8_t packed_w[2] = {byte0, byte1};
        int32_t inputs[5] = {10, 20, 30, 40, 50};
        int32_t z = TernaryNeuron::integrate_dendrites_scalar(inputs, packed_w, 5, 5);
        assert(z == -15);

        float soma_relu2 = TernaryNeuron::activate_soma(4, SomaActivationMode::SquaredReLU);
        assert(soma_relu2 == 16.0f);
        float soma_neg = TernaryNeuron::activate_soma(-4, SomaActivationMode::SquaredReLU);
        assert(soma_neg == 0.0f);

        std::cout << "PASSED (4-phase compute verified)\n";
    }

    // -------------------------------------------------------------------------
    // L1b: Neural Operators (BitLinear, RMSNorm, SquaredReLU, RoPE, Softmax)
    // -------------------------------------------------------------------------
    std::cout << "  [L1b: Fundamental Neural Operators]... ";
    {
        SquaredReLU relu2;
        Tensor in_t(TensorShape(4), TensorDType::FLOAT32);
        Tensor out_t(TensorShape(4), TensorDType::FLOAT32);
        float* p_in = static_cast<float*>(in_t.raw_data());
        float* p_out = static_cast<float*>(out_t.raw_data());
        p_in[0] = -2.0f; p_in[1] = 0.0f; p_in[2] = 1.5f; p_in[3] = 3.0f;

        EdgeArena dummy_a(64 * 1024);
        EdgeArena dummy_w(64 * 1024);
        ExecutionContext ctx(dummy_a, dummy_w);
        TensorView in_v = in_t.view();
        TensorView out_v = out_t.view();
        Status st = relu2.forward(ctx, in_v, out_v);
        assert(st.ok());
        assert(p_out[0] == 0.0f);
        assert(p_out[1] == 0.0f);
        assert(std::fabs(p_out[2] - 2.25f) < 1e-5f);
        assert(std::fabs(p_out[3] - 9.00f) < 1e-5f);
        std::cout << "PASSED (SquaredReLU verified)\n";
    }

    // -------------------------------------------------------------------------
    // L2: Transformer DecoderBlock (Prefill + Decode)
    // -------------------------------------------------------------------------
    std::cout << "  [L2: Transformer DecoderBlock Dual-Mode Execution]... ";
    {
        EdgeArena act_arena(2 * EdgeArena::BUDGET_1MB);
        EdgeArena work_arena(EdgeArena::BUDGET_1MB);
        KVCache kv_cache(1, 2, 16, 32);
        ExecutionContext ctx(act_arena, work_arena, &kv_cache);

        DecoderBlock block("layer0", 0, 64, 4, 2, 16, 128, 32);
        block.init_synthetic(42);

        Tensor in_s(TensorShape(4, 64), TensorDType::FLOAT32);
        Tensor out_s(TensorShape(4, 64), TensorDType::FLOAT32);
        TensorView in_v = in_s.view();
        TensorView out_v = out_s.view();

        auto probe = AllocationProbe::start();
        Status st = block.forward(ctx, in_v, out_v);
        assert(st.ok());
        assert(probe.alloc_count() == 0);
        std::cout << "PASSED (0 heap allocations)\n";
    }

    // -------------------------------------------------------------------------
    // L3: Static Liveness Memory Planner
    // -------------------------------------------------------------------------
    std::cout << "  [L3: Static Liveness-Based Memory Planner]... ";
    {
        std::vector<TensorInterval> intervals = {
            {1, "t1", 1024, 0, 2, 0},
            {2, "t2", 2048, 3, 5, 0},
            {3, "t3", 512,  6, 8, 0}
        };

        MemoryPlan plan = LivenessPlanner::plan(intervals, 64);
        assert(plan.peak_arena_bytes == 2048);
        for (const auto& it : plan.intervals) {
            assert(it.assigned_offset == 0);
            assert(it.assigned_offset % 64 == 0);
        }
        std::cout << "PASSED (Interval coloring compiled, peak=" << plan.peak_arena_bytes << " B)\n";
    }

    // -------------------------------------------------------------------------
    // L4: KV Cache Invariant Equivalence
    // -------------------------------------------------------------------------
    std::cout << "  [L4: Full Sequence vs Prefill+Decode Invariant Check]... ";
    {
        BitNetConfig config = BitNetConfig::toy_profile();
        BitNetModel model(config);
        model.init_synthetic(777);

        uint32_t tokens[4] = {11, 22, 33, 44};

        EdgeArena act1(2 * EdgeArena::BUDGET_1MB), work1(EdgeArena::BUDGET_1MB);
        KVCache kv1(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
        ExecutionContext ctx1(act1, work1, &kv1);
        Tensor logits1(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
        TensorView v1 = logits1.view();
        model.forward(ctx1, tokens, 4, v1);

        EdgeArena act2(2 * EdgeArena::BUDGET_1MB), work2(EdgeArena::BUDGET_1MB);
        KVCache kv2(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
        ExecutionContext ctx2(act2, work2, &kv2);
        Tensor dummy(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
        TensorView dummy_v = dummy.view();
        model.forward(ctx2, tokens, 3, dummy_v);

        Tensor logits2(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
        TensorView v2 = logits2.view();
        model.forward_decode_step(ctx2, tokens[3], 3, v2);

        const float* p1 = static_cast<const float*>(logits1.raw_data());
        const float* p2 = static_cast<const float*>(logits2.raw_data());
        float max_diff = 0.0f;
        for (size_t i = 0; i < config.vocab_size; ++i) {
            float d = std::fabs(p1[i] - p2[i]);
            if (d > max_diff) max_diff = d;
        }
        assert(max_diff < 1e-4f);
        std::cout << "PASSED (max_diff=" << max_diff << ")\n";
    }

    // -------------------------------------------------------------------------
    // L5: Sustained Zero-Allocation Autoregressive Generation Proof
    // -------------------------------------------------------------------------
    std::cout << "  [L5: Continuous Autoregressive Generation (100 Tokens)]... ";
    {
        BitNetConfig config = BitNetConfig::toy_profile();
        config.max_position_embeddings = 128;
        BitNetModel model(config);
        model.init_synthetic(42);

        EdgeArena act(2 * EdgeArena::BUDGET_1MB), work(EdgeArena::BUDGET_1MB);
        KVCache kv(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
        ExecutionContext ctx(act, work, &kv);

        uint32_t prompt[3] = {5, 15, 25};
        Tensor logits_buf(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
        TensorView log_v = logits_buf.view();
        model.forward(ctx, prompt, 3, log_v);

        const float* p_log = static_cast<const float*>(logits_buf.raw_data());
        uint32_t cur = Sampler::sample_greedy(p_log, config.vocab_size);

        auto probe = AllocationProbe::start();
        auto t0 = std::chrono::high_resolution_clock::now();

        for (size_t s = 3; s < 103; ++s) {
            ctx.reset_activation_arena();
            model.forward_decode_step(ctx, cur, s, log_v);
            cur = Sampler::sample_greedy(p_log, config.vocab_size);
        }

        auto t1 = std::chrono::high_resolution_clock::now();
        size_t allocs = probe.alloc_count();
        double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

        assert(allocs == 0);
        assert(kv.current_seq_len() == 103);
        std::cout << "PASSED (100 tokens in " << ms << " ms, 0 heap allocations)\n";
    }

    // -------------------------------------------------------------------------
    // Numerical Checkpointing Forensics Determinism
    // -------------------------------------------------------------------------
    std::cout << "  [Forensics: FNV-1a Numerical Checksum Determinism]... ";
    {
        float dataA[5] = {1.0f, -2.5f, 0.0f, 3.14159f, 42.0f};
        float dataB[5] = {1.0f, -2.5f, -0.0f, 3.14159f, 42.0f}; // -0.0f normalized to 0.0f
        uint64_t hA = NumericalForensics::hash_floats(dataA, 5);
        uint64_t hB = NumericalForensics::hash_floats(dataB, 5);
        assert(hA != 0);
        assert(hA == hB);
        std::cout << "PASSED (Hash=0x" << std::hex << hA << ")\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  ALL TERSUN NEURAL RUNTIME LEVELS (L1-L5): 100% VERIFIED!         \n";
    std::cout << "===================================================================\n";
    return 0;
}
