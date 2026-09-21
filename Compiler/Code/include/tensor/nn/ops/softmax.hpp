#pragma once

#include "tensor/tensor_view.hpp"
#include "tensor/nn/core/status.hpp"
#include <cstddef>

namespace setun::tensor::nn {

// Numerically stable masked Softmax
class SoftmaxOps {
public:
    // in-place or out-of-place softmax over last dimension
    // If causal_mask is true, positions with col > row are masked out
    static Status compute(
        const float* input,
        float* output,
        size_t rows,
        size_t cols,
        bool causal_mask = false,
        size_t row_offset = 0) noexcept;
};

} // namespace setun::tensor::nn
