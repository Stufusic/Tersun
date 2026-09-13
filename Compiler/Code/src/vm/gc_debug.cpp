#include "vm/gc_debug.hpp"
#include <cstring>
#include <sstream>

namespace setun {

void GCDebug::poison(void* ptr, size_t bytes) {
    if (!ptr || bytes == 0) return;
    auto* u32 = reinterpret_cast<uint32_t*>(ptr);
    size_t count = bytes / sizeof(uint32_t);
    for (size_t i = 0; i < count; ++i) {
        u32[i] = POISON_DEAD_PATTERN;
    }
}

bool GCDebug::is_valid_heap_pointer(GCHeap& heap, const void* ptr) {
    if (!ptr) return false;
    uintptr_t p = reinterpret_cast<uintptr_t>(ptr);

    GCRegion* r = heap.active_regions();
    while (r) {
        uintptr_t start = reinterpret_cast<uintptr_t>(r->base);
        uintptr_t end = start + r->alloc_offset;
        if (p >= start && p < end) return true;
        r = r->next;
    }
    return false;
}

bool GCDebug::verify_heap(GCHeap& heap, TypeRegistry& types, std::string* error_out) {
    GCRegion* r = heap.active_regions();
    size_t reg_idx = 0;

    while (r) {
        size_t offset = 0;
        while (offset < r->alloc_offset) {
            auto* hdr = reinterpret_cast<GCHeader*>(r->base + offset);
            size_t total_size = sizeof(GCHeader) + hdr->size;
            total_size = (total_size + 7) & ~static_cast<size_t>(7);
            if (total_size < 16) total_size = 16;

            if (offset + total_size > r->capacity) {
                if (error_out) {
                    std::ostringstream oss;
                    oss << "Region " << reg_idx << " overflow: offset " << offset
                        << " + size " << total_size << " > capacity " << r->capacity;
                    *error_out = oss.str();
                }
                return false;
            }

            if (hdr->is_free()) {
                offset += total_size;
                continue;
            }

            const GCTypeDescriptor* desc = types.get_descriptor(hdr->type_id);
            if (!desc) {
                if (error_out) {
                    std::ostringstream oss;
                    oss << "Corrupt type_id " << hdr->type_id << " in region " << reg_idx << " at offset " << offset;
                    *error_out = oss.str();
                }
                return false;
            }

            offset += total_size;
        }
        r = r->next;
        reg_idx++;
    }

    return true;
}

} // namespace setun
