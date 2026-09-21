#include "tensor/nn/runtime/inference_session.hpp"
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/edge_arena.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

using namespace setun::tensor::nn;
using namespace setun::tensor;

void test_zero_alloc_session_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 7.4 TIER 5: ZERO-ALLOCATION INFERENCE SESSION VERIFICATION  \n";
    std::cout << "  Invariant: Hot-path prefill & decode maintain strictly malloc == 0\n";
    std::cout << "===================================================================\n";

    BitNetConfig config = BitNetConfig::toy_profile();
    config.max_position_embeddings = 128;
    BitNetModel model(config);
    model.init_synthetic(42);

    ModelManifest manifest;
    manifest.vocab_size = config.vocab_size;
    manifest.hidden_size = config.hidden_size;
    manifest.intermediate_size = config.intermediate_size;
    manifest.num_hidden_layers = config.num_hidden_layers;
    manifest.num_attention_heads = config.num_attention_heads;
    manifest.num_key_value_heads = config.num_key_value_heads;
    manifest.head_dim = config.head_dim;
    manifest.max_position_embeddings = config.max_position_embeddings;
    manifest.rms_norm_eps = config.rms_norm_eps;
    manifest.eos_token_ids.push_back(9999);

    InferenceSession session(model, manifest, 128, 16 * 1024 * 1024);

    SamplingConfig sampling_cfg = SamplingConfig::greedy();

    uint32_t prompt[4] = {10, 20, 30, 40};

    std::cout << "  [1. Zero-Allocation Prefill Validation]... ";
    uint32_t first_token = 0;
    {
        auto probe = AllocationProbe::start();
        Status st = session.prefill(Span<const uint32_t>(prompt, 4), first_token, sampling_cfg);
        assert(st.ok());
        size_t allocs = probe.alloc_count();
        std::cout << "(allocs=" << allocs << ") ";
        assert(allocs == 0);
        std::cout << "PASSED (0 heap allocations in prefill)\n";
    }

    std::cout << "  [2. Zero-Allocation Continuous Decode Loop (50 Tokens)]... ";
    {
        uint32_t current_token = first_token;
        auto probe = AllocationProbe::start();
        for (size_t step = 0; step < 50; ++step) {
            uint32_t next_tok = 0;
            Status st = session.decode_step(current_token, next_tok, sampling_cfg);
            assert(st.ok());
            current_token = next_tok;
        }
        size_t allocs = probe.alloc_count();
        std::cout << "(allocs=" << allocs << ") ";
        assert(allocs == 0);
        std::cout << "PASSED (0 heap allocations across 50 steps)\n";
    }

    std::cout << ">>> ZERO-ALLOCATION INFERENCE SESSION VERIFIED! <<<\n";
}

} // namespace setun::test
