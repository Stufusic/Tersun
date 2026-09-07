#pragma once

#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <memory>
#include <new>
#include <cassert>
#include <iostream>

namespace setun {

// ============================================================================
// Gate 2: VMArena Controlled Handle Memory Subsystem
// - Manages high-speed bump-pointer chunk allocation for dynamic heap objects
// - Controlled 32-bit handle indexing: ptr = arena_base + handle
// - Resilient to virtual memory fragmentation & ASLR
// ============================================================================

class VMArena {
public:
    static constexpr size_t DEFAULT_CHUNK_SIZE = 256 * 1024 * 1024; // 256 MB primary contiguous pool
    static constexpr size_t SECONDARY_CHUNK_SIZE = 16 * 1024 * 1024; // 16 MB secondary chunk

    static constexpr uint32_t NULL_HANDLE = 0;

    static VMArena& instance() {
        static thread_local VMArena s_instance;
        return s_instance;
    }

    VMArena(size_t pool_size = DEFAULT_CHUNK_SIZE)
        : pool_size_(pool_size), allocated_bytes_(16), peak_bytes_(16) {
        base_addr_ = reinterpret_cast<uint8_t*>(std::malloc(pool_size_));
        if (!base_addr_) {
            // Fallback to 64MB if 256MB cannot be allocated in a contiguous block
            pool_size_ = 64 * 1024 * 1024;
            base_addr_ = reinterpret_cast<uint8_t*>(std::malloc(pool_size_));
        }
        assert(base_addr_ != nullptr && "VMArena: Failed to allocate primary memory pool");
    }

    ~VMArena() {
        cleanup();
    }

    // Disable copying
    VMArena(const VMArena&) = delete;
    VMArena& operator=(const VMArena&) = delete;

    // --- Controlled 32-bit Handle Indexing ---
    // Handle is the exact byte offset from base_addr_
    inline uint32_t to_handle(const void* ptr) const {
        if (!ptr || !base_addr_) return NULL_HANDLE;
        uintptr_t p = reinterpret_cast<uintptr_t>(ptr);
        uintptr_t b = reinterpret_cast<uintptr_t>(base_addr_);
        if (p >= b && p < b + pool_size_) {
            return static_cast<uint32_t>(p - b);
        }
        return NULL_HANDLE;
    }

    inline void* from_handle(uint32_t handle) const {
        if (!base_addr_ || handle == NULL_HANDLE) return nullptr;
        assert(handle < pool_size_ && "VMArena: Handle offset out of bounds");
        return reinterpret_cast<void*>(base_addr_ + handle);
    }

    // --- High-Speed Bump Allocation ---
    inline void* allocate(size_t bytes, size_t alignment = 16) {
        size_t aligned_offset = (allocated_bytes_ + alignment - 1) & ~(alignment - 1);
        size_t new_allocated = aligned_offset + bytes;

        if (__builtin_expect(new_allocated <= pool_size_, 1)) {
            void* ptr = base_addr_ + aligned_offset;
            allocated_bytes_ = new_allocated;
            if (allocated_bytes_ > peak_bytes_) {
                peak_bytes_ = allocated_bytes_;
            }
            return ptr;
        }

        // Secondary chunk bump allocation if primary pool is exceeded
        return allocate_overflow(bytes, alignment);
    }

    // --- Typed Object Factory ---
    template<typename T, typename... Args>
    inline T* make(Args&&... args) {
        void* mem = allocate(sizeof(T), alignof(T));
        return new (mem) T(std::forward<Args>(args)...);
    }

    // --- Arena Lifetime Reset (O(1) Memory Reclamation) ---
    void reset() {
        allocated_bytes_ = 16;
        for (const auto& chunk : secondary_chunks_) {
            std::free(chunk.ptr);
        }
        secondary_chunks_.clear();
    }

    // --- Inspection & Diagnostics ---
    uint8_t* base_addr() const { return base_addr_; }
    size_t allocated_bytes() const { return allocated_bytes_; }
    size_t peak_bytes() const { return peak_bytes_; }
    size_t pool_size() const { return pool_size_; }

private:
    struct SecondaryChunk {
        uint8_t* ptr{nullptr};
        size_t size{0};
        size_t used{0};
    };

    void* allocate_overflow(size_t bytes, size_t alignment) {
        if (!secondary_chunks_.empty()) {
            SecondaryChunk& cur = secondary_chunks_.back();
            size_t aligned_used = (cur.used + alignment - 1) & ~(alignment - 1);
            if (aligned_used + bytes <= cur.size) {
                void* res = cur.ptr + aligned_used;
                cur.used = aligned_used + bytes;
                allocated_bytes_ += bytes;
                if (allocated_bytes_ > peak_bytes_) peak_bytes_ = allocated_bytes_;
                return res;
            }
        }

        size_t alloc_sz = (bytes + alignment > SECONDARY_CHUNK_SIZE) ? (bytes + alignment * 2) : SECONDARY_CHUNK_SIZE;
        uint8_t* raw = reinterpret_cast<uint8_t*>(std::malloc(alloc_sz));
        assert(raw != nullptr && "VMArena: Failed to allocate secondary memory chunk");

        size_t aligned_start = (reinterpret_cast<uintptr_t>(raw) + alignment - 1) & ~(alignment - 1);
        size_t offset = aligned_start - reinterpret_cast<uintptr_t>(raw);

        SecondaryChunk sc;
        sc.ptr = raw;
        sc.size = alloc_sz;
        sc.used = offset + bytes;
        secondary_chunks_.push_back(sc);

        allocated_bytes_ += bytes;
        if (allocated_bytes_ > peak_bytes_) peak_bytes_ = allocated_bytes_;
        return reinterpret_cast<void*>(aligned_start);
    }

    void cleanup() {
        if (base_addr_) {
            std::free(base_addr_);
            base_addr_ = nullptr;
        }
        for (const auto& chunk : secondary_chunks_) {
            std::free(chunk.ptr);
        }
        secondary_chunks_.clear();
        allocated_bytes_ = 0;
    }

    uint8_t* base_addr_{nullptr};
    size_t pool_size_{0};
    size_t allocated_bytes_{0};
    size_t peak_bytes_{0};
    std::vector<SecondaryChunk> secondary_chunks_;
};

} // namespace setun
