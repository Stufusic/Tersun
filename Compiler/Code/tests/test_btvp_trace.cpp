#include "tafpu/trit.hpp"
#include <cassert>
#include <iostream>

namespace setun {

void test_btvp_paper_table1() {
    std::cout << "  [Test] BTVP Table 1 Trit-by-Trit Addition Trace Verification (14 + 25 = 39)...\n";

    int64_t a = 14;
    int64_t b = 25;
    auto [res, trace] = btvp_add_with_trace(a, b);

    // Verify string representation of operands
    assert(to_ternary_string(14) == "1TTT");
    assert(to_ternary_string(25) == "10T1");
    assert(to_ternary_string(39) == "1110");
    assert(res == 39);

    // Verify individual trace steps matching Table 1:
    // Pos 3^0: Trit A = T, Trit B = 1, Carry in = 0, Total = 0, Trit Res = 0, Carry out = 0
    assert(trace[0].trit_a == Trit::NEG);
    assert(trace[0].trit_b == Trit::POS);
    assert(trace[0].carry_in == Trit::ZERO);
    assert(trace[0].total_sum == 0);
    assert(trace[0].trit_result == Trit::ZERO);
    assert(trace[0].carry_out == Trit::ZERO);

    // Pos 3^1: Trit A = T, Trit B = T, Carry in = 0, Total = -2, Trit Res = 1, Carry out = T
    assert(trace[1].trit_a == Trit::NEG);
    assert(trace[1].trit_b == Trit::NEG);
    assert(trace[1].carry_in == Trit::ZERO);
    assert(trace[1].total_sum == -2);
    assert(trace[1].trit_result == Trit::POS);
    assert(trace[1].carry_out == Trit::NEG);

    // Pos 3^2: Trit A = T, Trit B = 0, Carry in = T, Total = -2, Trit Res = 1, Carry out = T
    assert(trace[2].trit_a == Trit::NEG);
    assert(trace[2].trit_b == Trit::ZERO);
    assert(trace[2].carry_in == Trit::NEG);
    assert(trace[2].total_sum == -2);
    assert(trace[2].trit_result == Trit::POS);
    assert(trace[2].carry_out == Trit::NEG);

    // Pos 3^3: Trit A = 1, Trit B = 1, Carry in = T, Total = +1, Trit Res = 1, Carry out = 0
    assert(trace[3].trit_a == Trit::POS);
    assert(trace[3].trit_b == Trit::POS);
    assert(trace[3].carry_in == Trit::NEG);
    assert(trace[3].total_sum == 1);
    assert(trace[3].trit_result == Trit::POS);
    assert(trace[3].carry_out == Trit::ZERO);

    std::cout << "    -> PASSED: All 4 cycles of BTVP Table 1 trace exactly match the paper specification!\n";
}

void test_tryte_packing() {
    std::cout << "  [Test] Tryte (6-trit) Packing and Unpacking...\n";
    // Pack 14 ("001TTT")
    int16_t tryte_14 = 14;
    auto trits = unpack_tryte(tryte_14);
    int16_t repacked = pack_tryte(trits);
    assert(repacked == 14);

    // Test boundaries: -364 and +364
    auto min_trits = unpack_tryte(-364);
    assert(pack_tryte(min_trits) == -364);

    auto max_trits = unpack_tryte(364);
    assert(pack_tryte(max_trits) == 364);
    std::cout << "    -> PASSED: Tryte packing into int16_t operates within [-364, 364] correctly.\n";
}

} // namespace setun
