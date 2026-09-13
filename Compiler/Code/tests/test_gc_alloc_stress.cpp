#include "vm/gc_header.hpp"
#include "vm/gc_heap.hpp"
#include "vm/type_descriptor.hpp"
#include "vm/gc_roots.hpp"
#include "vm/gc_engine.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <vector>
#include <cmath>
#include <cassert>

namespace setun {

struct SmallAllocPayload {
    uint64_t data[4]; // 32 bytes
};

void test_gc_alloc_stress() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 5.6F] ST-6: High-Frequency Allocation Stress (Memory Flatline)\n";
    std::cout << "===================================================================\n";

    auto& heap = GCHeap::instance();
    heap.reset();
    GCRootRegistry::instance().clear();
    auto& types = TypeRegistry::instance();

    GCTypeDescriptor desc;
    desc.type_name = "SmallPayload";
    desc.instance_size = sizeof(SmallAllocPayload);
    uint32_t type_id = types.register_type(desc);

    GCEngine engine(heap, types);
    engine.set_threshold(512 * 1024); // 512 KB tight threshold for stress testing

    VM vm;

    constexpr size_t WORKING_SET_SIZE = 128;
    constexpr size_t TOTAL_ITERATIONS = 1000000; // 1 Million allocations

    std::vector<void*> working_set(WORKING_SET_SIZE, nullptr);

    size_t live_at_warmup = 0;
    size_t live_at_finish = 0;

    std::cout << "  [ST-6.1] Executing 1,000,000 Rapid Allocations under 512KB GC Pressure...\n";

    for (size_t i = 0; i < TOTAL_ITERATIONS; ++i) {
        void* p = heap.allocate(sizeof(SmallAllocPayload), type_id);
        auto* payload = reinterpret_cast<SmallAllocPayload*>(p);
        payload->data[0] = i;

        // Replace older element in working set
        size_t idx = i % WORKING_SET_SIZE;
        if (working_set[idx]) {
            GCRootRegistry::instance().unregister_handle(working_set[idx]);
        }
        working_set[idx] = p;
        GCRootRegistry::instance().register_handle(p);

        // Check safepoint
        if (engine.should_collect()) {
            engine.collect_garbage(vm);
        }

        if (i == 100000) {
            engine.collect_garbage(vm);
            live_at_warmup = heap.bytes_live();
        }
    }

    // Synchronize GC at 1M mark while working set is still active
    engine.collect_garbage(vm);
    live_at_finish = heap.bytes_live();

    // Clean up roots
    for (void* p : working_set) {
        if (p) GCRootRegistry::instance().unregister_handle(p);
    }
    working_set.clear();
    GCRootRegistry::instance().clear();

    // Final post-unroot collection
    engine.collect_garbage(vm);
    size_t live_after_cleanup = heap.bytes_live();

    std::cout << "    -> Collections Triggered  : " << engine.total_collections() << "\n";
    std::cout << "    -> Total Bytes Reclaimed  : " << (engine.total_bytes_freed() / (1024 * 1024)) << " MB\n";
    std::cout << "    -> Live Bytes at 100k     : " << live_at_warmup << " B\n";
    std::cout << "    -> Live Bytes at 1.0M     : " << live_at_finish << " B\n";
    std::cout << "    -> Live Bytes after Clean : " << live_after_cleanup << " B\n";

    // Mathematically verify Memory Flatline: variance between 100k and 1M < 5%
    double drift = std::abs(static_cast<double>(live_at_finish) - static_cast<double>(live_at_warmup)) / static_cast<double>(live_at_warmup);
    std::cout << "    -> Memory Flatline Drift  : " << (drift * 100.0) << "% (Limit: < 5.0%)\n";

    assert(drift < 0.05 && "ST-6 Memory Flatline violated! Drift exceeds 5%!");
    assert(engine.total_collections() > 10 && "GC must trigger repeatedly during stress test!");
    assert(live_after_cleanup == 0 && "All memory must be 100% reclaimed when roots are cleared!");

    std::cout << "===================================================================\n";
    std::cout << "  ALL ST-6 ALLOCATION & FLATLINE TESTS PASSED (100% SUCCESS)!\n";
    std::cout << "===================================================================\n";
}

} // namespace setun
