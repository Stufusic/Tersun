#pragma once

#include "vm/gc_header.hpp"
#include "vm/gc_heap.hpp"
#include "vm/type_descriptor.hpp"
#include <cstdint>
#include <cstddef>
#include <string>

namespace setun {

// ============================================================================
// Gate 5.6E: GC Debug & Verification Mode
// ============================================================================

class GCDebug {
public:
    static constexpr uint32_t POISON_DEAD_PATTERN = 0xDEADBEEF;
    static constexpr uint32_t CANARY_PATTERN      = 0xCAFEBABE;

    // Poison memory after sweep / free
    static void poison(void* ptr, size_t bytes);

    // Verify heap integrity (returns true if valid, throws/returns false if corrupted)
    static bool verify_heap(GCHeap& heap, TypeRegistry& types, std::string* error_out = nullptr);

    // Check if pointer is within any active heap region
    static bool is_valid_heap_pointer(GCHeap& heap, const void* ptr);
};

} // namespace setun
