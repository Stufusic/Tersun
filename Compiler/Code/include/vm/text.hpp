#pragma once

// Minimal UTF-8 helpers shared by the VM and the Setun2D bridge.
// Strings in Tersun are byte strings holding UTF-8; these helpers are used
// only at system boundaries (rendering, keyboard input, unicode-aware
// string methods). Plain len()/substr()/indexing stay byte-based.

#include <cstdint>
#include <string>
#include <utility>

namespace setun::text {

constexpr uint32_t REPLACEMENT_CHAR = 0xFFFD;

// Encode one Unicode codepoint as UTF-8 (1-4 bytes). Invalid codepoints
// encode as the replacement character.
inline std::string utf8_encode(uint32_t cp) {
    std::string out;
    if (cp <= 0x7F) {
        out.push_back(static_cast<char>(cp));
    } else if (cp <= 0x7FF) {
        out.push_back(static_cast<char>(0xC0 | (cp >> 6)));
        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else if (cp <= 0xFFFF) {
        out.push_back(static_cast<char>(0xE0 | (cp >> 12)));
        out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else if (cp <= 0x10FFFF) {
        out.push_back(static_cast<char>(0xF0 | (cp >> 18)));
        out.push_back(static_cast<char>(0x80 | ((cp >> 12) & 0x3F)));
        out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else {
        return utf8_encode(REPLACEMENT_CHAR);
    }
    return out;
}

// Decode the codepoint starting at byte index i. Returns {codepoint,
// next_index}; invalid sequences yield REPLACEMENT_CHAR and advance one byte.
inline std::pair<uint32_t, size_t> utf8_decode_next(const std::string& s, size_t i) {
    if (i >= s.size()) return {REPLACEMENT_CHAR, i};
    uint8_t b0 = static_cast<uint8_t>(s[i]);
    if (b0 < 0x80) return {b0, i + 1};

    auto continuation = [&](uint8_t b) -> bool {
        return (b & 0xC0) == 0x80;
    };

    if ((b0 & 0xE0) == 0xC0) {
        if (i + 1 < s.size() && continuation(static_cast<uint8_t>(s[i + 1]))) {
            uint32_t cp = ((b0 & 0x1F) << 6) | (static_cast<uint8_t>(s[i + 1]) & 0x3F);
            if (cp >= 0x80) return {cp, i + 2};
        }
        return {REPLACEMENT_CHAR, i + 1};
    }
    if ((b0 & 0xF0) == 0xE0) {
        if (i + 2 < s.size() && continuation(static_cast<uint8_t>(s[i + 1]))
            && continuation(static_cast<uint8_t>(s[i + 2]))) {
            uint32_t cp = ((b0 & 0x0F) << 12)
                          | ((static_cast<uint8_t>(s[i + 1]) & 0x3F) << 6)
                          | (static_cast<uint8_t>(s[i + 2]) & 0x3F);
            if (cp >= 0x800 && !(cp >= 0xD800 && cp <= 0xDFFF)) return {cp, i + 3};
        }
        return {REPLACEMENT_CHAR, i + 1};
    }
    if ((b0 & 0xF8) == 0xF0) {
        if (i + 3 < s.size() && continuation(static_cast<uint8_t>(s[i + 1]))
            && continuation(static_cast<uint8_t>(s[i + 2]))
            && continuation(static_cast<uint8_t>(s[i + 3]))) {
            uint32_t cp = ((b0 & 0x07) << 18)
                          | ((static_cast<uint8_t>(s[i + 1]) & 0x3F) << 12)
                          | ((static_cast<uint8_t>(s[i + 2]) & 0x3F) << 6)
                          | (static_cast<uint8_t>(s[i + 3]) & 0x3F);
            if (cp >= 0x10000 && cp <= 0x10FFFF) return {cp, i + 4};
        }
        return {REPLACEMENT_CHAR, i + 1};
    }
    // Stray continuation byte or invalid lead byte.
    return {REPLACEMENT_CHAR, i + 1};
}

// Number of Unicode codepoints in a UTF-8 string.
inline size_t utf8_codepoint_count(const std::string& s) {
    size_t count = 0;
    size_t i = 0;
    while (i < s.size()) {
        auto [cp, next] = utf8_decode_next(s, i);
        (void)cp;
        i = next;
        ++count;
    }
    return count;
}

} // namespace setun::text
