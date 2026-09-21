#include <iostream>
#include <vector>
#include <cassert>
#include <chrono>
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/runtime/sampler.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/edge_arena.hpp"

using namespace setun::tensor::nn;
using namespace setun::tensor;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2 Sprint 12: L5 Zero-Allocation Autoregressive Generation \n";
    std::cout << "===================================================================\n";

    BitNetConfig config = BitNetConfig::toy_profile();
    config.max_position_embeddings = 128;
    BitNetModel model(config);
    model.init_synthetic(42);

    EdgeArena act_arena(2 * EdgeArena::BUDGET_1MB);
    EdgeArena work_arena(EdgeArena::BUDGET_1MB);
    KVCache kv_cache(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
    ExecutionContext ctx(act_arena, work_arena, &kv_cache);

    // Prompt tokens
    uint32_t prompt[3] = {10, 20, 30};
    Tensor logits_buf(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
    TensorView logits_v = logits_buf.view();

    std::cout << "  [Step 1: Prefill Prompt (3 Tokens)]... ";
    Status st_prefill = model.forward(ctx, prompt, 3, logits_v);
    assert(st_prefill.ok());
    assert(kv_cache.current_seq_len() == 3);
    std::cout << "PASSED\n";

    const float* log_ptr = static_cast<const float*>(logits_buf.raw_data());
    uint32_t current_token = Sampler::sample_greedy(log_ptr, config.vocab_size);
    std::cout << "  First predicted token after prompt: " << current_token << "\n";

    // Continuous Autoregressive Generation Loop (100 tokens)
    const size_t NUM_GENERATED_TOKENS = 100;
    std::cout << "  [Step 2: Generating " << NUM_GENERATED_TOKENS << " Tokens under AllocationProbe]...\n";

    std::vector<uint32_t> generated_tokens;
    generated_tokens.reserve(NUM_GENERATED_TOKENS);

    auto start_time = std::chrono::high_resolution_clock::now();
    auto probe = AllocationProbe::start();

    for (size_t step = 3; step < 3 + NUM_GENERATED_TOKENS; ++step) {
        // Reset activation arena for this generation step (scratch space recycled)
        ctx.reset_activation_arena();

        Status st = model.forward_decode_step(ctx, current_token, step, logits_v);
        assert(st.ok());

        current_token = Sampler::sample_greedy(log_ptr, config.vocab_size);
        generated_tokens.push_back(current_token);
    }

    size_t total_allocs = probe.alloc_count();
    auto end_time = std::chrono::high_resolution_clock::now();
    double elapsed_ms = std::chrono::duration<double, std::milli>(end_time - start_time).count();
    double tok_per_sec = (NUM_GENERATED_TOKENS / elapsed_ms) * 1000.0;

    std::cout << "  Generated " << NUM_GENERATED_TOKENS << " tokens in " << elapsed_ms << " ms ("
              << tok_per_sec << " tokens/sec)\n";
    std::cout << "  Total Heap Allocations (malloc/calloc/new): " << total_allocs << "\n";

    // Strict Zero-Allocation Guarantee
    assert(total_allocs == 0);
    assert(kv_cache.current_seq_len() == 3 + NUM_GENERATED_TOKENS);

    std::cout << "  [Proof Verified]: Strict malloc=0, free=0 sustained over 100 consecutive decode steps!\n";
    std::cout << "===================================================================\n";
    std::cout << "  L5 Zero-Allocation Autoregressive Generation: 100% SUCCESSFUL!   \n";
    std::cout << "===================================================================\n";
    return 0;
}
