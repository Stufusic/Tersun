#pragma once

#include "tensor/nn/format/model_manifest.hpp"
#include "tensor/nn/format/checkpoint_adapter.hpp"
#include "tensor/nn/models/bitnet_model.hpp"
#include "tensor/safetensors_loader.hpp"
#include "tensor/nn/core/status.hpp"
#include <string>
#include <memory>

namespace setun::tensor::nn {

// ============================================================================
// ModelPackage: Asset Bundle Manager for Large Language Models
// Coordinates all files on disk (config.json, tokenizer.json, model.safetensors)
// validates integrity and instantiates the BitNetModel with bound weights.
// ============================================================================
class ModelPackage {
public:
    ModelPackage(
        std::string model_dir,
        ModelManifest manifest,
        std::string config_path,
        std::string tokenizer_path,
        std::string safetensors_path,
        std::unique_ptr<SafeTensorsFile> weights_file);

    ~ModelPackage() = default;

    // Factory: Load and validate package from directory
    static Result<std::unique_ptr<ModelPackage>> load_from_dir(const std::string& dir_path);

    // Asset paths & Manifest inspection
    const std::string& model_dir() const noexcept { return model_dir_; }
    const ModelManifest& manifest() const noexcept { return manifest_; }
    const std::string& config_path() const noexcept { return config_path_; }
    const std::string& tokenizer_path() const noexcept { return tokenizer_path_; }
    const std::string& safetensors_path() const noexcept { return safetensors_path_; }
    const SafeTensorsFile& weights() const noexcept { return *weights_file_; }

    // Model Instantiation & Weight Binding
    std::unique_ptr<BitNetModel> create_model() const;
    Status bind_weights(BitNetModel& model) const;

private:
    std::string model_dir_;
    ModelManifest manifest_;
    std::string config_path_;
    std::string tokenizer_path_;
    std::string safetensors_path_;
    std::unique_ptr<SafeTensorsFile> weights_file_;
};

} // namespace setun::tensor::nn
