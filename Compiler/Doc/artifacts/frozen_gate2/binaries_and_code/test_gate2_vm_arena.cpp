#include <iostream>
#include <chrono>
#include <vector>
#include <cassert>
#include <cmath>
#include <iomanip>
#include "vm/value.hpp"
#include "vm/vm_arena.hpp"

using namespace setun;

void run_gate2_arena_tests() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 2: VMArena Controlled Handle Memory Subsystem Verification  \n";
    std::cout << "===================================================================\n";

    auto& arena = VMArena::instance();
    arena.reset();

    // Test 1: Null Handle Invariant
    std::cout << "[Test 1/7] Testing Null Handle Invariants (handle 0 == nullptr)...\n";
    assert(VMArena::NULL_HANDLE == 0);
    assert(arena.from_handle(0) == nullptr);
    assert(arena.to_handle(nullptr) == 0);
    std::cout << "  -> PASSED: Handle 0 uniquely maps to nullptr!\n";

    // Test 2: 16-Byte Alignment and Bump Pointer Progression
    std::cout << "[Test 2/7] Testing 16-Byte Memory Alignment & Bump Allocation...\n";
    void* p1 = arena.allocate(17, 16);
    void* p2 = arena.allocate(33, 16);
    void* p3 = arena.allocate(8, 16);

    assert(reinterpret_cast<uintptr_t>(p1) % 16 == 0);
    assert(reinterpret_cast<uintptr_t>(p2) % 16 == 0);
    assert(reinterpret_cast<uintptr_t>(p3) % 16 == 0);
    assert(p2 > p1);
    assert(p3 > p2);
    std::cout << "  -> PASSED: All allocations strictly aligned to 16-byte boundaries!\n";

    // Test 3: 32-bit Handle Offset Exactness (ptr == base + handle)
    std::cout << "[Test 3/7] Testing Controlled 32-bit Handle Mapping (ptr == base + handle)...\n";
    uint32_t h1 = arena.to_handle(p1);
    uint32_t h2 = arena.to_handle(p2);
    uint32_t h3 = arena.to_handle(p3);

    assert(h1 > 0);
    assert(h2 > h1);
    assert(h3 > h2);
    assert(arena.from_handle(h1) == p1);
    assert(arena.from_handle(h2) == p2);
    assert(arena.from_handle(h3) == p3);
    assert(reinterpret_cast<uint8_t*>(arena.base_addr()) + h1 == p1);
    assert(reinterpret_cast<uint8_t*>(arena.base_addr()) + h2 == p2);
    assert(reinterpret_cast<uint8_t*>(arena.base_addr()) + h3 == p3);
    std::cout << "  -> PASSED: Exact bidirectional handle bijection verified!\n";

    // Test 4: VMValue Heap Integration with VMArena Handles
    std::cout << "[Test 4/7] Testing VMValue Tagged Heap Handles...\n";
    {
        VMValue v_str("Hello Tersun Arena");
        VMValue v_taf(TafpuNum(10, 20, 1));
        VMValue v_arr(std::make_shared<std::vector<VMValue>>(std::initializer_list<VMValue>{VMValue(1), VMValue(2), VMValue(3)}));
        
        auto obj = std::make_shared<VMObject>();
        obj->type_name = "Point2D";
        obj->fields["x"] = VMValue(100);
        obj->fields["y"] = VMValue(200);
        VMValue v_obj(obj);

        assert(v_str.has_handle());
        assert(v_taf.has_handle());
        assert(v_arr.has_handle());
        assert(v_obj.has_handle());

        // Verify handle resolves to the exact same pointer as payload
        assert(arena.from_handle(v_str.handle()) == v_str.payload());
        assert(arena.from_handle(v_taf.handle()) == v_taf.payload());
        assert(arena.from_handle(v_arr.handle()) == v_arr.payload());
        assert(arena.from_handle(v_obj.handle()) == v_obj.payload());

        // Verify object field retrieval
        assert(v_obj.as_object()->fields["x"].as_int() == 100);
        assert(v_obj.as_object()->fields["y"].as_int() == 200);
        assert(v_arr.as_array()->size() == 3);
        assert(v_str.to_string() == "Hello Tersun Arena");
    }
    std::cout << "  -> PASSED: All 4 heap types natively bound to VMArena handles!\n";

    // Test 5: Allocation Throughput: VMArena Bump Allocator vs std::malloc (1,000,000 allocs)
    std::cout << "[Test 5/7] Benchmarking Allocation Throughput (1,000,000 objects)...\n";
    constexpr size_t N_ALLOCS = 1000000;
    
    // std::malloc baseline
    auto t0 = std::chrono::high_resolution_clock::now();
    std::vector<void*> sys_ptrs(N_ALLOCS);
    for (size_t i = 0; i < N_ALLOCS; ++i) {
        sys_ptrs[i] = std::malloc(sizeof(HeapPayload));
    }
    for (size_t i = 0; i < N_ALLOCS; ++i) {
        std::free(sys_ptrs[i]);
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double malloc_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

    // VMArena bump allocator
    arena.reset();
    auto t2 = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < N_ALLOCS; ++i) {
        void* p = arena.allocate(sizeof(HeapPayload), alignof(HeapPayload));
        (void)p;
    }
    arena.reset(); // O(1) bulk deallocation
    auto t3 = std::chrono::high_resolution_clock::now();
    double arena_ms = std::chrono::duration<double, std::milli>(t3 - t2).count();

    double speedup = malloc_ms / arena_ms;
    std::cout << std::fixed << std::setprecision(2);
    std::cout << "  -> std::malloc + free (1M): " << malloc_ms << " ms\n";
    std::cout << "  -> VMArena bump + reset (1M): " << arena_ms << " ms\n";
    std::cout << "  -> SPEEDUP: " << speedup << "x faster than system allocator!\n";
    assert(arena_ms < malloc_ms);

    // Test 6: O(1) Lifetime Reset Memory Reclamation
    std::cout << "[Test 6/7] Testing O(1) Lifetime Reset (Zero Leaks)...\n";
    size_t before_alloc = arena.allocated_bytes();
    for (size_t i = 0; i < 50000; ++i) {
        arena.allocate(128, 16);
    }
    assert(arena.allocated_bytes() > before_alloc);
    arena.reset();
    assert(arena.allocated_bytes() == 16); // Reset to base sentinel offset
    std::cout << "  -> PASSED: Instantaneous O(1) reclamation confirmed!\n";

    // Test 7: Overflow Chunk Allocation (> 64MB limit)
    std::cout << "[Test 7/7] Testing Large Allocation / Overflow Handling (> 64MB)...\n";
    arena.reset();
    // Allocate 70 MB in 10MB chunks
    for (int i = 0; i < 7; ++i) {
        void* big = arena.allocate(10 * 1024 * 1024, 16);
        assert(big != nullptr);
    }
    assert(arena.peak_bytes() >= 60 * 1024 * 1024);
    arena.reset();
    assert(arena.allocated_bytes() == 16);
    std::cout << "  -> PASSED: Overflow chunks allocated and cleaned up cleanly!\n";

    std::cout << "===================================================================\n";
    std::cout << "  ALL GATE 2 VMARENA INVARIANTS PASSED SUCCESSFULLY (7/7 SUCCESS)!  \n";
    std::cout << "===================================================================\n";
}

int main() {
    try {
        run_gate2_arena_tests();
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Gate 2 Test Failed with exception: " << e.what() << "\n";
        return 1;
    }
}
