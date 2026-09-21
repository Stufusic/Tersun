#include "tensor/nn/format/model_package.hpp"
#include <fstream>
#include <filesystem>

namespace setun::tensor::nn {

namespace fs = std::filesystem;

ModelPackage::ModelPackage(
    std::string model_dir,
    ModelManifest manifest,
    std::string config_path,
    std::string tokenizer_path,
    std::string safetensors_path,
    std::unique_ptr<SafeTensorsFile> weights_file)
    : model_dir_(std::move(model_dir)),
      manifest_(std::move(manifest)),
      config_path_(std::move(config_path)),
      tokenizer_path_(std::move(tokenizer_path)),
      safetensors_path_(std::move(safetensors_path)),
      weights_file_(std::move(weights_file)) {}

Result<std::unique_ptr<ModelPackage>> ModelPackage::load_from_dir(const std::string& dir_path) {
    if (!fs::exists(dir_path) || !fs::is_directory(dir_path)) {
        return Result<std::unique_ptr<ModelPackage>>(
            StatusCode::TensorNotFound, "ModelPackage: directory not found at " + dir_path);
    }

    std::string config_path = dir_path + "/config.json";
    if (!fs::exists(config_path)) {
        return Result<std::unique_ptr<ModelPackage>>(
            StatusCode::TensorNotFound, "ModelPackage: missing config.json in " + dir_path);
    }

    auto manifest_res = ModelManifest::load_from_dir(dir_path);
    if (!manifest_res.ok()) {
        return Result<std::unique_ptr<ModelPackage>>(
            manifest_res.status().code, manifest_res.status().message);
    }

    std::string tokenizer_path = dir_path + "/tokenizer.json";
    // Tokenizer path is recorded if exists, or can be empty if only weights are being evaluated

    std::string safetensors_path = dir_path + "/model.safetensors";
    if (!fs::exists(safetensors_path)) {
        // Search for any .safetensors in dir
        for (const auto& entry : fs::directory_iterator(dir_path)) {
            if (entry.path().extension() == ".safetensors") {
                safetensors_path = entry.path().string();
                break;
            }
        }
    }

    std::unique_ptr<SafeTensorsFile> weights_file = nullptr;
    if (fs::exists(safetensors_path)) {
        weights_file = SafeTensorsFile::load_from_file(safetensors_path);
        if (!weights_file) {
            return Result<std::unique_ptr<ModelPackage>>(
                StatusCode::CheckpointCorrupt, "ModelPackage: failed to parse safetensors at " + safetensors_path);
        }
    }

    auto pkg = std::make_unique<ModelPackage>(
        dir_path,
        manifest_res.value(),
        config_path,
        tokenizer_path,
        safetensors_path,
        std::move(weights_file)
    );

    return Result<std::unique_ptr<ModelPackage>>(std::move(pkg));
}

std::unique_ptr<BitNetModel> ModelPackage::create_model() const {
    BitNetConfig cfg = manifest_.to_bitnet_config();
    return std::make_unique<BitNetModel>(cfg);
}

Status ModelPackage::bind_weights(BitNetModel& model) const {
    if (!weights_file_) {
        return Status(StatusCode::UninitializedState, "ModelPackage: no safetensors file loaded");
    }

    auto res = CheckpointAdapter::load_checkpoint(*weights_file_, model);
    if (!res.ok()) {
        return res.status();
    }

    return Status::OK();
}

} // namespace setun::tensor::nn
