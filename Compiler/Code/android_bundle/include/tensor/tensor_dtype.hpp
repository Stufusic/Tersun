#pragma once

#include "runtime/kernel_abi.hpp"
#include <cstddef>
#include <string>

namespace setun::tensor {

enum class TensorDType : int {
    UNKNOWN            = 0,
    INT8               = 1,
    INT16              = 2,
    INT32              = 3,
    INT64              = 4,
    FLOAT32            = 5,
    FLOAT64            = 6,
    TAF3               = 7,
    TERNARY_PACKED_2B  = 8
};

inline size_t dtype_element_bytes(TensorDType dt) {
    switch (dt) {
        case TensorDType::INT8:              return 1;
        case TensorDType::INT16:             return 2;
        case TensorDType::INT32:             return 4;
        case TensorDType::INT64:             return 8;
        case TensorDType::FLOAT32:           return 4;
        case TensorDType::FLOAT64:           return 8;
        case TensorDType::TAF3:              return 24; // 3 x int64_t for (a + b*sqrt(3)) / 3^c
        case TensorDType::TERNARY_PACKED_2B: return 0;  // 2 bits per element; handled via calc_packed_bytes
        default:                             return 0;
    }
}

inline std::string dtype_name(TensorDType dt) {
    switch (dt) {
        case TensorDType::INT8:              return "int8";
        case TensorDType::INT16:             return "int16";
        case TensorDType::INT32:             return "int32";
        case TensorDType::INT64:             return "int64";
        case TensorDType::FLOAT32:           return "float32";
        case TensorDType::FLOAT64:           return "float64";
        case TensorDType::TAF3:              return "taf3";
        case TensorDType::TERNARY_PACKED_2B: return "ternary_packed_2b";
        default:                             return "unknown";
    }
}

inline int to_kernel_dtype_id(TensorDType dt) {
    return static_cast<int>(dt);
}

inline TensorDType from_kernel_dtype_id(int id) {
    return static_cast<TensorDType>(id);
}

} // namespace setun::tensor
