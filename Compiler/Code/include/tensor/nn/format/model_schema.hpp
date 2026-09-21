#pragma once

#include <cstddef>
#include <string>
#include <string_view>
#include "tensor/nn/core/status.hpp"

namespace setun::tensor::nn {

// ============================================================================
// BitNetConfig: Configuration Schema for Microsoft BitNet-b1.58
// Compatible with HuggingFace config.json for bitnet architectures
// ============================================================================
struct BitNetConfig {
    size_t vocab_size{32000};
    size_t hidden_size{2048};
    size_t intermediate_size{5632};
    size_t num_hidden_layers{24};
    size_t num_attention_heads{32};
    size_t num_key_value_heads{8};   // GQA 4:1
    size_t head_dim{64};
    size_t max_position_embeddings{4096};
    float rms_norm_eps{1e-5f};
    bool tie_word_embeddings{false};

    // Helper: compute head dimension if not explicitly set
    void finalize() {
        if (head_dim == 0 && num_attention_heads > 0) {
            head_dim = hidden_size / num_attention_heads;
        }
    }

    // Factory: Default Toy Config for fast unit testing / micro validation
    static BitNetConfig toy_profile() {
        BitNetConfig cfg;
        cfg.vocab_size = 128;
        cfg.hidden_size = 64;
        cfg.intermediate_size = 128;
        cfg.num_hidden_layers = 2;
        cfg.num_attention_heads = 4;
        cfg.num_key_value_heads = 2; // GQA 2:1
        cfg.head_dim = 16;
        cfg.max_position_embeddings = 32;
        cfg.rms_norm_eps = 1e-5f;
        cfg.tie_word_embeddings = false;
        return cfg;
    }

    // Factory: Official Microsoft BitNet-b1.58-Large profile
    static BitNetConfig bitnet_large_profile() {
        BitNetConfig cfg;
        cfg.vocab_size = 32000;
        cfg.hidden_size = 2048;
        cfg.intermediate_size = 5632;
        cfg.num_hidden_layers = 24;
        cfg.num_attention_heads = 32;
        cfg.num_key_value_heads = 8;
        cfg.head_dim = 64;
        cfg.max_position_embeddings = 4096;
        cfg.rms_norm_eps = 1e-5f;
        cfg.tie_word_embeddings = false;
        return cfg;
    }

    // Minimal zero-dependency JSON parser for config.json
    static Result<BitNetConfig> from_json_string(std::string_view json_str) {
        BitNetConfig cfg;

        auto extract_int = [&](std::string_view key, size_t& target) {
            size_t pos = json_str.find(key);
            if (pos == std::string_view::npos) return;
            pos = json_str.find(':', pos);
            if (pos == std::string_view::npos) return;
            pos++;
            while (pos < json_str.size() && (json_str[pos] == ' ' || json_str[pos] == '\t' || json_str[pos] == '\r' || json_str[pos] == '\n' || json_str[pos] == '\"')) {
                pos++;
            }
            size_t end = pos;
            while (end < json_str.size() && (json_str[end] >= '0' && json_str[end] <= '9')) {
                end++;
            }
            if (end > pos) {
                target = std::stoull(std::string(json_str.substr(pos, end - pos)));
            }
        };

        auto extract_float = [&](std::string_view key, float& target) {
            size_t pos = json_str.find(key);
            if (pos == std::string_view::npos) return;
            pos = json_str.find(':', pos);
            if (pos == std::string_view::npos) return;
            pos++;
            while (pos < json_str.size() && (json_str[pos] == ' ' || json_str[pos] == '\t' || json_str[pos] == '\r' || json_str[pos] == '\n' || json_str[pos] == '\"')) {
                pos++;
            }
            size_t end = pos;
            while (end < json_str.size() && ((json_str[end] >= '0' && json_str[end] <= '9') || json_str[end] == '.' || json_str[end] == 'e' || json_str[end] == 'E' || json_str[end] == '-' || json_str[end] == '+')) {
                end++;
            }
            if (end > pos) {
                target = std::stof(std::string(json_str.substr(pos, end - pos)));
            }
        };

        extract_int("\"vocab_size\"", cfg.vocab_size);
        extract_int("\"hidden_size\"", cfg.hidden_size);
        extract_int("\"intermediate_size\"", cfg.intermediate_size);
        extract_int("\"num_hidden_layers\"", cfg.num_hidden_layers);
        extract_int("\"num_attention_heads\"", cfg.num_attention_heads);
        extract_int("\"num_key_value_heads\"", cfg.num_key_value_heads);
        extract_int("\"head_dim\"", cfg.head_dim);
        extract_int("\"max_position_embeddings\"", cfg.max_position_embeddings);
        extract_float("\"rms_norm_eps\"", cfg.rms_norm_eps);

        cfg.finalize();
        return Result<BitNetConfig>(cfg);
    }
};

} // namespace setun::tensor::nn
