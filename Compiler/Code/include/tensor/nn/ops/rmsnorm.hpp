#pragma once

#include "tensor/tensor.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/nn/core/layer.hpp"
#include "tensor/nn/core/parameter_ref.hpp"
#include <string>
#include <vector>

namespace setun::tensor::nn {

// ============================================================================
// RMSNorm: Root Mean Square Layer Normalization (BitNet SubLN / LLaMA-style)
// y = (x / sqrt(mean(x^2) + eps)) * gamma
// ============================================================================
class RMSNorm : public Layer {
public:
    RMSNorm(std::string name, size_t dim, float eps = 1e-6f);

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "RMSNorm"; }
    TensorShape output_shape(const TensorShape& in_shape) const override { return in_shape; }
    Span<const ParameterRef> parameters() const noexcept override;

    Tensor& gamma() noexcept { return gamma_; }
    const Tensor& gamma() const noexcept { return gamma_; }

    void init_constant(float val = 1.0f);

    Status forward(
        ExecutionContext& ctx,
        const TensorView& input,
        TensorView& output
    ) noexcept override;

private:
    std::string name_;
    size_t dim_;
    float eps_;
    Tensor gamma_; // Dim (Float32)
    std::vector<ParameterRef> param_refs_;
};

} // namespace setun::tensor::nn
