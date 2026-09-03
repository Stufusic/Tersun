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
