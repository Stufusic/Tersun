#pragma once

#include "vm/gc_header.hpp"
#include "vm/gc_heap.hpp"
#include "vm/type_descriptor.hpp"
#include "vm/gc_roots.hpp"
#include <vector>
#include <cstdint>
#include <cstddef>
#include <algorithm>

namespace setun {

class VM; // Forward declaration

// ============================================================================
// Gate 5.6D: Non-Moving Mark-Sweep GC Engine & Safepoints
// ============================================================================

class GCEngine {
public:
    static constexpr size_t DEFAULT_THRESHOLD = 4 * 1024 * 1024; // 4 MB initial trigger

    GCEngine(GCHeap& heap = GCHeap::instance(), TypeRegistry& types = TypeRegistry::instance());

    // Mark-Sweep Collection Cycle
    size_t collect_garbage(VM& vm);

    // Safepoint Check - called at OP_CALL, backward loops, and allocation trigger
    inline bool should_collect() const {
        return heap_.bytes_live() >= gc_threshold_;
    }

    void safepoint(VM& vm) {
        if (__builtin_expect(should_collect(), 0)) {
            collect_garbage(vm);
        }
    }

    void set_threshold(size_t bytes) {
        min_threshold_ = bytes;
        gc_threshold_ = bytes;
    }
    size_t threshold() const { return gc_threshold_; }
    size_t total_collections() const { return total_collections_; }
    size_t total_bytes_freed() const { return total_bytes_freed_; }

    void mark_value(const VMValue& val);
    void mark_pointer(void* payload);

private:
    void mark_roots(VM& vm);
    void process_worklist();
    size_t sweep_phase();

    GCHeap& heap_;
    TypeRegistry& types_;
    std::vector<GCHeader*> grey_worklist_;

    size_t min_threshold_{DEFAULT_THRESHOLD};
    size_t gc_threshold_{DEFAULT_THRESHOLD};
    size_t total_collections_{0};
    size_t total_bytes_freed_{0};
};

} // namespace setun
