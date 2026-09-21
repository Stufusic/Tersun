#include <iostream>
#include <vector>
#include <cassert>
#include <cmath>
#include "tensor/nn/models/decoder_block.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/edge_arena.hpp"

using namespace setun::tensor::nn;
using namespace setun::tensor;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2 Sprint 8: BitNet Transformer DecoderBlock Verification   \n";
    std::cout << "===================================================================\n";

    size_t hidden_size = 64;
    size_t num_heads = 4;
    size_t num_kv_heads = 2; // GQA 2:1
    size_t head_dim = 16;
    size_t intermediate_size = 128;
    size_t max_seq_len = 32;

    EdgeArena act_arena(EdgeArena::BUDGET_1MB);
    EdgeArena work_arena(EdgeArena::BUDGET_512KB);
    KVCache kv_cache(1, num_kv_heads, head_dim, max_seq_len);

    ExecutionContext ctx(act_arena, work_arena, &kv_cache);

    DecoderBlock block(
        "layers.0",
        0,
        hidden_size,
        num_heads,
        num_kv_heads,
        head_dim,
        intermediate_size,
        max_seq_len);
    block.init_synthetic(42);

    // Verify parameter registration
    auto params = block.parameters();
    std::cout << "  Registered block parameters: " << params.size() << " tensors\n";
    assert(params.size() > 0);

    // 1. Prefill Mode Verification (Sequence Length = 4)
    std::cout << "  [Test 1: DecoderBlock Prefill Mode (S=4)]... ";
    {
        ctx.set_mode(ExecutionMode::Prefill);
        ctx.set_sequence_length(4);

        Tensor in_seq(TensorShape(4, hidden_size), TensorDType::FLOAT32);
        float* in_ptr = static_cast<float*>(in_seq.raw_data());
        for (size_t i = 0; i < in_seq.total_elements(); ++i) in_ptr[i] = 0.5f;

        Tensor out_seq(TensorShape(4, hidden_size), TensorDType::FLOAT32);
        TensorView in_v = in_seq.view();
        TensorView out_v = out_seq.view();

        auto probe = AllocationProbe::start();
        Status st = block.forward(ctx, in_v, out_v);
        size_t allocs = probe.alloc_count();

        assert(st.ok());
        assert(allocs == 0);
        assert(kv_cache.current_seq_len() == 4);

        const float* out_p = static_cast<const float*>(out_seq.raw_data());
        float max_val = 0.0f;
        for (size_t i = 0; i < out_seq.total_elements(); ++i) {
            float v = std::fabs(out_p[i]);
            if (v > max_val) max_val = v;
        }
        assert(max_val > 0.0f);
        std::cout << "PASSED (0 heap allocations, max_val=" << max_val << ")\n";
    }

    // 2. Decode Mode Verification (1 token at step 4)
    std::cout << "  [Test 2: DecoderBlock Autoregressive Decode (Step 4, Token 5)]... ";
    {
        ctx.set_mode(ExecutionMode::Decode);
        ctx.set_current_step(4);

        Tensor in_tok(TensorShape(1, hidden_size), TensorDType::FLOAT32);
        float* in_ptr = static_cast<float*>(in_tok.raw_data());
        for (size_t i = 0; i < in_tok.total_elements(); ++i) in_ptr[i] = 0.25f;

        Tensor out_tok(TensorShape(1, hidden_size), TensorDType::FLOAT32);
        TensorView in_v = in_tok.view();
        TensorView out_v = out_tok.view();

        auto probe = AllocationProbe::start();
        Status st = block.forward(ctx, in_v, out_v);
        size_t allocs = probe.alloc_count();

        assert(st.ok());
        assert(allocs == 0);
        assert(kv_cache.current_seq_len() == 5);

        const float* out_p = static_cast<const float*>(out_tok.raw_data());
        float max_val = 0.0f;
        for (size_t i = 0; i < out_tok.total_elements(); ++i) {
            float v = std::fabs(out_p[i]);
            if (v > max_val) max_val = v;
        }
        assert(max_val > 0.0f);
        std::cout << "PASSED (0 heap allocations, max_val=" << max_val << ")\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  BitNet Transformer DecoderBlock: 100% SUCCESSFUL!               \n";
    std::cout << "===================================================================\n";
    return 0;
}
