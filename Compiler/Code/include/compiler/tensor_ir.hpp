#pragma once

#include "tensor/tensor_shape.hpp"
#include "tensor/tensor_dtype.hpp"
#include <string>
#include <vector>

namespace setun::compiler {

enum class TensorOpCode : int {
    LOAD_TENSOR = 1,
    STORE_TENSOR = 2,
    MATMUL_TERNARY = 3,
    ADD_BIAS = 4,
    RELU = 5,
    FUSED_LINEAR_BIAS_RELU = 6,
    REDUCE_SUM = 7
};

inline std::string tensor_opcode_name(TensorOpCode op) {
    switch (op) {
        case TensorOpCode::LOAD_TENSOR:            return "LOAD_TENSOR";
        case TensorOpCode::STORE_TENSOR:           return "STORE_TENSOR";
        case TensorOpCode::MATMUL_TERNARY:         return "MATMUL_TERNARY";
        case TensorOpCode::ADD_BIAS:               return "ADD_BIAS";
        case TensorOpCode::RELU:                   return "RELU";
        case TensorOpCode::FUSED_LINEAR_BIAS_RELU: return "FUSED_LINEAR_BIAS_RELU";
        case TensorOpCode::REDUCE_SUM:             return "REDUCE_SUM";
        default:                                   return "UNKNOWN_OP";
    }
}

struct TensorIRNode {
    TensorOpCode op{TensorOpCode::LOAD_TENSOR};
    std::string dst;
    std::vector<std::string> srcs;
    tensor::TensorShape shape;
    tensor::TensorDType dtype{tensor::TensorDType::INT32};

    std::string to_string() const;
};

// Graph Optimization Pass: Pattern Fusing
std::vector<TensorIRNode> optimize_tensor_graph(const std::vector<TensorIRNode>& graph);

} // namespace setun::compiler
