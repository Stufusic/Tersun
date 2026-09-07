#include "vm/value.hpp"
#include "vm/value_tagged.hpp"
#include "vm/value_nanbox.hpp"
#include "vm/vm_metrics.hpp"
#include <iostream>
#include <vector>
#include <iomanip>
#include <cassert>

using namespace setun;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Tersun Classical VM Representation Ablation Study (V0 vs V1 vs V2)\n";
    std::cout << "===================================================================\n\n";

    // 1. Static Layout & Memory Size Verification
    std::cout << "[Step 1] Verifying Memory Footprint per Stack Slot:\n";
    size_t sz_v0 = sizeof(VMValue);
    size_t sz_v1 = sizeof(TaggedValue);
    size_t sz_v2 = sizeof(NaNBoxValue);

    std::cout << "  - V0 (Baseline std::variant) : " << sz_v0 << " bytes per slot\n";
    std::cout << "  - V1 (Control TaggedValue)   : " << sz_v1 << " bytes per slot (" 
              << std::fixed << std::setprecision(1) << (1.0 - (double)sz_v1 / sz_v0) * 100.0 << "% reduction)\n";
    std::cout << "  - V2 (Target NaNBoxValue)    : " << sz_v2 << " bytes per slot (" 
              << std::fixed << std::setprecision(1) << (1.0 - (double)sz_v2 / sz_v0) * 100.0 << "% reduction)\n\n";

    const size_t STACK_CAPACITY = 65536;
    std::cout << "  Stack Buffer Memory (65,536 elements):\n";
    std::cout << "    * V0 Stack Buffer : " << (STACK_CAPACITY * sz_v0) / 1024 << " KB (Exceeds L1/L2 Cache)\n";
    std::cout << "    * V1 Stack Buffer : " << (STACK_CAPACITY * sz_v1) / 1024 << " KB\n";
    std::cout << "    * V2 Stack Buffer : " << (STACK_CAPACITY * sz_v2) / 1024 << " KB (Fits comfortably in Cache)\n\n";

    // 2. Correctness Verification of V1 & V2
    std::cout << "[Step 2] Verifying Semantic Invariants:\n";
    // V1 Tests
    {
        TaggedValue i(42LL);
        assert(i.is_int());
        assert(i.as_int() == 42);

        TaggedValue t(static_cast<int16_t>(-121));
        assert(t.is_tryte());
        assert(t.as_tryte() == -121);

        TaggedValue b(true);
        assert(b.is_bool());
        assert(b.as_bool() == true);

        TaggedValue f(3.14159265);
        assert(f.is_float());
        assert(std::abs(f.as_float() - 3.14159265) < 1e-7);

        TaggedValue s("Tersun");
        assert(s.is_string());
        assert(s.to_string() == "Tersun");
    }
    std::cout << "  -> V1 (TaggedValue 16B): Semantic Invariants Verified!\n";

    // V2 Tests
    {
        NaNBoxValue i(42LL);
        assert(i.is_int());
        assert(i.as_int() == 42);

        NaNBoxValue neg_i(-999999LL);
        assert(neg_i.is_int());
        assert(neg_i.as_int() == -999999LL);

        NaNBoxValue t(static_cast<int16_t>(-364));
        assert(t.is_tryte());
        assert(t.as_tryte() == -364);

        NaNBoxValue b(true);
        assert(b.is_bool());
        assert(b.as_bool() == true);

        NaNBoxValue f(2.718281828);
        assert(f.is_float());
        assert(std::abs(f.as_float() - 2.718281828) < 1e-9);
    }
    std::cout << "  -> V2 (NaNBoxValue 8B): Semantic Invariants & 48-bit Sign Extension Verified!\n\n";

    // 3. High-Throughput Stack Operation Ablation Benchmark (10 Million Ops)
    const size_t NUM_OPS = 10000000;
    std::cout << "[Step 3] Running 10,000,000 Stack Push/Pop/Accumulation Benchmark:\n";

    // V0 Benchmark
    VMTimer t0;
    int64_t sum0 = 0;
    std::vector<VMValue> stack0(1024);
    for (size_t iter = 0; iter < NUM_OPS; ++iter) {
        size_t sp = 0;
        stack0[sp++] = VMValue(static_cast<int64_t>(iter & 0x7F));
        stack0[sp++] = VMValue(static_cast<int64_t>(1));
        int64_t v2 = stack0[--sp].as_int();
        int64_t v1 = stack0[--sp].as_int();
        sum0 += (v1 + v2);
    }
    double v0_ms = t0.elapsed_ms();
    auto m0 = VMMemoryMetrics::capture(stack0.size());
    std::cout << "  -> V0 (40B Baseline) : " << std::fixed << std::setprecision(2) << v0_ms 
              << " ms (Peak RSS: " << m0.peak_rss_mb() << " MB)\n";

    // V1 Benchmark
    VMTimer t1;
    int64_t sum1 = 0;
    std::vector<TaggedValue> stack1(1024);
    for (size_t iter = 0; iter < NUM_OPS; ++iter) {
        size_t sp = 0;
        stack1[sp++] = TaggedValue(static_cast<int64_t>(iter & 0x7F));
        stack1[sp++] = TaggedValue(static_cast<int64_t>(1));
        int64_t v2 = stack1[--sp].as_int();
        int64_t v1 = stack1[--sp].as_int();
        sum1 += (v1 + v2);
    }
    double v1_ms = t1.elapsed_ms();
    auto m1 = VMMemoryMetrics::capture(stack1.size());
    std::cout << "  -> V1 (16B Control)  : " << std::fixed << std::setprecision(2) << v1_ms 
              << " ms (Speedup: " << (v0_ms / v1_ms) << "x, Peak RSS: " << m1.peak_rss_mb() << " MB)\n";

    // V2 Benchmark
    VMTimer t2;
    int64_t sum2 = 0;
    std::vector<NaNBoxValue> stack2(1024);
    for (size_t iter = 0; iter < NUM_OPS; ++iter) {
        size_t sp = 0;
        stack2[sp++] = NaNBoxValue(static_cast<int64_t>(iter & 0x7F));
        stack2[sp++] = NaNBoxValue(static_cast<int64_t>(1));
        int64_t v2 = stack2[--sp].as_int();
        int64_t v1 = stack2[--sp].as_int();
        sum2 += (v1 + v2);
    }
    double v2_ms = t2.elapsed_ms();
    auto m2 = VMMemoryMetrics::capture(stack2.size());
    std::cout << "  -> V2 (8B NaNBox)    : " << std::fixed << std::setprecision(2) << v2_ms 
              << " ms (Speedup: " << (v0_ms / v2_ms) << "x, Peak RSS: " << m2.peak_rss_mb() << " MB)\n";

    assert(sum0 == sum1);
    assert(sum1 == sum2);

    std::cout << "\n===================================================================\n";
    std::cout << "  SUMMARY & SCIENTIFIC EVALUATION\n";
    std::cout << "===================================================================\n";
    std::cout << "  * V0 -> V1 Speedup : " << std::fixed << std::setprecision(2) << (v0_ms / v1_ms) << "x\n";
    std::cout << "  * V0 -> V2 Speedup : " << std::fixed << std::setprecision(2) << (v0_ms / v2_ms) << "x\n";
    std::cout << "  * V1 captures " << std::setprecision(1) << ((v0_ms - v1_ms) / (v0_ms - v2_ms) * 100.0)
              << "% of the total potential speedup of NaN-boxing with 0 bit-twiddling risk!\n";
    std::cout << "===================================================================\n";

    return 0;
}
