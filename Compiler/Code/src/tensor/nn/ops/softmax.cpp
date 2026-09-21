#include "tensor/nn/ops/softmax.hpp"
#include <cmath>
#include <algorithm>

namespace setun::tensor::nn {

Status SoftmaxOps::compute(
    const float* input,
    float* output,
    size_t rows,
    size_t cols,
    bool causal_mask,
    size_t row_offset) noexcept
{
    for (size_t r = 0; r < rows; ++r) {
        const float* in_row = input + r * cols;
        float* out_row = output + r * cols;
        size_t current_row_pos = row_offset + r;

        // 1. Find max for numerical stability
        float max_val = -1e30f;
        for (size_t c = 0; c < cols; ++c) {
            if (causal_mask && c > current_row_pos) {
                continue;
            }
            if (in_row[c] > max_val) {
                max_val = in_row[c];
            }
        }

        // 2. Compute exp and sum
        float sum_exp = 0.0f;
        for (size_t c = 0; c < cols; ++c) {
            if (causal_mask && c > current_row_pos) {
                out_row[c] = 0.0f;
            } else {
                float e = std::exp(in_row[c] - max_val);
                out_row[c] = e;
                sum_exp += e;
            }
        }

        // 3. Normalize
        float inv_sum = (sum_exp > 1e-12f) ? (1.0f / sum_exp) : 0.0f;
        for (size_t c = 0; c < cols; ++c) {
            out_row[c] *= inv_sum;
        }
    }

    return Status::OK();
}

} // namespace setun::tensor::nn
