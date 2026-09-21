#pragma once

#include "tensor/nn/core/layer.hpp"
#include <string>

namespace setun::tensor::nn {

// ============================================================================
// Squared ReLU Activation Layer: f(x) = (max(0, x))^2
// Official BitNet-b1.58-2B-4T FFN non-linearity
// ============================================================================
class SquaredReLU : public Layer {
public:
    SquaredReLU(std::string name = "relu2") : name_(std::move(name)) {}

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "SquaredReLU"; }
    TensorShape output_shape(const TensorShape& in_shape) const override { return in_shape; }
    Span<const ParameterRef> parameters() const noexcept override { return {}; }

    Status forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept override;

private:
    std::string name_;
};

// ============================================================================
// Standard ReLU Activation Layer: f(x) = max(0, x)
// ============================================================================
class ReLU : public Layer {
public:
    ReLU(std::string name = "relu") : name_(std::move(name)) {}

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "ReLU"; }
    TensorShape output_shape(const TensorShape& in_shape) const override { return in_shape; }
    Span<const ParameterRef> parameters() const noexcept override { return {}; }

    Status forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept override;

private:
    std::string name_;
};

// ============================================================================
// SiLU (Swish) Activation Layer: f(x) = x * sigmoid(x)
// ============================================================================
class SiLU : public Layer {
public:
    SiLU(std::string name = "silu") : name_(std::move(name)) {}

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "SiLU"; }
    TensorShape output_shape(const TensorShape& in_shape) const override { return in_shape; }
    Span<const ParameterRef> parameters() const noexcept override { return {}; }

    Status forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept override;

private:
    std::string name_;
};

// ============================================================================
// Discrete Ternary Sign / Threshold Activation Layer
// ============================================================================
class TernaryThreshold : public Layer {
public:
    TernaryThreshold(std::string name = "ternary_sign", float theta_pos = 0.5f, float theta_neg = -0.5f)
        : name_(std::move(name)), theta_pos_(theta_pos), theta_neg_(theta_neg) {}

    std::string_view name() const noexcept override { return name_; }
    std::string_view type() const noexcept override { return "TernaryThreshold"; }
    TensorShape output_shape(const TensorShape& in_shape) const override { return in_shape; }
    Span<const ParameterRef> parameters() const noexcept override { return {}; }

    Status forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept override;

private:
    std::string name_;
    float theta_pos_;
    float theta_neg_;
};

} // namespace setun::tensor::nn
