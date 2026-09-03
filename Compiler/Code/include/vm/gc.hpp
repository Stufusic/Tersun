#pragma once

#include "tafpu/trit.hpp"
#include <vector>
#include <memory>
#include <cstdint>
#include <unordered_set>
#include <iostream>

namespace setun {

// -----------------------------------------------------------------------------
// Tri-Color Garbage Collector: Mapped directly to Balanced Ternary Trit states
// -----------------------------------------------------------------------------
enum class GcColor : int8_t {
    WHITE = -1, // Unvisited / Candidate for collection
    GREY  =  0, // Discovered on worklist, references unscanned
    BLACK =  1  // Preserved, all references scanned
};

struct GcObject {
    GcColor color{GcColor::WHITE};
    size_t size_bytes{0};
    std::vector<GcObject*> references;

    virtual ~GcObject() = default;
};

class TriColorGC {
public:
    TriColorGC();
    ~TriColorGC();

    // Allocate managed object
    template <typename T, typename... Args>
    T* allocate(Args&&... args) {
        auto obj = std::make_unique<T>(std::forward<Args>(args)...);
        T* ptr = obj.get();
        ptr->color = GcColor::WHITE;
        ptr->size_bytes = sizeof(T);
        all_objects_.push_back(ptr);
        managed_storage_.push_back(std::move(obj));
        bytes_allocated_ += sizeof(T);
        return ptr;
    }

    // Root registration
    void add_root(GcObject* root);
    void clear_roots();

    // Tri-Color Mark & Sweep cycle
    size_t collect_garbage();

    size_t bytes_allocated() const { return bytes_allocated_; }
    size_t live_objects_count() const { return all_objects_.size(); }

private:
    void mark_roots();
    void trace_references();
    size_t sweep();

    std::vector<GcObject*> roots_;
    std::vector<GcObject*> grey_worklist_;
    std::vector<GcObject*> all_objects_;
    std::vector<std::unique_ptr<GcObject>> managed_storage_;
    size_t bytes_allocated_{0};
};

} // namespace setun
