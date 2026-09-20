#include <iostream>
#include <vector>
#include <chrono>
#include <iomanip>
#include <fstream>
#include <cmath>
#include <numeric>
#include "vm/fixed_frame_arena.hpp"
#include "vm/value.hpp"

using namespace setun;

// Prevent compiler from optimizing away benchmarks
template <typename T>
inline void benchmark_black_box(T* ptr) {
    asm volatile("" : : "g"(ptr) : "memory");
}

struct MicroStats {
    double total_ns{0.0};
    double per_op_ns{0.0};
    double ops_per_sec{0.0};
};

template <typename F>
MicroStats run_bench(size_t iterations, F&& func) {
    // Warmup
    for (size_t i = 0; i < iterations / 10; ++i) {
        func();
    }
    auto t0 = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < iterations; ++i) {
        func();
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double total_ns = std::chrono::duration<double, std::nano>(t1 - t0).count();
    double per_op_ns = total_ns / static_cast<double>(iterations);
    double ops_per_sec = (iterations / total_ns) * 1e9;
    return {total_ns, per_op_ns, ops_per_sec};
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  G6R.2.3 Phase 2.3-A: Frame Cost Microbenchmark Suite (Nanosecond) \n";
    std::cout << "===================================================================\n\n";

    constexpr size_t N = 2'000'000;

    // 1. Dynamic Frame Create & Destroy (Unoptimized Baseline)
    MicroStats dynamic_create_destroy;
    {
        std::vector<CallFrame> stack;
        stack.reserve(64);
        dynamic_create_destroy = run_bench(N, [&]() {
            stack.push_back(CallFrame{100, 0, 0, 32, 50});
            benchmark_black_box(stack.data());
            stack.pop_back();
            benchmark_black_box(stack.data());
        });
    }

    // 2. FixedFrameArena Frame Reuse (Pointer Bump)
    MicroStats arena_reuse;
    {
        FixedFrameArena arena;
        arena_reuse = run_bench(N, [&]() {
            arena.push_back(CallFrame{100, 0, 0, 32, 50});
            benchmark_black_box(arena.data());
            arena.pop_back();
            benchmark_black_box(arena.data());
        });
    }

    // 3. Full Initialization Waste (32 VMValue zero-filling per frame)
    MicroStats full_init;
    {
        VMValue buffer[32];
        full_init = run_bench(N, [&]() {
            for (int i = 0; i < 32; ++i) {
                buffer[i] = VMValue{};
            }
            benchmark_black_box(buffer);
        });
    }

    // 4. Lazy Initialization (Only 1 slot initialized - arg0, remainder dead-until-used)
    MicroStats lazy_init;
    {
        VMValue buffer[32];
        lazy_init = run_bench(N, [&]() {
            buffer[0] = VMValue(static_cast<int64_t>(30));
            benchmark_black_box(buffer);
        });
    }

    // 5. Simulated Interpreter Call & Return Transition (Operand stack pop, frame push, local bump, ret)
    MicroStats interp_transition;
    {
        FixedFrameArena arena;
        VMValue op_stack[16];
        VMValue locals[1024];
        size_t sp = 1;
        op_stack[0] = VMValue(static_cast<int64_t>(30));
        size_t local_top = 0;

        interp_transition = run_bench(N, [&]() {
            // Call: pop arg, bump local, push frame
            VMValue arg = op_stack[--sp];
            size_t new_base = local_top;
            local_top += 4;
            locals[new_base] = arg;
            arena.push_back(CallFrame{1234, new_base, sp, 4, 5678});

            // Return: pop frame, restore local, push ret val
            CallFrame f = arena.back();
            arena.pop_back();
            local_top = f.local_base;
            op_stack[sp++] = locals[new_base];
            benchmark_black_box(locals);
        });
    }

    // 6. Simulated JIT Native Direct Call Transition (RCX = arg, RAX = ret, RSP adjust)
    MicroStats jit_transition;
    {
        jit_transition = run_bench(N, [&]() {
            volatile int64_t arg = 30;
            // Native ABI pass in register
            int64_t rcx = arg;
            // Native direct call simulation
            int64_t rax = rcx; // identity return
            benchmark_black_box(&rax);
        });
    }

    // 7. Recursive Call Chains at Varying Depths
    auto bench_recursive_chain = [](size_t depth, size_t iters) -> double {
        FixedFrameArena arena;
        auto t0 = std::chrono::high_resolution_clock::now();
        for (size_t it = 0; it < iters; ++it) {
            for (size_t d = 0; d < depth; ++d) {
                arena.push_back(CallFrame{d * 4, d * 8, d, 8, 100});
            }
            while (!arena.empty()) {
                arena.pop_back();
            }
        }
        auto t1 = std::chrono::high_resolution_clock::now();
        double total_ns = std::chrono::duration<double, std::nano>(t1 - t0).count();
        return total_ns / (iters * depth);
    };

    double depth_10_ns  = bench_recursive_chain(10, 200'000);
    double depth_30_ns  = bench_recursive_chain(30, 100'000);
    double depth_100_ns = bench_recursive_chain(100, 30'000);
    double depth_500_ns = bench_recursive_chain(500, 10'000);

    // Print Results Table
    std::cout << std::left << std::setw(42) << "Benchmark Component"
              << std::setw(18) << "Per Op (ns)"
              << std::setw(20) << "Throughput (Ops/sec)"
              << "Speedup / Ratio\n";
    std::cout << "----------------------------------------------------------------------------------------\n";
    std::cout << std::fixed << std::setprecision(2);
    
    std::cout << std::left << std::setw(42) << "1. Dynamic Frame (Vector Push/Pop)"
              << std::setw(18) << dynamic_create_destroy.per_op_ns
              << std::setw(20) << dynamic_create_destroy.ops_per_sec
              << "1.00x (Baseline)\n";

    std::cout << std::left << std::setw(42) << "2. FixedFrameArena Reuse (Pointer Bump)"
              << std::setw(18) << arena_reuse.per_op_ns
              << std::setw(20) << arena_reuse.ops_per_sec
              << (dynamic_create_destroy.per_op_ns / arena_reuse.per_op_ns) << "x faster\n";

    std::cout << std::left << std::setw(42) << "3. Full Frame Init (32 Slots Zeroing)"
              << std::setw(18) << full_init.per_op_ns
              << std::setw(20) << full_init.ops_per_sec
              << "1.00x (Wasteful)\n";

    std::cout << std::left << std::setw(42) << "4. Lazy Frame Init (1 Slot Arg Only)"
              << std::setw(18) << lazy_init.per_op_ns
              << std::setw(20) << lazy_init.ops_per_sec
              << (full_init.per_op_ns / lazy_init.per_op_ns) << "x faster\n";

    std::cout << std::left << std::setw(42) << "5. Interpreter Call/Ret Transition"
              << std::setw(18) << interp_transition.per_op_ns
              << std::setw(20) << interp_transition.ops_per_sec
              << "Interpreter\n";

    std::cout << std::left << std::setw(42) << "6. JIT Native Direct Call Transition"
              << std::setw(18) << jit_transition.per_op_ns
              << std::setw(20) << jit_transition.ops_per_sec
              << (interp_transition.per_op_ns / jit_transition.per_op_ns) << "x faster\n";

    std::cout << "----------------------------------------------------------------------------------------\n\n";

    std::cout << "Recursive Call Chain Cost per Frame:\n";
    std::cout << "  Depth 10  : " << depth_10_ns << " ns/frame\n";
    std::cout << "  Depth 30  : " << depth_30_ns << " ns/frame (Canonical W1 Fibonacci depth)\n";
    std::cout << "  Depth 100 : " << depth_100_ns << " ns/frame\n";
    std::cout << "  Depth 500 : " << depth_500_ns << " ns/frame\n\n";

    // Cost Decomposition Calculation
    double alloc_cost_ns = dynamic_create_destroy.per_op_ns - arena_reuse.per_op_ns;
    if (alloc_cost_ns < 0) alloc_cost_ns = 0.0;
    double init_waste_ns = full_init.per_op_ns - lazy_init.per_op_ns;
    if (init_waste_ns < 0) init_waste_ns = 0.0;
    double transition_cost_ns = interp_transition.per_op_ns - arena_reuse.per_op_ns;
    if (transition_cost_ns < 0) transition_cost_ns = 0.0;

    double total_unoptimized_ns = dynamic_create_destroy.per_op_ns + full_init.per_op_ns + interp_transition.per_op_ns;
    double alloc_pct = (alloc_cost_ns / total_unoptimized_ns) * 100.0;
    double init_pct = (init_waste_ns / total_unoptimized_ns) * 100.0;
    double transition_pct = (transition_cost_ns / total_unoptimized_ns) * 100.0;
    double pure_exec_pct = 100.0 - alloc_pct - init_pct - transition_pct;

    std::cout << "Frame Cost Decomposition Matrix:\n";
    std::cout << "  - Allocation Overhead   : " << alloc_cost_ns << " ns (" << alloc_pct << "%)\n";
    std::cout << "  - Initialization Waste  : " << init_waste_ns << " ns (" << init_pct << "%)\n";
    std::cout << "  - Transition / Passing  : " << transition_cost_ns << " ns (" << transition_pct << "%)\n";
    std::cout << "  - Residual Core Logic   : " << pure_exec_pct << "%\n\n";

    // Save JSON Telemetry
    std::ofstream out("benchmarks/g6r2/raw/frame_cost_decomposition.json");
    if (out.is_open()) {
        out << "{\n";
        out << "  \"subgate\": \"G6R.2.3\",\n";
        out << "  \"phase\": \"Phase 2.3-A\",\n";
        out << "  \"sample_size\": " << N << ",\n";
        out << "  \"measurements\": {\n";
        out << "    \"dynamic_frame_create_destroy_ns\": " << dynamic_create_destroy.per_op_ns << ",\n";
        out << "    \"arena_frame_reuse_ns\": " << arena_reuse.per_op_ns << ",\n";
        out << "    \"arena_speedup\": " << (dynamic_create_destroy.per_op_ns / arena_reuse.per_op_ns) << ",\n";
        out << "    \"full_initialization_waste_ns\": " << full_init.per_op_ns << ",\n";
        out << "    \"lazy_initialization_ns\": " << lazy_init.per_op_ns << ",\n";
        out << "    \"lazy_init_speedup\": " << (full_init.per_op_ns / lazy_init.per_op_ns) << ",\n";
        out << "    \"interp_call_ret_transition_ns\": " << interp_transition.per_op_ns << ",\n";
        out << "    \"jit_native_direct_call_ns\": " << jit_transition.per_op_ns << ",\n";
        out << "    \"jit_direct_call_speedup\": " << (interp_transition.per_op_ns / jit_transition.per_op_ns) << ",\n";
        out << "    \"recursive_chain_depth_10_ns\": " << depth_10_ns << ",\n";
        out << "    \"recursive_chain_depth_30_ns\": " << depth_30_ns << ",\n";
        out << "    \"recursive_chain_depth_100_ns\": " << depth_100_ns << ",\n";
        out << "    \"recursive_chain_depth_500_ns\": " << depth_500_ns << "\n";
        out << "  },\n";
        out << "  \"decomposition_percentages\": {\n";
        out << "    \"allocation_overhead_pct\": " << alloc_pct << ",\n";
        out << "    \"initialization_waste_pct\": " << init_pct << ",\n";
        out << "    \"transition_overhead_pct\": " << transition_pct << ",\n";
        out << "    \"residual_core_logic_pct\": " << pure_exec_pct << "\n";
        out << "  }\n";
        out << "}\n";
        std::cout << "[OK] Saved decomposition report to benchmarks/g6r2/raw/frame_cost_decomposition.json\n";
    }

    return 0;
}
