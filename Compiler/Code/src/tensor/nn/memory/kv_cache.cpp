#include "tensor/nn/memory/kv_cache.hpp"
#include <cstring>

namespace setun::tensor::nn {

KVCache::KVCache(
    size_t num_layers,
    size_t num_kv_heads,
    size_t head_dim,
    size_t max_seq_len)
    : num_layers_(num_layers),
      num_kv_heads_(num_kv_heads),
      head_dim_(head_dim),
      max_seq_len_(max_seq_len),
      current_len_(0) {
    layer_stride_ = num_kv_heads_ * max_seq_len_ * head_dim_;
    size_t total_elements = num_layers_ * layer_stride_;
    k_data_.assign(total_elements, 0.0f);
    v_data_.assign(total_elements, 0.0f);
}

Status KVCache::append_token_at(
    size_t layer_idx,
    size_t pos,
    const float* k_token,
    const float* v_token) noexcept {
    if (layer_idx >= num_layers_) {
        return Status(StatusCode::IndexOutOfBounds, "KVCache: layer_idx out of range");
    }
    if (pos >= max_seq_len_) {
        return Status(StatusCode::IndexOutOfBounds, "KVCache: sequence length exceeds max_seq_len");
    }

    float* k_layer = layer_k_buffer(layer_idx);
    float* v_layer = layer_v_buffer(layer_idx);

    for (size_t h = 0; h < num_kv_heads_; ++h) {
        size_t head_offset = (h * max_seq_len_ + pos) * head_dim_;
        std::memcpy(k_layer + head_offset, k_token + h * head_dim_, head_dim_ * sizeof(float));
        std::memcpy(v_layer + head_offset, v_token + h * head_dim_, head_dim_ * sizeof(float));
    }

    if (pos + 1 > current_len_) {
        current_len_ = pos + 1;
    }
    return Status::OK();
}

Status KVCache::append_token(
    size_t layer_idx,
    const float* k_token,
    const float* v_token) noexcept {
    return append_token_at(layer_idx, current_len_, k_token, v_token);
}

} // namespace setun::tensor::nn
