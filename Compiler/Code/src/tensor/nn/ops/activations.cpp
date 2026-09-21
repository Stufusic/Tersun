#include "tensor/nn/ops/activations.hpp"
#include <cmath>
#include <algorithm>

namespace setun::tensor::nn {

Status SquaredReLU::forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept {
    (void)ctx;
    size_t count = input.total_elements();
    if (count != output.total_elements()) {
        return Status(StatusCode::DimensionMismatch, "SquaredReLU: element counts mismatch");
    }

    const float* in_ptr = static_cast<const float*>(input.raw_data());
    float* out_ptr = static_cast<float*>(output.raw_data());

    for (size_t i = 0; i < count; ++i) {
        float v = in_ptr[i];
        if (v <= 0.0f) {
            out_ptr[i] = 0.0f;
        } else {
            out_ptr[i] = v * v;
        }
    }
    return Status::OK();
}

Status ReLU::forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept {
    (void)ctx;
    size_t count = input.total_elements();
    if (count != output.total_elements()) {
        return Status(StatusCode::DimensionMismatch, "ReLU: element counts mismatch");
    }

    const float* in_ptr = static_cast<const float*>(input.raw_data());
    float* out_ptr = static_cast<float*>(output.raw_data());

    for (size_t i = 0; i < count; ++i) {
        out_ptr[i] = std::max(0.0f, in_ptr[i]);
    }
    return Status::OK();
}

Status SiLU::forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept {
    (void)ctx;
    size_t count = input.total_elements();
    if (count != output.total_elements()) {
        return Status(StatusCode::DimensionMismatch, "SiLU: element counts mismatch");
    }

    const float* in_ptr = static_cast<const float*>(input.raw_data());
    float* out_ptr = static_cast<float*>(output.raw_data());

    for (size_t i = 0; i < count; ++i) {
        float x = in_ptr[i];
        out_ptr[i] = x / (1.0f + std::exp(-x));
    }
    return Status::OK();
}

Status TernaryThreshold::forward(ExecutionContext& ctx, const TensorView& input, TensorView& output) noexcept {
    (void)ctx;
    size_t count = input.total_elements();
    if (count != output.total_elements()) {
        return Status(StatusCode::DimensionMismatch, "TernaryThreshold: element counts mismatch");
    }

    const float* in_ptr = static_cast<const float*>(input.raw_data());
    float* out_ptr = static_cast<float*>(output.raw_data());

    for (size_t i = 0; i < count; ++i) {
        float x = in_ptr[i];
        if (x >= theta_pos_) out_ptr[i] = 1.0f;
        else if (x <= theta_neg_) out_ptr[i] = -1.0f;
        else out_ptr[i] = 0.0f;
    }
    return Status::OK();
}

} // namespace setun::tensor::nn
