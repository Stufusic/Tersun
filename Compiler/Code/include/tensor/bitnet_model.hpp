#pragma once

#include "tensor/tensor.hpp"
#include "tensor/edge_arena.hpp"
#include "tensor/safetensors_loader.hpp"
#include "tensor/kernels/microkernels.hpp"
#include "runtime/target_capabilities.hpp"
#include <memory>
#include <string>
#include <vector>

namespace setun::tensor {

// ============================================================================
// BitNetMnistModel: Reference 1.58-bit Ternary Neural Network
// Architecture: 784 (Input) -> 128 (Hidden + ReLU) -> 10 (Output Classes)
// Storage: ~25.4 KB (15.7x smaller than FP32)
// Execution: 0 Heap Allocations, Multi-Architecture Dynamic Dispatch
// ============================================================================
class BitNetMnistModel {
public:
    static constexpr size_t INPUT_DIM = 784;
    static constexpr size_t HIDDEN_DIM = 128;
    static constexpr size_t OUTPUT_DIM = 10;

    BitNetMnistModel();
    ~BitNetMnistModel() = default;

    // Initialize with synthetic deterministic weights (e.g. for self-tests/benchmarking)
    void init_synthetic(int seed = 42);

    // Load weights from SafeTensors format
    void load_safetensors(const std::string& filepath);

    // Save current model weights to SafeTensors format
    void save_safetensors(const std::string& filepath) const;

    // Zero-allocation forward pass
    // Returns: predicted class index (0..9) via argmax
    int32_t forward(const int32_t* input_784, int32_t* out_logits = nullptr);

    // Batch forward pass
    void forward_batch(const int32_t* inputs_batch, int32_t* out_classes, size_t batch_size);

    // Inspect model parameters and memory footprint
    size_t total_weight_bytes() const;
    size_t total_parameters() const;
    size_t arena_used_bytes() const { return arena_.used_bytes(); }
    void resolve_kernels();

private:
    EdgeArena arena_{64 * 1024}; // 64 KB static arena for activations

    // Owning weight tensors
    Tensor w1_{TensorShape(HIDDEN_DIM, INPUT_DIM), TensorDType::TERNARY_PACKED_2B};
    Tensor b1_{TensorShape(HIDDEN_DIM), TensorDType::INT32};
    Tensor w2_{TensorShape(OUTPUT_DIM, HIDDEN_DIM), TensorDType::TERNARY_PACKED_2B};
    Tensor b2_{TensorShape(OUTPUT_DIM), TensorDType::INT32};

    // Preallocated static activation pointers in EdgeArena (0 allocation during forward)
    int32_t* hidden_activation_{nullptr};
    int32_t* output_activation_{nullptr};

    // Cached pre-resolved kernel dispatch functions (zero lookup/string allocation on hot path)
    runtime::KernelFn k_layer1_{nullptr};
    runtime::KernelFn k_layer2_{nullptr};

    void allocate_activation_buffers();
};

} // namespace setun::tensor
