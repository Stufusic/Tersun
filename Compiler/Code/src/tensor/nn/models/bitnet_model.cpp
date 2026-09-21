#include "tensor/nn/models/bitnet_model.hpp"
#include <random>
#include <cstring>

namespace setun::tensor::nn {

BitNetModel::BitNetModel(const BitNetConfig& config)
    : config_(config),
      embed_tokens_(TensorShape(config.vocab_size, config.hidden_size), TensorDType::FLOAT32),
      norm_("model.norm", config.hidden_size, config.rms_norm_eps),
      lm_head_("lm_head", config.hidden_size, config.vocab_size, false) {
    layers_.reserve(config.num_hidden_layers);
    for (size_t i = 0; i < config.num_hidden_layers; ++i) {
        std::string layer_name = "model.layers." + std::to_string(i);
        layers_.push_back(std::make_unique<DecoderBlock>(
            layer_name,
            i,
            config.hidden_size,
            config.num_attention_heads,
            config.num_key_value_heads,
            config.head_dim,
            config.intermediate_size,
            config.max_position_embeddings,
            config.rms_norm_eps
        ));
    }
    update_param_refs();
}

void BitNetModel::update_param_refs() {
    param_refs_.clear();
    param_refs_.emplace_back("model.embed_tokens.weight", embed_tokens_.view(), ParameterRole::EmbeddingTable, false);
    for (const auto& layer : layers_) {
        for (const auto& p : layer->parameters()) {
            param_refs_.push_back(p);
        }
    }
    for (const auto& p : norm_.parameters()) {
        param_refs_.push_back(p);
    }
    for (const auto& p : lm_head_.parameters()) {
        param_refs_.push_back(p);
    }
}

Span<const ParameterRef> BitNetModel::parameters() const noexcept {
    return Span<const ParameterRef>(param_refs_.data(), param_refs_.size());
}

void BitNetModel::init_synthetic(uint32_t seed) {
    std::mt19937 rng(seed);
    std::normal_distribution<float> dist(0.0f, 0.02f);
    float* emb_ptr = static_cast<float*>(embed_tokens_.raw_data());
    size_t total_emb = embed_tokens_.total_elements();
    for (size_t i = 0; i < total_emb; ++i) {
        emb_ptr[i] = dist(rng);
    }

    norm_.init_constant(1.0f);
    lm_head_.init_synthetic(seed + 1000);

    for (size_t i = 0; i < layers_.size(); ++i) {
        layers_[i]->init_synthetic(seed + 100 + static_cast<uint32_t>(i * 50));
    }
    update_param_refs();
}

Status BitNetModel::forward(
    ExecutionContext& ctx,
    const uint32_t* token_ids,
    size_t num_tokens,
    TensorView& logits
) noexcept {
    if (num_tokens == 0 || num_tokens > config_.max_position_embeddings) {
        return Status(StatusCode::IndexOutOfBounds, "BitNetModel: invalid sequence length");
    }

    ctx.set_mode(ExecutionMode::Prefill);
    ctx.set_sequence_length(num_tokens);

    size_t S = num_tokens;
    size_t D = config_.hidden_size;
    size_t bytes_per_seq = S * D * sizeof(float);

    // Allocate ping-pong buffers and norm buffer in activation arena
    void* act0_mem = nullptr;
    if (ctx.activation_arena().try_allocate(bytes_per_seq, 64, &act0_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "BitNetModel: act0 allocation failed");
    }

    void* act1_mem = nullptr;
    if (ctx.activation_arena().try_allocate(bytes_per_seq, 64, &act1_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "BitNetModel: act1 allocation failed");
    }

    void* norm_mem = nullptr;
    if (ctx.activation_arena().try_allocate(bytes_per_seq, 64, &norm_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "BitNetModel: norm buffer allocation failed");
    }

    float* act0 = static_cast<float*>(act0_mem);
    float* act1 = static_cast<float*>(act1_mem);
    float* norm_buf = static_cast<float*>(norm_mem);

    // 1. Embedding lookup
    const float* emb_table = static_cast<const float*>(embed_tokens_.raw_data());
    for (size_t t = 0; t < S; ++t) {
        uint32_t tok = token_ids[t];
        if (tok >= config_.vocab_size) tok = 0;
        const float* src = emb_table + tok * D;
        float* dst = act0 + t * D;
        std::memcpy(dst, src, D * sizeof(float));
    }

    // 2. Pass through Decoder Blocks (ping-pong)
    float* cur_in_ptr = act0;
    float* cur_out_ptr = act1;

    for (size_t i = 0; i < layers_.size(); ++i) {
        TensorView in_v(cur_in_ptr, TensorShape(S, D), TensorDType::FLOAT32);
        TensorView out_v(cur_out_ptr, TensorShape(S, D), TensorDType::FLOAT32);
        Status st = layers_[i]->forward(ctx, in_v, out_v);
        if (!st.ok()) return st;
        std::swap(cur_in_ptr, cur_out_ptr);
    }

    // 3. Final RMSNorm
    TensorView last_in_v(cur_in_ptr, TensorShape(S, D), TensorDType::FLOAT32);
    TensorView norm_v(norm_buf, TensorShape(S, D), TensorDType::FLOAT32);
    Status st_norm = norm_.forward(ctx, last_in_v, norm_v);
    if (!st_norm.ok()) return st_norm;

    // 4. LM Head Projection
    // If logits is shape [1, Vocab], project only the last token
    if (logits.dim(0) == 1) {
        TensorView last_token_v(norm_buf + (S - 1) * D, TensorShape(1, D), TensorDType::FLOAT32);
        return lm_head_.forward(ctx, last_token_v, logits);
    } else {
        return lm_head_.forward(ctx, norm_v, logits);
    }
}

Status BitNetModel::forward_decode_step(
    ExecutionContext& ctx,
    uint32_t token_id,
    size_t step,
    TensorView& logits
) noexcept {
    if (step >= config_.max_position_embeddings) {
        return Status(StatusCode::IndexOutOfBounds, "BitNetModel: step exceeds max sequence length");
    }

    ctx.set_mode(ExecutionMode::Decode);
    ctx.set_current_step(step);

    size_t D = config_.hidden_size;
    size_t bytes_token = D * sizeof(float);

    // Allocate ping-pong buffers and norm buffer for 1 token in activation arena
    void* act0_mem = nullptr;
    if (ctx.activation_arena().try_allocate(bytes_token, 64, &act0_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "BitNetModel: decode act0 allocation failed");
    }

    void* act1_mem = nullptr;
    if (ctx.activation_arena().try_allocate(bytes_token, 64, &act1_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "BitNetModel: decode act1 allocation failed");
    }

    void* norm_mem = nullptr;
    if (ctx.activation_arena().try_allocate(bytes_token, 64, &norm_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "BitNetModel: decode norm allocation failed");
    }

    float* act0 = static_cast<float*>(act0_mem);
    float* act1 = static_cast<float*>(act1_mem);
    float* norm_buf = static_cast<float*>(norm_mem);

    // 1. Embedding lookup for single token
    const float* emb_table = static_cast<const float*>(embed_tokens_.raw_data());
    uint32_t tok = token_id;
    if (tok >= config_.vocab_size) tok = 0;
    std::memcpy(act0, emb_table + tok * D, D * sizeof(float));

    // 2. Decoder blocks
    float* cur_in_ptr = act0;
    float* cur_out_ptr = act1;

    for (size_t i = 0; i < layers_.size(); ++i) {
        TensorView in_v(cur_in_ptr, TensorShape(1, D), TensorDType::FLOAT32);
        TensorView out_v(cur_out_ptr, TensorShape(1, D), TensorDType::FLOAT32);
        Status st = layers_[i]->forward(ctx, in_v, out_v);
        if (!st.ok()) return st;
        std::swap(cur_in_ptr, cur_out_ptr);
    }

    // 3. Final RMSNorm
    TensorView last_in_v(cur_in_ptr, TensorShape(1, D), TensorDType::FLOAT32);
    TensorView norm_v(norm_buf, TensorShape(1, D), TensorDType::FLOAT32);
    Status st_norm = norm_.forward(ctx, last_in_v, norm_v);
    if (!st_norm.ok()) return st_norm;

    // 4. LM Head Projection
    return lm_head_.forward(ctx, norm_v, logits);
}

} // namespace setun::tensor::nn
