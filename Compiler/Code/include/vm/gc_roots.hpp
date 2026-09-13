#pragma once

#include "vm/gc_header.hpp"
#include "vm/value.hpp"
#include <vector>
#include <unordered_set>
#include <functional>

namespace setun {

// ============================================================================
// Gate 5.6C: Precise Root Tracing & Write Barrier Abstraction
// ============================================================================

class GCRootRegistry {
public:
    static GCRootRegistry& instance() {
        static GCRootRegistry s_instance;
        return s_instance;
    }

    void register_handle(void* payload) {
        if (payload) native_handles_.push_back(payload);
    }

    void unregister_handle(void* payload) {
        for (auto it = native_handles_.rbegin(); it != native_handles_.rend(); ++it) {
            if (*it == payload) {
                native_handles_.erase(std::next(it).base());
                return;
            }
        }
    }

    const std::vector<void*>& native_handles() const {
        return native_handles_;
    }

    void clear() {
        native_handles_.clear();
    }

private:
    std::vector<void*> native_handles_;
};

// RAII Handle Scope for native host extensions / FFI
template<typename T>
class LocalHandleScope {
public:
    explicit LocalHandleScope(T* ptr) : ptr_(ptr) {
        GCRootRegistry::instance().register_handle(reinterpret_cast<void*>(ptr_));
    }

    ~LocalHandleScope() {
        GCRootRegistry::instance().unregister_handle(reinterpret_cast<void*>(ptr_));
    }

    T* get() const { return ptr_; }
    T* operator->() const { return ptr_; }
    T& operator*() const { return *ptr_; }

    LocalHandleScope(const LocalHandleScope&) = delete;
    LocalHandleScope& operator=(const LocalHandleScope&) = delete;

private:
    T* ptr_{nullptr};
};

// Write barrier abstraction ensuring Tri-Color Invariant (Strong Tri-color: no Black points to White)
inline void gc_write_barrier(void* source_payload, const VMValue& target_val) {
    if (!source_payload || !target_val.is_heap_type()) return;
    GCHeader* src_hdr = GCHeader::from_payload(source_payload);
    if (src_hdr && src_hdr->is_black()) {
        void* tgt_payload = VMArena::instance().from_handle(target_val.handle());
        if (tgt_payload) {
            GCHeader* tgt_hdr = GCHeader::from_payload(tgt_payload);
            if (tgt_hdr && tgt_hdr->is_white()) {
                // Shade source back to GREY so its new target will be scanned
                src_hdr->set_color(GC_COLOR_GREY);
            }
        }
    }
}

#define GC_WRITE_BARRIER(src, val) setun::gc_write_barrier((src), (val))

} // namespace setun
