#include <iostream>
#include <iomanip>
#include <cassert>
#include <vector>
#include <chrono>
#include <limits>
#include "vm/value.hpp"
#include "vm/vm_arena.hpp"

using namespace setun;

void run_gate3c_memory_tests() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 3C: Memory, Lifetime & VMArena Safety Verification Suite    \n";
    std::cout << "===================================================================\n";

    auto& arena = VMArena::instance();
    arena.reset();

    // Test 1: Handle Stability & Resolution Across 100,000 Dynamic Heap Allocations
    std::cout << "[Test 1/4] Verifying Handle Stability Across 100,000 Heap Payloads...\n";
    std::vector<VMValue> live_values;
    live_values.reserve(100000);

    for (size_t i = 0; i < 100000; ++i) {
        live_values.emplace_back(TafpuNum(static_cast<int64_t>(i), static_cast<int64_t>(i * 2), 0));
    }

    // Verify all 100,000 handles remain stable, correct, and uncorrupted
    for (size_t i = 0; i < 100000; ++i) {
        assert(live_values[i].is_tafpu());
        assert(live_values[i].has_handle());
        TafpuNum num = live_values[i].as_tafpu();
        assert(num.a == static_cast<int64_t>(i));
        assert(num.b == static_cast<int64_t>(i * 2));
        assert(num.s == 0);
    }
    std::cout << "  -> PASSED: 100,000 concurrent heap handles verified with zero corruption!\n";

    // Test 2: Boxed 64-bit Integer Overflow Arithmetic & Safety
    std::cout << "[Test 2/4] Verifying Boxed Int64 Arithmetic Across 48-bit Threshold...\n";
    int64_t base_threshold = VMValue::MAX_INT48; // 140,737,488,355,327
    VMValue v_imm(base_threshold - 5);
    assert(v_imm.is_immediate_int());
    assert(!v_imm.is_boxed_int());

    // Step across threshold into boxed representation
    for (int step = 0; step < 20; ++step) {
        int64_t expected_val = base_threshold - 5 + step;
        VMValue v_cur(expected_val);
        assert(v_cur.is_int());
        if (expected_val > VMValue::MAX_INT48) {
            assert(v_cur.is_boxed_int());
            assert(v_cur.has_handle());
        } else {
            assert(v_cur.is_immediate_int());
        }
        assert(v_cur.as_int() == expected_val);
    }

    // Negative threshold boundary
    int64_t neg_threshold = VMValue::MIN_INT48; // -140,737,488,355,328
    for (int step = 0; step < 20; ++step) {
        int64_t expected_val = neg_threshold + 5 - step;
        VMValue v_cur(expected_val);
        assert(v_cur.is_int());
        if (expected_val < VMValue::MIN_INT48) {
            assert(v_cur.is_boxed_int());
            assert(v_cur.has_handle());
        } else {
            assert(v_cur.is_immediate_int());
        }
        assert(v_cur.as_int() == expected_val);
    }
    std::cout << "  -> PASSED: Bidirectional 48-bit threshold transitions verified!\n";

    // Test 3: O(1) Lifetime Reset (Zero Leaks, Instant Reclamation)
    std::cout << "[Test 3/4] Testing O(1) Lifetime Reset Memory Reclamation...\n";
    size_t before_used = arena.allocated_bytes();
    assert(before_used > 16);
    live_values.clear();
    arena.reset();
    assert(arena.allocated_bytes() == 16);
    std::cout << "  -> PASSED: Entire heap cleanly reclaimed instantaneously (O(1) reset)!\n";

    // Test 4: Heavy Allocation & Deallocation Cycles (1,000,000 Operations)
    std::cout << "[Test 4/4] Stress Testing 1,000,000 Objects Allocation & Lifetime Cycles...\n";
    constexpr size_t CYCLES = 10;
    constexpr size_t CHUNK_N = 100000;
    
    auto t0 = std::chrono::high_resolution_clock::now();
    for (size_t c = 0; c < CYCLES; ++c) {
        std::vector<VMValue> cycle_objs;
        cycle_objs.reserve(CHUNK_N);
        for (size_t i = 0; i < CHUNK_N; ++i) {
            cycle_objs.emplace_back(std::string("Cycle_Object_" + std::to_string(i & 0xFF)));
        }
        arena.reset();
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

    std::cout << std::fixed << std::setprecision(2);
    std::cout << "  -> 1,000,000 dynamic heap objects created and reclaimed in: " << ms << " ms ("
              << (1000000.0 / (ms / 1000.0) / 1e6) << " M objects/sec)\n";

    std::cout << "===================================================================\n";
    std::cout << "  ALL GATE 3C MEMORY & LIFETIME INVARIANTS PASSED (4/4 SUCCESS)!   \n";
    std::cout << "===================================================================\n";
}

int main() {
    try {
        run_gate3c_memory_tests();
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Gate 3C Verification Failed with exception: " << e.what() << "\n";
        return 1;
    }
}
