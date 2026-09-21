#pragma once

#include "tensor/tensor_shape.hpp"
#include "tensor/tensor_dtype.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/packed_ternary_layout.hpp"
#include <vector>
#include <memory>
#include <string>

namespace setun::tensor {

class Tensor {
public:
    Tensor();
    explicit Tensor(const TensorShape& shape, TensorDType dtype = TensorDType::INT32);
    explicit Tensor(size_t length, TensorDType dtype = TensorDType::INT32);
    Tensor(size_t rows, size_t cols, TensorDType dtype = TensorDType::INT32);

    Tensor(const Tensor& other);
    Tensor(Tensor&& other) noexcept;
    Tensor& operator=(const Tensor& other);
    Tensor& operator=(Tensor&& other) noexcept;
    ~Tensor() = default;

    const TensorShape& shape() const { return shape_; }
    TensorDType dtype() const { return dtype_; }
    size_t total_elements() const { return shape_.total_elements(); }
    size_t byte_size() const { return storage_.size(); }

    void* raw_data() { return storage_.data(); }
    const void* raw_data() const { return storage_.data(); }

    TensorView view() { return TensorView(storage_.data(), shape_, dtype_); }
    TensorView view() const { return TensorView(storage_.data(), shape_, dtype_); }

    TensorView slice(size_t axis, size_t start, size_t length) const {
        return view().slice(axis, start, length);
    }

    template <typename T>
    T& at(size_t idx) { return view().template at<T>(idx); }

    template <typename T>
    const T& at(size_t idx) const { return view().template at<T>(idx); }

    template <typename T>
    T& at(size_t r, size_t c) { return view().template at<T>(r, c); }

    template <typename T>
    const T& at(size_t r, size_t c) const { return view().template at<T>(r, c); }

    int8_t get_trit(size_t r, size_t c) const { return view().get_trit(r, c); }
    void set_trit(size_t r, size_t c, int8_t val) { view().set_trit(r, c, val); }

    void fill_zero();
    bool aliases(const Tensor& other) const;

    // High-Level Standard Arithmetic & Neural Operations
    Tensor add(const Tensor& other) const;
    Tensor mul(const Tensor& other) const;
    Tensor relu() const;
    Tensor matmul(const Tensor& other) const;
    int64_t reduce_sum() const;

    static Tensor zeros(const TensorShape& shape, TensorDType dtype = TensorDType::INT32);
    static Tensor ones(const TensorShape& shape, TensorDType dtype = TensorDType::INT32);

private:
    void allocate_storage();

    TensorShape shape_;
    TensorDType dtype_{TensorDType::INT32};
    std::vector<uint8_t> storage_;
};

} // namespace setun::tensor
