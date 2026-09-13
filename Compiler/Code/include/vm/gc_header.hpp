#pragma once

#include <cstdint>
#include <cstddef>
#include <cassert>

namespace setun {

// ============================================================================
// Gate 5.6B: 8-Byte GC Header Layout
// Explicit 8-byte packed word for all managed heap allocations
// ============================================================================

enum GCColor : uint8_t {
    GC_COLOR_WHITE = 0, // Unreached / candidate for collection
    GC_COLOR_GREY  = 1, // On worklist / reachable, fields unscanned
    GC_COLOR_BLACK = 2  // Reachable, all fields scanned
};

enum GCFlags : uint8_t {
    GC_FLAG_NONE       = 0,
    GC_FLAG_PINNED     = 1 << 2, // Pinned in place (e.g. host handle)
    GC_FLAG_FINALIZER  = 1 << 3, // Requires custom destructor call
    GC_FLAG_LARGE      = 1 << 4, // Allocated in large object list (>4KB)
    GC_FLAG_FREE       = 1 << 5  // Recycled free slot in segregated list
};

#pragma pack(push, 1)
struct GCHeader {
    uint32_t type_id : 24;      // 24 bits: type descriptor index
    uint32_t flags   : 8;       // 8 bits: color (bits 0-1) + flags (bits 2-7)
    uint32_t size    : 24;      // 24 bits: allocation payload size (up to 16MB)
    uint32_t age     : 8;       // 8 bits: generational / survivor count

    inline GCColor color() const {
        return static_cast<GCColor>(flags & 0x3);
    }

    inline void set_color(GCColor c) {
        flags = static_cast<uint8_t>((flags & ~0x3) | (static_cast<uint8_t>(c) & 0x3));
    }

    inline bool is_white() const { return color() == GC_COLOR_WHITE; }
    inline bool is_grey()  const { return color() == GC_COLOR_GREY; }
    inline bool is_black() const { return color() == GC_COLOR_BLACK; }

    inline bool is_pinned() const { return (flags & GC_FLAG_PINNED) != 0; }
    inline void set_pinned(bool p) {
        if (p) flags |= GC_FLAG_PINNED;
        else   flags &= ~GC_FLAG_PINNED;
    }

    inline bool is_large() const { return (flags & GC_FLAG_LARGE) != 0; }
    inline void set_large(bool l) {
        if (l) flags |= GC_FLAG_LARGE;
        else   flags &= ~GC_FLAG_LARGE;
    }

    inline bool is_free() const { return (flags & GC_FLAG_FREE) != 0; }
    inline void set_free(bool f) {
        if (f) flags |= GC_FLAG_FREE;
        else   flags &= ~GC_FLAG_FREE;
    }

    inline bool has_finalizer() const { return (flags & GC_FLAG_FINALIZER) != 0; }
    inline void set_finalizer(bool f) {
        if (f) flags |= GC_FLAG_FINALIZER;
        else   flags &= ~GC_FLAG_FINALIZER;
    }

    // Pointer to payload directly follows header
    inline void* payload() {
        return reinterpret_cast<void*>(reinterpret_cast<uint8_t*>(this) + sizeof(GCHeader));
    }

    inline const void* payload() const {
        return reinterpret_cast<const void*>(reinterpret_cast<const uint8_t*>(this) + sizeof(GCHeader));
    }

    // Derive GCHeader from payload pointer
    inline static GCHeader* from_payload(void* ptr) {
        if (!ptr) return nullptr;
        return reinterpret_cast<GCHeader*>(reinterpret_cast<uint8_t*>(ptr) - sizeof(GCHeader));
    }

    inline static const GCHeader* from_payload(const void* ptr) {
        if (!ptr) return nullptr;
        return reinterpret_cast<const GCHeader*>(reinterpret_cast<const uint8_t*>(ptr) - sizeof(GCHeader));
    }
};
#pragma pack(pop)

static_assert(sizeof(GCHeader) == 8, "GCHeader must be exactly 8 bytes!");

} // namespace setun
