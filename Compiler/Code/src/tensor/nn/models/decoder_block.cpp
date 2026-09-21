#include "tensor/nn/models/decoder_block.hpp"

namespace setun::tensor::nn {

DecoderBlock::DecoderBlock(
    std::string name,
    size_t layer_idx,
    size_t hidden_size,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    size_t intermediate_size,
    size_t max_seq_len,
    float rms_norm_eps)
    : name_(std::move(name)),
      layer_idx_(layer_idx),
      hidden_size_(hidden_size),
      intermediate_size_(intermediate_size),
      input_layernorm_(name_ + ".input_layernorm", hidden_size, rms_norm_eps),
      self_attn_(name_ + ".self_attn", layer_idx, hidden_size, num_heads, num_kv_heads, head_dim, max_seq_len),
      post_attention_layernorm_(name_ + ".post_attention_layernorm", hidden_size, rms_norm_eps),
      mlp_(name_ + ".mlp", hidden_size, intermediate_size, false) {
    update_param_refs();
}

void DecoderBlock::update_param_refs() {
    param_refs_.clear();
    for (const auto& p : input_layernorm_.parameters()) {
        param_refs_.push_back(p);
    }
    for (const auto& p : self_attn_.parameters()) {
        param_refs_.push_back(p);
    }
    for (const auto& p : post_attention_layernorm_.parameters()) {
        param_refs_.push_back(p);
    }
    for (const auto& p : mlp_.parameters()) {
        param_refs_.push_back(p);
    }
}

TensorShape DecoderBlock::output_shape(const TensorShape& in_shape) const {
    return in_shape;
}

Span<const ParameterRef> DecoderBlock::parameters() const noexcept {
    return Span<const ParameterRef>(param_refs_.data(), param_refs_.size());
}

void DecoderBlock::init_synthetic(uint32_t seed) {
    input_layernorm_.init_constant(1.0f);
    self_attn_.init_synthetic(seed + 100);
    post_attention_layernorm_.init_constant(1.0f);
    mlp_.init_synthetic(seed + 300);
    update_param_refs();
}

Status DecoderBlock::forward(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    size_t total_elements = input.total_elements();
    if (total_elements % hidden_size_ != 0) {
        return Status(StatusCode::DimensionMismatch, "DecoderBlock: total elements not divisible by hidden_size");
    }
    if (total_elements != output.total_elements()) {
        return Status(StatusCode::DimensionMismatch, "DecoderBlock: input and output total elements mismatch");
    }

    size_t S = total_elements / hidden_size_;
    size_t h_bytes = total_elements * sizeof(float);

    // Scratch buffers for branch execution
    void* norm1_mem = nullptr;
    if (ctx.activation_arena().try_allocate(h_bytes, 64, &norm1_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "DecoderBlock: norm1 scratch allocation failed");
    }

    void* attn_mem = nullptr;
    if (ctx.activation_arena().try_allocate(h_bytes, 64, &attn_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "DecoderBlock: attn scratch allocation failed");
    }

    void* norm2_mem = nullptr;
    if (ctx.activation_arena().try_allocate(h_bytes, 64, &norm2_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "DecoderBlock: norm2 scratch allocation failed");
    }

    void* mlp_mem = nullptr;
    if (ctx.activation_arena().try_allocate(h_bytes, 64, &mlp_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "DecoderBlock: mlp scratch allocation failed");
    }

    float* norm1_buf = static_cast<float*>(norm1_mem);
    float* attn_buf = static_cast<float*>(attn_mem);
    float* norm2_buf = static_cast<float*>(norm2_mem);
    float* mlp_buf = static_cast<float*>(mlp_mem);

    TensorView norm1_view(norm1_buf, TensorShape(S, hidden_size_), TensorDType::FLOAT32);
    TensorView attn_view(attn_buf, TensorShape(S, hidden_size_), TensorDType::FLOAT32);
    TensorView norm2_view(norm2_buf, TensorShape(S, hidden_size_), TensorDType::FLOAT32);
    TensorView mlp_view(mlp_buf, TensorShape(S, hidden_size_), TensorDType::FLOAT32);

    const float* in_ptr = static_cast<const float*>(input.raw_data());
    float* out_ptr = static_cast<float*>(output.raw_data());

    // 1. Attention branch: input_layernorm -> self_attn
    Status st_norm1 = input_layernorm_.forward(ctx, input, norm1_view);
    if (!st_norm1.ok()) return st_norm1;

    Status st_attn = self_attn_.forward(ctx, norm1_view, attn_view);
    if (!st_attn.ok()) return st_attn;

    // 2. Residual Connection 1: output = input + attn_output
    for (size_t i = 0; i < total_elements; ++i) {
        out_ptr[i] = in_ptr[i] + attn_buf[i];
    }

    // 3. FFN branch: post_attention_layernorm -> mlp
    Status st_norm2 = post_attention_layernorm_.forward(ctx, output, norm2_view);
    if (!st_norm2.ok()) return st_norm2;

    Status st_mlp = mlp_.forward(ctx, norm2_view, mlp_view);
    if (!st_mlp.ok()) return st_mlp;

    // 4. Residual Connection 2: output = output + mlp_output
    for (size_t i = 0; i < total_elements; ++i) {
        out_ptr[i] += mlp_buf[i];
    }

    return Status::OK();
}

} // namespace setun::tensor::nn
