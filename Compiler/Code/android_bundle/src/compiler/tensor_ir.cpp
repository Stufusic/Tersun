#include "compiler/tensor_ir.hpp"
#include <sstream>

namespace setun::compiler {

std::string TensorIRNode::to_string() const {
    std::ostringstream oss;
    oss << "%" << dst << " = " << tensor_opcode_name(op) << "(";
    for (size_t i = 0; i < srcs.size(); ++i) {
        oss << "%" << srcs[i];
        if (i + 1 < srcs.size()) oss << ", ";
    }
    oss << ") : " << shape.to_string() << " (" << tensor::dtype_name(dtype) << ")";
    return oss.str();
}

std::vector<TensorIRNode> optimize_tensor_graph(const std::vector<TensorIRNode>& graph) {
    std::vector<TensorIRNode> optimized;
    optimized.reserve(graph.size());

    size_t i = 0;
    while (i < graph.size()) {
        // Pattern 1: FUSED_LINEAR_BIAS_RELU: MATMUL + ADD_BIAS + RELU
        if (i + 2 < graph.size() &&
            graph[i].op == TensorOpCode::MATMUL_TERNARY &&
            graph[i + 1].op == TensorOpCode::ADD_BIAS &&
            graph[i + 2].op == TensorOpCode::RELU) {

            const auto& n_matmul = graph[i];
            const auto& n_bias   = graph[i + 1];
            const auto& n_relu   = graph[i + 2];

            // Verify data dependency: n_bias input is n_matmul dst, n_relu input is n_bias dst
            if (n_bias.srcs.size() >= 2 && n_bias.srcs[0] == n_matmul.dst &&
                n_relu.srcs.size() >= 1 && n_relu.srcs[0] == n_bias.dst) {

                TensorIRNode fused;
                fused.op = TensorOpCode::FUSED_LINEAR_BIAS_RELU;
                fused.dst = n_relu.dst;
                fused.srcs = {n_matmul.srcs[0], n_matmul.srcs[1], n_bias.srcs[1]}; // x, w, bias
                fused.shape = n_relu.shape;
                fused.dtype = n_relu.dtype;

                optimized.push_back(fused);
                i += 3;
                continue;
            }
        }

        // Default: copy node unchanged
        optimized.push_back(graph[i]);
        ++i;
    }

    return optimized;
}

} // namespace setun::compiler
