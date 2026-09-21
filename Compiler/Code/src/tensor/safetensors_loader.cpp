#include "tensor/safetensors_loader.hpp"
#include <fstream>
#include <sstream>
#include <cstring>
#include <stdexcept>
#include <limits>
#include <algorithm>

namespace setun::tensor {

SafeTensorsFile::~SafeTensorsFile() {
    if (owns_buffer_ && mapped_data_) {
        std::free(mapped_data_);
        mapped_data_ = nullptr;
    }
}

SafeTensorsFile::SafeTensorsFile(SafeTensorsFile&& other) noexcept
    : mapped_data_(other.mapped_data_),
      file_size_(other.file_size_),
      header_size_(other.header_size_),
      owns_buffer_(other.owns_buffer_),
      entries_(std::move(other.entries_)) {
    other.mapped_data_ = nullptr;
    other.file_size_ = 0;
    other.header_size_ = 0;
    other.owns_buffer_ = false;
}

SafeTensorsFile& SafeTensorsFile::operator=(SafeTensorsFile&& other) noexcept {
    if (this != &other) {
        if (owns_buffer_ && mapped_data_) {
            std::free(mapped_data_);
        }
        mapped_data_ = other.mapped_data_;
        file_size_ = other.file_size_;
        header_size_ = other.header_size_;
        owns_buffer_ = other.owns_buffer_;
        entries_ = std::move(other.entries_);

        other.mapped_data_ = nullptr;
        other.file_size_ = 0;
        other.header_size_ = 0;
        other.owns_buffer_ = false;
    }
    return *this;
}

std::unique_ptr<SafeTensorsFile> SafeTensorsFile::load_from_file(const std::string& filepath) {
    std::ifstream file(filepath, std::ios::binary | std::ios::ate);
    if (!file.is_open()) {
        throw std::runtime_error("Failed to open SafeTensors file: " + filepath);
    }

    std::streamsize size = file.tellg();
    if (size < 8) {
        throw std::runtime_error("SafeTensors file truncated or too small (< 8 bytes)");
    }
    file.seekg(0, std::ios::beg);

    uint8_t* buffer = static_cast<uint8_t*>(std::malloc(size));
    if (!buffer) {
        throw std::bad_alloc();
    }

    if (!file.read(reinterpret_cast<char*>(buffer), size)) {
        std::free(buffer);
        throw std::runtime_error("Failed to read file contents: " + filepath);
    }

    auto instance = std::make_unique<SafeTensorsFile>();
    instance->mapped_data_ = buffer;
    instance->file_size_ = static_cast<size_t>(size);
    instance->owns_buffer_ = true;
    instance->parse_and_validate(buffer, instance->file_size_);
    return instance;
}

std::unique_ptr<SafeTensorsFile> SafeTensorsFile::load_from_memory(const uint8_t* buffer, size_t size) {
    if (size < 8) {
        throw std::runtime_error("Buffer too small to contain SafeTensors header (< 8 bytes)");
    }
    auto instance = std::make_unique<SafeTensorsFile>();
    instance->mapped_data_ = const_cast<uint8_t*>(buffer);
    instance->file_size_ = size;
    instance->owns_buffer_ = false;
    instance->parse_and_validate(buffer, size);
    return instance;
}

// Lightweight JSON metadata parser for SafeTensors headers
static std::string trim(const std::string& s) {
    size_t start = s.find_first_not_of(" \t\r\n");
    if (start == std::string::npos) return "";
    size_t end = s.find_last_not_of(" \t\r\n");
    return s.substr(start, end - start + 1);
}

void SafeTensorsFile::parse_and_validate(const uint8_t* data, size_t size) {
    if (size < 8) {
        throw std::runtime_error("SafeTensors size underflow");
    }

    // First 8 bytes: unsigned 64-bit little-endian integer for header length
    uint64_t header_len = 0;
    std::memcpy(&header_len, data, 8);

    if (header_len == 0 || header_len > 100 * 1024 * 1024) {
        throw std::runtime_error("SafeTensors header size invalid or exceeds sanity limit (100MB): " + std::to_string(header_len));
    }

    if (8 + header_len > size) {
        throw std::runtime_error("SafeTensors header size exceeds total file size");
    }

    header_size_ = static_cast<size_t>(header_len);
    const char* header_str = reinterpret_cast<const char*>(data + 8);
    std::string json(header_str, header_size_);

    const uint8_t* payload_start = data + 8 + header_size_;
    size_t payload_capacity = size - (8 + header_size_);

    // Parse tensor entries in json
    // Format: "tensor_name": {"dtype": "...", "shape": [...], "data_offsets": [start, end]}
    size_t pos = 0;
    while (pos < json.size()) {
        size_t name_start = json.find('"', pos);
        if (name_start == std::string::npos) break;
        size_t name_end = json.find('"', name_start + 1);
        if (name_end == std::string::npos) break;

        std::string key = json.substr(name_start + 1, name_end - name_start - 1);
        pos = name_end + 1;

        if (key == "__metadata__") {
            // Skip metadata object
            continue;
        }

        size_t colon = json.find(':', pos);
        if (colon == std::string::npos) break;
        size_t brace_open = json.find('{', colon);
        if (brace_open == std::string::npos) break;
        size_t brace_close = json.find('}', brace_open);
        if (brace_close == std::string::npos) break;

        std::string tensor_info = json.substr(brace_open, brace_close - brace_open + 1);
        pos = brace_close + 1;

        SafeTensorEntry entry;
        entry.name = key;

        // Parse dtype
        size_t dt_pos = tensor_info.find("\"dtype\"");
        if (dt_pos != std::string::npos) {
            size_t val_start = tensor_info.find('"', tensor_info.find(':', dt_pos) + 1);
            size_t val_end = tensor_info.find('"', val_start + 1);
            if (val_start != std::string::npos && val_end != std::string::npos) {
                entry.dtype = tensor_info.substr(val_start + 1, val_end - val_start - 1);
            }
        }

        // Parse shape
        size_t shape_pos = tensor_info.find("\"shape\"");
        if (shape_pos != std::string::npos) {
            size_t arr_start = tensor_info.find('[', shape_pos);
            size_t arr_end = tensor_info.find(']', arr_start);
            if (arr_start != std::string::npos && arr_end != std::string::npos) {
                std::string shape_str = tensor_info.substr(arr_start + 1, arr_end - arr_start - 1);
                std::stringstream ss(shape_str);
                std::string item;
                while (std::getline(ss, item, ',')) {
                    std::string trimmed = trim(item);
                    if (!trimmed.empty()) {
                        if (trimmed.find('-') != std::string::npos) {
                            throw std::runtime_error("Negative dimension in SafeTensors shape for tensor " + key + ": " + trimmed);
                        }
                        try {
                            entry.shape.push_back(std::stoull(trimmed));
                        } catch (const std::exception& e) {
                            throw std::runtime_error("Invalid shape dimension for tensor " + key + ": " + trimmed);
                        }
                    }
                }
            }
        }

        // Parse data_offsets
        size_t off_pos = tensor_info.find("\"data_offsets\"");
        if (off_pos != std::string::npos) {
            size_t arr_start = tensor_info.find('[', off_pos);
            size_t arr_end = tensor_info.find(']', arr_start);
            if (arr_start != std::string::npos && arr_end != std::string::npos) {
                std::string off_str = tensor_info.substr(arr_start + 1, arr_end - arr_start - 1);
                std::stringstream ss(off_str);
                std::string item;
                std::vector<size_t> offsets;
                while (std::getline(ss, item, ',')) {
                    std::string trimmed = trim(item);
                    if (!trimmed.empty()) {
                        if (trimmed.find('-') != std::string::npos) {
                            throw std::runtime_error("Negative offset in SafeTensors data_offsets for tensor " + key + ": " + trimmed);
                        }
                        try {
                            offsets.push_back(std::stoull(trimmed));
                        } catch (const std::exception& e) {
                            throw std::runtime_error("Invalid data_offset for tensor " + key + ": " + trimmed);
                        }
                    }
                }
                if (offsets.size() >= 2) {
                    entry.data_offset_start = offsets[0];
                    entry.data_offset_end = offsets[1];
                }
            }
        }

        // Hardening & Security Validation
        if (entry.data_offset_start > entry.data_offset_end) {
            throw std::runtime_error("Corrupted SafeTensors offsets: start > end for tensor " + key);
        }
        if (entry.data_offset_end > payload_capacity) {
            throw std::runtime_error("SafeTensors offset out of bounds: exceeds payload size for tensor " + key);
        }

        // Enforce disjoint non-overlapping data ranges across tensors
        for (const auto& [existing_name, existing_entry] : entries_) {
            size_t max_start = std::max(entry.data_offset_start, existing_entry.data_offset_start);
            size_t min_end = std::min(entry.data_offset_end, existing_entry.data_offset_end);
            if (max_start < min_end) {
                throw std::runtime_error("SafeTensors overlapping tensor data ranges detected between '" 
                                         + existing_name + "' and '" + key + "'");
            }
        }

        entry.byte_size = entry.data_offset_end - entry.data_offset_start;
        entry.raw_data = payload_start + entry.data_offset_start;

        entries_[key] = entry;
    }
}

bool SafeTensorsFile::has_tensor(const std::string& name) const {
    return entries_.find(name) != entries_.end();
}

const SafeTensorEntry& SafeTensorsFile::get_entry(const std::string& name) const {
    auto it = entries_.find(name);
    if (it == entries_.end()) {
        throw std::out_of_range("Tensor not found in SafeTensors: " + name);
    }
    return it->second;
}

std::vector<std::string> SafeTensorsFile::tensor_names() const {
    std::vector<std::string> names;
    for (const auto& [k, _] : entries_) {
        names.push_back(k);
    }
    return names;
}

TensorView SafeTensorsFile::get_tensor_view(const std::string& name) const {
    const auto& entry = get_entry(name);
    TensorShape shape(entry.shape);

    TensorDType dt = TensorDType::INT8;
    if (entry.dtype == "I32") dt = TensorDType::INT32;
    else if (entry.dtype == "I64") dt = TensorDType::INT64;
    else if (entry.dtype == "F32") dt = TensorDType::FLOAT32;
    else if (entry.dtype == "F64") dt = TensorDType::FLOAT64;
    else if (entry.dtype == "TERNARY_PACKED" || entry.dtype == "I8") {
        // Stored as packed ternary or int8 bytes
        dt = TensorDType::TERNARY_PACKED_2B;
    }

    return TensorView(entry.raw_data, shape, dt);
}

Tensor SafeTensorsFile::get_tensor(const std::string& name) const {
    const auto& entry = get_entry(name);
    TensorShape shape(entry.shape);
    TensorDType dt = TensorDType::INT8;
    if (entry.dtype == "I32") dt = TensorDType::INT32;
    else if (entry.dtype == "TERNARY_PACKED" || entry.dtype == "I8") dt = TensorDType::TERNARY_PACKED_2B;

    Tensor result(shape, dt);
    size_t copy_bytes = std::min(result.byte_size(), entry.byte_size);
    std::memcpy(result.raw_data(), entry.raw_data, copy_bytes);
    return result;
}

void SafeTensorsFile::save_to_file(const std::string& filepath,
                                  const std::unordered_map<std::string, TensorView>& tensors) {
    std::ostringstream json_ss;
    json_ss << "{";

    size_t current_offset = 0;
    bool first = true;

    struct SerializedMeta {
        std::string name;
        std::string dtype;
        std::vector<size_t> shape;
        size_t start;
        size_t end;
        const void* raw_data;
        size_t byte_len;
    };
    std::vector<SerializedMeta> metas;

    for (const auto& [name, view] : tensors) {
        size_t byte_len = view.byte_size();
        std::string dt_str = "I8";
        if (view.dtype() == TensorDType::INT32) dt_str = "I32";
        else if (view.dtype() == TensorDType::INT64) dt_str = "I64";
        else if (view.dtype() == TensorDType::FLOAT32) dt_str = "F32";
        else if (view.dtype() == TensorDType::FLOAT64) dt_str = "F64";
        else if (view.dtype() == TensorDType::TERNARY_PACKED_2B) dt_str = "TERNARY_PACKED";

        metas.push_back({name, dt_str, view.shape().dims(), current_offset, current_offset + byte_len, view.raw_data(), byte_len});
        current_offset += byte_len;
    }

    for (const auto& meta : metas) {
        if (!first) json_ss << ", ";
        first = false;
        json_ss << "\"" << meta.name << "\": {";
        json_ss << "\"dtype\": \"" << meta.dtype << "\", ";
        json_ss << "\"shape\": [";
        for (size_t i = 0; i < meta.shape.size(); ++i) {
            json_ss << meta.shape[i];
            if (i + 1 < meta.shape.size()) json_ss << ", ";
        }
        json_ss << "], ";
        json_ss << "\"data_offsets\": [" << meta.start << ", " << meta.end << "]";
        json_ss << "}";
    }
    json_ss << "}";

    std::string json_str = json_ss.str();
    uint64_t header_len = json_str.size();

    std::ofstream out(filepath, std::ios::binary);
    if (!out.is_open()) {
        throw std::runtime_error("Failed to create SafeTensors output file: " + filepath);
    }

    out.write(reinterpret_cast<const char*>(&header_len), 8);
    out.write(json_str.data(), header_len);

    for (const auto& meta : metas) {
        out.write(reinterpret_cast<const char*>(meta.raw_data), meta.byte_len);
    }
}

} // namespace setun::tensor
