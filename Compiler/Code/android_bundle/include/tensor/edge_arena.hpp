#pragma once

#include <cstdint>
#include <cstddef>
#include <vector>
#include <stdexcept>
#include <atomic>
#include <cassert>

namespace setun::tensor {

enum class ArenaStatus : int {
    OK = 0,
    BudgetExceeded = 101,
    InvalidAlignment = 102
};

// ============================================================================
// EdgeArena: Deterministic Zero-Allocation Arena for Embedded/Edge Inference
// - Guaranteed 0 heap allocations during model execution
// - Strict byte alignment (default 64 bytes for cacheline/vector alignment)
// - Fast O(1) bump allocation and O(1) reset
// ============================================================================
class EdgeArena {
public:
    static constexpr size_t BUDGET_128KB = 128 * 1024;
    static constexpr size_t BUDGET_256KB = 256 * 1024;
    static constexpr size_t BUDGET_512KB = 512 * 1024;
    static constexpr size_t BUDGET_1MB   = 1024 * 1024;

    explicit EdgeArena(size_t capacity_bytes = BUDGET_256KB)
        : capacity_(capacity_bytes), offset_(0), peak_used_(0), owns_memory_(true) {
        // Allocate aligned buffer
        storage_ = static_cast<uint8_t*>(std::malloc(capacity_));
        if (!storage_) {
            throw std::bad_alloc();
        }
    }

    // External fixed static buffer constructor (e.g. static uint8_t s_buffer[65536])
    EdgeArena(void* external_buffer, size_t capacity_bytes)
        : storage_(static_cast<uint8_t*>(external_buffer)),
          capacity_(capacity_bytes),
          offset_(0),
          peak_used_(0),
          owns_memory_(false) {}

    ~EdgeArena() {
        if (owns_memory_ && storage_) {
            std::free(storage_);
            storage_ = nullptr;
        }
    }

    // Non-copyable
    EdgeArena(const EdgeArena&) = delete;
    EdgeArena& operator=(const EdgeArena&) = delete;

    // Movable
    EdgeArena(EdgeArena&& other) noexcept
        : storage_(other.storage_),
          capacity_(other.capacity_),
          offset_(other.offset_),
          peak_used_(other.peak_used_),
          owns_memory_(other.owns_memory_) {
        other.storage_ = nullptr;
        other.capacity_ = 0;
        other.offset_ = 0;
        other.owns_memory_ = false;
    }

    ArenaStatus try_allocate(size_t bytes, size_t alignment, void** out_ptr) {
        if (!out_ptr) return ArenaStatus::BudgetExceeded;
        uintptr_t current_addr = reinterpret_cast<uintptr_t>(storage_ + offset_);
        uintptr_t aligned_addr = (current_addr + alignment - 1) & ~(alignment - 1);
        size_t padding = aligned_addr - current_addr;

        if (offset_ + padding + bytes > capacity_) {
            *out_ptr = nullptr;
            return ArenaStatus::BudgetExceeded;
        }

        offset_ += padding;
        *out_ptr = storage_ + offset_;
        offset_ += bytes;

        if (offset_ > peak_used_) {
            peak_used_ = offset_;
        }

        return ArenaStatus::OK;
    }

    void* allocate(size_t bytes, size_t alignment = 64) {
        void* ptr = nullptr;
        ArenaStatus st = try_allocate(bytes, alignment, &ptr);
        if (st != ArenaStatus::OK || !ptr) {
            throw std::bad_alloc();
        }
        return ptr;
    }

    void reset() {
        offset_ = 0;
    }

    size_t used_bytes() const { return offset_; }
    size_t capacity_bytes() const { return capacity_; }
    size_t peak_used_bytes() const { return peak_used_; }
    size_t headroom_bytes() const { return capacity_ > offset_ ? capacity_ - offset_ : 0; }
    uint8_t* raw_buffer() { return storage_; }

private:
    uint8_t* storage_{nullptr};
    size_t capacity_{0};
    size_t offset_{0};
    size_t peak_used_{0};
    bool owns_memory_{true};
};

// ============================================================================
// AllocationTracker & AllocationProbe: Verification of 0 Heap Allocation Contract
// ============================================================================
class AllocationTracker {
public:
    static void set_active(bool active);
    static bool is_active();
    static void record_alloc(size_t bytes);
    static void record_dealloc();
    static size_t total_allocations();
    static size_t total_deallocations();
    static size_t total_allocated_bytes();
    static void reset();
};

class AllocationProbe {
public:
    static AllocationProbe start() {
        return AllocationProbe();
    }

    AllocationProbe() {
        start_allocs_ = AllocationTracker::total_allocations();
        start_deallocs_ = AllocationTracker::total_deallocations();
        start_bytes_ = AllocationTracker::total_allocated_bytes();
        AllocationTracker::set_active(true);
    }

    ~AllocationProbe() {
        AllocationTracker::set_active(false);
    }

    size_t alloc_count() const {
        return AllocationTracker::total_allocations() - start_allocs_;
    }

    size_t dealloc_count() const {
        return AllocationTracker::total_deallocations() - start_deallocs_;
    }

    size_t allocated_bytes() const {
        return AllocationTracker::total_allocated_bytes() - start_bytes_;
    }

private:
    size_t start_allocs_{0};
    size_t start_deallocs_{0};
    size_t start_bytes_{0};
};

} // namespace setun::tensor
