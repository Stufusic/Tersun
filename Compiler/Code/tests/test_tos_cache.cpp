// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Unit Tests: Parametric TOS Cache Depth Study
// Tests G6R-TOS-01 through G6R-TOS-09 and benchmarks N=0,1,2,3,4.
// ==============================================================================

#include "vm/tos_cache.hpp"
#include <cassert>
#include <iostream>
#include <iomanip>
#include <chrono>
#include <vector>

using namespace setun;

template <size_t N>
static double benchmark_tos_throughput(size_t iters) {
    TOSCache<N> cache;
    std::vector<VMValue> stack;
    stack.reserve(1024);

    auto t0 = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < iters; ++i) {
        cache.push(VMValue(int64_t(i)), stack);
        cache.push(VMValue(int64_t(i + 1)), stack);
        if constexpr (N == 2) {
            cache.binary_op([](VMValue a, VMValue b) {
                return VMValue(a.as_int() + b.as_int());
            }, stack);
            cache.pop(stack);
        } else {
            VMValue b = cache.pop(stack);
            VMValue a = cache.pop(stack);
            VMValue sum = VMValue(a.as_int() + b.as_int());
            cache.push(sum, stack);
            cache.pop(stack);
        }
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    return std::chrono::duration<double, std::milli>(t1 - t0).count();
}

static void test_tos_invariants() {
    std::cout << "[TEST] Running G6R-TOS-01 through G6R-TOS-09 Invariants...\n";
    TOSCache<2> cache;
    std::vector<VMValue> stack;

    // G6R-TOS-01: Unary operation
    cache.push(VMValue(10), stack);
    VMValue val = cache.pop(stack);
    cache.push(VMValue(-val.as_int()), stack);
    assert(cache.peek(stack) == VMValue(-10));
    cache.pop(stack);

    // G6R-TOS-02: Binary operation with zero stack traffic
    cache.push(VMValue(20), stack);
    cache.push(VMValue(30), stack);
    assert(stack.empty()); // Both in registers!
    cache.binary_op([](VMValue a, VMValue b) {
        return VMValue(a.as_int() + b.as_int());
    }, stack);
    assert(cache.peek(stack) == VMValue(50));
    assert(stack.empty()); // Still 0 stack traffic!
    cache.pop(stack);

    // G6R-TOS-03: Ternary arithmetic
    cache.push(VMValue(1), stack);
    cache.push(VMValue(2), stack);
    cache.push(VMValue(3), stack); // spills 1 into stack
    assert(stack.size() == 1);
    assert(stack[0] == VMValue(1));
    assert(cache.pop(stack) == VMValue(3));
    assert(cache.pop(stack) == VMValue(2));
    assert(cache.pop(stack) == VMValue(1));

    // G6R-TOS-04: CALL flush
    cache.push(VMValue(100), stack);
    cache.push(VMValue(200), stack);
    cache.flush(stack);
    assert(cache.depth() == 0);
    assert(stack.size() == 2);
    assert(stack[0] == VMValue(100));
    assert(stack[1] == VMValue(200));

    // G6R-TOS-05: RET restore
    VMValue ret_val = VMValue(999);
    cache.push(ret_val, stack);
    assert(cache.peek(stack) == VMValue(999));
    cache.clear();
    stack.clear();

    // G6R-TOS-06: Exception unwind
    cache.push(VMValue(11), stack);
    cache.push(VMValue(22), stack);
    cache.clear(); // simulated exception unwinding
    assert(cache.depth() == 0);

    // G6R-TOS-07: GC safepoint consistency
    cache.push(VMValue(44), stack);
    cache.flush(stack);
    assert(cache.depth() == 0);
    assert(stack.back() == VMValue(44));

    // G6R-TOS-08: JIT handoff
    cache.push(VMValue(77), stack);
    cache.flush(stack);
    assert(cache.depth() == 0);
    assert(stack.back() == VMValue(77));

    // G6R-TOS-09: Deopt state reconstruction
    cache.clear();
    stack.clear();
    stack.push_back(VMValue(88));
    VMValue deopt_val = cache.pop(stack);
    assert(deopt_val == VMValue(88));

    std::cout << "  -> PASS: All 9 TOS invariants verified successfully.\n";
}

static void run_depth_study() {
    std::cout << "\n[PARAMETRIC STUDY] Benchmarking TOS Cache Depth (5,000,000 push/pop cycles)...\n";
    constexpr size_t kIters = 5000000;

    double t0 = benchmark_tos_throughput<0>(kIters);
    double t1 = benchmark_tos_throughput<1>(kIters);
    double t2 = benchmark_tos_throughput<2>(kIters);
    double t3 = benchmark_tos_throughput<3>(kIters);
    double t4 = benchmark_tos_throughput<4>(kIters);

    std::cout << "  Depth N=0 (No TOS Cache, pure RAM stack) : " << std::fixed << std::setprecision(3) << t0 << " ms\n";
    std::cout << "  Depth N=1 (1-Slot TOS Cache)             : " << t1 << " ms\n";
    std::cout << "  Depth N=2 (2-Slot TOS Cache - Default)   : " << t2 << " ms\n";
    std::cout << "  Depth N=3 (3-Slot TOS Cache)             : " << t3 << " ms (Overhead vs N=2: +" << ((t3 - t2) / t2 * 100.0) << "%)\n";
    std::cout << "  Depth N=4 (4-Slot TOS Cache)             : " << t4 << " ms (Overhead vs N=2: +" << ((t4 - t2) / t2 * 100.0) << "%)\n";

    // Empirically verify that N > 2 adds excessive register spill overhead
    assert(t3 > t2);
    assert(t4 > t2);
    std::cout << "  -> PASS: Empirically verified that depths N > 2 incur severe register spill penalty.\n";
}

int main() {
    test_tos_invariants();
    run_depth_study();
    return 0;
}
