#pragma once

#include "tensor/nn/core/span.hpp"
#include "tensor/nn/core/status.hpp"
#include <string>
#include <string_view>
#include <vector>
#include <unordered_map>
#include <cstdint>
#include <cstddef>
#include <memory>

namespace setun::tensor::nn {

// ============================================================================
// Tokenizer Options
// ============================================================================
struct EncodeOptions {
    bool add_bos{false};
    bool add_eos{false};
    bool add_special_tokens{true};
};

struct DecodeOptions {
    bool skip_special_tokens{true};
};

// ============================================================================
// ITokenizer: Abstract Tokenizer Interface
// Decouples Tokenizer semantics from concrete representations (BPE, TikToken, etc.)
// Supports dual APIs:
//   - Convenience path: returns owning std::vector / std::string
//   - Hot-path / Zero-allocation: encodes / decodes directly into caller buffers
// ============================================================================
class ITokenizer {
public:
    virtual ~ITokenizer() = default;

    virtual size_t vocab_size() const noexcept = 0;
    virtual int64_t bos_token_id() const noexcept = 0;
    virtual int64_t eos_token_id() const noexcept = 0;
    virtual int64_t pad_token_id() const noexcept = 0;
    virtual int64_t unk_token_id() const noexcept = 0;

    virtual bool is_special_token(uint32_t id) const noexcept = 0;
    virtual std::string_view token_to_piece(uint32_t id) const noexcept = 0;
    virtual int64_t piece_to_token(std::string_view piece) const noexcept = 0;

    // Convenience API (cold path)
    virtual std::vector<uint32_t> encode(
        std::string_view text,
        const EncodeOptions& opts = {}) const = 0;

    virtual std::string decode(
        Span<const uint32_t> tokens,
        const DecodeOptions& opts = {}) const = 0;

    std::string decode(
        const std::vector<uint32_t>& tokens,
        const DecodeOptions& opts = {}) const {
        return decode(Span<const uint32_t>(tokens.data(), tokens.size()), opts);
    }

    // Hot-Path Zero-Allocation API
    virtual Status encode_into(
        std::string_view text,
        uint32_t* out_tokens,
        size_t max_tokens,
        size_t& actual_tokens,
        const EncodeOptions& opts = {}) const noexcept = 0;

    virtual Status decode_into(
        Span<const uint32_t> tokens,
        char* out_buf,
        size_t max_bytes,
        size_t& actual_bytes,
        const DecodeOptions& opts = {}) const noexcept = 0;
};

// ============================================================================
// HuggingFaceBPETokenizer: Byte-Pair Encoding Implementation
// Compatible with HuggingFace tokenizer.json and vocab.json + merges.txt
// ============================================================================
class HuggingFaceBPETokenizer : public ITokenizer {
public:
    HuggingFaceBPETokenizer();
    ~HuggingFaceBPETokenizer() override = default;

    // Loaders
    static Result<std::unique_ptr<HuggingFaceBPETokenizer>> load_from_json(const std::string& path);
    static Result<std::unique_ptr<HuggingFaceBPETokenizer>> load_from_json_string(std::string_view json_str);
    static Result<std::unique_ptr<HuggingFaceBPETokenizer>> load_from_vocab_and_merges(
        const std::string& vocab_path,
        const std::string& merges_path);

    // Vocabulary manual manipulation & synthetic setups
    void add_token(std::string piece, uint32_t id, bool is_special = false);
    void add_merge(std::string left, std::string right, uint32_t rank);
    void set_special_ids(int64_t bos, int64_t eos, int64_t pad = -1, int64_t unk = -1);

    // ITokenizer Implementation
    using ITokenizer::decode;
    size_t vocab_size() const noexcept override { return id_to_token_.size(); }
    int64_t bos_token_id() const noexcept override { return bos_id_; }
    int64_t eos_token_id() const noexcept override { return eos_id_; }
    int64_t pad_token_id() const noexcept override { return pad_id_; }
    int64_t unk_token_id() const noexcept override { return unk_id_; }

    bool is_special_token(uint32_t id) const noexcept override;
    std::string_view token_to_piece(uint32_t id) const noexcept override;
    int64_t piece_to_token(std::string_view piece) const noexcept override;

    std::vector<uint32_t> encode(
        std::string_view text,
        const EncodeOptions& opts = {}) const override;

    std::string decode(
        Span<const uint32_t> tokens,
        const DecodeOptions& opts = {}) const override;

    Status encode_into(
        std::string_view text,
        uint32_t* out_tokens,
        size_t max_tokens,
        size_t& actual_tokens,
        const EncodeOptions& opts = {}) const noexcept override;

    Status decode_into(
        Span<const uint32_t> tokens,
        char* out_buf,
        size_t max_bytes,
        size_t& actual_bytes,
        const DecodeOptions& opts = {}) const noexcept override;

private:
    std::unordered_map<std::string, uint32_t> token_to_id_;
    std::vector<std::string> id_to_token_;
    std::vector<bool> is_special_;

    // Merge pair rank: hash of ("left\0right") -> rank
    std::unordered_map<std::string, uint32_t> merge_ranks_;

    int64_t bos_id_{-1};
    int64_t eos_id_{-1};
    int64_t pad_id_{-1};
    int64_t unk_id_{-1};

    // Byte <-> Char mappings for Byte-Level BPE (GPT-2 standard)
    std::vector<std::string> byte_to_piece_;
    std::unordered_map<std::string, uint8_t> piece_to_byte_;
    void init_byte_mappings();

    // Internal BPE segment encoder
    void encode_bpe_segment(std::string_view segment, std::vector<uint32_t>& out) const;
};

} // namespace setun::tensor::nn
