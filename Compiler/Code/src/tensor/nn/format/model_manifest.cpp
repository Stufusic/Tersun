#include "tensor/nn/format/model_manifest.hpp"
#include <fstream>
#include <sstream>
#include <cctype>
#include <algorithm>

namespace setun::tensor::nn {

namespace {

// Lightweight zero-dependency JSON token helper
void skip_whitespace(std::string_view s, size_t& pos) {
    while (pos < s.size() && (std::isspace(static_cast<unsigned char>(s[pos])) || s[pos] == '\r' || s[pos] == '\n')) {
        pos++;
    }
}

bool find_key(std::string_view json, std::string_view key, size_t& val_pos) {
    std::string pattern = "\"" + std::string(key) + "\"";
    size_t pos = json.find(pattern);
    if (pos == std::string_view::npos) return false;
    pos = json.find(':', pos + pattern.size());
    if (pos == std::string_view::npos) return false;
    pos++;
    skip_whitespace(json, pos);
    val_pos = pos;
    return true;
}

bool parse_size_t(std::string_view json, std::string_view key, size_t& out) {
    size_t pos = 0;
    if (!find_key(json, key, pos)) return false;
    if (pos >= json.size()) return false;
    size_t end = pos;
    while (end < json.size() && (std::isdigit(static_cast<unsigned char>(json[end])))) {
        end++;
    }
    if (end > pos) {
        try {
            out = std::stoull(std::string(json.substr(pos, end - pos)));
            return true;
        } catch (...) {}
    }
    return false;
}

bool parse_int64(std::string_view json, std::string_view key, int64_t& out) {
    size_t pos = 0;
    if (!find_key(json, key, pos)) return false;
    if (pos >= json.size()) return false;
    size_t end = pos;
    if (json[end] == '-') end++;
    while (end < json.size() && (std::isdigit(static_cast<unsigned char>(json[end])))) {
        end++;
    }
    if (end > pos) {
        try {
            out = std::stoll(std::string(json.substr(pos, end - pos)));
            return true;
        } catch (...) {}
    }
    return false;
}

bool parse_float(std::string_view json, std::string_view key, float& out) {
    size_t pos = 0;
    if (!find_key(json, key, pos)) return false;
    if (pos >= json.size()) return false;
    size_t end = pos;
    while (end < json.size() && (std::isdigit(static_cast<unsigned char>(json[end])) || json[end] == '.' ||
                                json[end] == '-' || json[end] == '+' || json[end] == 'e' || json[end] == 'E')) {
        end++;
    }
    if (end > pos) {
        try {
            out = std::stof(std::string(json.substr(pos, end - pos)));
            return true;
        } catch (...) {}
    }
    return false;
}

bool parse_string(std::string_view json, std::string_view key, std::string& out) {
    size_t pos = 0;
    if (!find_key(json, key, pos)) return false;
    if (pos >= json.size() || json[pos] != '\"') return false;
    pos++;
    size_t end = json.find('\"', pos);
    if (end != std::string_view::npos) {
        out = std::string(json.substr(pos, end - pos));
        return true;
    }
    return false;
}

bool parse_bool(std::string_view json, std::string_view key, bool& out) {
    size_t pos = 0;
    if (!find_key(json, key, pos)) return false;
    if (json.substr(pos, 4) == "true") {
        out = true;
        return true;
    } else if (json.substr(pos, 5) == "false") {
        out = false;
        return true;
    }
    return false;
}

void parse_eos_token_ids(std::string_view json, std::vector<uint32_t>& out) {
    size_t pos = 0;
    if (!find_key(json, "eos_token_id", pos)) return;
    if (pos >= json.size()) return;

    if (json[pos] == '[') {
        pos++;
        while (pos < json.size() && json[pos] != ']') {
            skip_whitespace(json, pos);
            if (pos >= json.size() || json[pos] == ']') break;
            size_t end = pos;
            while (end < json.size() && std::isdigit(static_cast<unsigned char>(json[end]))) {
                end++;
            }
            if (end > pos) {
                uint32_t val = static_cast<uint32_t>(std::stoul(std::string(json.substr(pos, end - pos))));
                if (std::find(out.begin(), out.end(), val) == out.end()) {
                    out.push_back(val);
                }
                pos = end;
            }
            skip_whitespace(json, pos);
            if (pos < json.size() && json[pos] == ',') pos++;
        }
    } else if (std::isdigit(static_cast<unsigned char>(json[pos]))) {
        size_t end = pos;
        while (end < json.size() && std::isdigit(static_cast<unsigned char>(json[end]))) {
            end++;
        }
        if (end > pos) {
            uint32_t val = static_cast<uint32_t>(std::stoul(std::string(json.substr(pos, end - pos))));
            if (std::find(out.begin(), out.end(), val) == out.end()) {
                out.push_back(val);
            }
        }
    }
}

} // namespace

Result<ModelManifest> ModelManifest::from_config_json(std::string_view json_str) {
    if (json_str.empty()) {
        return Result<ModelManifest>(StatusCode::CheckpointCorrupt, "Empty config.json");
    }

    ModelManifest m;
    parse_string(json_str, "model_type", m.model_type);
    parse_size_t(json_str, "vocab_size", m.vocab_size);
    parse_size_t(json_str, "hidden_size", m.hidden_size);
    parse_size_t(json_str, "intermediate_size", m.intermediate_size);
    parse_size_t(json_str, "num_hidden_layers", m.num_hidden_layers);
    parse_size_t(json_str, "num_attention_heads", m.num_attention_heads);

    if (!parse_size_t(json_str, "num_key_value_heads", m.num_key_value_heads)) {
        // Fallback: MHA (KV heads == Q heads) if not specified
        m.num_key_value_heads = m.num_attention_heads;
    }

    if (!parse_size_t(json_str, "head_dim", m.head_dim)) {
        if (m.num_attention_heads > 0) {
            m.head_dim = m.hidden_size / m.num_attention_heads;
        }
    }

    parse_size_t(json_str, "max_position_embeddings", m.max_position_embeddings);
    parse_float(json_str, "rms_norm_eps", m.rms_norm_eps);
    parse_float(json_str, "rope_theta", m.rope_theta);
    parse_bool(json_str, "tie_word_embeddings", m.tie_word_embeddings);

    parse_int64(json_str, "bos_token_id", m.bos_token_id);
    parse_int64(json_str, "pad_token_id", m.pad_token_id);
    parse_int64(json_str, "unk_token_id", m.unk_token_id);
    parse_eos_token_ids(json_str, m.eos_token_ids);

    return Result<ModelManifest>(m);
}

Status ModelManifest::parse_generation_config_json(std::string_view json_str) {
    if (json_str.empty()) return Status::OK();

    parse_float(json_str, "temperature", default_temperature);
    parse_float(json_str, "top_p", default_top_p);
    
    size_t k_val = 0;
    if (parse_size_t(json_str, "top_k", k_val)) {
        default_top_k = static_cast<int32_t>(k_val);
    }

    parse_float(json_str, "repetition_penalty", default_repetition_penalty);
    parse_float(json_str, "presence_penalty", default_presence_penalty);
    parse_float(json_str, "frequency_penalty", default_frequency_penalty);
    parse_size_t(json_str, "max_new_tokens", default_max_new_tokens);

    parse_int64(json_str, "bos_token_id", bos_token_id);
    parse_int64(json_str, "pad_token_id", pad_token_id);
    parse_eos_token_ids(json_str, eos_token_ids);

    return Status::OK();
}

Result<ModelManifest> ModelManifest::load_from_dir(const std::string& dir_path) {
    std::string config_path = dir_path + "/config.json";
    std::ifstream cfg_file(config_path);
    if (!cfg_file.is_open()) {
        return Result<ModelManifest>(StatusCode::TensorNotFound, "Could not open config.json at " + config_path);
    }
    std::stringstream cfg_ss;
    cfg_ss << cfg_file.rdbuf();
    std::string cfg_str = cfg_ss.str();

    auto res = from_config_json(cfg_str);
    if (!res.ok()) return res;

    ModelManifest manifest = res.value();

    // Optionally parse generation_config.json if present
    std::string gen_path = dir_path + "/generation_config.json";
    std::ifstream gen_file(gen_path);
    if (gen_file.is_open()) {
        std::stringstream gen_ss;
        gen_ss << gen_file.rdbuf();
        manifest.parse_generation_config_json(gen_ss.str());
    }

    return Result<ModelManifest>(manifest);
}

} // namespace setun::tensor::nn
