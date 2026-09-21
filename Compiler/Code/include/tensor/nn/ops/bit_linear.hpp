#pragma once

#include "tensor/tensor.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/packed_ternary_layout.hpp"
#include "tensor/nn/core/layer.hpp"
#include "tensor/nn/core/parameter_ref.hpp"
#include "runtime/kernel_registry.hpp"
#include <vector>
#include <string>

namespace setun::tensor::nn {

// ============================================================================
// BitLinear W1.58A8 Multiplication-Free Linear Projection Layer
// - Weights: Balanced Ternary {-1, 0, +1}, 2-bit packed
// - Activations: Per-token Absmax Dynamic 8-bit Quantization
// - Compute: Multiplication-free vector adder tree (AVX2/NEON/Scalar)
// ============================================================================
class BitLinear : public Layer {
public:
    BitLinear(
        std::string name,
        size_t in_features,
        size_t out_features,
        bool has_bias = false);

    // Layer metadata
    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "BitLinear"; }
    TensorShape output_shape(const TensorShape& in_shape) const override;
    Span<const ParameterRef> parameters() const noexcept override;

    // Weight accessors & initialization
    Tensor& weight() noexcept { return weight_packed_; }
    const Tensor& weight() const noexcept { return weight_packed_; }
    Tensor& bias() noexcept { return bias_; }
    const Tensor& bias() const noexcept { return bias_; }

    void init_synthetic(uint32_t seed);
    void set_weight_scale(float scale) noexcept { weight_scale_ = scale; }
    float weight_scale() const noexcept { return weight_scale_; }

    // Runtime forward (zero heap allocations)
    Status forward(
        ExecutionContext& ctx,
        const TensorView& input,
        TensorView& output
    ) noexcept override;

private:
    std::string name_;
    size_t in_features_;
    size_t out_features_;
    bool has_bias_;
    float weight_scale_{1.0f};

    // Parameters
    Tensor weight_packed_; // Out x (In / 4)
    Tensor bias_;          // Out (int32)
    std::vector<ParameterRef> param_refs_;

    void update_param_refs();
};

} // namespace setun::tensor::nn
