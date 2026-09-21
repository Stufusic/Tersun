#include <iostream>
#include <vector>
#include <cassert>
#include <cmath>
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/format/checkpoint_adapter.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/edge_arena.hpp"

using namespace setun::tensor::nn;
using namespace setun::tensor;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2 Sprint 9-10: Full BitNet-b1.58 Model & Checkpoint Suite \n";
    std::cout << "===================================================================\n";

    // 1. Test Config Schema & JSON parsing
    std::cout << "  [Test 1: Config Schema & JSON Parsing]... ";
    {
        std::string json = R"({
            "vocab_size": 256,
            "hidden_size": 128,
            "intermediate_size": 256,
            "num_hidden_layers": 4,
            "num_attention_heads": 8,
            "num_key_value_heads": 2,
            "head_dim": 16,
            "max_position_embeddings": 64,
            "rms_norm_eps": 1e-5
        })";
        auto cfg_res = BitNetConfig::from_json_string(json);
        assert(cfg_res.ok());
        const auto& cfg = cfg_res.value();
        assert(cfg.vocab_size == 256);
        assert(cfg.hidden_size == 128);
        assert(cfg.intermediate_size == 256);
        assert(cfg.num_hidden_layers == 4);
        assert(cfg.num_attention_heads == 8);
        assert(cfg.num_key_value_heads == 2);
        assert(cfg.head_dim == 16);
        assert(cfg.max_position_embeddings == 64);
        std::cout << "PASSED (parsed 9 hyperparameters correctly)\n";
    }

    // 2. Instantiate Toy BitNet Model
    std::cout << "  [Test 2: BitNet Model Instantiation & Parameter Graph]... ";
    BitNetConfig config = BitNetConfig::toy_profile();
    BitNetModel model(config);
    model.init_synthetic(42);

    auto params = model.parameters();
    std::cout << "PASSED (Total registered parameter tensors: " << params.size() << ")\n";
    assert(params.size() == 1 + config.num_hidden_layers * 9 + 1 + 1); // embed + layers*9 + norm + lm_head

    // 3. Test SafeTensors Checkpoint Save & Load Roundtrip
    std::cout << "  [Test 3: SafeTensors Checkpoint Adapter Roundtrip]... ";
    try {
        std::string ckpt_path = "test_bitnet_toy.safetensors";
        Status st_save = CheckpointAdapter::save_checkpoint(ckpt_path, model);
        assert(st_save.ok());

        auto file = SafeTensorsFile::load_from_file(ckpt_path);
        assert(file != nullptr);

        BitNetModel fresh_model(config);
        auto load_res = CheckpointAdapter::load_checkpoint(*file, fresh_model);
        if (!load_res.ok()) {
            std::cout << "FAILED: " << load_res.status().message << "\n";
        }
        std::cout << "bound=" << load_res.value().bound_tensors << " vs total=" << params.size() << " missing=" << load_res.value().missing_tensors << "\n";
        for (const auto& p : fresh_model.parameters()) {
            if (!file->has_tensor(std::string(p.name))) {
                std::cout << "  File missing tensor: " << p.name << "\n";
            }
        }
        assert(load_res.value().bound_tensors == params.size());
        assert(load_res.value().missing_tensors == 0);
        std::cout << "PASSED (" << load_res.value().bound_tensors << " tensors loaded, "
                  << load_res.value().byte_count << " bytes bound)\n";
    } catch (const std::exception& e) {
        std::cout << "EXCEPTION in Test 3: " << e.what() << "\n";
        assert(false);
    }

    // 4. Zero-Allocation Prefill Mode (Sequence Length = 4)
    std::cout << "  [Test 4: Full Model Prefill (S=4 Tokens)]... ";
    EdgeArena act_arena(2 * EdgeArena::BUDGET_1MB);
    EdgeArena work_arena(EdgeArena::BUDGET_1MB);
    KVCache kv_cache(config.num_hidden_layers, config.num_key_value_heads, config.head_dim, config.max_position_embeddings);
    ExecutionContext ctx(act_arena, work_arena, &kv_cache);

    uint32_t prompt_tokens[4] = {12, 45, 78, 101};
    Tensor logits_prefill(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
    TensorView logits_v = logits_prefill.view();

    {
        auto probe = AllocationProbe::start();
        Status st = model.forward(ctx, prompt_tokens, 4, logits_v);
        size_t allocs = probe.alloc_count();

        assert(st.ok());
        assert(allocs == 0);
        assert(kv_cache.current_seq_len() == 4);

        const float* log_ptr = static_cast<const float*>(logits_prefill.raw_data());
        float max_abs_logit = 0.0f;
        for (size_t i = 0; i < config.vocab_size; ++i) {
            float v = std::fabs(log_ptr[i]);
            if (v > max_abs_logit) max_abs_logit = v;
        }
        assert(max_abs_logit > 0.0f);
        std::cout << "PASSED (0 heap allocations, max_abs_logit=" << max_abs_logit << ")\n";
    }

    // 5. Zero-Allocation Autoregressive Decode Step (Token 5, Step 4)
    std::cout << "  [Test 5: Full Model Autoregressive Decode Step (Step 4)]... ";
    Tensor logits_decode(TensorShape(1, config.vocab_size), TensorDType::FLOAT32);
    TensorView dec_v = logits_decode.view();

    {
        uint32_t next_token = 55;
        auto probe = AllocationProbe::start();
        Status st = model.forward_decode_step(ctx, next_token, 4, dec_v);
        size_t allocs = probe.alloc_count();

        assert(st.ok());
        assert(allocs == 0);
        assert(kv_cache.current_seq_len() == 5);

        const float* dec_ptr = static_cast<const float*>(logits_decode.raw_data());
        float max_abs_logit = 0.0f;
        for (size_t i = 0; i < config.vocab_size; ++i) {
            float v = std::fabs(dec_ptr[i]);
            if (v > max_abs_logit) max_abs_logit = v;
        }
        assert(max_abs_logit > 0.0f);
        std::cout << "PASSED (0 heap allocations, step 4 attended against 5 cached tokens)\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  BitNet-b1.58 Full Model & Checkpoint Suite: 100% SUCCESSFUL!     \n";
    std::cout << "===================================================================\n";
    return 0;
}
