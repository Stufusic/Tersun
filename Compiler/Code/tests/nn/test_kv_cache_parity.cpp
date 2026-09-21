#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/format/model_schema.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/nn/memory/execution_context.hpp"
#include "tensor/edge_arena.hpp"
#include <iostream>
#include <cassert>
#include <cmath>
#include <vector>

namespace setun::test {

using namespace setun::tensor::nn;
using namespace setun::tensor;

void test_kv_cache_parity_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 7.4 TIER 3: KV CACHE DIFFERENTIAL PARITY VERIFICATION       \n";
    std::cout << "  Invariant: Full forward(S) == Prefill(P) + Incremental Decode(S-P)\n";
    std::cout << "===================================================================\n";

    BitNetConfig config = BitNetConfig::toy_profile();
    BitNetModel model(config);
    model.init_synthetic(42);

    constexpr size_t S = 6;
    constexpr size_t P = 3;
    uint32_t tokens[S] = {5, 12, 19, 23, 7, 14};

    // -------------------------------------------------------------------------
    // Branch A: Full Context Forward (Parallel Prefill of all S tokens)
    // -------------------------------------------------------------------------
    std::vector<float> logits_full(config.vocab_size);
    {
        EdgeArena act_arena(16 * 1024 * 1024);
        EdgeArena ws_arena(16 * 1024 * 1024);
        KVCache kv_a(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
        ExecutionContext ctx_a(act_arena, ws_arena, &kv_a, ExecutionMode::Prefill);

        TensorView logits_v(logits_full.data(), TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
        Status st = model.forward(ctx_a, tokens, S, logits_v);
        assert(st.ok());
    }

    // -------------------------------------------------------------------------
    // Branch B: Prefill(P) + Incremental Decode(S - P)
    // -------------------------------------------------------------------------
    std::vector<float> logits_incremental(config.vocab_size);
    {
        EdgeArena act_arena(16 * 1024 * 1024);
        EdgeArena ws_arena(16 * 1024 * 1024);
        KVCache kv_b(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
        ExecutionContext ctx_b(act_arena, ws_arena, &kv_b, ExecutionMode::Prefill);

        // 1. Prefill prefix P tokens
        std::vector<float> prefill_logits(config.vocab_size);
        TensorView prefill_v(prefill_logits.data(), TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
        Status st_p = model.forward(ctx_b, tokens, P, prefill_v);
        assert(st_p.ok());

        // 2. Incremental decode remaining tokens: pos P..S-1
        ctx_b.set_mode(ExecutionMode::Decode);
        for (size_t step = P; step < S; ++step) {
            uint32_t tok = tokens[step];
            TensorView step_v(logits_incremental.data(), TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
            Status st_d = model.forward_decode_step(ctx_b, tok, step, step_v);
            assert(st_d.ok());
        }
    }

    // -------------------------------------------------------------------------
    // Parity Assertion: Cross-Check Logits between Full and Incremental
    // -------------------------------------------------------------------------
    float max_diff = 0.0f;
    for (size_t v = 0; v < config.vocab_size; ++v) {
        float diff = std::fabs(logits_full[v] - logits_incremental[v]);
        if (diff > max_diff) {
            max_diff = diff;
        }
    }

    std::cout << "  [Differential Analysis]: max_diff = " << max_diff << "\n";
    assert(max_diff < 1e-4f);

    size_t argmax_full = 0;
    size_t argmax_inc = 0;
    for (size_t v = 1; v < config.vocab_size; ++v) {
        if (logits_full[v] > logits_full[argmax_full]) argmax_full = v;
        if (logits_incremental[v] > logits_incremental[argmax_inc]) argmax_inc = v;
    }
    std::cout << "  Argmax Full: " << argmax_full << " vs Argmax Incremental: " << argmax_inc << "\n";
    assert(argmax_full == argmax_inc);

    std::cout << ">>> KV CACHE DIFFERENTIAL PARITY PASSED! (max_diff < 1e-4) <<<\n";
}

} // namespace setun::test
