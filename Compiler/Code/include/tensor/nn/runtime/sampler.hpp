#pragma once

#include "tensor/nn/core/span.hpp"
#include <cstddef>
#include <cstdint>
#include <cmath>
#include <algorithm>
#include <vector>
#include <random>
#include <unordered_map>

namespace setun::tensor::nn {

// ============================================================================
// SamplingConfig: Specification for Generation & Penalty Control
// ============================================================================
struct SamplingConfig {
    float temperature{0.7f};
    int32_t top_k{50};
    float top_p{0.9f};
    float repetition_penalty{1.0f};  // 1.0 = disabled; > 1.0 penalizes repeats
    float presence_penalty{0.0f};    // 0.0 = disabled; > 0.0 flat penalty if present
    float frequency_penalty{0.0f};   // 0.0 = disabled; > 0.0 proportional to frequency count
    uint64_t seed{42};

    static SamplingConfig greedy() {
        SamplingConfig cfg;
        cfg.temperature = 0.0f;
        cfg.top_k = 1;
        cfg.top_p = 1.0f;
        cfg.repetition_penalty = 1.0f;
        return cfg;
    }
};

// ============================================================================
// StopMatcher: Non-Allocating Fast Token Stream Matcher
// Checks single token IDs and multi-token sequences directly on token stream
// ============================================================================
class StopMatcher {
public:
    StopMatcher() = default;

    void add_stop_token_id(uint32_t id) {
        stop_ids_.push_back(id);
    }

    void add_stop_sequence(std::vector<uint32_t> seq) {
        if (!seq.empty()) {
            stop_seqs_.push_back(std::move(seq));
        }
    }

    // Check if the current generated stream ends with any stop condition
    // Returns true if stopped, and out_match_len gives the length of matched tokens to trim
    bool should_stop(Span<const uint32_t> tokens, size_t& out_match_len) const noexcept {
        out_match_len = 0;
        if (tokens.empty()) return false;

        uint32_t last_token = tokens[tokens.size() - 1];

        // 1. Single token ID check
        for (uint32_t id : stop_ids_) {
            if (last_token == id) {
                out_match_len = 1;
                return true;
            }
        }

        // 2. Multi-token sequence check
        for (const auto& seq : stop_seqs_) {
            if (seq.size() <= tokens.size()) {
                size_t offset = tokens.size() - seq.size();
                bool match = true;
                for (size_t i = 0; i < seq.size(); ++i) {
                    if (tokens[offset + i] != seq[i]) {
                        match = false;
                        break;
                    }
                }
                if (match) {
                    out_match_len = seq.size();
                    return true;
                }
            }
        }

        return false;
    }

private:
    std::vector<uint32_t> stop_ids_;
    std::vector<std::vector<uint32_t>> stop_seqs_;
};

// ============================================================================
// Sampler: Decoupled Non-Allocating Token Sampler
// Implements strict 8-step sampling contract with 3 distinct penalty models.
// ============================================================================
class Sampler {
public:
    // Greedy deterministic sampling: argmax(logits)
    static uint32_t sample_greedy(const float* logits, size_t vocab_size) noexcept {
        if (vocab_size == 0 || !logits) return 0;
        size_t best_idx = 0;
        float best_val = logits[0];
        for (size_t i = 1; i < vocab_size; ++i) {
            if (logits[i] > best_val) {
                best_val = logits[i];
                best_idx = i;
            }
        }
        return static_cast<uint32_t>(best_idx);
    }

    // Penalty 1: Repetition Penalty: (x > 0 ? x / alpha : x * alpha)
    static void apply_repetition_penalty(
        float* logits,
        size_t vocab_size,
        const uint32_t* context_tokens,
        size_t num_context_tokens,
        float penalty_factor) noexcept {
        if (penalty_factor == 1.0f || !context_tokens || num_context_tokens == 0) return;

        for (size_t i = 0; i < num_context_tokens; ++i) {
            uint32_t tok = context_tokens[i];
            if (tok < vocab_size) {
                float val = logits[tok];
                logits[tok] = (val > 0.0f) ? (val / penalty_factor) : (val * penalty_factor);
            }
        }
    }

    // Penalty 2 & 3: Presence Penalty (flat subtract) & Frequency Penalty (proportional subtract)
    static void apply_presence_and_frequency_penalty(
        float* logits,
        size_t vocab_size,
        const uint32_t* context_tokens,
        size_t num_context_tokens,
        float presence_penalty,
        float frequency_penalty) noexcept {
        if ((presence_penalty == 0.0f && frequency_penalty == 0.0f) || !context_tokens || num_context_tokens == 0) return;

        // Context token histogram (in-place or small linear scan)
        for (size_t i = 0; i < num_context_tokens; ++i) {
            uint32_t tok = context_tokens[i];
            if (tok < vocab_size) {
                // Count occurrences up to this point to apply only once per unique token
                size_t count = 0;
                for (size_t j = 0; j < num_context_tokens; ++j) {
                    if (context_tokens[j] == tok) count++;
                }
                // Check if already processed (first occurrence)
                bool first = true;
                for (size_t j = 0; j < i; ++j) {
                    if (context_tokens[j] == tok) {
                        first = false;
                        break;
                    }
                }
                if (first) {
                    logits[tok] -= presence_penalty;
                    logits[tok] -= (frequency_penalty * static_cast<float>(count));
                }
            }
        }
    }

    // Strict Pipeline Sampler Contract:
    // (1) Copy logits to scratch
    // (2) Repetition Penalty
    // (3) Presence & Frequency Penalty
    // (4) Temperature Scaling (T <= 1e-4 -> Greedy)
    // (5) Top-K Truncation
    // (6) Top-P (Nucleus) Truncation
    // (7) Categorical / CDF Sampling
    static uint32_t sample(
        const float* raw_logits,
        size_t vocab_size,
        const SamplingConfig& config,
        const uint32_t* context_tokens,
        size_t num_context_tokens,
        float* scratch_probs,
        size_t* scratch_indices) noexcept {
        if (vocab_size == 0 || !raw_logits) return 0;

        // 1. Copy raw logits into scratch
        for (size_t i = 0; i < vocab_size; ++i) {
            scratch_probs[i] = raw_logits[i];
            scratch_indices[i] = i;
        }

        // 2. Repetition Penalty
        if (config.repetition_penalty > 1.0f && context_tokens && num_context_tokens > 0) {
            apply_repetition_penalty(
                scratch_probs, vocab_size, context_tokens, num_context_tokens, config.repetition_penalty);
        }

        // 3. Presence & Frequency Penalty
        if ((config.presence_penalty != 0.0f || config.frequency_penalty != 0.0f) && context_tokens && num_context_tokens > 0) {
            apply_presence_and_frequency_penalty(
                scratch_probs, vocab_size, context_tokens, num_context_tokens,
                config.presence_penalty, config.frequency_penalty);
        }

        // 4. Check for Greedy Shortcut
        if (config.temperature <= 1e-4f || config.top_k == 1) {
            return sample_greedy(scratch_probs, vocab_size);
        }

        // 5. Top-K candidates identification
        size_t k = (config.top_k > 0 && static_cast<size_t>(config.top_k) < vocab_size)
                       ? static_cast<size_t>(config.top_k)
                       : vocab_size;

        std::partial_sort(
            scratch_indices,
            scratch_indices + k,
            scratch_indices + vocab_size,
            [&](size_t a, size_t b) { return scratch_probs[a] > scratch_probs[b]; });

        // 6. Temperature scaling & Softmax over top-K candidates
        float max_logit = scratch_probs[scratch_indices[0]] / config.temperature;
        float sum_exp = 0.0f;
        for (size_t i = 0; i < k; ++i) {
            size_t idx = scratch_indices[i];
            float prob = std::exp((scratch_probs[idx] / config.temperature) - max_logit);
            scratch_probs[idx] = prob;
            sum_exp += prob;
        }

        // Normalize
        for (size_t i = 0; i < k; ++i) {
            size_t idx = scratch_indices[i];
            scratch_probs[idx] /= sum_exp;
        }

        // 7. Top-P (Nucleus) Truncation
        size_t p_count = k;
        if (config.top_p > 0.0f && config.top_p < 1.0f) {
            float cumsum = 0.0f;
            for (size_t i = 0; i < k; ++i) {
                size_t idx = scratch_indices[i];
                cumsum += scratch_probs[idx];
                if (cumsum >= config.top_p) {
                    p_count = i + 1;
                    break;
                }
            }
        }

        // Renormalize over truncated Top-P subset
        float p_sum = 0.0f;
        for (size_t i = 0; i < p_count; ++i) {
            p_sum += scratch_probs[scratch_indices[i]];
        }
        if (p_sum <= 0.0f) p_sum = 1.0f;

        // 8. Categorical Sampling with deterministic seed
        std::mt19937_64 rng(config.seed);
        std::uniform_real_distribution<float> dist(0.0f, p_sum);
        float r = dist(rng);

        float accum = 0.0f;
        for (size_t i = 0; i < p_count; ++i) {
            size_t idx = scratch_indices[i];
            accum += scratch_probs[idx];
            if (r <= accum) {
                return static_cast<uint32_t>(idx);
            }
        }

        return static_cast<uint32_t>(scratch_indices[0]);
    }

    // Top-K backward compatibility wrapper
    static uint32_t sample_top_k(
        const float* logits,
        size_t vocab_size,
        size_t top_k,
        float temperature,
        uint32_t seed,
        float* scratch_probs,
        size_t* scratch_indices) noexcept {
        SamplingConfig cfg;
        cfg.temperature = temperature;
        cfg.top_k = static_cast<int32_t>(top_k);
        cfg.top_p = 1.0f;
        cfg.seed = seed;
        return sample(logits, vocab_size, cfg, nullptr, 0, scratch_probs, scratch_indices);
    }
};

} // namespace setun::tensor::nn
