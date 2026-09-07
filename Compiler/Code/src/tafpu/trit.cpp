#include "tafpu/trit.hpp"
#include <algorithm>
#include <cmath>
#include <sstream>

namespace setun {

std::array<Trit, 6> unpack_tryte(int16_t val) {
    std::array<Trit, 6> trits = {Trit::ZERO, Trit::ZERO, Trit::ZERO, Trit::ZERO, Trit::ZERO, Trit::ZERO};
    int current = val;
    for (size_t i = 0; i < 6; ++i) {
        int rem = ((current % 3) + 3) % 3;
        if (rem == 0) {
            trits[i] = Trit::ZERO;
            current = current / 3;
        } else if (rem == 1) {
            trits[i] = Trit::POS;
            current = (current - 1) / 3;
        } else { // rem == 2
            trits[i] = Trit::NEG;
            current = (current + 1) / 3;
        }
    }
    return trits;
}

std::string to_ternary_string(int64_t val) {
    if (val == 0) return "0";
    std::string result;
    int64_t current = val;
    while (current != 0) {
        int64_t rem = ((current % 3) + 3) % 3;
        if (rem == 0) {
            result.push_back('0');
            current = current / 3;
        } else if (rem == 1) {
            result.push_back('1');
            current = (current + 2) / 3 - 1;
        } else { // rem == 2
            result.push_back('T');
            current = (current + 1) / 3;
        }
    }
    std::reverse(result.begin(), result.end());
    return result;
}

int64_t from_ternary_string(std::string_view s) {
    int64_t result = 0;
    for (char c : s) {
        auto opt_trit = char_to_trit(c);
        if (!opt_trit.has_value()) continue;
        result = result * 3 + static_cast<int64_t>(opt_trit.value());
    }
    return result;
}

std::pair<int64_t, std::vector<BtvpTraceStep>> btvp_add_with_trace(int64_t a, int64_t b) {
    std::string str_a = to_ternary_string(a);
    std::string str_b = to_ternary_string(b);
    
    // Reverse so index 0 is 3^0
    std::reverse(str_a.begin(), str_a.end());
    std::reverse(str_b.begin(), str_b.end());
    
    size_t max_len = std::max(str_a.size(), str_b.size()) + 2;
    std::vector<BtvpTraceStep> trace;
    
    Trit carry = Trit::ZERO;
    std::string res_trits;
    int64_t weight = 1;

    for (size_t i = 0; i < max_len; ++i) {
        Trit ta = (i < str_a.size()) ? char_to_trit(str_a[i]).value_or(Trit::ZERO) : Trit::ZERO;
        Trit tb = (i < str_b.size()) ? char_to_trit(str_b[i]).value_or(Trit::ZERO) : Trit::ZERO;
        
        if (i >= str_a.size() && i >= str_b.size() && carry == Trit::ZERO) {
            break;
        }
        
        int total_sum = static_cast<int>(ta) + static_cast<int>(tb) + static_cast<int>(carry);
        TritAddResult res = trit_full_add(ta, tb, carry);
        
        trace.push_back(BtvpTraceStep{
            static_cast<int>(i),
            weight,
            ta,
            tb,
            carry,
            total_sum,
            res.sum,
            res.carry
        });
        
        res_trits.push_back(trit_to_char(res.sum));
        carry = res.carry;
        weight *= 3;
    }
    
    std::reverse(res_trits.begin(), res_trits.end());
    int64_t total_val = from_ternary_string(res_trits);
    return {total_val, trace};
}

} // namespace setun

#include <chrono>
#include <iostream>
#include <cstdlib>

extern "C" {
int64_t tersun_monotonic_now_us() {
    auto now = std::chrono::steady_clock::now();
    return std::chrono::duration_cast<std::chrono::microseconds>(now.time_since_epoch()).count();
}

int64_t tersun_time_now_us() {
    return tersun_monotonic_now_us();
}

int64_t tersun_safe_mod_i64(int64_t a, int64_t b) {
    if (b == 0) {
        std::cerr << "[Fatal Error] Division by zero in integer modulo.\n";
        std::abort();
    }
    if (a == INT64_MIN && b == -1) return 0;
    return a % b;
}

int16_t tersun_tryte_mod(int16_t a, int16_t b) {
    if (b == 0) {
        std::cerr << "[Fatal Error] Division by zero in tryte modulo.\n";
        std::abort();
    }
    return static_cast<int16_t>(a % b);
}

int16_t tersun_tryte_gf3_xor(int16_t a, int16_t b) {
    auto ta = setun::unpack_tryte(a);
    auto tb = setun::unpack_tryte(b);
    std::array<setun::Trit, 6> res;
    for (size_t i = 0; i < 6; ++i) {
        int sum = static_cast<int>(ta[i]) + static_cast<int>(tb[i]);
        if (sum == 2) res[i] = setun::Trit::NEG;
        else if (sum == -2) res[i] = setun::Trit::POS;
        else res[i] = static_cast<setun::Trit>(sum);
    }
    return setun::pack_tryte(res);
}

int16_t tersun_tryte_kleene_and(int16_t a, int16_t b) {
    auto ta = setun::unpack_tryte(a);
    auto tb = setun::unpack_tryte(b);
    std::array<setun::Trit, 6> res;
    for (size_t i = 0; i < 6; ++i) res[i] = setun::trit_min(ta[i], tb[i]);
    return setun::pack_tryte(res);
}

int16_t tersun_tryte_kleene_or(int16_t a, int16_t b) {
    auto ta = setun::unpack_tryte(a);
    auto tb = setun::unpack_tryte(b);
    std::array<setun::Trit, 6> res;
    for (size_t i = 0; i < 6; ++i) res[i] = setun::trit_max(ta[i], tb[i]);
    return setun::pack_tryte(res);
}

int16_t tersun_tryte_shl(int16_t a, int64_t k) {
    if (k < 0) {
        std::cerr << "[Fatal Error] Negative shift count in tryte shift left.\n";
        std::abort();
    }
    if (k >= 6) return 0;
    if (k == 0) return a;
    auto t = setun::unpack_tryte(a);
    std::array<setun::Trit, 6> res;
    for (size_t i = 0; i < 6; ++i) {
        if (i >= static_cast<size_t>(k)) res[i] = t[i - static_cast<size_t>(k)];
        else res[i] = setun::Trit::ZERO;
    }
    return setun::pack_tryte(res);
}

int16_t tersun_tryte_shr(int16_t a, int64_t k) {
    if (k < 0) {
        std::cerr << "[Fatal Error] Negative shift count in tryte shift right.\n";
        std::abort();
    }
    if (k >= 6) return 0;
    if (k == 0) return a;
    auto t = setun::unpack_tryte(a);
    std::array<setun::Trit, 6> res;
    for (size_t i = 0; i < 6; ++i) {
        if (i + static_cast<size_t>(k) < 6) res[i] = t[i + static_cast<size_t>(k)];
        else res[i] = setun::Trit::ZERO;
    }
    return setun::pack_tryte(res);
}
}
