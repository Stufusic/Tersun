#pragma once

#include "tensor/tensor.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/nn/core/layer.hpp"
#include "tensor/nn/ops/bit_linear.hpp"
#include "tensor/nn/ops/rope.hpp"
#include "tensor/nn/ops/softmax.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include <string>
#include <vector>
#include <memory>

namespace setun::tensor::nn {

// ============================================================================
// MultiHeadSelfAttention: Grouped Query Attention (GQA) & RoPE
// Official BitNet-b1.58 Specification (e.g. 20 Q heads, 5 KV heads)
// Full Prefill and Decode Dual-Mode Support with Static KV Cache
// ============================================================================
class MultiHeadSelfAttention : public Layer {
public:
    MultiHeadSelfAttention(
        std::string name,
        size_t layer_idx,
        size_t hidden_size,
        size_t num_heads,
        size_t num_kv_heads,
        size_t head_dim,
        size_t max_seq_len = 4096);

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "MultiHeadSelfAttention"; }
    TensorShape output_shape(const TensorShape& in_shape) const override { return in_shape; }
    Span<const ParameterRef> parameters() const noexcept override;

    void init_synthetic(uint32_t seed);

    BitLinear& q_proj() noexcept { return q_proj_; }
    BitLinear& k_proj() noexcept { return k_proj_; }
    BitLinear& v_proj() noexcept { return v_proj_; }
    BitLinear& out_proj() noexcept { return out_proj_; }

    Status forward(
        ExecutionContext& ctx,
        const TensorView& input,
        TensorView& output
    ) noexcept override;

private:
    std::string name_;
    size_t layer_idx_;
    size_t hidden_size_;
    size_t num_heads_;
    size_t num_kv_heads_;
    size_t head_dim_;
    size_t gqa_ratio_;
    float scale_;

    // Ternary projections
    BitLinear q_proj_;
    BitLinear k_proj_;
    BitLinear v_proj_;
    BitLinear out_proj_;

    RoPECache rope_;
    std::vector<ParameterRef> param_refs_;

    void update_param_refs();

    Status forward_prefill(
        ExecutionContext& ctx,
        const TensorView& input,
        TensorView& output
    ) noexcept;

    Status forward_decode(
        ExecutionContext& ctx,
        const TensorView& input,
        TensorView& output
    ) noexcept;
};

} // namespace setun::tensor::nn
