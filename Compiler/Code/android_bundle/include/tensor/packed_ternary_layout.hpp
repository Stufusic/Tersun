#pragma once

#include <cstdint>
#include <cstddef>
#include <cassert>

namespace setun::tensor {

// ============================================================================
// Specification: PackedTernaryLayout v1
// - Representation: 2 bits per balanced trit {-1, 0, +1}
// - Density: 4 trits per byte (4:1 compression ratio vs int8)
// - Binary Encoding:
//     00b (0) ->  0
//     01b (1) -> +1
//     10b (2) -> -1
//     11b (3) -> Reserved / Padding
// - Trit Ordering in Byte (Little-Endian / LSB first):
//     Bits [1:0] = Trit 0
//     Bits [3:2] = Trit 1
//     Bits [5:4] = Trit 2
//     Bits [7:6] = Trit 3
//     Byte = (T3 << 6) | (T2 << 4) | (T1 << 2) | (T0 << 0)
// ============================================================================

constexpr uint8_t TRIT_CODE_ZERO       = 0b00;
constexpr uint8_t TRIT_CODE_PLUS_ONE   = 0b01;
constexpr uint8_t TRIT_CODE_MINUS_ONE  = 0b10;
constexpr uint8_t TRIT_CODE_PADDING    = 0b11;

constexpr size_t TRITS_PER_BYTE = 4;

inline constexpr size_t calc_packed_bytes(size_t num_trits) {
    return (num_trits + TRITS_PER_BYTE - 1) / TRITS_PER_BYTE;
}

inline constexpr bool is_valid_trit_code(uint8_t code) {
    return code <= 0b10; // 0, 1, 2 are valid numeric trits; 3 is padding
}

inline constexpr uint8_t encode_trit(int8_t val) {
    if (val == 1) return TRIT_CODE_PLUS_ONE;
    if (val == -1) return TRIT_CODE_MINUS_ONE;
    return TRIT_CODE_ZERO;
}

inline constexpr int8_t decode_trit(uint8_t code) {
    if (code == TRIT_CODE_PLUS_ONE) return 1;
    if (code == TRIT_CODE_MINUS_ONE) return -1;
    return 0; // 00b and 11b (padding) map to 0
}

inline void pack_trit_at(uint8_t& byte, size_t pos, int8_t val) {
    assert(pos < TRITS_PER_BYTE);
    size_t shift = pos * 2;
    uint8_t code = encode_trit(val);
    byte &= ~(0b11 << shift);
    byte |= (code << shift);
}

inline int8_t unpack_trit_at(uint8_t byte, size_t pos) {
    assert(pos < TRITS_PER_BYTE);
    size_t shift = pos * 2;
    uint8_t code = (byte >> shift) & 0b11;
    return decode_trit(code);
}

inline uint8_t pack_trits_4(int8_t t0, int8_t t1, int8_t t2, int8_t t3) {
    return static_cast<uint8_t>(
        (encode_trit(t0) << 0) |
        (encode_trit(t1) << 2) |
        (encode_trit(t2) << 4) |
        (encode_trit(t3) << 6)
    );
}

inline void unpack_trits_4(uint8_t byte, int8_t out_trits[4]) {
    out_trits[0] = decode_trit(byte & 0b11);
    out_trits[1] = decode_trit((byte >> 2) & 0b11);
    out_trits[2] = decode_trit((byte >> 4) & 0b11);
    out_trits[3] = decode_trit((byte >> 6) & 0b11);
}

} // namespace setun::tensor
