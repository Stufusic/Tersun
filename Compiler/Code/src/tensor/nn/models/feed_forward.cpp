#include "tensor/nn/models/feed_forward.hpp"
#include <cmath>
#include <algorithm>

namespace setun::tensor::nn {

FeedForward::FeedForward(
    std::string name,
    size_t hidden_size,
    size_t intermediate_size,
    bool has_bias)
    : name_(std::move(name)),
      hidden_size_(hidden_size),
      intermediate_size_(intermediate_size),
      gate_proj_(name_ + ".gate_proj", hidden_size, intermediate_size, has_bias),
      up_proj_(name_ + ".up_proj", hidden_size, intermediate_size, has_bias),
      down_proj_(name_ + ".down_proj", intermediate_size, hidden_size, has_bias) {
    update_param_refs();
}

void FeedForward::update_param_refs() {
    param_refs_.clear();
    for (const auto& p : gate_proj_.parameters()) {
        param_refs_.push_back(p);
    }
    for (const auto& p : up_proj_.parameters()) {
        param_refs_.push_back(p);
    }
    for (const auto& p : down_proj_.parameters()) {
        param_refs_.push_back(p);
    }
}

TensorShape FeedForward::output_shape(const TensorShape& in_shape) const {
    return in_shape;
}

Span<const ParameterRef> FeedForward::parameters() const noexcept {
    return Span<const ParameterRef>(param_refs_.data(), param_refs_.size());
}

void FeedForward::init_synthetic(uint32_t seed) {
    gate_proj_.init_synthetic(seed);
    up_proj_.init_synthetic(seed + 101);
    down_proj_.init_synthetic(seed + 202);
    update_param_refs();
}

Status FeedForward::forward(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    size_t total_elements = input.total_elements();
    if (total_elements % hidden_size_ != 0) {
        return Status(StatusCode::DimensionMismatch, "FeedForward: total elements not divisible by hidden_size");
    }

    size_t S = total_elements / hidden_size_;
    size_t inter_elements = S * intermediate_size_;
    size_t inter_bytes = inter_elements * sizeof(float);

    // Allocate gate and up scratch buffers in activation arena
    void* gate_mem = nullptr;
    if (ctx.activation_arena().try_allocate(inter_bytes, 64, &gate_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "FeedForward: gate scratch allocation failed");
    }

    void* up_mem = nullptr;
    if (ctx.activation_arena().try_allocate(inter_bytes, 64, &up_mem) != ArenaStatus::OK) {
        return Status(StatusCode::ArenaBudgetExceeded, "FeedForward: up scratch allocation failed");
    }

    float* gate_buf = static_cast<float*>(gate_mem);
    float* up_buf = static_cast<float*>(up_mem);

    TensorView gate_view(gate_buf, TensorShape(S, intermediate_size_), TensorDType::FLOAT32);
    TensorView up_view(up_buf, TensorShape(S, intermediate_size_), TensorDType::FLOAT32);

    // 1. Compute gate projection
    Status st_gate = gate_proj_.forward(ctx, input, gate_view);
    if (!st_gate.ok()) return st_gate;

    // 2. Compute up projection
    Status st_up = up_proj_.forward(ctx, input, up_view);
    if (!st_up.ok()) return st_up;

    // 3. Fused SquaredReLU(gate) * up in-place into up_buf
    // SquaredReLU(x) = (max(0, x))^2
    for (size_t i = 0; i < inter_elements; ++i) {
        float g = gate_buf[i];
        float relu2_val = (g > 0.0f) ? (g * g) : 0.0f;
        up_buf[i] = relu2_val * up_buf[i];
    }

    // 4. Down projection back to hidden dimension
    Status st_down = down_proj_.forward(ctx, up_view, output);
    return st_down;
}

} // namespace setun::tensor::nn
