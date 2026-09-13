#include "vm/gc_header.hpp"
#include "vm/gc_heap.hpp"
#include "vm/type_descriptor.hpp"
#include "vm/gc_roots.hpp"
#include "vm/gc_engine.hpp"
#include "vm/gc_debug.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <vector>
#include <cassert>

namespace setun {

// Graph Node for Cyclic Tracing
struct GCTestNode {
    uint64_t id{0};
    VMValue next;
    VMValue prev;
};

static void trace_test_node(void* payload, const GCVisitor& visitor) {
    if (!payload) return;
    auto* node = reinterpret_cast<GCTestNode*>(payload);
    if (node->next.is_heap_type()) {
        void* p = VMArena::instance().from_handle(node->next.handle());
        if (p) visitor(p);
    }
    if (node->prev.is_heap_type()) {
        void* p = VMArena::instance().from_handle(node->prev.handle());
        if (p) visitor(p);
    }
}

void test_gc_tracing_stress() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 5.6F] ST-5: Precise Tracing, Cycles & Deep Graph Stress   \n";
    std::cout << "===================================================================\n";

    auto& heap = GCHeap::instance();
    heap.reset();
    auto& types = TypeRegistry::instance();

    GCTypeDescriptor node_desc;
    node_desc.type_name = "GCTestNode";
    node_desc.instance_size = sizeof(GCTestNode);
    node_desc.trace_fn = trace_test_node;
    uint32_t node_type_id = types.register_type(node_desc);

    GCEngine engine(heap, types);
    VM vm;

    // --- Subtest 1: Cyclic Tri-Node Graph (A -> B -> C -> A) ---
    std::cout << "  [ST-5.1] Cyclic Object Reference Graph (A -> B -> C -> A)...\n";
    {
        void* pA = heap.allocate(sizeof(GCTestNode), node_type_id);
        void* pB = heap.allocate(sizeof(GCTestNode), node_type_id);
        void* pC = heap.allocate(sizeof(GCTestNode), node_type_id);

        auto* nA = new (pA) GCTestNode(); nA->id = 101;
        auto* nB = new (pB) GCTestNode(); nB->id = 102;
        auto* nC = new (pC) GCTestNode(); nC->id = 103;

        uint32_t hA = VMArena::instance().to_handle(pA);
        uint32_t hB = VMArena::instance().to_handle(pB);
        uint32_t hC = VMArena::instance().to_handle(pC);

        nA->next = VMValue::make_heap(HeapSubtype::OBJECT, hB);
        nB->next = VMValue::make_heap(HeapSubtype::OBJECT, hC);
        nC->next = VMValue::make_heap(HeapSubtype::OBJECT, hA);

        // Retain A via LocalHandleScope
        {
            LocalHandleScope<GCTestNode> root_scope(nA);

            size_t before_live = heap.bytes_live();
            size_t freed = engine.collect_garbage(vm);
            assert(freed == 0 && "Active cyclic graph must NOT be collected!");
            assert(heap.bytes_live() == before_live && "Live memory must remain unchanged!");
        }

        // Now root_scope is destroyed: cycle is unreachable
        size_t freed = engine.collect_garbage(vm);
        assert(freed >= 3 * sizeof(GCTestNode) && "Unreachable cyclic graph must be 100% collected!");
        std::cout << "    -> PASSED: Cyclic graph preserved while rooted, 100% collected when unrooted.\n";
    }

    // --- Subtest 2: Deep Linear Linked List (10,000 nodes) ---
    std::cout << "  [ST-5.2] Deep 10,000-Node Linear List Graph...\n";
    {
        void* head_ptr = heap.allocate(sizeof(GCTestNode), node_type_id);
        auto* head_node = new (head_ptr) GCTestNode();
        head_node->id = 0;

        auto* curr = head_node;
        for (uint64_t i = 1; i < 10000; ++i) {
            void* nxt_ptr = heap.allocate(sizeof(GCTestNode), node_type_id);
            auto* nxt_node = new (nxt_ptr) GCTestNode();
            nxt_node->id = i;
            uint32_t h = VMArena::instance().to_handle(nxt_ptr);
            curr->next = VMValue::make_heap(HeapSubtype::OBJECT, h);
            curr = nxt_node;
        }

        // Test with head rooted
        {
            LocalHandleScope<GCTestNode> head_scope(head_node);
            size_t freed = engine.collect_garbage(vm);
            assert(freed == 0 && "Entire 10,000-node list must survive when head is rooted!");
        }

        // Test with head unrooted
        size_t freed = engine.collect_garbage(vm);
        assert(freed >= 10000 * sizeof(GCTestNode) && "Entire 10,000-node list must be freed!");
        std::cout << "    -> PASSED: Deep 10,000-node list marked without stack overflow, fully reclaimed.\n";
    }

    // --- Subtest 3: Heap Integrity & Poison Verification ---
    std::cout << "  [ST-5.3] Heap Integrity & Region Verification...\n";
    {
        std::string err;
        bool valid = GCDebug::verify_heap(heap, types, &err);
        assert(valid && "GCHeap integrity verification must pass!");
        std::cout << "    -> PASSED: Heap integrity formally validated across all regions.\n";
    }

    // --- Subtest 4: Write Barrier Abstraction Invariant ---
    std::cout << "  [ST-5.4] Tri-Color Write Barrier recoloring...\n";
    {
        void* pParent = heap.allocate(sizeof(GCTestNode), node_type_id);
        void* pChild = heap.allocate(sizeof(GCTestNode), node_type_id);

        GCHeader* parent_hdr = GCHeader::from_payload(pParent);
        GCHeader* child_hdr = GCHeader::from_payload(pChild);

        parent_hdr->set_color(GC_COLOR_BLACK);
        child_hdr->set_color(GC_COLOR_WHITE);

        uint32_t hChild = VMArena::instance().to_handle(pChild);
        VMValue child_val = VMValue::make_heap(HeapSubtype::OBJECT, hChild);

        GC_WRITE_BARRIER(pParent, child_val);

        assert(parent_hdr->is_grey() && "Write barrier must shade Black parent to Grey when pointing to White child!");
        std::cout << "    -> PASSED: Tri-Color write barrier invariant verified.\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  ALL ST-5 TRACING & CYCLIC GRAPH TESTS PASSED (100% SUCCESS)!\n";
    std::cout << "===================================================================\n";
}

} // namespace setun
