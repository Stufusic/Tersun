#include "tensor/edge_arena.hpp"
#include <new>
#include <cstdlib>

namespace setun::tensor {

static std::atomic<bool> s_tracker_active{false};
static std::atomic<size_t> s_total_allocs{0};
static std::atomic<size_t> s_total_deallocs{0};
static std::atomic<size_t> s_total_bytes{0};

void AllocationTracker::set_active(bool active) {
    s_tracker_active.store(active, std::memory_order_relaxed);
}

bool AllocationTracker::is_active() {
    return s_tracker_active.load(std::memory_order_relaxed);
}

void AllocationTracker::record_alloc(size_t bytes) {
    if (s_tracker_active.load(std::memory_order_relaxed)) {
        s_total_allocs.fetch_add(1, std::memory_order_relaxed);
        s_total_bytes.fetch_add(bytes, std::memory_order_relaxed);
    }
}

void AllocationTracker::record_dealloc() {
    if (s_tracker_active.load(std::memory_order_relaxed)) {
        s_total_deallocs.fetch_add(1, std::memory_order_relaxed);
    }
}

size_t AllocationTracker::total_allocations() {
    return s_total_allocs.load(std::memory_order_relaxed);
}

size_t AllocationTracker::total_deallocations() {
    return s_total_deallocs.load(std::memory_order_relaxed);
}

size_t AllocationTracker::total_allocated_bytes() {
    return s_total_bytes.load(std::memory_order_relaxed);
}

void AllocationTracker::reset() {
    s_total_allocs.store(0, std::memory_order_relaxed);
    s_total_deallocs.store(0, std::memory_order_relaxed);
    s_total_bytes.store(0, std::memory_order_relaxed);
}

} // namespace setun::tensor

// Global operator new/delete hooks to detect allocations during inference
void* operator new(std::size_t size) {
    setun::tensor::AllocationTracker::record_alloc(size);
    void* ptr = std::malloc(size);
    if (!ptr) throw std::bad_alloc();
    return ptr;
}

void operator delete(void* ptr) noexcept {
    setun::tensor::AllocationTracker::record_dealloc();
    std::free(ptr);
}

void operator delete(void* ptr, std::size_t) noexcept {
    setun::tensor::AllocationTracker::record_dealloc();
    std::free(ptr);
}
