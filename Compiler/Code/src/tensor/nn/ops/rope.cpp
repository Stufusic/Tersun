#include "tensor/nn/ops/rope.hpp"
#include <cmath>

namespace setun::tensor::nn {

RoPECache::RoPECache(size_t head_dim, size_t max_seq_len, float theta_base)
    : head_dim_(head_dim), max_seq_len_(max_seq_len), theta_base_(theta_base) {
    precompute();
}

void RoPECache::precompute() {
    size_t half_dim = head_dim_ / 2;
    cos_table_.resize(max_seq_len_ * half_dim);
    sin_table_.resize(max_seq_len_ * half_dim);

    for (size_t pos = 0; pos < max_seq_len_; ++pos) {
        for (size_t i = 0; i < half_dim; ++i) {
            float exponent = static_cast<float>(2 * i) / static_cast<float>(head_dim_);
            float theta_i = 1.0f / std::pow(theta_base_, exponent);
            float angle = static_cast<float>(pos) * theta_i;

            cos_table_[pos * half_dim + i] = std::cos(angle);
            sin_table_[pos * half_dim + i] = std::sin(angle);
        }
    }
}

Status RoPECache::apply(float* vec, size_t head_dim, size_t position) const noexcept {
    if (head_dim != head_dim_) {
        return Status(StatusCode::DimensionMismatch, "RoPE: head_dim mismatch with precomputed cache");
    }
    if (position >= max_seq_len_) {
        return Status(StatusCode::IndexOutOfBounds, "RoPE: position exceeds max_seq_len");
    }

    size_t half_dim = head_dim_ / 2;
    const float* cos_row = cos_table_.data() + position * half_dim;
    const float* sin_row = sin_table_.data() + position * half_dim;

    for (size_t i = 0; i < half_dim; ++i) {
        float x0 = vec[2 * i];
        float x1 = vec[2 * i + 1];
        float c = cos_row[i];
        float s = sin_row[i];

        vec[2 * i]     = x0 * c - x1 * s;
        vec[2 * i + 1] = x0 * s + x1 * c;
    }

    return Status::OK();
}

Status RoPECache::apply_multihead(float* heads_data, size_t num_heads, size_t head_dim, size_t position) const noexcept {
    for (size_t h = 0; h < num_heads; ++h) {
        Status st = apply(heads_data + h * head_dim, head_dim, position);
        if (!st.ok()) return st;
    }
    return Status::OK();
}

} // namespace setun::tensor::nn
