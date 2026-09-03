#pragma once

#include <cstdint>
#include <array>
#include <string>
#include <string_view>
#include <optional>
#include <vector>
#include <iostream>

namespace setun {

// Trit states in balanced ternary logic: {-1, 0, +1}
enum class Trit : int8_t {
    NEG = -1,  // Represented by 'T' or 't' or '-'
    ZERO = 0,  // Represented by '0'
    POS = 1    // Represented by '1' or '+'
};

// Convert Trit to char ('T', '0', '1')
constexpr char trit_to_char(Trit t) {
    switch (t) {
        case Trit::NEG: return 'T';
        case Trit::ZERO: return '0';
        case Trit::POS: return '1';
    }
    return '?';
}

// Convert char ('T', 't', '-', '0', '1', '+') to Trit
constexpr std::optional<Trit> char_to_trit(char c) {
    switch (c) {
        case 'T':
        case 't':
        case '-': return Trit::NEG;
        case '0': return Trit::ZERO;
        case '1':
        case '+': return Trit::POS;
        default: return std::nullopt;
    }
}

// Single Trit full addition result
struct TritAddResult {
    Trit sum;
    Trit carry;
};

// Single Trit full addition: sum = a + b + c_in, carry = carry_out
// Satisfies Table 1 in BTVP specification
constexpr TritAddResult trit_full_add(Trit a, Trit b, Trit carry_in = Trit::ZERO) {
    int val = static_cast<int>(a) + static_cast<int>(b) + static_cast<int>(carry_in);
    // Range of val is [-3, +3]
    switch (val) {
        case -3: return { Trit::ZERO, Trit::NEG }; // -3 = -1 * 3 + 0
        case -2: return { Trit::POS,  Trit::NEG }; // -2 = -1 * 3 + 1
        case -1: return { Trit::NEG,  Trit::ZERO };// -1 =  0 * 3 - 1
        case 0:  return { Trit::ZERO, Trit::ZERO };//  0 =  0 * 3 + 0
        case 1:  return { Trit::POS,  Trit::ZERO };// +1 =  0 * 3 + 1
        case 2:  return { Trit::NEG,  Trit::POS }; // +2 =  1 * 3 - 1
        case 3:  return { Trit::ZERO, Trit::POS }; // +3 =  1 * 3 + 0
        default: return { Trit::ZERO, Trit::ZERO };
    }
}

// Kleene Ternary Logic operations
constexpr Trit trit_not(Trit a) {
    return static_cast<Trit>(-static_cast<int8_t>(a));
}

constexpr Trit trit_min(Trit a, Trit b) { // Kleene AND
    int8_t va = static_cast<int8_t>(a);
    int8_t vb = static_cast<int8_t>(b);
    return static_cast<Trit>(va < vb ? va : vb);
}

constexpr Trit trit_max(Trit a, Trit b) { // Kleene OR
    int8_t va = static_cast<int8_t>(a);
    int8_t vb = static_cast<int8_t>(b);
    return static_cast<Trit>(va > vb ? va : vb);
}

constexpr Trit trit_cmp(int64_t a, int64_t b) {
    if (a < b) return Trit::NEG;
    if (a > b) return Trit::POS;
    return Trit::ZERO;
}

// Tryte representation: 6 Trits packed into int16_t
// Range of 6-trit balanced ternary integer is from -364 to +364 (3^6 = 729 states)
constexpr int16_t MAX_TRYTE_VAL = 364;
constexpr int16_t MIN_TRYTE_VAL = -364;

// Pack 6 trits (index 0 = lowest order 3^0, index 5 = highest order 3^5) to int16_t
constexpr int16_t pack_tryte(const std::array<Trit, 6>& trits) {
    int16_t val = 0;
    int16_t power = 1;
    for (size_t i = 0; i < 6; ++i) {
        val += static_cast<int16_t>(trits[i]) * power;
        power *= 3;
    }
    return val;
}

// Unpack int16_t to 6 trits (index 0 = 3^0, index 5 = 3^5)
std::array<Trit, 6> unpack_tryte(int16_t val);

// Balanced ternary string conversion: e.g. 14 -> "1TTT", 25 -> "10T1", 39 -> "1110"
std::string to_ternary_string(int64_t val);
int64_t from_ternary_string(std::string_view s);

// Trace struct for BTVP Trit-by-trit addition (Table 1 verification)
struct BtvpTraceStep {
    int power_idx;     // i where 3^i
    int64_t weight;    // 3^i
    Trit trit_a;
    Trit trit_b;
    Trit carry_in;
    int total_sum;     // a + b + c_in
    Trit trit_result;
    Trit carry_out;
};

// Simulate BTVP multi-trit addition with cycle-by-cycle trace
std::pair<int64_t, std::vector<BtvpTraceStep>> btvp_add_with_trace(int64_t a, int64_t b);

} // namespace setun
