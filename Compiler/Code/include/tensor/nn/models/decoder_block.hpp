#pragma once

#include "tensor/nn/core/layer.hpp"
#include "tensor/nn/ops/rmsnorm.hpp"
#include "tensor/nn/ops/attention_ops.hpp"
#include "tensor/nn/models/feed_forward.hpp"
#include <string>
#include <vector>

namespace setun::tensor::nn {

// ============================================================================
// DecoderBlock: Canonical Transformer Decoder Block for Microsoft BitNet-b1.58
// Dataflow:
//   h1 = input + SelfAttention(input_layernorm(input))
//   out = h1 + MLP(post_attention_layernorm(h1))
// Zero-allocation forward pass across both Prefill and Decode modes.
// ============================================================================
class DecoderBlock : public Layer {
public:
    DecoderBlock(
        std::string name,
        size_t layer_idx,
        size_t hidden_size,
        size_t num_heads,
        size_t num_kv_heads,
        size_t head_dim,
        size_t intermediate_size,
        size_t max_seq_len = 4096,
        float rms_norm_eps = 1e-5f);

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "DecoderBlock"; }
    TensorShape output_shape(const TensorShape& in_shape) const override;
    Span<const ParameterRef> parameters() const noexcept override;

    Status forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept override;

    // Weight initializers for synthetic testing
    void init_synthetic(uint32_t seed);

    RMSNorm& input_layernorm() noexcept { return input_layernorm_; }
    MultiHeadSelfAttention& self_attn() noexcept { return self_attn_; }
    RMSNorm& post_attention_layernorm() noexcept { return post_attention_layernorm_; }
    FeedForward& mlp() noexcept { return mlp_; }

    size_t layer_idx() const noexcept { return layer_idx_; }
    size_t hidden_size() const noexcept { return hidden_size_; }

private:
    std::string name_;
    size_t layer_idx_;
    size_t hidden_size_;
    size_t intermediate_size_;

    RMSNorm input_layernorm_;
    MultiHeadSelfAttention self_attn_;
    RMSNorm post_attention_layernorm_;
    FeedForward mlp_;

    std::vector<ParameterRef> param_refs_;
    void update_param_refs();
};

} // namespace setun::tensor::nn
