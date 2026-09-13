#include "vm/gc_heap.hpp"
#include <cstdlib>
#include <cstring>
#include <cassert>

namespace setun {

GCHeap::GCHeap() {
    free_lists_.fill(nullptr);
}

GCHeap::~GCHeap() {
    reset();
}

int GCHeap::get_size_class_index(size_t total_size) {
    for (size_t i = 0; i < NUM_FREE_CLASSES; ++i) {
        if (FREE_CLASS_SIZES[i] >= total_size) {
            return static_cast<int>(i);
        }
    }
    return -1;
}

GCRegion* GCHeap::create_region() {
    void* mem = VMArena::instance().allocate(REGION_SIZE, 64);
    assert(mem != nullptr && "GCHeap: Failed to allocate 64KB region");

    auto* region = new GCRegion();
    region->base = reinterpret_cast<uint8_t*>(mem);
    region->alloc_offset = 0;
    region->capacity = REGION_SIZE;
    region->next = nullptr;

    if (!head_region_) {
        head_region_ = region;
    } else {
        GCRegion* curr = head_region_;
        while (curr->next) curr = curr->next;
        curr->next = region;
    }

    all_regions_.push_back(region);
    region_count_++;
    return region;
}

void* GCHeap::allocate(size_t payload_bytes, uint32_t type_id) {
    size_t total_size = sizeof(GCHeader) + payload_bytes;
    // Align total size to 8 bytes
    total_size = (total_size + 7) & ~static_cast<size_t>(7);
    if (total_size < 16) total_size = 16;

    if (total_size <= MAX_SMALL_SIZE) {
        return allocate_small(total_size, type_id);
    } else {
        return allocate_large(total_size, type_id);
    }
}

void* GCHeap::allocate_small(size_t total_size, uint32_t type_id) {
    int class_idx = get_size_class_index(total_size);
    assert(class_idx >= 0 && class_idx < static_cast<int>(NUM_FREE_CLASSES));
    size_t rounded_size = FREE_CLASS_SIZES[class_idx];

    // Check Segregated Free List for recycled slot
    if (free_lists_[class_idx] != nullptr) {
        FreeSlot* slot = free_lists_[class_idx];
        free_lists_[class_idx] = slot->next;

        auto* hdr = GCHeader::from_payload(slot);
        hdr->type_id = type_id;
        hdr->flags = GC_COLOR_WHITE;
        hdr->size = static_cast<uint32_t>(rounded_size - sizeof(GCHeader));
        hdr->age = 0;

        bytes_live_ += rounded_size;
        if (bytes_live_ > peak_bytes_) peak_bytes_ = bytes_live_;

        // Zero out payload memory for safety
        std::memset(hdr->payload(), 0, hdr->size);
        return hdr->payload();
    }

    // Bump allocate from current 64KB region
    if (!current_region_ || !current_region_->has_space(rounded_size)) {
        current_region_ = create_region();
    }

    uint8_t* ptr = current_region_->base + current_region_->alloc_offset;
    current_region_->alloc_offset += rounded_size;

    auto* hdr = reinterpret_cast<GCHeader*>(ptr);
    hdr->type_id = type_id;
    hdr->flags = GC_COLOR_WHITE;
    hdr->size = static_cast<uint32_t>(rounded_size - sizeof(GCHeader));
    hdr->age = 0;

    bytes_allocated_ += rounded_size;
    bytes_live_ += rounded_size;
    if (bytes_live_ > peak_bytes_) peak_bytes_ = bytes_live_;

    std::memset(hdr->payload(), 0, hdr->size);
    return hdr->payload();
}

void* GCHeap::allocate_large(size_t total_size, uint32_t type_id) {
    void* mem = VMArena::instance().allocate(total_size, 16);
    assert(mem != nullptr && "GCHeap: Failed to allocate large object");

    auto* hdr = reinterpret_cast<GCHeader*>(mem);
    hdr->type_id = type_id;
    hdr->flags = GC_COLOR_WHITE;
    hdr->set_large(true);
    hdr->size = static_cast<uint32_t>(total_size - sizeof(GCHeader));
    hdr->age = 0;

    // Link into large objects chain (stored at the end of the region or in-heap)
    // We maintain a simple linked list where next pointer is stored in the header/payload prefix
    // For large objects, we can chain using a dedicated pointer or reuse age/metadata
    // Here we maintain head_large_
    bytes_allocated_ += total_size;
    bytes_live_ += total_size;
    if (bytes_live_ > peak_bytes_) peak_bytes_ = bytes_live_;

    std::memset(hdr->payload(), 0, hdr->size);
    return hdr->payload();
}

void GCHeap::recycle_small(void* payload, size_t total_size) {
    int class_idx = get_size_class_index(total_size);
    if (class_idx < 0 || class_idx >= static_cast<int>(NUM_FREE_CLASSES)) return;

    GCHeader* hdr = GCHeader::from_payload(payload);
    hdr->set_free(true);
    auto* slot = reinterpret_cast<FreeSlot*>(payload);
    slot->next = free_lists_[class_idx];
    free_lists_[class_idx] = slot;
}

void GCHeap::free_large(GCHeader* hdr) {
    (void)hdr;
    // Managed within VMArena contiguous lifecycle
}

void GCHeap::reset() {
    for (auto* r : all_regions_) {
        delete r;
    }
    all_regions_.clear();
    head_region_ = nullptr;
    current_region_ = nullptr;
    free_lists_.fill(nullptr);
    head_large_ = nullptr;

    bytes_allocated_ = 0;
    bytes_live_ = 0;
    peak_bytes_ = 0;
    region_count_ = 0;
    gc_count_ = 0;
}

} // namespace setun
