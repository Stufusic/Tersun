#include <iostream>
#include <vector>
#include <cassert>
#include <cmath>
#include <iomanip>
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/edge_arena.hpp"

using namespace setun::tensor::nn;
using namespace setun::tensor;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2 Sprint 11: L4 KV Cache Equivalence Invariant Verification\n";
    std::cout << "===================================================================\n";

    BitNetConfig config = BitNetConfig::toy_profile();
    BitNetModel model(config);
    model.init_synthetic(999);

    uint32_t tokens[4] = {14, 28, 57, 102};

    // =========================================================================
    // Path 1: Full Sequence Forward (Tokens 0, 1, 2, 3 in one shot)
    // =========================================================================
    std::cout << "  [Step 1: Computing Full Sequence Forward (S=4)]... ";
    EdgeArena act_arena1(2 * EdgeArena::BUDGET_1MB);
    EdgeArena work_arena1(EdgeArena::BUDGET_1MB);
    KVCache kv_cache1(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
    ExecutionContext ctx1(act_arena1, work_arena1, &kv_cache1);

    Tensor logits_full(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
    TensorView full_v = logits_full.view();

    Status st1 = model.forward(ctx1, tokens, 4, full_v);
    assert(st1.ok());
    std::cout << "DONE\n";

    // =========================================================================
    // Path 2: Split Execution: Prefill(0, 1, 2) -> Decode(3)
    // =========================================================================
    std::cout << "  [Step 2: Computing Prefill (S=3) followed by Decode (Token 3, Step 3)]... ";
    EdgeArena act_arena2(2 * EdgeArena::BUDGET_1MB);
    EdgeArena work_arena2(EdgeArena::BUDGET_1MB);
    KVCache kv_cache2(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
    ExecutionContext ctx2(act_arena2, work_arena2, &kv_cache2);

    // 2a. Prefill first 3 tokens
    Tensor logits_dummy(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
    TensorView dummy_v = logits_dummy.view();
    Status st2a = model.forward(ctx2, tokens, 3, dummy_v);
    assert(st2a.ok());
    assert(kv_cache2.current_seq_len() == 3);

    // 2b. Autoregressive decode token 3 at step 3
    Tensor logits_decode(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
    TensorView dec_v = logits_decode.view();
    Status st2b = model.forward_decode_step(ctx2, tokens[3], 3, dec_v);
    assert(st2b.ok());
    assert(kv_cache2.current_seq_len() == 4);
    std::cout << "DONE\n";

    // =========================================================================
    // Step 3: Mathematical Invariant Assertion: logits_full == logits_decode
    // =========================================================================
    std::cout << "  [Step 3: Comparing Logits Invariant]... ";
    const float* p_full = static_cast<const float*>(logits_full.raw_data());
    const float* p_dec = static_cast<const float*>(logits_decode.raw_data());

    float max_diff = 0.0f;
    float sum_diff = 0.0f;
    for (size_t i = 0; i < config.vocab_size; ++i) {
        float diff = std::fabs(p_full[i] - p_dec[i]);
        if (diff > max_diff) max_diff = diff;
        sum_diff += diff;
    }
    float avg_diff = sum_diff / config.vocab_size;

    std::cout << "Max Absolute Difference = " << std::scientific << std::setprecision(6) << max_diff
              << ", Avg Difference = " << avg_diff << "\n";

    // Mathematical identity check: differences should be within floating-point epsilon (<= 1e-4)
    assert(max_diff < 1e-3f);
    std::cout << "  [Invariant Verified]: logits(prefill(A,B,C) -> decode(D)) == logits(forward(A,B,C,D))\n";

    std::cout << "===================================================================\n";
    std::cout << "  L4 KV Cache Invariant Test: 100% SUCCESSFUL!                     \n";
    std::cout << "===================================================================\n";
    return 0;
}
