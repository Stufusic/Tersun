#include "tensor/nn/runtime/inference_session.hpp"
#include <cstring>
#include <iostream>

namespace setun::tensor::nn {

InferenceSession::InferenceSession(
    BitNetModel& model,
    const ModelManifest& manifest,
    size_t max_seq_len,
    size_t arena_bytes)
    : model_(model),
      manifest_(manifest),
      max_seq_len_(max_seq_len),
      kv_cache_(manifest.num_hidden_layers, manifest.num_key_value_heads, manifest.head_dim, max_seq_len),
      activation_arena_(arena_bytes),
      workspace_arena_(arena_bytes),
      ctx_(activation_arena_, workspace_arena_, &kv_cache_, ExecutionMode::Prefill),
      current_step_(0),
      logits_buffer_(manifest.vocab_size, 0.0f),
      scratch_probs_(manifest.vocab_size, 0.0f),
      scratch_indices_(manifest.vocab_size, 0) {
    context_history_.reserve(max_seq_len_);

    // Register default stop tokens from manifest
    for (uint32_t eos : manifest_.eos_token_ids) {
        stop_matcher_.add_stop_token_id(eos);
    }
}

void InferenceSession::reset() noexcept {
    kv_cache_.reset();
    activation_arena_.reset();
    workspace_arena_.reset();
    context_history_.clear();
    current_step_ = 0;
}

Status InferenceSession::prefill(
    Span<const uint32_t> prompt_tokens,
    uint32_t& out_first_token,
    const SamplingConfig& sampling_cfg) noexcept {
    if (prompt_tokens.empty()) {
        return Status(StatusCode::InvalidInput, "InferenceSession: prompt tokens cannot be empty");
    }
    if (prompt_tokens.size() >= max_seq_len_) {
        return Status(StatusCode::IndexOutOfBounds, "InferenceSession: prompt exceeds max sequence length");
    }

    reset();

    size_t S = prompt_tokens.size();
    ctx_.set_mode(ExecutionMode::Prefill);
    ctx_.set_sequence_length(S);
    ctx_.reset_activation_arena();
    ctx_.reset_workspace();

    TensorView logits_v(logits_buffer_.data(), TensorShape(1, manifest_.vocab_size), TensorDType::FLOAT32);

    Status st = model_.forward(ctx_, prompt_tokens.data(), S, logits_v);
    if (!st.ok()) return st;

    // Update history
    for (size_t i = 0; i < S; ++i) {
        context_history_.push_back(prompt_tokens[i]);
    }
    kv_cache_.set_current_seq_len(S);
    current_step_ = S;

    // Sample first token following prompt
    out_first_token = Sampler::sample(
        logits_buffer_.data(),
        manifest_.vocab_size,
        sampling_cfg,
        context_history_.data(),
        context_history_.size(),
        scratch_probs_.data(),
        scratch_indices_.data()
    );

    return Status::OK();
}

Status InferenceSession::decode_step(
    uint32_t input_token,
    uint32_t& out_next_token,
    const SamplingConfig& sampling_cfg) noexcept {
    if (current_step_ >= max_seq_len_) {
        return Status(StatusCode::IndexOutOfBounds, "InferenceSession: decode step exceeds max sequence length");
    }

    ctx_.set_mode(ExecutionMode::Decode);
    ctx_.set_current_step(current_step_);
    ctx_.reset_activation_arena();
    ctx_.reset_workspace();

    TensorView logits_v(logits_buffer_.data(), TensorShape(1, manifest_.vocab_size), TensorDType::FLOAT32);

    Status st = model_.forward_decode_step(ctx_, input_token, current_step_, logits_v);
    if (!st.ok()) return st;

    // Append input token to history and advance step
    context_history_.push_back(input_token);
    current_step_++;
    kv_cache_.set_current_seq_len(current_step_);

    // Sample next token
    out_next_token = Sampler::sample(
        logits_buffer_.data(),
        manifest_.vocab_size,
        sampling_cfg,
        context_history_.data(),
        context_history_.size(),
        scratch_probs_.data(),
        scratch_indices_.data()
    );

    return Status::OK();
}

Status InferenceSession::generate(
    Span<const uint32_t> prompt_tokens,
    const SamplingConfig& sampling_cfg,
    size_t max_new_tokens,
    const ITokenizer* tokenizer,
    TokenCallback callback) {
    uint32_t next_tok = 0;
    Status st_pref = prefill(prompt_tokens, next_tok, sampling_cfg);
    if (!st_pref.ok()) return st_pref;

    std::vector<uint32_t> generated;
    generated.reserve(max_new_tokens);
    generated.push_back(next_tok);

    if (callback) {
        std::string_view piece = tokenizer ? tokenizer->token_to_piece(next_tok) : "";
        if (!callback(next_tok, piece)) {
            return Status::OK();
        }
    }

    size_t matched_len = 0;
    if (stop_matcher_.should_stop(Span<const uint32_t>(generated.data(), generated.size()), matched_len)) {
        return Status::OK();
    }

    for (size_t i = 1; i < max_new_tokens; ++i) {
        uint32_t gen_tok = 0;
        Status st_dec = decode_step(next_tok, gen_tok, sampling_cfg);
        if (!st_dec.ok()) return st_dec;

        next_tok = gen_tok;
        generated.push_back(next_tok);

        if (callback) {
            std::string_view piece = tokenizer ? tokenizer->token_to_piece(next_tok) : "";
            if (!callback(next_tok, piece)) {
                break;
            }
        }

        if (stop_matcher_.should_stop(Span<const uint32_t>(generated.data(), generated.size()), matched_len)) {
            break;
        }
    }

    return Status::OK();
}

} // namespace setun::tensor::nn
