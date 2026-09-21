#include "tensor/tensor.hpp"
#include <algorithm>
#include <stdexcept>
#include <cstring>

namespace setun::tensor {

Tensor::Tensor() : shape_(), dtype_(TensorDType::INT32) {
    allocate_storage();
}

Tensor::Tensor(const TensorShape& shape, TensorDType dtype)
    : shape_(shape), dtype_(dtype) {
    allocate_storage();
}

Tensor::Tensor(size_t length, TensorDType dtype)
    : shape_(length), dtype_(dtype) {
    allocate_storage();
}

Tensor::Tensor(size_t rows, size_t cols, TensorDType dtype)
    : shape_(rows, cols), dtype_(dtype) {
    allocate_storage();
}

Tensor::Tensor(const Tensor& other)
    : shape_(other.shape_), dtype_(other.dtype_), storage_(other.storage_) {}

Tensor::Tensor(Tensor&& other) noexcept
    : shape_(std::move(other.shape_)),
      dtype_(other.dtype_),
      storage_(std::move(other.storage_)) {}

Tensor& Tensor::operator=(const Tensor& other) {
    if (this != &other) {
        shape_ = other.shape_;
        dtype_ = other.dtype_;
        storage_ = other.storage_;
    }
    return *this;
}

Tensor& Tensor::operator=(Tensor&& other) noexcept {
    if (this != &other) {
        shape_ = std::move(other.shape_);
        dtype_ = other.dtype_;
        storage_ = std::move(other.storage_);
    }
    return *this;
}

void Tensor::allocate_storage() {
    size_t bytes = 0;
    if (dtype_ == TensorDType::TERNARY_PACKED_2B) {
        bytes = calc_packed_bytes(shape_.total_elements());
    } else {
        bytes = shape_.total_elements() * dtype_element_bytes(dtype_);
    }
    storage_.assign(bytes, 0);
}

void Tensor::fill_zero() {
    std::fill(storage_.begin(), storage_.end(), 0);
}

bool Tensor::aliases(const Tensor& other) const {
    if (storage_.empty() || other.storage_.empty()) return false;
    return storage_.data() == other.storage_.data();
}

Tensor Tensor::add(const Tensor& other) const {
    if (shape_ != other.shape_) {
        throw std::invalid_argument("Shape mismatch in Tensor::add: " +
                                    shape_.to_string() + " vs " + other.shape_.to_string());
    }
    if (dtype_ != other.dtype_) {
        throw std::invalid_argument("DType mismatch in Tensor::add: " +
                                    dtype_name(dtype_) + " vs " + dtype_name(other.dtype_));
    }

    Tensor result(shape_, dtype_);
    size_t count = shape_.total_elements();

    if (dtype_ == TensorDType::INT32) {
        const int32_t* a = static_cast<const int32_t*>(raw_data());
        const int32_t* b = static_cast<const int32_t*>(other.raw_data());
        int32_t* c = static_cast<int32_t*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) c[i] = a[i] + b[i];
    } else if (dtype_ == TensorDType::FLOAT32) {
        const float* a = static_cast<const float*>(raw_data());
        const float* b = static_cast<const float*>(other.raw_data());
        float* c = static_cast<float*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) c[i] = a[i] + b[i];
    } else if (dtype_ == TensorDType::INT64) {
        const int64_t* a = static_cast<const int64_t*>(raw_data());
        const int64_t* b = static_cast<const int64_t*>(other.raw_data());
        int64_t* c = static_cast<int64_t*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) c[i] = a[i] + b[i];
    } else {
        throw std::runtime_error("Tensor::add unsupported for dtype: " + dtype_name(dtype_));
    }

    return result;
}

Tensor Tensor::mul(const Tensor& other) const {
    if (shape_ != other.shape_) {
        throw std::invalid_argument("Shape mismatch in Tensor::mul: " +
                                    shape_.to_string() + " vs " + other.shape_.to_string());
    }
    Tensor result(shape_, dtype_);
    size_t count = shape_.total_elements();

    if (dtype_ == TensorDType::INT32) {
        const int32_t* a = static_cast<const int32_t*>(raw_data());
        const int32_t* b = static_cast<const int32_t*>(other.raw_data());
        int32_t* c = static_cast<int32_t*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) c[i] = a[i] * b[i];
    } else if (dtype_ == TensorDType::FLOAT32) {
        const float* a = static_cast<const float*>(raw_data());
        const float* b = static_cast<const float*>(other.raw_data());
        float* c = static_cast<float*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) c[i] = a[i] * b[i];
    } else {
        throw std::runtime_error("Tensor::mul unsupported for dtype: " + dtype_name(dtype_));
    }

    return result;
}

Tensor Tensor::relu() const {
    Tensor result(shape_, dtype_);
    size_t count = shape_.total_elements();

    if (dtype_ == TensorDType::INT32) {
        const int32_t* in = static_cast<const int32_t*>(raw_data());
        int32_t* out = static_cast<int32_t*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) out[i] = in[i] > 0 ? in[i] : 0;
    } else if (dtype_ == TensorDType::FLOAT32) {
        const float* in = static_cast<const float*>(raw_data());
        float* out = static_cast<float*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) out[i] = in[i] > 0.0f ? in[i] : 0.0f;
    } else if (dtype_ == TensorDType::INT64) {
        const int64_t* in = static_cast<const int64_t*>(raw_data());
        int64_t* out = static_cast<int64_t*>(result.raw_data());
        for (size_t i = 0; i < count; ++i) out[i] = in[i] > 0 ? in[i] : 0;
    } else {
        throw std::runtime_error("Tensor::relu unsupported for dtype: " + dtype_name(dtype_));
    }

    return result;
}

Tensor Tensor::matmul(const Tensor& other) const {
    if (shape_.rank() != 2 || other.shape_.rank() != 2) {
        throw std::invalid_argument("Tensor::matmul requires 2D matrices, got " +
                                    shape_.to_string() + " and " + other.shape_.to_string());
    }

    size_t M = shape_.dim(0);
    size_t K = shape_.dim(1);
    size_t other_K = other.shape_.dim(0);
    size_t N = other.shape_.dim(1);

    if (K != other_K) {
        throw std::invalid_argument("Tensor::matmul dimension mismatch on contraction axis: " +
                                    shape_.to_string() + " x " + other.shape_.to_string() +
                                    " (inner dims " + std::to_string(K) + " != " + std::to_string(other_K) + ")");
    }

    Tensor result(TensorShape(M, N), dtype_ == TensorDType::FLOAT32 ? TensorDType::FLOAT32 : TensorDType::INT32);

    // Multiplication-Free BitNet MatMul (Input: INT32, Weights: TERNARY_PACKED_2B)
    if (other.dtype() == TensorDType::TERNARY_PACKED_2B && dtype_ == TensorDType::INT32) {
        const int32_t* A = static_cast<const int32_t*>(raw_data());
        int32_t* C = static_cast<int32_t*>(result.raw_data());

        for (size_t i = 0; i < M; ++i) {
            for (size_t j = 0; j < N; ++j) {
                int64_t acc = 0;
                for (size_t k = 0; k < K; ++k) {
                    int8_t w = other.get_trit(k, j);
                    int32_t a_val = A[i * K + k];
                    if (w == 1) acc += a_val;
                    else if (w == -1) acc -= a_val;
                }
                C[i * N + j] = static_cast<int32_t>(acc);
            }
        }
        return result;
    }

    // Standard INT32 GEMM
    if (dtype_ == TensorDType::INT32 && other.dtype() == TensorDType::INT32) {
        const int32_t* A = static_cast<const int32_t*>(raw_data());
        const int32_t* B = static_cast<const int32_t*>(other.raw_data());
        int32_t* C = static_cast<int32_t*>(result.raw_data());

        for (size_t i = 0; i < M; ++i) {
            for (size_t j = 0; j < N; ++j) {
                int64_t acc = 0;
                for (size_t k = 0; k < K; ++k) {
                    acc += static_cast<int64_t>(A[i * K + k]) * B[k * N + j];
                }
                C[i * N + j] = static_cast<int32_t>(acc);
            }
        }
        return result;
    }

    // Standard FLOAT32 GEMM
    if (dtype_ == TensorDType::FLOAT32 && other.dtype() == TensorDType::FLOAT32) {
        const float* A = static_cast<const float*>(raw_data());
        const float* B = static_cast<const float*>(other.raw_data());
        float* C = static_cast<float*>(result.raw_data());

        for (size_t i = 0; i < M; ++i) {
            for (size_t j = 0; j < N; ++j) {
                float acc = 0.0f;
                for (size_t k = 0; k < K; ++k) {
                    acc += A[i * K + k] * B[k * N + j];
                }
                C[i * N + j] = acc;
            }
        }
        return result;
    }

    throw std::runtime_error("Tensor::matmul unsupported dtype combination: " +
                             dtype_name(dtype_) + " x " + dtype_name(other.dtype()));
}

int64_t Tensor::reduce_sum() const {
    int64_t sum = 0;
    size_t count = shape_.total_elements();

    if (dtype_ == TensorDType::INT32) {
        const int32_t* ptr = static_cast<const int32_t*>(raw_data());
        for (size_t i = 0; i < count; ++i) sum += ptr[i];
    } else if (dtype_ == TensorDType::INT64) {
        const int64_t* ptr = static_cast<const int64_t*>(raw_data());
        for (size_t i = 0; i < count; ++i) sum += ptr[i];
    } else {
        throw std::runtime_error("Tensor::reduce_sum unsupported for dtype: " + dtype_name(dtype_));
    }
    return sum;
}

Tensor Tensor::zeros(const TensorShape& shape, TensorDType dtype) {
    Tensor t(shape, dtype);
    t.fill_zero();
    return t;
}

Tensor Tensor::ones(const TensorShape& shape, TensorDType dtype) {
    Tensor t(shape, dtype);
    size_t count = shape.total_elements();
    if (dtype == TensorDType::INT32) {
        int32_t* p = static_cast<int32_t*>(t.raw_data());
        for (size_t i = 0; i < count; ++i) p[i] = 1;
    } else if (dtype == TensorDType::FLOAT32) {
        float* p = static_cast<float*>(t.raw_data());
        for (size_t i = 0; i < count; ++i) p[i] = 1.0f;
    }
    return t;
}

} // namespace setun::tensor
