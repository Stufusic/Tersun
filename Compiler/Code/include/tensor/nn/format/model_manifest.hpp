#pragma once

#include "tensor/nn/format/model_schema.hpp"
#include "tensor/nn/core/status.hpp"
#include <string>
#include <vector>
#include <cstdint>
#include <cstddef>
#include <string_view>
#include <optional>

namespace setun::tensor::nn {

// ============================================================================
// ModelManifest: Normalized Metadata Schema for Large Language Models (LLM)
// Combines HuggingFace config.json and generation_config.json into a unified
// runtime specification for BitNet and compatible Transformer architectures.
// ============================================================================
struct ModelManifest {
    // Model Architecture
    std::string model_type{"bitnet"};
    std::string architecture{"BitNetForCausalLM"};

    // Dimensions
    size_t vocab_size{32000};
    size_t hidden_size{2048};
    size_t intermediate_size{5632};
    size_t num_hidden_layers{24};
    size_t num_attention_heads{20};   // e.g., BitNet b1.58-2B-4T (20 Q heads)
    size_t num_key_value_heads{5};    // e.g., BitNet b1.58-2B-4T (5 KV heads, GQA 4:1)
    size_t head_dim{128};             // 2560 / 20 = 128
    size_t max_position_embeddings{4096};
    float rms_norm_eps{1e-5f};
    float rope_theta{10000.0f};
    bool tie_word_embeddings{false};

    // Special Token IDs
    int64_t bos_token_id{-1};
    std::vector<uint32_t> eos_token_ids; // Can have multiple EOS IDs (e.g. 128001, 128009)
    int64_t pad_token_id{-1};
    int64_t unk_token_id{-1};

    // Generation Defaults
    float default_temperature{0.7f};
    float default_top_p{0.9f};
    int32_t default_top_k{50};
    float default_repetition_penalty{1.1f};
    float default_presence_penalty{0.0f};
    float default_frequency_penalty{0.0f};
    size_t default_max_new_tokens{256};

    // Check if token id matches any EOS
    bool is_eos_token(uint32_t token_id) const noexcept {
        for (uint32_t eos : eos_token_ids) {
            if (eos == token_id) return true;
        }
        return false;
    }

    // Convert to BitNetConfig for BitNetModel instantiation
    BitNetConfig to_bitnet_config() const noexcept {
        BitNetConfig cfg;
        cfg.vocab_size = vocab_size;
        cfg.hidden_size = hidden_size;
        cfg.intermediate_size = intermediate_size;
        cfg.num_hidden_layers = num_hidden_layers;
        cfg.num_attention_heads = num_attention_heads;
        cfg.num_key_value_heads = num_key_value_heads;
        cfg.head_dim = head_dim;
        cfg.max_position_embeddings = max_position_embeddings;
        cfg.rms_norm_eps = rms_norm_eps;
        cfg.tie_word_embeddings = tie_word_embeddings;
        cfg.finalize();
        return cfg;
    }

    // JSON Parsers
    static Result<ModelManifest> from_config_json(std::string_view json_str);
    Status parse_generation_config_json(std::string_view json_str);
    static Result<ModelManifest> load_from_dir(const std::string& dir_path);
};

} // namespace setun::tensor::nn
