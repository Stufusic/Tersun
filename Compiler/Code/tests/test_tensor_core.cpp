#include "tensor/packed_ternary_layout.hpp"
#include "tensor/tensor_shape.hpp"
#include "tensor/tensor_dtype.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/tensor.hpp"
#include "compiler/tensor_ir.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

void test_tensor_core_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  [Gate 7.2] Tensor Core & PackedTernaryLayout v1 Verification     \n";
    std::cout << "===================================================================\n";

    // 1. Kiểm thử đặc tả chuẩn PackedTernaryLayout v1
    std::cout << "  [G7.2-1] Testing PackedTernaryLayout v1 Bit-Level Encoding...\n";
    {
        uint8_t byte = 0;
        tensor::pack_trit_at(byte, 0, 1);   // t0 = +1 (01b)
        tensor::pack_trit_at(byte, 1, -1);  // t1 = -1 (10b)
        tensor::pack_trit_at(byte, 2, 0);   // t2 =  0 (00b)
        tensor::pack_trit_at(byte, 3, 1);   // t3 = +1 (01b)

        // Expected byte: (01 << 6) | (00 << 4) | (10 << 2) | (01 << 0) = 0b01001001 = 0x49
        assert(byte == 0x49);
        assert(tensor::unpack_trit_at(byte, 0) == 1);
        assert(tensor::unpack_trit_at(byte, 1) == -1);
        assert(tensor::unpack_trit_at(byte, 2) == 0);
        assert(tensor::unpack_trit_at(byte, 3) == 1);

        int8_t unpacked[4];
        tensor::unpack_trits_4(byte, unpacked);
        assert(unpacked[0] == 1);
        assert(unpacked[1] == -1);
        assert(unpacked[2] == 0);
        assert(unpacked[3] == 1);

        uint8_t packed_again = tensor::pack_trits_4(1, -1, 0, 1);
        assert(packed_again == 0x49);

        assert(tensor::calc_packed_bytes(1) == 1);
        assert(tensor::calc_packed_bytes(4) == 1);
        assert(tensor::calc_packed_bytes(5) == 2);
        assert(tensor::calc_packed_bytes(101632) == 25408); // 101,632 weights = 25,408 bytes (~25KB)
        std::cout << "    -> PackedTernaryLayout v1 verified: 4:1 compression, Little-Endian bit order!\n";
    }

    // 2. Kiểm thử TensorShape, Strides & Bounds Safety
    std::cout << "  [G7.2-2] Testing TensorShape Strides, Contiguity & Bounds...\n";
    {
        tensor::TensorShape s1(128);
        assert(s1.rank() == 1);
        assert(s1.dim(0) == 128);
        assert(s1.stride(0) == 1);
        assert(s1.is_contiguous());

        tensor::TensorShape s2(100, 20);
        assert(s2.rank() == 2);
        assert(s2.dim(0) == 100);
        assert(s2.dim(1) == 20);
        assert(s2.stride(0) == 20);
        assert(s2.stride(1) == 1);
        assert(s2.total_elements() == 2000);
        assert(s2.is_contiguous());
        assert(s2.linear_offset(5, 7) == 5 * 20 + 7);

        bool caught_overflow = false;
        try {
            size_t huge = static_cast<size_t>(-1) / 2;
            tensor::TensorShape s_overflow(huge, 10);
        } catch (const std::overflow_error&) {
            caught_overflow = true;
        }
        assert(caught_overflow);
        std::cout << "    -> TensorShape bounds, row-major strides & overflow protection verified!\n";
    }

    // 3. Kiểm thử TensorView & Zero-Copy Slicing
    std::cout << "  [G7.2-3] Testing TensorView & Zero-Copy Strided Slicing...\n";
    {
        int32_t raw_matrix[12] = {
            10, 20, 30, 40,
            50, 60, 70, 80,
            90, 100, 110, 120
        };
        tensor::TensorShape shape(3, 4);
        tensor::TensorView view(raw_matrix, shape, tensor::TensorDType::INT32);

        assert(view.at<int32_t>(0, 0) == 10);
        assert(view.at<int32_t>(1, 2) == 70);
        assert(view.at<int32_t>(2, 3) == 120);

        // Slice rows 1..2 (length=2)
        tensor::TensorView row_slice = view.slice(0, 1, 2);
        assert(row_slice.shape().dim(0) == 2);
        assert(row_slice.shape().dim(1) == 4);
        assert(row_slice.at<int32_t>(0, 0) == 50);
        assert(row_slice.at<int32_t>(1, 3) == 120);

        // Zero-copy verification: modify original data and observe in slice
        raw_matrix[4] = 999;
        assert(row_slice.at<int32_t>(0, 0) == 999);
        std::cout << "    -> Zero-copy strided view & slicing verified without memory copy!\n";
    }

    // 4. Kiểm thử Tensor Owning Class & Multiplication-Free MatMul
    std::cout << "  [G7.2-4] Testing Tensor Owning Class & Multiplication-Free MatMul...\n";
    {
        tensor::Tensor A(2, 3, tensor::TensorDType::INT32);
        tensor::Tensor B(2, 3, tensor::TensorDType::INT32);

        A.at<int32_t>(0, 0) = 5; A.at<int32_t>(0, 1) = -3; A.at<int32_t>(0, 2) = 10;
        A.at<int32_t>(1, 0) = -2; A.at<int32_t>(1, 1) = 4; A.at<int32_t>(1, 2) = 0;

        B.at<int32_t>(0, 0) = 1; B.at<int32_t>(0, 1) = 2; B.at<int32_t>(0, 2) = 3;
        B.at<int32_t>(1, 0) = 4; B.at<int32_t>(1, 1) = 5; B.at<int32_t>(1, 2) = 6;

        tensor::Tensor C = A.add(B);
        assert(C.at<int32_t>(0, 0) == 6);
        assert(C.at<int32_t>(0, 1) == -1);
        assert(C.at<int32_t>(1, 2) == 6);

        tensor::Tensor R = A.relu();
        assert(R.at<int32_t>(0, 0) == 5);
        assert(R.at<int32_t>(0, 1) == 0); // -3 clamped to 0
        assert(R.at<int32_t>(1, 0) == 0); // -2 clamped to 0

        // Multiplication-Free MatMul with Packed Ternary Weights
        // X = [1, 4] with values: [10, 20, 30, 40]
        tensor::Tensor X(1, 4, tensor::TensorDType::INT32);
        X.at<int32_t>(0, 0) = 10;
        X.at<int32_t>(0, 1) = 20;
        X.at<int32_t>(0, 2) = 30;
        X.at<int32_t>(0, 3) = 40;

        // W = [4, 2] with ternary weights:
        // Col 0: [+1, -1,  0, +1] -> 10*1 + 20*(-1) + 30*0 + 40*1 = 10 - 20 + 0 + 40 = 30
        // Col 1: [-1, -1, +1,  0] -> 10*(-1) + 20*(-1) + 30*1 + 40*0 = -10 - 20 + 30 + 0 = 0
        tensor::Tensor W(4, 2, tensor::TensorDType::TERNARY_PACKED_2B);
        W.set_trit(0, 0, 1);  W.set_trit(0, 1, -1);
        W.set_trit(1, 0, -1); W.set_trit(1, 1, -1);
        W.set_trit(2, 0, 0);  W.set_trit(2, 1, 1);
        W.set_trit(3, 0, 1);  W.set_trit(3, 1, 0);

        tensor::Tensor Y = X.matmul(W);
        assert(Y.shape().dim(0) == 1 && Y.shape().dim(1) == 2);
        assert(Y.at<int32_t>(0, 0) == 30);
        assert(Y.at<int32_t>(0, 1) == 0);
        std::cout << "    -> Multiplication-Free Ternary MatMul evaluated bit-exact outputs: {30, 0}!\n";
    }

    // 5. Kiểm thử Tensor IR & Graph Optimization Pass
    std::cout << "  [G7.2-5] Testing Tensor IR Pattern Matching & Fusion Pass...\n";
    {
        std::vector<compiler::TensorIRNode> graph;

        compiler::TensorIRNode n1;
        n1.op = compiler::TensorOpCode::MATMUL_TERNARY;
        n1.dst = "t1";
        n1.srcs = {"x", "weights"};
        n1.shape = tensor::TensorShape(1, 128);
        graph.push_back(n1);

        compiler::TensorIRNode n2;
        n2.op = compiler::TensorOpCode::ADD_BIAS;
        n2.dst = "t2";
        n2.srcs = {"t1", "bias"};
        n2.shape = tensor::TensorShape(1, 128);
        graph.push_back(n2);

        compiler::TensorIRNode n3;
        n3.op = compiler::TensorOpCode::RELU;
        n3.dst = "out";
        n3.srcs = {"t2"};
        n3.shape = tensor::TensorShape(1, 128);
        graph.push_back(n3);

        assert(graph.size() == 3);

        auto opt_graph = compiler::optimize_tensor_graph(graph);
        assert(opt_graph.size() == 1);
        assert(opt_graph[0].op == compiler::TensorOpCode::FUSED_LINEAR_BIAS_RELU);
        assert(opt_graph[0].dst == "out");
        assert(opt_graph[0].srcs.size() == 3);
        assert(opt_graph[0].srcs[0] == "x");
        assert(opt_graph[0].srcs[1] == "weights");
        assert(opt_graph[0].srcs[2] == "bias");
        std::cout << "    -> Graph pass successfully fused MATMUL + ADD_BIAS + RELU into FUSED_LINEAR_BIAS_RELU!\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2: All Tensor Core & IR Tests Passed (100% Success)       \n";
    std::cout << "===================================================================\n";
}

} // namespace setun::test
