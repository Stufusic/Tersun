#include "tensor/nn/format/tokenizer.hpp"
#include <fstream>
#include <sstream>
#include <cctype>
#include <algorithm>
#include <cstring>
#include <iostream>

namespace setun::tensor::nn {

namespace {

// Helper: encode a 32-bit unicode code point to UTF-8
std::string codepoint_to_utf8(uint32_t cp) {
    std::string out;
    if (cp <= 0x7F) {
        out.push_back(static_cast<char>(cp));
    } else if (cp <= 0x7FF) {
        out.push_back(static_cast<char>(0xC0 | ((cp >> 6) & 0x1F)));
        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else if (cp <= 0xFFFF) {
        out.push_back(static_cast<char>(0xE0 | ((cp >> 12) & 0x0F)));
        out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else if (cp <= 0x10FFFF) {
        out.push_back(static_cast<char>(0xF0 | ((cp >> 18) & 0x07)));
        out.push_back(static_cast<char>(0x80 | ((cp >> 12) & 0x3F)));
        out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    }
    return out;
}

// Decode one UTF-8 character from string_view at pos, returns code point and advances pos
uint32_t utf8_next(std::string_view s, size_t& pos) {
    if (pos >= s.size()) return 0;
    unsigned char c = static_cast<unsigned char>(s[pos++]);
    if (c <= 0x7F) return c;
    if ((c & 0xE0) == 0xC0) {
        if (pos >= s.size()) return c;
        uint32_t cp = (c & 0x1F) << 6;
        cp |= (static_cast<unsigned char>(s[pos++]) & 0x3F);
        return cp;
    }
    if ((c & 0xF0) == 0xE0) {
        if (pos + 1 >= s.size()) return c;
        uint32_t cp = (c & 0x0F) << 12;
        cp |= (static_cast<unsigned char>(s[pos++]) & 0x3F) << 6;
        cp |= (static_cast<unsigned char>(s[pos++]) & 0x3F);
        return cp;
    }
    if ((c & 0xF8) == 0xF0) {
        if (pos + 2 >= s.size()) return c;
        uint32_t cp = (c & 0x07) << 18;
        cp |= (static_cast<unsigned char>(s[pos++]) & 0x3F) << 12;
        cp |= (static_cast<unsigned char>(s[pos++]) & 0x3F) << 6;
        cp |= (static_cast<unsigned char>(s[pos++]) & 0x3F);
        return cp;
    }
    return c;
}

} // namespace

HuggingFaceBPETokenizer::HuggingFaceBPETokenizer() {
    init_byte_mappings();
}

void HuggingFaceBPETokenizer::init_byte_mappings() {
    byte_to_piece_.resize(256);
    piece_to_byte_.clear();

    uint32_t n = 0;
    for (int b = 0; b < 256; ++b) {
        bool self_map = (b >= '!' && b <= '~') ||
                        (b >= 161 && b <= 172) ||
                        (b >= 174 && b <= 255);
        uint32_t cp = 0;
        if (self_map) {
            cp = static_cast<uint32_t>(b);
        } else {
            cp = 256 + n;
            n++;
        }
        std::string s = codepoint_to_utf8(cp);
        byte_to_piece_[b] = s;
        piece_to_byte_[s] = static_cast<uint8_t>(b);
    }
}

void HuggingFaceBPETokenizer::add_token(std::string piece, uint32_t id, bool is_special) {
    token_to_id_[piece] = id;
    if (id >= id_to_token_.size()) {
        id_to_token_.resize(id + 1);
        is_special_.resize(id + 1, false);
    }
    id_to_token_[id] = piece;
    is_special_[id] = is_special;
}

void HuggingFaceBPETokenizer::add_merge(std::string left, std::string right, uint32_t rank) {
    std::string key = left;
    key.push_back('\0');
    key.append(right);
    merge_ranks_[key] = rank;
}

void HuggingFaceBPETokenizer::set_special_ids(int64_t bos, int64_t eos, int64_t pad, int64_t unk) {
    bos_id_ = bos;
    eos_id_ = eos;
    pad_id_ = pad;
    unk_id_ = unk;

    auto mark_special = [this](int64_t id) {
        if (id >= 0 && static_cast<size_t>(id) < is_special_.size()) {
            is_special_[static_cast<size_t>(id)] = true;
        }
    };
    mark_special(bos);
    mark_special(eos);
    mark_special(pad);
    mark_special(unk);
}

bool HuggingFaceBPETokenizer::is_special_token(uint32_t id) const noexcept {
    if (id < is_special_.size()) {
        return is_special_[id];
    }
    return false;
}

std::string_view HuggingFaceBPETokenizer::token_to_piece(uint32_t id) const noexcept {
    if (id < id_to_token_.size()) {
        return id_to_token_[id];
    }
    return "";
}

int64_t HuggingFaceBPETokenizer::piece_to_token(std::string_view piece) const noexcept {
    auto it = token_to_id_.find(std::string(piece));
    if (it != token_to_id_.end()) {
        return static_cast<int64_t>(it->second);
    }
    return -1;
}

void HuggingFaceBPETokenizer::encode_bpe_segment(std::string_view segment, std::vector<uint32_t>& out) const {
    if (segment.empty()) return;

    // Convert raw UTF-8 bytes to byte-level pieces
    std::vector<std::string> pieces;
    pieces.reserve(segment.size());
    for (unsigned char c : segment) {
        pieces.push_back(byte_to_piece_[c]);
    }

    if (pieces.size() == 1) {
        auto it = token_to_id_.find(pieces[0]);
        if (it != token_to_id_.end()) {
            out.push_back(it->second);
        } else if (unk_id_ >= 0) {
            out.push_back(static_cast<uint32_t>(unk_id_));
        }
        return;
    }

    // Iterative BPE merges
    while (pieces.size() >= 2) {
        int best_pair_idx = -1;
        uint32_t min_rank = UINT32_MAX;

        for (size_t i = 0; i + 1 < pieces.size(); ++i) {
            std::string key = pieces[i];
            key.push_back('\0');
            key.append(pieces[i + 1]);

            auto it = merge_ranks_.find(key);
            if (it != merge_ranks_.end()) {
                if (it->second < min_rank) {
                    min_rank = it->second;
                    best_pair_idx = static_cast<int>(i);
                }
            }
        }

        if (best_pair_idx == -1) {
            break; // No more merges possible
        }

        // Merge best pair
        std::vector<std::string> next_pieces;
        next_pieces.reserve(pieces.size() - 1);
        for (int i = 0; i < static_cast<int>(pieces.size()); ++i) {
            if (i == best_pair_idx) {
                next_pieces.push_back(pieces[i] + pieces[i + 1]);
                i++; // Skip merged partner
            } else {
                next_pieces.push_back(std::move(pieces[i]));
            }
        }
        pieces = std::move(next_pieces);
    }

    // Map merged pieces to IDs
    for (const auto& p : pieces) {
        auto it = token_to_id_.find(p);
        if (it != token_to_id_.end()) {
            out.push_back(it->second);
        } else if (unk_id_ >= 0) {
            out.push_back(static_cast<uint32_t>(unk_id_));
        }
    }
}

std::vector<uint32_t> HuggingFaceBPETokenizer::encode(
    std::string_view text,
    const EncodeOptions& opts) const {
    std::vector<uint32_t> tokens;
    if (opts.add_bos && bos_id_ >= 0) {
        tokens.push_back(static_cast<uint32_t>(bos_id_));
    }

    if (text.empty()) {
        if (opts.add_eos && eos_id_ >= 0) {
            tokens.push_back(static_cast<uint32_t>(eos_id_));
        }
        return tokens;
    }

    // Split text on special tokens if enabled
    size_t cursor = 0;
    while (cursor < text.size()) {
        int best_special_id = -1;
        size_t best_special_pos = std::string_view::npos;
        size_t best_special_len = 0;

        if (opts.add_special_tokens) {
            for (size_t id = 0; id < id_to_token_.size(); ++id) {
                if (is_special_[id] && !id_to_token_[id].empty()) {
                    const std::string& spec = id_to_token_[id];
                    size_t pos = text.find(spec, cursor);
                    if (pos != std::string_view::npos) {
                        if (pos < best_special_pos || (pos == best_special_pos && spec.size() > best_special_len)) {
                            best_special_pos = pos;
                            best_special_len = spec.size();
                            best_special_id = static_cast<int>(id);
                        }
                    }
                }
            }
        }

        if (best_special_pos != std::string_view::npos) {
            // Encode prefix before special token
            if (best_special_pos > cursor) {
                std::string_view prefix = text.substr(cursor, best_special_pos - cursor);
                encode_bpe_segment(prefix, tokens);
            }
            // Add special token
            tokens.push_back(static_cast<uint32_t>(best_special_id));
            cursor = best_special_pos + best_special_len;
        } else {
            // Encode remaining segment
            std::string_view rest = text.substr(cursor);
            encode_bpe_segment(rest, tokens);
            break;
        }
    }

    if (opts.add_eos && eos_id_ >= 0) {
        tokens.push_back(static_cast<uint32_t>(eos_id_));
    }

    return tokens;
}

std::string HuggingFaceBPETokenizer::decode(
    Span<const uint32_t> tokens,
    const DecodeOptions& opts) const {
    std::string out;
    for (size_t i = 0; i < tokens.size(); ++i) {
        uint32_t id = tokens[i];
        if (id >= id_to_token_.size()) continue;

        if (opts.skip_special_tokens && is_special_token(id)) {
            continue;
        }

        const std::string& piece = id_to_token_[id];
        // Decode byte-level piece characters back to raw bytes
        size_t p_pos = 0;
        while (p_pos < piece.size()) {
            size_t old_p = p_pos;
            utf8_next(piece, p_pos);
            std::string char_str = piece.substr(old_p, p_pos - old_p);

            auto it = piece_to_byte_.find(char_str);
            if (it != piece_to_byte_.end()) {
                out.push_back(static_cast<char>(it->second));
            } else {
                out.append(char_str);
            }
        }
    }
    return out;
}

Status HuggingFaceBPETokenizer::encode_into(
    std::string_view text,
    uint32_t* out_tokens,
    size_t max_tokens,
    size_t& actual_tokens,
    const EncodeOptions& opts) const noexcept {
    if (!out_tokens && max_tokens > 0) {
        return Status(StatusCode::InvalidInput, "Tokenizer: null output buffer");
    }

    // Call convenience encode and copy into buffer
    std::vector<uint32_t> vec = encode(text, opts);
    actual_tokens = vec.size();
    if (vec.size() > max_tokens) {
        std::memcpy(out_tokens, vec.data(), max_tokens * sizeof(uint32_t));
        return Status(StatusCode::ArenaBudgetExceeded, "Tokenizer: output buffer too small");
    }

    std::memcpy(out_tokens, vec.data(), vec.size() * sizeof(uint32_t));
    return Status::OK();
}

Status HuggingFaceBPETokenizer::decode_into(
    Span<const uint32_t> tokens,
    char* out_buf,
    size_t max_bytes,
    size_t& actual_bytes,
    const DecodeOptions& opts) const noexcept {
    if (!out_buf && max_bytes > 0) {
        return Status(StatusCode::InvalidInput, "Tokenizer: null output buffer");
    }

    std::string str = decode(tokens, opts);
    actual_bytes = str.size();
    if (str.size() >= max_bytes) {
        if (max_bytes > 0) {
            std::memcpy(out_buf, str.data(), max_bytes - 1);
            out_buf[max_bytes - 1] = '\0';
        }
        return Status(StatusCode::ArenaBudgetExceeded, "Tokenizer: output buffer too small");
    }

    std::memcpy(out_buf, str.data(), str.size());
    out_buf[str.size()] = '\0';
    return Status::OK();
}

// ----------------------------------------------------------------------------
// JSON Parser for tokenizer.json
// ----------------------------------------------------------------------------
Result<std::unique_ptr<HuggingFaceBPETokenizer>> HuggingFaceBPETokenizer::load_from_json(const std::string& path) {
    std::ifstream f(path);
    if (!f.is_open()) {
        return Result<std::unique_ptr<HuggingFaceBPETokenizer>>(
            StatusCode::TensorNotFound, "Could not open tokenizer.json at " + path);
    }
    std::stringstream ss;
    ss << f.rdbuf();
    return load_from_json_string(ss.str());
}

Result<std::unique_ptr<HuggingFaceBPETokenizer>> HuggingFaceBPETokenizer::load_from_json_string(std::string_view json) {
    auto tok = std::make_unique<HuggingFaceBPETokenizer>();

    // 1. Parse vocab from "vocab": { "token": id, ... }
    size_t vocab_pos = json.find("\"vocab\":");
    if (vocab_pos == std::string_view::npos) {
        vocab_pos = json.find("\"vocab\" :");
    }

    if (vocab_pos != std::string_view::npos) {
        size_t open_brace = json.find('{', vocab_pos);
        if (open_brace != std::string_view::npos) {
            size_t p = open_brace + 1;
            while (p < json.size()) {
                // Find next key "token"
                p = json.find('\"', p);
                if (p == std::string_view::npos) break;
                // Check if closing brace was passed
                size_t next_close = json.find('}', open_brace);
                if (next_close != std::string_view::npos && p > next_close) break;

                size_t tok_start = p + 1;
                // Handle escaped quotes
                size_t tok_end = tok_start;
                while (tok_end < json.size()) {
                    if (json[tok_end] == '\"' && json[tok_end - 1] != '\\') {
                        break;
                    }
                    tok_end++;
                }
                if (tok_end >= json.size()) break;

                std::string token_str(json.substr(tok_start, tok_end - tok_start));
                // Unescape \" and \\ if present
                std::string unescaped;
                for (size_t c = 0; c < token_str.size(); ++c) {
                    if (token_str[c] == '\\' && c + 1 < token_str.size()) {
                        if (token_str[c + 1] == '\"' || token_str[c + 1] == '\\') {
                            c++;
                        }
                    }
                    unescaped.push_back(token_str[c]);
                }

                p = json.find(':', tok_end);
                if (p == std::string_view::npos) break;
                p++;
                while (p < json.size() && (std::isspace(static_cast<unsigned char>(json[p])))) p++;

                size_t id_end = p;
                while (id_end < json.size() && std::isdigit(static_cast<unsigned char>(json[id_end]))) id_end++;

                if (id_end > p) {
                    uint32_t id = static_cast<uint32_t>(std::stoul(std::string(json.substr(p, id_end - p))));
                    tok->add_token(unescaped, id, false);
                }
                p = id_end;
                // Find next comma or close brace
                while (p < json.size() && json[p] != ',' && json[p] != '}') p++;
                if (p < json.size() && json[p] == '}') break;
                if (p < json.size() && json[p] == ',') p++;
            }
        }
    }

    // 2. Parse merges from "merges": [ "token1 token2", ... ]
    size_t merges_pos = json.find("\"merges\":");
    if (merges_pos == std::string_view::npos) {
        merges_pos = json.find("\"merges\" :");
    }

    if (merges_pos != std::string_view::npos) {
        size_t open_bracket = json.find('[', merges_pos);
        if (open_bracket != std::string_view::npos) {
            size_t p = open_bracket + 1;
            uint32_t rank = 0;
            while (p < json.size()) {
                p = json.find('\"', p);
                if (p == std::string_view::npos) break;
                size_t next_bracket = json.find(']', open_bracket);
                if (next_bracket != std::string_view::npos && p > next_bracket) break;

                size_t m_start = p + 1;
                size_t m_end = json.find('\"', m_start);
                if (m_end == std::string_view::npos) break;

                std::string merge_line(json.substr(m_start, m_end - m_start));
                size_t space_idx = merge_line.find(' ');
                if (space_idx != std::string_view::npos) {
                    std::string left = merge_line.substr(0, space_idx);
                    std::string right = merge_line.substr(space_idx + 1);
                    tok->add_merge(left, right, rank++);
                }

                p = m_end + 1;
                while (p < json.size() && json[p] != ',' && json[p] != ']') p++;
                if (p < json.size() && json[p] == ']') break;
                if (p < json.size() && json[p] == ',') p++;
            }
        }
    }

    // 3. Parse added_tokens: [ { "id": 128000, "content": "<s>", "special": true }, ... ]
    size_t added_pos = json.find("\"added_tokens\":");
    if (added_pos != std::string_view::npos) {
        size_t p = added_pos;
        while ((p = json.find("\"id\":", p)) != std::string_view::npos) {
            p += 5;
            while (p < json.size() && std::isspace(static_cast<unsigned char>(json[p]))) p++;
            size_t id_end = p;
            while (id_end < json.size() && std::isdigit(static_cast<unsigned char>(json[id_end]))) id_end++;
            if (id_end > p) {
                uint32_t id = static_cast<uint32_t>(std::stoul(std::string(json.substr(p, id_end - p))));
                // Find content
                size_t content_key = json.find("\"content\":", p);
                if (content_key != std::string_view::npos && content_key < p + 200) {
                    size_t c_start = json.find('\"', content_key + 10);
                    if (c_start != std::string_view::npos) {
                        size_t c_end = json.find('\"', c_start + 1);
                        if (c_end != std::string_view::npos) {
                            std::string content(json.substr(c_start + 1, c_end - c_start - 1));
                            tok->add_token(content, id, true);

                            // Detect special ids
                            if (content == "<s>" || content == "<|begin_of_text|>" || content == "<|startoftext|>") {
                                tok->set_special_ids(id, tok->eos_token_id(), tok->pad_token_id(), tok->unk_token_id());
                            } else if (content == "</s>" || content == "<|end_of_text|>" || content == "<|endoftext|>" || content == "<|im_end|>") {
                                tok->set_special_ids(tok->bos_token_id(), id, tok->pad_token_id(), tok->unk_token_id());
                            } else if (content == "<pad>") {
                                tok->set_special_ids(tok->bos_token_id(), tok->eos_token_id(), id, tok->unk_token_id());
                            } else if (content == "<unk>") {
                                tok->set_special_ids(tok->bos_token_id(), tok->eos_token_id(), tok->pad_token_id(), id);
                            }
                        }
                    }
                }
            }
            p = id_end;
        }
    }

    return Result<std::unique_ptr<HuggingFaceBPETokenizer>>(std::move(tok));
}

Result<std::unique_ptr<HuggingFaceBPETokenizer>> HuggingFaceBPETokenizer::load_from_vocab_and_merges(
    const std::string& vocab_path,
    const std::string& merges_path) {
    auto tok = std::make_unique<HuggingFaceBPETokenizer>();

    // Load vocab.json
    std::ifstream v_file(vocab_path);
    if (!v_file.is_open()) {
        return Result<std::unique_ptr<HuggingFaceBPETokenizer>>(
            StatusCode::TensorNotFound, "Could not open vocab file at " + vocab_path);
    }
    std::stringstream v_ss;
    v_ss << v_file.rdbuf();
    std::string v_str = v_ss.str();

    // Read key-value pairs
    size_t p = 0;
    while ((p = v_str.find('\"', p)) != std::string_view::npos) {
        size_t tok_start = p + 1;
        size_t tok_end = v_str.find('\"', tok_start);
        if (tok_end == std::string_view::npos) break;
        std::string token_str(v_str.substr(tok_start, tok_end - tok_start));

        p = v_str.find(':', tok_end);
        if (p == std::string_view::npos) break;
        p++;
        while (p < v_str.size() && std::isspace(static_cast<unsigned char>(v_str[p]))) p++;
        size_t id_end = p;
        while (id_end < v_str.size() && std::isdigit(static_cast<unsigned char>(v_str[id_end]))) id_end++;

        if (id_end > p) {
            uint32_t id = static_cast<uint32_t>(std::stoul(std::string(v_str.substr(p, id_end - p))));
            tok->add_token(token_str, id, false);
        }
        p = id_end;
    }

    // Load merges.txt
    std::ifstream m_file(merges_path);
    if (!m_file.is_open()) {
        return Result<std::unique_ptr<HuggingFaceBPETokenizer>>(
            StatusCode::TensorNotFound, "Could not open merges file at " + merges_path);
    }

    std::string line;
    uint32_t rank = 0;
    while (std::getline(m_file, line)) {
        if (line.empty() || line[0] == '#') continue;
        size_t sp = line.find(' ');
        if (sp != std::string::npos) {
            std::string left = line.substr(0, sp);
            std::string right = line.substr(sp + 1);
            tok->add_merge(left, right, rank++);
        }
    }

    return Result<std::unique_ptr<HuggingFaceBPETokenizer>>(std::move(tok));
}

} // namespace setun::tensor::nn
