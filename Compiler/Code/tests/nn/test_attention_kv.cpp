#include <iostream>
#include <vector>
#include <cassert>
#include <cmath>
#include "tensor/nn/ops/attention_ops.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/edge_arena.hpp"

using namespace setun::tensor::nn;
using namespace setun::tensor;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2 Sprint 6-7: MultiHead Attention & KV Cache Verification \n";
    std::cout << "===================================================================\n";

    size_t hidden_size = 64;
    size_t num_heads = 4;
    size_t num_kv_heads = 2; // GQA 2:1
    size_t head_dim = 16;
    size_t max_seq_len = 32;

    EdgeArena act_arena(EdgeArena::BUDGET_512KB);
    EdgeArena work_arena(EdgeArena::BUDGET_512KB);
    KVCache kv_cache(1, num_kv_heads, head_dim, max_seq_len);

    ExecutionContext ctx(act_arena, work_arena, &kv_cache);

    MultiHeadSelfAttention attn("layer0_attn", 0, hidden_size, num_heads, num_kv_heads, head_dim, max_seq_len);
    attn.init_synthetic(42);

    // 1. Prefill Mode Verification (Sequence Length = 4)
    std::cout << "  [Test 1: Attention Prefill Mode (S=4)]... ";
    {
        ctx.set_mode(ExecutionMode::Prefill);
        ctx.set_sequence_length(4);

        Tensor in_seq(TensorShape(4, hidden_size), TensorDType::FLOAT32);
        float* in_ptr = static_cast<float*>(in_seq.raw_data());
        for (size_t i = 0; i < in_seq.total_elements(); ++i) in_ptr[i] = 1.0f;

        Tensor out_seq(TensorShape(4, hidden_size), TensorDType::FLOAT32);
        TensorView in_v = in_seq.view();
        TensorView out_v = out_seq.view();

        auto probe = AllocationProbe::start();
        Status st = attn.forward(ctx, in_v, out_v);
        size_t allocs = probe.alloc_count();

        assert(st.ok());
        assert(allocs == 0);
        assert(kv_cache.current_seq_len() == 4);
        std::cout << "PASSED (0 heap allocations, S=4 prefilled into KV cache)\n";
    }

    // 2. Decode Mode Verification (1 token at step 4)
    std::cout << "  [Test 2: Attention Autoregressive Decode (Token 5, Step 4)]... ";
    {
        ctx.set_mode(ExecutionMode::Decode);
        ctx.set_current_step(4); // 5th token (index 4)

        Tensor in_tok(TensorShape(1, hidden_size), TensorDType::FLOAT32);
        float* in_ptr = static_cast<float*>(in_tok.raw_data());
        for (size_t i = 0; i < in_tok.total_elements(); ++i) in_ptr[i] = 0.5f;

        Tensor out_tok(TensorShape(1, hidden_size), TensorDType::FLOAT32);
        TensorView in_v = in_tok.view();
        TensorView out_v = out_tok.view();

        auto probe = AllocationProbe::start();
        Status st = attn.forward(ctx, in_v, out_v);
        size_t allocs = probe.alloc_count();

        assert(st.ok());
        assert(allocs == 0);

        const float* out_p = static_cast<const float*>(out_tok.raw_data());
        float max_abs_out = 0.0f;
        for (size_t i = 0; i < hidden_size; ++i) {
            float a = std::fabs(out_p[i]);
            if (a > max_abs_out) max_abs_out = a;
        }
        assert(max_abs_out > 0.0f);
        std::cout << "PASSED (0 heap allocations, attended against cached 5 tokens, max_out=" << max_abs_out << ")\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  MultiHead GQA Attention & KV Cache: 100% SUCCESSFUL!             \n";
    std::cout << "===================================================================\n";
    return 0;
}
