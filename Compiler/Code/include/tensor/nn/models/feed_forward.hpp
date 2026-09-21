#pragma once

#include "tensor/nn/core/layer.hpp"
#include "tensor/nn/ops/bit_linear.hpp"
#include <string>
#include <vector>

namespace setun::tensor::nn {

// ============================================================================
// FeedForward (MLP) for Microsoft BitNet-b1.58
// Architecture:
//   gate = BitLinear(hidden_size, intermediate_size)
//   up   = BitLinear(hidden_size, intermediate_size)
//   act  = SquaredReLU(gate) * up
//   out  = BitLinear(intermediate_size, hidden_size)
// Zero-allocation forward pass in both Prefill and Decode modes.
// ============================================================================
class FeedForward : public Layer {
public:
    FeedForward(
        std::string name,
        size_t hidden_size,
        size_t intermediate_size,
        bool has_bias = false);

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "FeedForward"; }
    TensorShape output_shape(const TensorShape& in_shape) const override;
    Span<const ParameterRef> parameters() const noexcept override;

    Status forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept override;

    // Weight initializers for synthetic testing
    void init_synthetic(uint32_t seed);

    BitLinear& gate_proj() noexcept { return gate_proj_; }
    BitLinear& up_proj() noexcept { return up_proj_; }
    BitLinear& down_proj() noexcept { return down_proj_; }

private:
    std::string name_;
    size_t hidden_size_;
    size_t intermediate_size_;

    BitLinear gate_proj_;
    BitLinear up_proj_;
    BitLinear down_proj_;

    std::vector<ParameterRef> param_refs_;
    void update_param_refs();
};

} // namespace setun::tensor::nn
