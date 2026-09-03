#pragma once

#include <vector>
#include <cstdint>
#include <cstddef>
#include <cmath>
#include <string>
#include <memory>
#include <unordered_map>
#include <cassert>

namespace setun::ai {

// Activation Functions Enum
enum class ActivationType : int {
    NONE = 0,
    TERNARY_SIGN = 1, // {-1, 0, +1} (Setun Native 1-cycle)
    RELU = 2,         // max(0, x)
    GELU = 3,         // 0.5 * x * (1 + tanh(...))
    STEP = 4          // x >= 0 ? 1 : 0
};

// ============================================================================
// 1. Packed Ternary Tensor (2 bits per trit: 4 weights per byte)
// Encoding:
//   00 (0) -> 0
//   01 (1) -> +1
//   10 (2) -> -1
// ============================================================================
class PackedTernaryTensor {
public:
    PackedTernaryTensor() : rows_(0), cols_(0) {}
    PackedTernaryTensor(size_t rows, size_t cols) : rows_(rows), cols_(cols) {
        size_t total = rows * cols;
        size_t bytes = (total + 3) / 4;
        data_.assign(bytes, 0);
    }

    size_t rows() const { return rows_; }
    size_t cols() const { return cols_; }
    size_t size() const { return rows_ * cols_; }
    size_t bytes() const { return data_.size(); }

    void set(size_t r, size_t c, int8_t val) {
        size_t idx = r * cols_ + c;
        size_t byte_idx = idx / 4;
        size_t bit_offset = (idx % 4) * 2;

        uint8_t code = 0;
        if (val == 1) code = 0b01;
        else if (val == -1) code = 0b10;
        else code = 0b00;

        data_[byte_idx] &= ~(0b11 << bit_offset);
        data_[byte_idx] |= (code << bit_offset);
    }

    int8_t get(size_t r, size_t c) const {
        size_t idx = r * cols_ + c;
        size_t byte_idx = idx / 4;
        size_t bit_offset = (idx % 4) * 2;

        uint8_t code = (data_[byte_idx] >> bit_offset) & 0b11;
        if (code == 0b01) return 1;
        if (code == 0b10) return -1;
        return 0;
    }

    const uint8_t* raw_data() const { return data_.data(); }
    uint8_t* raw_data() { return data_.data(); }

private:
    size_t rows_;
    size_t cols_;
    std::vector<uint8_t> data_;
};

// ============================================================================
// 2. BitNet Dense Layer (Multiplication-Free GEMM)
// ============================================================================
class DenseLayer {
public:
    DenseLayer(size_t in_features, size_t out_features, ActivationType act = ActivationType::NONE)
        : in_features_(in_features), out_features_(out_features), act_(act),
          weights_(out_features, in_features), bias_(out_features, 0) {}

    size_t in_features() const { return in_features_; }
    size_t out_features() const { return out_features_; }
    ActivationType activation() const { return act_; }

    void set_weight(size_t row, size_t col, int8_t val) {
        weights_.set(row, col, val);
    }

    int8_t get_weight(size_t row, size_t col) const {
        return weights_.get(row, col);
    }

    void set_bias(size_t row, int64_t val) {
        if (row < bias_.size()) bias_[row] = val;
    }

    int64_t get_bias(size_t row) const {
        return (row < bias_.size()) ? bias_[row] : 0;
    }

    // Multiplication-Free Forward: Addition/Subtraction only!
    void forward(const int64_t* input, int64_t* output) const {
        for (size_t r = 0; r < out_features_; ++r) {
            int64_t acc = bias_[r];

            // Addition/Subtraction loop skipping zeroes
            for (size_t c = 0; c < in_features_; ++c) {
                int8_t w = weights_.get(r, c);
                if (w == 1) {
                    acc += input[c];
                } else if (w == -1) {
                    acc -= input[c];
                }
            }

            // Activation
            switch (act_) {
                case ActivationType::TERNARY_SIGN:
                    output[r] = (acc > 0) ? 1 : ((acc < 0) ? -1 : 0);
                    break;
                case ActivationType::RELU:
                    output[r] = (acc > 0) ? acc : 0;
                    break;
                case ActivationType::GELU: {
                    double v = static_cast<double>(acc);
                    double g = 0.5 * v * (1.0 + std::tanh(0.79788456 * (v + 0.044715 * v * v * v)));
                    output[r] = static_cast<int64_t>(std::round(g));
                    break;
                }
                case ActivationType::STEP:
                    output[r] = (acc >= 0) ? 1 : 0;
                    break;
                case ActivationType::NONE:
                default:
                    output[r] = acc;
                    break;
            }
        }
    }

private:
    size_t in_features_;
    size_t out_features_;
    ActivationType act_;
    PackedTernaryTensor weights_;
    std::vector<int64_t> bias_;
};

// ============================================================================
// 3. Global Engine Registry for FFI & Setun VM
// ============================================================================
class BitNetEngine {
public:
    static BitNetEngine& instance() {
        static BitNetEngine inst;
        return inst;
    }

    int create_layer(size_t in_dim, size_t out_dim, int act_type) {
        int id = next_id_++;
        layers_[id] = std::make_unique<DenseLayer>(in_dim, out_dim, static_cast<ActivationType>(act_type));
        output_buffers_[id].assign(out_dim, 0);
        return id;
    }

    DenseLayer* get_layer(int id) {
        auto it = layers_.find(id);
        return (it != layers_.end()) ? it->second.get() : nullptr;
    }

    void free_layer(int id) {
        layers_.erase(id);
        output_buffers_.erase(id);
    }

    void set_input(size_t index, int64_t val) {
        if (index >= input_buffer_.size()) {
            input_buffer_.resize(index + 1, 0);
        }
        input_buffer_[index] = val;
    }

    int64_t get_input(size_t index) const {
        return (index < input_buffer_.size()) ? input_buffer_[index] : 0;
    }

    void forward(int layer_id) {
        auto* layer = get_layer(layer_id);
        if (!layer) return;

        if (input_buffer_.size() < layer->in_features()) {
            input_buffer_.resize(layer->in_features(), 0);
        }

        auto& out = output_buffers_[layer_id];
        out.assign(layer->out_features(), 0);
        layer->forward(input_buffer_.data(), out.data());
    }

    int64_t get_output(int layer_id, size_t index) const {
        auto it = output_buffers_.find(layer_id);
        if (it != output_buffers_.end() && index < it->second.size()) {
            return it->second[index];
        }
        return 0;
    }

    void copy_output_to_input(int layer_id) {
        auto it = output_buffers_.find(layer_id);
        if (it != output_buffers_.end()) {
            input_buffer_ = it->second;
        }
    }

    int predict(int layer_id) const {
        auto it = output_buffers_.find(layer_id);
        if (it == output_buffers_.end() || it->second.empty()) return 0;

        const auto& logits = it->second;
        int max_idx = 0;
        int64_t max_val = logits[0];
        for (size_t i = 1; i < logits.size(); ++i) {
            if (logits[i] > max_val) {
                max_val = logits[i];
                max_idx = static_cast<int>(i);
            }
        }
        return max_idx;
    }

    int get_confidence(int layer_id, int predicted_class) const {
        auto it = output_buffers_.find(layer_id);
        if (it == output_buffers_.end() || it->second.empty()) return 0;

        const auto& logits = it->second;
        if (predicted_class < 0 || predicted_class >= static_cast<int>(logits.size())) return 0;

        int64_t max_val = logits[0];
        for (int64_t v : logits) {
            if (v > max_val) max_val = v;
        }

        double sum = 0.0;
        std::vector<double> exp_vals(logits.size());
        for (size_t i = 0; i < logits.size(); ++i) {
            exp_vals[i] = std::exp(static_cast<double>(logits[i] - max_val));
            sum += exp_vals[i];
        }

        if (sum > 0.0) {
            double prob = exp_vals[predicted_class] / sum;
            return static_cast<int>(std::round(prob * 100.0));
        }
        return 0;
    }

    void load_mnist_sample(int digit);

    void clear() {
        layers_.clear();
        output_buffers_.clear();
        input_buffer_.clear();
    }

private:
    BitNetEngine() = default;
    int next_id_{1};
    std::unordered_map<int, std::unique_ptr<DenseLayer>> layers_;
    std::vector<int64_t> input_buffer_;
    std::unordered_map<int, std::vector<int64_t>> output_buffers_;
};

} // namespace setun::ai

// ============================================================================
// C API for VM & Native Calling
// ============================================================================
extern "C" {
    int setun_nn_create_dense(int in_features, int out_features, int act_type);
    void setun_nn_set_weight(int layer_id, int row, int col, int val);
    void setun_nn_set_bias(int layer_id, int row, int64_t val);
    void setun_nn_set_input(int index, int64_t val);
    int64_t setun_nn_get_input(int index);
    void setun_nn_forward(int layer_id);
    int64_t setun_nn_get_output(int layer_id, int index);
    void setun_nn_copy_output_to_input(int layer_id);
    int setun_nn_predict(int layer_id);
    int setun_nn_get_confidence(int layer_id, int predicted_class);
    void setun_nn_load_mnist_sample(int digit);
    void setun_nn_free_layer(int layer_id);
}
