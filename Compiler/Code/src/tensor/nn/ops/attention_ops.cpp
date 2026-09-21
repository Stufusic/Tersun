#include "tensor/nn/ops/attention_ops.hpp"
#include "tensor/nn/ops/attention_kernels.hpp"
#include <cmath>
#include <cstring>
#include <algorithm>

namespace setun::tensor::nn {

MultiHeadSelfAttention::MultiHeadSelfAttention(
    std::string name,
    size_t layer_idx,
    size_t hidden_size,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    size_t max_seq_len)
    : name_(std::move(name)),
      layer_idx_(layer_idx),
      hidden_size_(hidden_size),
      num_heads_(num_heads),
      num_kv_heads_(num_kv_heads),
      head_dim_(head_dim),
      gqa_ratio_(num_heads / num_kv_heads),
      scale_(1.0f / std::sqrt(static_cast<float>(head_dim))),
      q_proj_(name_ + ".q_proj", hidden_size, num_heads * head_dim, false),
      k_proj_(name_ + ".k_proj", hidden_size, num_kv_heads * head_dim, false),
      v_proj_(name_ + ".v_proj", hidden_size, num_kv_heads * head_dim, false),
      out_proj_(name_ + ".out_proj", num_heads * head_dim, hidden_size, false),
      rope_(head_dim, max_seq_len) {
    update_param_refs();
}

void MultiHeadSelfAttention::update_param_refs() {
    param_refs_.clear();
    for (const auto& p : q_proj_.parameters()) param_refs_.push_back(p);
    for (const auto& p : k_proj_.parameters()) param_refs_.push_back(p);
    for (const auto& p : v_proj_.parameters()) param_refs_.push_back(p);
    for (const auto& p : out_proj_.parameters()) param_refs_.push_back(p);
}

Span<const ParameterRef> MultiHeadSelfAttention::parameters() const noexcept {
    return Span<const ParameterRef>(param_refs_.data(), param_refs_.size());
}

void MultiHeadSelfAttention::init_synthetic(uint32_t seed) {
    q_proj_.init_synthetic(seed + 1);
    k_proj_.init_synthetic(seed + 2);
    v_proj_.init_synthetic(seed + 3);
    out_proj_.init_synthetic(seed + 4);
    update_param_refs();
}

Status MultiHeadSelfAttention::forward(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    if (ctx.mode() == ExecutionMode::Prefill) {
        return forward_prefill(ctx, input, output);
    }
    return forward_decode(ctx, input, output);
}

Status MultiHeadSelfAttention::forward_prefill(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    size_t S = input.dim(0);
    size_t q_dim = num_heads_ * head_dim_;
    size_t kv_dim = num_kv_heads_ * head_dim_;

    // Allocate scratch buffers from activation arena (Zero intermediate score matrix!)
    size_t q_bytes = S * q_dim * sizeof(float);
    size_t k_bytes = S * kv_dim * sizeof(float);
    size_t v_bytes = S * kv_dim * sizeof(float);
    size_t ctx_bytes = S * q_dim * sizeof(float);
    size_t total_scratch = q_bytes + k_bytes + v_bytes + ctx_bytes;

    void* scratch_mem = nullptr;
    if (ctx.activation_arena().try_allocate(total_scratch, 64, &scratch_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "MultiHeadSelfAttention: prefill activation arena exceeded");
    }

    uint8_t* ptr = static_cast<uint8_t*>(scratch_mem);
    float* q_buf = reinterpret_cast<float*>(ptr); ptr += q_bytes;
    float* k_buf = reinterpret_cast<float*>(ptr); ptr += k_bytes;
    float* v_buf = reinterpret_cast<float*>(ptr); ptr += v_bytes;
    float* context_buf = reinterpret_cast<float*>(ptr);

    // 1. Project Q, K, V
    TensorView q_view(q_buf, TensorShape(S, q_dim), TensorDType::FLOAT32);
    TensorView k_view(k_buf, TensorShape(S, kv_dim), TensorDType::FLOAT32);
    TensorView v_view(v_buf, TensorShape(S, kv_dim), TensorDType::FLOAT32);

    Status st_q = q_proj_.forward(ctx, input, q_view);
    if (!st_q.ok()) return st_q;
    Status st_k = k_proj_.forward(ctx, input, k_view);
    if (!st_k.ok()) return st_k;
    Status st_v = v_proj_.forward(ctx, input, v_view);
    if (!st_v.ok()) return st_v;

    // 2. Apply RoPE at each position
    for (size_t pos = 0; pos < S; ++pos) {
        float* q_token = q_buf + pos * q_dim;
        float* k_token = k_buf + pos * kv_dim;
        rope_.apply_multihead(q_token, num_heads_, head_dim_, pos);
        rope_.apply_multihead(k_token, num_kv_heads_, head_dim_, pos);

        // If KV cache is active, append to persistent state
        if (ctx.kv_cache()) {
            ctx.kv_cache()->append_token_at(layer_idx_, pos, k_token, v_buf + pos * kv_dim);
        }
    }

    // 3. Scaled Dot-Product Attention: Stage A6 GQA Parallel Attention (2D Tiling Bq x Bc)
    ops::AttentionTileConfig tile_cfg{4, 32};
    size_t k_token_stride = num_kv_heads_ * head_dim_;
    size_t v_token_stride = num_kv_heads_ * head_dim_;
    ops::compute_attention_a6_gqa_parallel(
        q_buf, k_buf, v_buf, context_buf,
        S, S, num_heads_, num_kv_heads_, head_dim_, scale_,
        /*is_causal=*/true, k_token_stride, v_token_stride,
        tile_cfg, /*num_threads=*/0,
        /*k_head_stride=*/head_dim_, /*v_head_stride=*/head_dim_);

    // 4. Output Projection
    TensorView ctx_view(context_buf, TensorShape(S, q_dim), TensorDType::FLOAT32);
    Status st_out = out_proj_.forward(ctx, ctx_view, output);

    ctx.reset_workspace();
    return st_out;
}

Status MultiHeadSelfAttention::forward_decode(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    if (!ctx.kv_cache()) {
        return Status(StatusCode::UninitializedState, "Attention decode mode requires active KVCache");
    }

    size_t q_dim = num_heads_ * head_dim_;
    size_t kv_dim = num_kv_heads_ * head_dim_;
    size_t current_pos = ctx.current_step();
    size_t total_len = current_pos + 1;

    size_t q_bytes = q_dim * sizeof(float);
    size_t k_bytes = kv_dim * sizeof(float);
    size_t v_bytes = kv_dim * sizeof(float);
    size_t ctx_bytes = q_dim * sizeof(float);
    size_t total_scratch = q_bytes + k_bytes + v_bytes + ctx_bytes;

    void* scratch_mem = nullptr;
    if (ctx.activation_arena().try_allocate(total_scratch, 64, &scratch_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "MultiHeadSelfAttention: decode activation arena exceeded");
    }

    uint8_t* ptr = static_cast<uint8_t*>(scratch_mem);
    float* q_buf = reinterpret_cast<float*>(ptr); ptr += q_bytes;
    float* k_buf = reinterpret_cast<float*>(ptr); ptr += k_bytes;
    float* v_buf = reinterpret_cast<float*>(ptr); ptr += v_bytes;
    float* context_buf = reinterpret_cast<float*>(ptr);

    // 1. Project Q, K, V for single token
    TensorView q_view(q_buf, TensorShape(1, q_dim), TensorDType::FLOAT32);
    TensorView k_view(k_buf, TensorShape(1, kv_dim), TensorDType::FLOAT32);
    TensorView v_view(v_buf, TensorShape(1, kv_dim), TensorDType::FLOAT32);

    Status st_q = q_proj_.forward(ctx, input, q_view);
    if (!st_q.ok()) return st_q;
    Status st_k = k_proj_.forward(ctx, input, k_view);
    if (!st_k.ok()) return st_k;
    Status st_v = v_proj_.forward(ctx, input, v_view);
    if (!st_v.ok()) return st_v;

    // 2. Apply RoPE at current_pos
    rope_.apply_multihead(q_buf, num_heads_, head_dim_, current_pos);
    rope_.apply_multihead(k_buf, num_kv_heads_, head_dim_, current_pos);

    // 3. Append to KV Cache
    ctx.kv_cache()->append_token_at(layer_idx_, current_pos, k_buf, v_buf);

    // 4. Attend single token Q against all cached KV history [0..current_pos] (Stage A6)
    const float* k_cache = ctx.kv_cache()->layer_k_buffer(layer_idx_);
    const float* v_cache = ctx.kv_cache()->layer_v_buffer(layer_idx_);
    size_t max_s = ctx.kv_cache()->max_seq_len();

    ops::AttentionTileConfig tile_cfg{1, 32};
    ops::compute_attention_a6_gqa_parallel(
        q_buf, k_cache, v_cache, context_buf,
        /*num_queries=*/1, total_len, num_heads_, num_kv_heads_, head_dim_, scale_,
        /*is_causal=*/false, /*k_token_stride=*/head_dim_, /*v_token_stride=*/head_dim_,
        tile_cfg, /*num_threads=*/0,
        /*k_head_stride=*/max_s * head_dim_, /*v_head_stride=*/max_s * head_dim_);

    // 5. Output Projection
    TensorView ctx_view(context_buf, TensorShape(1, q_dim), TensorDType::FLOAT32);
    Status st_out = out_proj_.forward(ctx, ctx_view, output);

    ctx.reset_workspace();
    return st_out;
}

} // namespace setun::tensor::nn
