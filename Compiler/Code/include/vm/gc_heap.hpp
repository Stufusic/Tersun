#pragma once

#include "vm/gc_header.hpp"
#include "vm/type_descriptor.hpp"
#include "vm/vm_arena.hpp"
#include <cstdint>
#include <cstddef>
#include <vector>
#include <array>
#include <memory>
#include <mutex>

namespace setun {

// ============================================================================
// Gate 5.6A: 2-Tier Managed GC Heap Architecture
// - Tier 1: Fresh 64KB Bump-Allocated Regions
// - Tier 2: Segregated Free Lists (16B - 4KB) for recycling dead swept slots
// - Large Object Allocator: Direct-managed blocks for objects > 4KB
// ============================================================================

struct FreeSlot {
    FreeSlot* next{nullptr};
};

struct GCRegion {
    uint8_t* base{nullptr};
    size_t alloc_offset{0};
    size_t capacity{64 * 1024};
    GCRegion* next{nullptr};

    bool has_space(size_t total_bytes) const {
        return alloc_offset + total_bytes <= capacity;
    }
};

class GCHeap {
public:
    static constexpr size_t REGION_SIZE = 64 * 1024; // 64 KB
    static constexpr size_t MAX_SMALL_SIZE = 4096;   // 4 KB

    // Segregated Free List Classes: 16B, 32B, 64B, 128B, 256B, 512B, 1024B, 2048B, 4096B
    static constexpr size_t NUM_FREE_CLASSES = 9;
    static constexpr std::array<size_t, NUM_FREE_CLASSES> FREE_CLASS_SIZES = {
        16, 32, 64, 128, 256, 512, 1024, 2048, 4096
    };

    static GCHeap& instance() {
        static GCHeap s_instance;
        return s_instance;
    }

    GCHeap();
    ~GCHeap();

    // Disable copy
    GCHeap(const GCHeap&) = delete;
    GCHeap& operator=(const GCHeap&) = delete;

    // Allocate memory with GCHeader prefix
    void* allocate(size_t payload_bytes, uint32_t type_id);

    // Free a swept block back to segregated list
    void recycle_small(void* payload, size_t total_size);

    // Large object management
    void free_large(GCHeader* hdr);

    // Heap stats
    size_t bytes_allocated() const { return bytes_allocated_; }
    size_t bytes_live() const { return bytes_live_; }
    size_t peak_bytes() const { return peak_bytes_; }
    size_t region_count() const { return region_count_; }
    size_t gc_count() const { return gc_count_; }

    void record_sweep(size_t freed_bytes) {
        if (bytes_live_ >= freed_bytes) bytes_live_ -= freed_bytes;
        else bytes_live_ = 0;
        gc_count_++;
    }

    // Accessors for GC Engine
    GCRegion* active_regions() { return head_region_; }
    GCHeader* large_objects() { return head_large_; }
    void set_large_objects(GCHeader* list) { head_large_ = list; }

    // Clear and reset entire heap
    void reset();

    // Size class index helper
    static int get_size_class_index(size_t total_size);

private:
    void* allocate_small(size_t total_size, uint32_t type_id);
    void* allocate_large(size_t total_size, uint32_t type_id);
    GCRegion* create_region();

    // 2-Tier Allocator State
    GCRegion* head_region_{nullptr};
    GCRegion* current_region_{nullptr};
    std::array<FreeSlot*, NUM_FREE_CLASSES> free_lists_{};

    // Large objects linked list (using payload as next pointer or explicit chain)
    GCHeader* head_large_{nullptr};

    size_t bytes_allocated_{0};
    size_t bytes_live_{0};
    size_t peak_bytes_{0};
    size_t region_count_{0};
    size_t gc_count_{0};

    std::vector<GCRegion*> all_regions_;
};

} // namespace setun
