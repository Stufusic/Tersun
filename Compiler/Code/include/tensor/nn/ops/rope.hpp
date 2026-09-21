#pragma once

#include "tensor/tensor.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/nn/core/status.hpp"
#include <cstddef>
#include <vector>

namespace setun::tensor::nn {

// ============================================================================
// RoPE: Rotary Position Embedding with Precomputed Sin/Cos Cache
// ============================================================================
class RoPECache {
public:
    RoPECache(size_t head_dim, size_t max_seq_len = 4096, float theta_base = 10000.0f);

    size_t head_dim() const noexcept { return head_dim_; }
    size_t max_seq_len() const noexcept { return max_seq_len_; }

    // Apply rotation in-place or to output vector at specific token position
    Status apply(float* vec, size_t head_dim, size_t position) const noexcept;

    // Apply to multiple heads of shape [num_heads, head_dim] at position
    Status apply_multihead(float* heads_data, size_t num_heads, size_t head_dim, size_t position) const noexcept;

private:
    size_t head_dim_;
    size_t max_seq_len_;
    float theta_base_;
    std::vector<float> cos_table_; // [max_seq_len, head_dim / 2]
    std::vector<float> sin_table_; // [max_seq_len, head_dim / 2]

    void precompute();
};

} // namespace setun::tensor::nn
