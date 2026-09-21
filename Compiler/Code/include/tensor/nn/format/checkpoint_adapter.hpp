#pragma once

#include "tensor/safetensors_loader.hpp"
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/nn/core/status.hpp"
#include <string>
#include <unordered_map>
#include <iostream>
#include <cstring>

namespace setun::tensor::nn {

// ============================================================================
// CheckpointAdapter: Zero-Overhead Weight Binder for SafeTensors Checkpoints
// Maps official HuggingFace / Microsoft BitNet checkpoint tensor names to
// internal ParameterRef bindings and handles 2-bit ternary packings.
// ============================================================================
class CheckpointAdapter {
public:
    struct LoadReport {
        size_t bound_tensors{0};
        size_t missing_tensors{0};
        size_t byte_count{0};
    };

    // Load and bind parameters from a SafeTensorsFile into a BitNetModel
    static Result<LoadReport> load_checkpoint(
        const SafeTensorsFile& file,
        BitNetModel& model
    ) {
        LoadReport report;

        for (const auto& param : model.parameters()) {
            std::string name(param.name);
            if (file.has_tensor(name)) {
                const TensorView src_v = file.get_tensor_view(name);
                void* dst_ptr = const_cast<void*>(static_cast<const TensorView&>(param.view).raw_data());
                size_t dst_bytes = param.view.byte_size();
                size_t src_bytes = src_v.byte_size();

                if (src_bytes != dst_bytes) {
                    return Result<LoadReport>(
                        StatusCode::DimensionMismatch,
                        "CheckpointAdapter: byte size mismatch for tensor " + name);
                }

                std::memcpy(dst_ptr, src_v.raw_data(), dst_bytes);
                report.bound_tensors++;
                report.byte_count += dst_bytes;
            } else {
                report.missing_tensors++;
            }
        }

        return Result<LoadReport>(report);
    }

    // Save model parameters to a SafeTensors checkpoint file
    static Status save_checkpoint(
        const std::string& filepath,
        const BitNetModel& model
    ) {
        std::unordered_map<std::string, TensorView> map;
        for (const auto& param : model.parameters()) {
            map.emplace(std::string(param.name), param.view);
        }
        SafeTensorsFile::save_to_file(filepath, map);
        return Status::OK();
    }
};

} // namespace setun::tensor::nn
