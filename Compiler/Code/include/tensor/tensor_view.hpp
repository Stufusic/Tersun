#pragma once

#include "tensor/tensor_shape.hpp"
#include "tensor/tensor_dtype.hpp"
#include "tensor/packed_ternary_layout.hpp"
#include "runtime/kernel_abi.hpp"
#include <cstdint>
#include <cstddef>
#include <stdexcept>
#include <cassert>

namespace setun::tensor {

class TensorView {
public:
    TensorView()
        : data_(nullptr), shape_(), dtype_(TensorDType::UNKNOWN), is_const_(true) {}

    TensorView(void* data, const TensorShape& shape, TensorDType dtype)
        : data_(data), shape_(shape), dtype_(dtype), is_const_(false) {}

    TensorView(const void* data, const TensorShape& shape, TensorDType dtype)
        : data_(const_cast<void*>(data)), shape_(shape), dtype_(dtype), is_const_(true) {}

    void* raw_data() {
        if (is_const_) throw std::runtime_error("Attempted to modify const TensorView");
        return data_;
    }

    const void* raw_data() const { return data_; }
    const TensorShape& shape() const { return shape_; }
    TensorDType dtype() const { return dtype_; }
    bool is_const() const { return is_const_; }

    size_t rank() const { return shape_.rank(); }
    size_t dim(size_t axis) const { return shape_.dim(axis); }
    size_t stride(size_t axis) const { return shape_.stride(axis); }
    size_t total_elements() const { return shape_.total_elements(); }
    bool is_contiguous() const { return shape_.is_contiguous(); }

    size_t byte_size() const {
        if (dtype_ == TensorDType::TERNARY_PACKED_2B) {
            return calc_packed_bytes(shape_.total_elements());
        }
        return shape_.total_elements() * dtype_element_bytes(dtype_);
    }

    // Typed Element Accessors
    template <typename T>
    T& at(size_t idx) {
        if (is_const_) throw std::runtime_error("Cannot mutate const TensorView");
        assert(shape_.rank() == 1);
        size_t off = shape_.linear_offset(idx);
        return static_cast<T*>(data_)[off];
    }

    template <typename T>
    const T& at(size_t idx) const {
        assert(shape_.rank() == 1);
        size_t off = shape_.linear_offset(idx);
        return static_cast<const T*>(data_)[off];
    }

    template <typename T>
    T& at(size_t r, size_t c) {
        if (is_const_) throw std::runtime_error("Cannot mutate const TensorView");
        assert(shape_.rank() == 2);
        size_t off = shape_.linear_offset(r, c);
        return static_cast<T*>(data_)[off];
    }

    template <typename T>
    const T& at(size_t r, size_t c) const {
        assert(shape_.rank() == 2);
        size_t off = shape_.linear_offset(r, c);
        return static_cast<const T*>(data_)[off];
    }

    // Packed Ternary Bit-Level Accessors
    int8_t get_trit(size_t r, size_t c) const {
        assert(dtype_ == TensorDType::TERNARY_PACKED_2B);
        assert(shape_.rank() == 2);
        size_t linear_idx = r * shape_.dim(1) + c;
        size_t byte_idx = linear_idx / TRITS_PER_BYTE;
        size_t pos_in_byte = linear_idx % TRITS_PER_BYTE;
        const uint8_t* bytes = static_cast<const uint8_t*>(data_);
        return unpack_trit_at(bytes[byte_idx], pos_in_byte);
    }

    void set_trit(size_t r, size_t c, int8_t val) {
        if (is_const_) throw std::runtime_error("Cannot mutate const TensorView");
        assert(dtype_ == TensorDType::TERNARY_PACKED_2B);
        assert(shape_.rank() == 2);
        size_t linear_idx = r * shape_.dim(1) + c;
        size_t byte_idx = linear_idx / TRITS_PER_BYTE;
        size_t pos_in_byte = linear_idx % TRITS_PER_BYTE;
        uint8_t* bytes = static_cast<uint8_t*>(data_);
        pack_trit_at(bytes[byte_idx], pos_in_byte, val);
    }

    // Non-copying Strided Slice (Zero-allocation)
    TensorView slice(size_t axis, size_t start, size_t length) const {
        if (axis >= shape_.rank()) {
            throw std::out_of_range("Slice axis out of range");
        }
        if (start + length > shape_.dim(axis)) {
            throw std::out_of_range("Slice range exceeds dimension size: " +
                                    std::to_string(start + length) + " > " + std::to_string(shape_.dim(axis)));
        }

        // Calculate offset in bytes
        size_t elem_offset = start * shape_.stride(axis);
        uint8_t* new_ptr = static_cast<uint8_t*>(data_);
        
        if (dtype_ != TensorDType::TERNARY_PACKED_2B) {
            new_ptr += elem_offset * dtype_element_bytes(dtype_);
        } else {
            // Packed ternary slicing must align on 4-trit boundaries for row slicing
            if (axis == 0) {
                size_t byte_off = (start * shape_.dim(1)) / TRITS_PER_BYTE;
                new_ptr += byte_off;
            } else {
                if (start % TRITS_PER_BYTE != 0) {
                    throw std::invalid_argument("Packed ternary column slice must be aligned to 4-trit byte boundary");
                }
                new_ptr += (start / TRITS_PER_BYTE);
            }
        }

        std::vector<size_t> new_dims = shape_.dims();
        new_dims[axis] = length;
        TensorShape new_shape(new_dims, shape_.strides());

        return TensorView(new_ptr, new_shape, dtype_);
    }

    // Convert view to C ABI KernelContext
    runtime::KernelContext to_kernel_context() const {
        runtime::KernelContext ctx;
        ctx.input = data_;
        ctx.output = data_;
        if (shape_.rank() == 1) {
            ctx.M = 1;
            ctx.N = shape_.dim(0);
            ctx.K = shape_.dim(0);
        } else if (shape_.rank() == 2) {
            ctx.M = shape_.dim(0);
            ctx.N = shape_.dim(1);
            ctx.K = shape_.dim(1);
        }
        ctx.input_dtype = to_kernel_dtype_id(dtype_);
        ctx.output_dtype = to_kernel_dtype_id(dtype_);
        ctx.flags = is_contiguous() ? runtime::KERNEL_FLAG_CONTIGUOUS : runtime::KERNEL_FLAG_NONE;
        return ctx;
    }

    // Physical split_at_mut: disjoint slicing with zero allocation & bounds verification
    std::pair<TensorView, TensorView> split_at_mut(size_t mid) {
        if (is_const_) {
            throw std::runtime_error("Cannot split_at_mut on const TensorView");
        }
        if (shape_.rank() != 1) {
            throw std::invalid_argument("split_at_mut requires 1D TensorView");
        }
        if (mid > shape_.dim(0)) {
            throw std::out_of_range("split_at_mut index " + std::to_string(mid) +
                                    " exceeds length " + std::to_string(shape_.dim(0)));
        }
        TensorView left = slice(0, 0, mid);
        TensorView right = slice(0, mid, shape_.dim(0) - mid);
        left.is_const_ = false;
        right.is_const_ = false;
#ifndef NDEBUG
        static uint32_t s_region_counter = 100;
        left.region_id_ = ++s_region_counter;
        right.region_id_ = ++s_region_counter;
#endif
        return {left, right};
    }

    uint32_t region_id() const noexcept {
#ifndef NDEBUG
        return region_id_;
#else
        return 0;
#endif
    }

    void set_region_id(uint32_t rid) noexcept {
#ifndef NDEBUG
        region_id_ = rid;
#else
        (void)rid;
#endif
    }

private:
    void* data_{nullptr};
    TensorShape shape_;
    TensorDType dtype_{TensorDType::UNKNOWN};
    bool is_const_{true};
#ifndef NDEBUG
    uint32_t region_id_{0};
#endif
};

} // namespace setun::tensor
