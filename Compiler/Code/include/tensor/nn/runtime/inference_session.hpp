#pragma once

#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/format/model_manifest.hpp"
#include "tensor/nn/format/tokenizer.hpp"
#include "tensor/nn/runtime/sampler.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/nn/memory/execution_context.hpp"
#include "tensor/edge_arena.hpp"
#include "tensor/nn/core/span.hpp"
#include "tensor/nn/core/status.hpp"
#include <vector>
#include <cstdint>
#include <functional>
#include <memory>

namespace setun::tensor::nn {

// Callback returning false requests early generation abort
using TokenCallback = std::function<bool(uint32_t token_id, std::string_view piece)>;

// ============================================================================
// InferenceSession: Primary LLM Runtime State Holder
// Owns persistent KVCache, Memory Arenas, ExecutionContext, and Token History.
// Guarantees zero heap allocation in both Prefill and Autoregressive Decode.
// ============================================================================
class InferenceSession {
public:
    InferenceSession(
        BitNetModel& model,
        const ModelManifest& manifest,
        size_t max_seq_len = 4096,
        size_t arena_bytes = 64 * 1024 * 1024);

    ~InferenceSession() = default;

    // Reset session state (clears KV Cache and history for a new conversation)
    void reset() noexcept;

    // Single Prefill Pass: processes prompt tokens [S] into KV Cache and returns first token
    Status prefill(
        Span<const uint32_t> prompt_tokens,
        uint32_t& out_first_token,
        const SamplingConfig& sampling_cfg) noexcept;

    // Single Decode Step: evaluates input_token at current_step and outputs next_token
    Status decode_step(
        uint32_t input_token,
        uint32_t& out_next_token,
        const SamplingConfig& sampling_cfg) noexcept;

    // Full Autoregressive Generation: Prefill + Decode Loop with Token Streaming
    Status generate(
        Span<const uint32_t> prompt_tokens,
        const SamplingConfig& sampling_cfg,
        size_t max_new_tokens,
        const ITokenizer* tokenizer = nullptr,
        TokenCallback callback = nullptr);

    // Stop Matcher access
    StopMatcher& stop_matcher() noexcept { return stop_matcher_; }
    const StopMatcher& stop_matcher() const noexcept { return stop_matcher_; }

    // State Inspection
    const KVCache& kv_cache() const noexcept { return kv_cache_; }
    size_t current_step() const noexcept { return current_step_; }
    Span<const uint32_t> context_history() const noexcept {
        return Span<const uint32_t>(context_history_.data(), context_history_.size());
    }

private:
    BitNetModel& model_;
    const ModelManifest& manifest_;
    size_t max_seq_len_;

    KVCache kv_cache_;
    EdgeArena activation_arena_;
    EdgeArena workspace_arena_;
    ExecutionContext ctx_;

    std::vector<uint32_t> context_history_;
    size_t current_step_{0};

    // Preallocated buffers for zero-allocation sampling
    std::vector<float> logits_buffer_;
    std::vector<float> scratch_probs_;
    std::vector<size_t> scratch_indices_;

    StopMatcher stop_matcher_;
};

} // namespace setun::tensor::nn
