#pragma once

#include "tensor/tensor.hpp"
#include <string>
#include <vector>
#include <unordered_map>
#include <cstdint>
#include <cstddef>
#include <memory>

namespace setun::tensor {

struct SafeTensorEntry {
    std::string name;
    std::string dtype;
    std::vector<size_t> shape;
    size_t data_offset_start{0};
    size_t data_offset_end{0};
    const uint8_t* raw_data{nullptr};
    size_t byte_size{0};
};

// ============================================================================
// SafeTensorsFile: Hardened Reader for SafeTensors Model Files
// Strict verification against corrupt, truncated, or malicious inputs
// ============================================================================
class SafeTensorsFile {
public:
    SafeTensorsFile() = default;
    ~SafeTensorsFile();

    // Non-copyable, movable
    SafeTensorsFile(const SafeTensorsFile&) = delete;
    SafeTensorsFile& operator=(const SafeTensorsFile&) = delete;
    SafeTensorsFile(SafeTensorsFile&& other) noexcept;
    SafeTensorsFile& operator=(SafeTensorsFile&& other) noexcept;

    static std::unique_ptr<SafeTensorsFile> load_from_file(const std::string& filepath);
    static std::unique_ptr<SafeTensorsFile> load_from_memory(const uint8_t* buffer, size_t size);

    bool has_tensor(const std::string& name) const;
    const SafeTensorEntry& get_entry(const std::string& name) const;
    std::vector<std::string> tensor_names() const;

    // Zero-copy TensorView into file buffer
    TensorView get_tensor_view(const std::string& name) const;

    // Owning Tensor copy
    Tensor get_tensor(const std::string& name) const;

    size_t file_size() const { return file_size_; }
    size_t header_size() const { return header_size_; }

    // Utility to serialize tensors into standard SafeTensors format
    static void save_to_file(const std::string& filepath,
                             const std::unordered_map<std::string, TensorView>& tensors);

private:
    uint8_t* mapped_data_{nullptr};
    size_t file_size_{0};
    size_t header_size_{0};
    bool owns_buffer_{false};
    std::unordered_map<std::string, SafeTensorEntry> entries_;

    void parse_and_validate(const uint8_t* data, size_t size);
};

} // namespace setun::tensor
