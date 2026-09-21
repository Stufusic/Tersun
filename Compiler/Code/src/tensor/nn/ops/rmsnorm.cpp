#include "tensor/nn/ops/rmsnorm.hpp"
#include <cmath>

namespace setun::tensor::nn {

RMSNorm::RMSNorm(std::string name, size_t dim, float eps)
    : name_(std::move(name)), dim_(dim), eps_(eps),
      gamma_(TensorShape(dim), TensorDType::FLOAT32) {
    init_constant(1.0f);
}

void RMSNorm::init_constant(float val) {
    float* ptr = static_cast<float*>(gamma_.raw_data());
    for (size_t i = 0; i < dim_; ++i) ptr[i] = val;
    param_refs_.clear();
    param_refs_.emplace_back(name_ + ".weight", gamma_.view(), ParameterRole::RMSNormGamma, false);
}

Span<const ParameterRef> RMSNorm::parameters() const noexcept {
    return Span<const ParameterRef>(param_refs_.data(), param_refs_.size());
}

Status RMSNorm::forward(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    (void)ctx;
    if (input.dim(input.rank() - 1) != dim_) {
        return Status(StatusCode::DimensionMismatch, "RMSNorm: last dimension does not match layer dim");
    }
    if (input.total_elements() != output.total_elements()) {
        return Status(StatusCode::DimensionMismatch, "RMSNorm: input and output total elements mismatch");
    }

    size_t rows = input.total_elements() / dim_;
    const float* in_ptr = static_cast<const float*>(input.raw_data());
    float* out_ptr = static_cast<float*>(output.raw_data());
    const float* g_ptr = static_cast<const float*>(gamma_.raw_data());

    for (size_t r = 0; r < rows; ++r) {
        const float* row_in = in_ptr + r * dim_;
        float* row_out = out_ptr + r * dim_;

        float sum_sq = 0.0f;
        for (size_t i = 0; i < dim_; ++i) {
            sum_sq += row_in[i] * row_in[i];
        }

        float rms = std::sqrt(sum_sq / static_cast<float>(dim_) + eps_);
        float inv_rms = 1.0f / rms;

        for (size_t i = 0; i < dim_; ++i) {
            row_out[i] = (row_in[i] * inv_rms) * g_ptr[i];
        }
    }

    return Status::OK();
}

} // namespace setun::tensor::nn
