#pragma once

#include <vector>
#include <cstddef>
#include <cstdint>
#include <string>
#include <stdexcept>
#include <sstream>
#include <limits>
#include <cassert>

namespace setun::tensor {

class TensorShape {
public:
    TensorShape() : dims_({0}), strides_({1}), total_elements_(0) {}

    // 1D Shape
    explicit TensorShape(size_t length) : dims_({length}), strides_({1}), total_elements_(length) {}

    // 2D Shape
    TensorShape(size_t rows, size_t cols) : dims_({rows, cols}), strides_({cols, 1}) {
        if (rows > 0 && cols > std::numeric_limits<size_t>::max() / rows) {
            throw std::overflow_error("TensorShape dimension product overflows size_t: " +
                                      std::to_string(rows) + " x " + std::to_string(cols));
        }
        total_elements_ = rows * cols;
    }

    // Multi-dim contiguous shape constructor
    explicit TensorShape(const std::vector<size_t>& dims) : dims_(dims) {
        if (dims.empty()) {
            total_elements_ = 0;
            return;
        }
        strides_.resize(dims.size());
        size_t stride = 1;
        for (int i = static_cast<int>(dims.size()) - 1; i >= 0; --i) {
            strides_[i] = stride;
            if (dims[i] > 0 && stride > std::numeric_limits<size_t>::max() / dims[i]) {
                throw std::overflow_error("TensorShape dimension overflow");
            }
            stride *= dims[i];
        }
        total_elements_ = stride;
    }

    // Arbitrary Strided Shape (e.g. for slicing/views)
    TensorShape(const std::vector<size_t>& dims, const std::vector<size_t>& strides)
        : dims_(dims), strides_(strides) {
        if (dims.empty()) {
            total_elements_ = 0;
            return;
        }
        size_t prod = 1;
        for (size_t d : dims) {
            if (d > 0 && prod > std::numeric_limits<size_t>::max() / d) {
                throw std::overflow_error("TensorShape dimension overflow");
            }
            prod *= d;
        }
        total_elements_ = prod;
    }

    size_t rank() const { return dims_.size(); }
    const std::vector<size_t>& dims() const { return dims_; }
    const std::vector<size_t>& strides() const { return strides_; }

    size_t dim(size_t axis) const {
        if (axis >= dims_.size()) {
            throw std::out_of_range("TensorShape axis " + std::to_string(axis) + " out of range for rank " + std::to_string(rank()));
        }
        return dims_[axis];
    }

    size_t stride(size_t axis) const {
        if (axis >= strides_.size()) {
            throw std::out_of_range("TensorShape stride axis " + std::to_string(axis) + " out of range");
        }
        return strides_[axis];
    }

    size_t total_elements() const { return total_elements_; }

    bool is_contiguous() const {
        if (dims_.empty() || total_elements_ == 0) return true;
        if (dims_.size() == 1) return strides_[0] == 1;
        if (dims_.size() == 2) return strides_[1] == 1 && strides_[0] == dims_[1];
        
        // Multi-dim general row-major check
        size_t expected_stride = 1;
        for (int i = static_cast<int>(dims_.size()) - 1; i >= 0; --i) {
            if (strides_[i] != expected_stride && dims_[i] > 1) return false;
            expected_stride *= dims_[i];
        }
        return true;
    }

    size_t linear_offset(size_t idx) const {
        assert(dims_.size() == 1);
        if (idx >= dims_[0]) throw std::out_of_range("Index out of bounds");
        return idx * strides_[0];
    }

    size_t linear_offset(size_t r, size_t c) const {
        assert(dims_.size() == 2);
        if (r >= dims_[0] || c >= dims_[1]) {
            throw std::out_of_range("Indices (" + std::to_string(r) + ", " + std::to_string(c) + ") out of bounds for shape " + to_string());
        }
        return r * strides_[0] + c * strides_[1];
    }

    bool operator==(const TensorShape& other) const {
        return dims_ == other.dims_ && strides_ == other.strides_;
    }

    bool operator!=(const TensorShape& other) const {
        return !(*this == other);
    }

    std::string to_string() const {
        std::ostringstream oss;
        oss << "[";
        for (size_t i = 0; i < dims_.size(); ++i) {
            oss << dims_[i];
            if (i + 1 < dims_.size()) oss << ", ";
        }
        oss << "]";
        return oss.str();
    }

private:
    std::vector<size_t> dims_;
    std::vector<size_t> strides_;
    size_t total_elements_{0};
};

} // namespace setun::tensor
