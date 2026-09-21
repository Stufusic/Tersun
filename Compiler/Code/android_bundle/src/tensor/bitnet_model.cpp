#include "tensor/bitnet_model.hpp"
#include "runtime/kernel_registry.hpp"
#include <random>
#include <algorithm>
#include <cstring>
#include <iostream>

namespace setun::tensor {

BitNetMnistModel::BitNetMnistModel() {
    kernels::register_all_bitnet_kernels();
    allocate_activation_buffers();
    resolve_kernels();
}

void BitNetMnistModel::resolve_kernels() {
    const auto& caps = runtime::TargetCapabilities::active();
    auto& reg = runtime::KernelRegistry::instance();
    k_layer1_ = reg.resolve(runtime::KernelOp::FUSED_LINEAR_BIAS_RELU, caps,
                            runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS | runtime::KERNEL_FLAG_FUSED_RELU);
    k_layer2_ = reg.resolve(runtime::KernelOp::GEMM_TERNARY, caps,
                            runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS);
}

void BitNetMnistModel::allocate_activation_buffers() {
    arena_.reset();
    hidden_activation_ = static_cast<int32_t*>(arena_.allocate(HIDDEN_DIM * sizeof(int32_t), 32));
    output_activation_ = static_cast<int32_t*>(arena_.allocate(OUTPUT_DIM * sizeof(int32_t), 32));
    std::memset(hidden_activation_, 0, HIDDEN_DIM * sizeof(int32_t));
    std::memset(output_activation_, 0, OUTPUT_DIM * sizeof(int32_t));
}

void BitNetMnistModel::init_synthetic(int seed) {
    uint32_t state = static_cast<uint32_t>(seed);
    auto lcg_rand = [&state]() -> uint32_t {
        state = state * 1664525u + 1013904223u;
        return state;
    };

    // Fill w1 (128 x 784 packed ternary)
    uint8_t* w1_bytes = static_cast<uint8_t*>(w1_.raw_data());
    size_t w1_byte_count = w1_.byte_size();
    for (size_t i = 0; i < w1_byte_count; ++i) {
        // Generate 4 pseudo-random trits
        int8_t t0 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        int8_t t1 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        int8_t t2 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        int8_t t3 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        w1_bytes[i] = pack_trits_4(t0, t1, t2, t3);
    }

    // Fill b1 (128 int32)
    int32_t* b1_data = static_cast<int32_t*>(b1_.raw_data());
    for (size_t i = 0; i < HIDDEN_DIM; ++i) {
        b1_data[i] = static_cast<int32_t>((lcg_rand() % 21) - 10);
    }

    // Fill w2 (10 x 128 packed ternary)
    uint8_t* w2_bytes = static_cast<uint8_t*>(w2_.raw_data());
    size_t w2_byte_count = w2_.byte_size();
    for (size_t i = 0; i < w2_byte_count; ++i) {
        int8_t t0 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        int8_t t1 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        int8_t t2 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        int8_t t3 = static_cast<int8_t>((lcg_rand() % 3) - 1);
        w2_bytes[i] = pack_trits_4(t0, t1, t2, t3);
    }

    // Fill b2 (10 int32)
    int32_t* b2_data = static_cast<int32_t*>(b2_.raw_data());
    for (size_t i = 0; i < OUTPUT_DIM; ++i) {
        b2_data[i] = static_cast<int32_t>((lcg_rand() % 11) - 5);
    }
}

void BitNetMnistModel::load_safetensors(const std::string& filepath) {
    auto file = SafeTensorsFile::load_from_file(filepath);
    if (file->has_tensor("w1")) w1_ = file->get_tensor("w1");
    if (file->has_tensor("b1")) b1_ = file->get_tensor("b1");
    if (file->has_tensor("w2")) w2_ = file->get_tensor("w2");
    if (file->has_tensor("b2")) b2_ = file->get_tensor("b2");
    resolve_kernels();
}

void BitNetMnistModel::save_safetensors(const std::string& filepath) const {
    std::unordered_map<std::string, TensorView> map;
    map["w1"] = w1_.view();
    map["b1"] = b1_.view();
    map["w2"] = w2_.view();
    map["b2"] = b2_.view();
    SafeTensorsFile::save_to_file(filepath, map);
}

int32_t BitNetMnistModel::forward(const int32_t* input_784, int32_t* out_logits) {
    if (!k_layer1_ || !k_layer2_) {
        resolve_kernels();
    }

    // ========================================================================
    // Layer 1: [1 x 784] @ [128 x 784]^T + Bias [128] -> ReLU -> [1 x 128]
    // ========================================================================
    runtime::KernelContext ctx1;
    ctx1.input = input_784;
    ctx1.weights = w1_.raw_data();
    ctx1.bias = b1_.raw_data();
    ctx1.output = hidden_activation_;
    ctx1.M = 1;
    ctx1.N = HIDDEN_DIM;
    ctx1.K = INPUT_DIM;
    ctx1.input_dtype = runtime::KERNEL_DTYPE_INT32;
    ctx1.weight_dtype = runtime::KERNEL_DTYPE_PACKED_TERNARY_2B;
    ctx1.output_dtype = runtime::KERNEL_DTYPE_INT32;
    ctx1.flags = runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS | runtime::KERNEL_FLAG_FUSED_RELU;

    if (k_layer1_) {
        k_layer1_(ctx1);
    } else {
        // Fallback directly to reference scalar
        kernels::gemm_packed_bias_relu_scalar(input_784,
                                              static_cast<const uint8_t*>(w1_.raw_data()),
                                              static_cast<const int32_t*>(b1_.raw_data()),
                                              hidden_activation_,
                                              1, HIDDEN_DIM, INPUT_DIM);
    }

    // ========================================================================
    // Layer 2: [1 x 128] @ [10 x 128]^T + Bias [10] -> [1 x 10]
    // ========================================================================
    runtime::KernelContext ctx2;
    ctx2.input = hidden_activation_;
    ctx2.weights = w2_.raw_data();
    ctx2.bias = b2_.raw_data();
    ctx2.output = output_activation_;
    ctx2.M = 1;
    ctx2.N = OUTPUT_DIM;
    ctx2.K = HIDDEN_DIM;
    ctx2.input_dtype = runtime::KERNEL_DTYPE_INT32;
    ctx2.weight_dtype = runtime::KERNEL_DTYPE_PACKED_TERNARY_2B;
    ctx2.output_dtype = runtime::KERNEL_DTYPE_INT32;
    ctx2.flags = runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS;

    if (k_layer2_) {
        k_layer2_(ctx2);
    } else {
        kernels::gemm_packed_bias_scalar(hidden_activation_,
                                         static_cast<const uint8_t*>(w2_.raw_data()),
                                         static_cast<const int32_t*>(b2_.raw_data()),
                                         output_activation_,
                                         1, OUTPUT_DIM, HIDDEN_DIM);
    }

    if (out_logits != nullptr) {
        std::memcpy(out_logits, output_activation_, OUTPUT_DIM * sizeof(int32_t));
    }

    // ArgMax classification (0..9)
    int32_t best_class = 0;
    int32_t best_score = output_activation_[0];
    for (size_t c = 1; c < OUTPUT_DIM; ++c) {
        if (output_activation_[c] > best_score) {
            best_score = output_activation_[c];
            best_class = static_cast<int32_t>(c);
        }
    }

    return best_class;
}

void BitNetMnistModel::forward_batch(const int32_t* inputs_batch, int32_t* out_classes, size_t batch_size) {
    for (size_t b = 0; b < batch_size; ++b) {
        out_classes[b] = forward(inputs_batch + b * INPUT_DIM);
    }
}

size_t BitNetMnistModel::total_weight_bytes() const {
    return w1_.byte_size() + b1_.byte_size() + w2_.byte_size() + b2_.byte_size();
}

size_t BitNetMnistModel::total_parameters() const {
    return (HIDDEN_DIM * INPUT_DIM) + HIDDEN_DIM + (OUTPUT_DIM * HIDDEN_DIM) + OUTPUT_DIM;
}

} // namespace setun::tensor
