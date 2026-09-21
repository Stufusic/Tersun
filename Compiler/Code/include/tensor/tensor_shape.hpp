#pragma once

#include <vector>
#include <array>
#include <cstddef>
#include <cstdint>
#include <string>
#include <stdexcept>
#include <sstream>
#include <limits>
#include <cassert>

namespace setun::tensor {

// ============================================================================
// TensorShape: Stack-Allocated N-Dimensional Tensor Shape (Zero Heap Alloc)
// Supports up to MAX_RANK = 6 dimensions with 0 dynamic memory allocations.
// ============================================================================
class TensorShape {
public:
    static constexpr size_t MAX_RANK = 6;

    TensorShape() : rank_(1), total_elements_(0) {
        dims_[0] = 0;
        strides_[0] = 1;
    }

    // 1D Shape
    explicit TensorShape(size_t length) : rank_(1), total_elements_(length) {
        dims_[0] = length;
        strides_[0] = 1;
    }

    // 2D Shape
    TensorShape(size_t rows, size_t cols) : rank_(2) {
        if (rows > 0 && cols > std::numeric_limits<size_t>::max() / rows) {
            throw std::overflow_error("TensorShape dimension product overflows size_t: " +
                                      std::to_string(rows) + " x " + std::to_string(cols));
        }
        dims_[0] = rows;
        dims_[1] = cols;
        strides_[0] = cols;
        strides_[1] = 1;
        total_elements_ = rows * cols;
    }

    // 3D Shape
    TensorShape(size_t d0, size_t d1, size_t d2) : rank_(3) {
        dims_[0] = d0;
        dims_[1] = d1;
        dims_[2] = d2;
        strides_[2] = 1;
        strides_[1] = d2;
        strides_[0] = d1 * d2;
        total_elements_ = d0 * d1 * d2;
    }

    // Multi-dim contiguous shape constructor
    explicit TensorShape(const std::vector<size_t>& dims) {
        if (dims.empty()) {
            rank_ = 0;
            total_elements_ = 0;
            return;
        }
        if (dims.size() > MAX_RANK) {
            throw std::out_of_range("TensorShape rank exceeds MAX_RANK = 6");
        }
        rank_ = dims.size();
        size_t stride = 1;
        for (int i = static_cast<int>(rank_) - 1; i >= 0; --i) {
            dims_[i] = dims[i];
            strides_[i] = stride;
            if (dims[i] > 0 && stride > std::numeric_limits<size_t>::max() / dims[i]) {
                throw std::overflow_error("TensorShape dimension overflow");
            }
            stride *= dims[i];
        }
        total_elements_ = stride;
    }

    // Arbitrary Strided Shape
    TensorShape(const std::vector<size_t>& dims, const std::vector<size_t>& strides) {
        if (dims.empty()) {
            rank_ = 0;
            total_elements_ = 0;
            return;
        }
        if (dims.size() > MAX_RANK || strides.size() > MAX_RANK) {
            throw std::out_of_range("TensorShape rank exceeds MAX_RANK = 6");
        }
        rank_ = dims.size();
        size_t prod = 1;
        for (size_t i = 0; i < rank_; ++i) {
            dims_[i] = dims[i];
            strides_[i] = strides[i];
            if (dims[i] > 0 && prod > std::numeric_limits<size_t>::max() / dims[i]) {
                throw std::overflow_error("TensorShape dimension overflow");
            }
            prod *= dims[i];
        }
        total_elements_ = prod;
    }

    size_t rank() const noexcept { return rank_; }
    size_t total_elements() const noexcept { return total_elements_; }

    size_t dim(size_t axis) const {
        if (axis >= rank_) {
            throw std::out_of_range("TensorShape axis " + std::to_string(axis) + " out of range for rank " + std::to_string(rank_));
        }
        return dims_[axis];
    }

    size_t stride(size_t axis) const {
        if (axis >= rank_) {
            throw std::out_of_range("TensorShape stride axis " + std::to_string(axis) + " out of range");
        }
        return strides_[axis];
    }

    std::vector<size_t> dims() const {
        return std::vector<size_t>(dims_.begin(), dims_.begin() + rank_);
    }

    std::vector<size_t> strides() const {
        return std::vector<size_t>(strides_.begin(), strides_.begin() + rank_);
    }

    bool is_contiguous() const noexcept {
        if (rank_ == 0 || total_elements_ == 0) return true;
        if (rank_ == 1) return strides_[0] == 1;
        if (rank_ == 2) return strides_[1] == 1 && strides_[0] == dims_[1];

        size_t expected_stride = 1;
        for (int i = static_cast<int>(rank_) - 1; i >= 0; --i) {
            if (strides_[i] != expected_stride && dims_[i] > 1) return false;
            expected_stride *= dims_[i];
        }
        return true;
    }

    static inline size_t safe_mul(size_t a, size_t b) {
#if defined(__GNUC__) || defined(__clang__)
        size_t res = 0;
        if (__builtin_mul_overflow(a, b, &res)) {
            throw std::overflow_error("Tensor index arithmetic overflow in multiplication");
        }
        return res;
#else
        if (a > 0 && b > std::numeric_limits<size_t>::max() / a) {
            throw std::overflow_error("Tensor index arithmetic overflow in multiplication");
        }
        return a * b;
#endif
    }

    static inline size_t safe_add(size_t a, size_t b) {
#if defined(__GNUC__) || defined(__clang__)
        size_t res = 0;
        if (__builtin_add_overflow(a, b, &res)) {
            throw std::overflow_error("Tensor index arithmetic overflow in addition");
        }
        return res;
#else
        if (a > std::numeric_limits<size_t>::max() - b) {
            throw std::overflow_error("Tensor index arithmetic overflow in addition");
        }
        return a + b;
#endif
    }

    size_t linear_offset(size_t idx) const {
        assert(rank_ == 1);
        if (idx >= dims_[0]) throw std::out_of_range("Index out of bounds");
        return safe_mul(idx, strides_[0]);
    }

    size_t linear_offset(size_t r, size_t c) const {
        assert(rank_ == 2);
        if (r >= dims_[0] || c >= dims_[1]) {
            throw std::out_of_range("Indices out of bounds for shape " + to_string());
        }
        return safe_add(safe_mul(r, strides_[0]), safe_mul(c, strides_[1]));
    }

    size_t linear_offset(const std::vector<size_t>& indices) const {
        if (indices.size() != rank_) {
            throw std::invalid_argument("Indices rank " + std::to_string(indices.size()) + " != shape rank " + std::to_string(rank_));
        }
        size_t total_off = 0;
        for (size_t i = 0; i < rank_; ++i) {
            if (indices[i] >= dims_[i]) {
                throw std::out_of_range("Index out of bounds");
            }
            total_off = safe_add(total_off, safe_mul(indices[i], strides_[i]));
        }
        return total_off;
    }

    bool operator==(const TensorShape& other) const noexcept {
        if (rank_ != other.rank_ || total_elements_ != other.total_elements_) return false;
        for (size_t i = 0; i < rank_; ++i) {
            if (dims_[i] != other.dims_[i] || strides_[i] != other.strides_[i]) return false;
        }
        return true;
    }

    bool operator!=(const TensorShape& other) const noexcept {
        return !(*this == other);
    }

    std::string to_string() const {
        std::ostringstream oss;
        oss << "[";
        for (size_t i = 0; i < rank_; ++i) {
            oss << dims_[i];
            if (i + 1 < rank_) oss << ", ";
        }
        oss << "]";
        return oss.str();
    }

private:
    size_t rank_{0};
    std::array<size_t, MAX_RANK> dims_{0};
    std::array<size_t, MAX_RANK> strides_{0};
    size_t total_elements_{0};
};

} // namespace setun::tensor
