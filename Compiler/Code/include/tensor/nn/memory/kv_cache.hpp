#pragma once

#include "tensor/tensor.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/nn/core/status.hpp"
#include <vector>
#include <cstddef>

namespace setun::tensor::nn {

// ============================================================================
// KVCache: Static Persistent Runtime State for Grouped Query Attention (GQA)
// Zero dynamic allocations during inference / token generation
// ============================================================================
class KVCache {
public:
    KVCache(
        size_t num_layers,
        size_t num_kv_heads,
        size_t head_dim,
        size_t max_seq_len);

    size_t num_layers() const noexcept { return num_layers_; }
    size_t num_kv_heads() const noexcept { return num_kv_heads_; }
    size_t head_dim() const noexcept { return head_dim_; }
    size_t max_seq_len() const noexcept { return max_seq_len_; }
    size_t current_seq_len() const noexcept { return current_len_; }

    void reset() noexcept { current_len_ = 0; }
    void set_current_seq_len(size_t len) noexcept { current_len_ = len; }

    // Append K and V for one token at position 'current_len_'
    // k_token, v_token have shape [num_kv_heads, head_dim]
    Status append_token(
        size_t layer_idx,
        const float* k_token,
        const float* v_token) noexcept;

    // Append K and V for one token at explicit position 'pos'
    Status append_token_at(
        size_t layer_idx,
        size_t pos,
        const float* k_token,
        const float* v_token) noexcept;

    // Direct pointers to layer K/V history buffers
    // Layout: [num_kv_heads, max_seq_len, head_dim]
    float* layer_k_buffer(size_t layer_idx) noexcept {
        return k_data_.data() + layer_idx * layer_stride_;
    }
    const float* layer_k_buffer(size_t layer_idx) const noexcept {
        return k_data_.data() + layer_idx * layer_stride_;
    }

    float* layer_v_buffer(size_t layer_idx) noexcept {
        return v_data_.data() + layer_idx * layer_stride_;
    }
    const float* layer_v_buffer(size_t layer_idx) const noexcept {
        return v_data_.data() + layer_idx * layer_stride_;
    }

    size_t total_allocated_bytes() const noexcept {
        return (k_data_.size() + v_data_.size()) * sizeof(float);
    }

private:
    size_t num_layers_;
    size_t num_kv_heads_;
    size_t head_dim_;
    size_t max_seq_len_;
    size_t current_len_{0};

    size_t layer_stride_{0}; // num_kv_heads * max_seq_len * head_dim
    std::vector<float> k_data_;
    std::vector<float> v_data_;
};

} // namespace setun::tensor::nn
