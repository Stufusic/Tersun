#include "vm/gc.hpp"
#include <algorithm>

namespace setun {

TriColorGC::TriColorGC() = default;
TriColorGC::~TriColorGC() = default;

void TriColorGC::add_root(GcObject* root) {
    if (root) {
        roots_.push_back(root);
    }
}

void TriColorGC::clear_roots() {
    roots_.clear();
}

void TriColorGC::mark_roots() {
    grey_worklist_.clear();
    for (GcObject* root : roots_) {
        if (root && root->color == GcColor::WHITE) {
            root->color = GcColor::GREY; // Trit 0: Discovered
            grey_worklist_.push_back(root);
        }
    }
}

void TriColorGC::trace_references() {
    while (!grey_worklist_.empty()) {
        GcObject* obj = grey_worklist_.back();
        grey_worklist_.pop_back();

        // Scan outgoing references
        for (GcObject* ref : obj->references) {
            if (ref && ref->color == GcColor::WHITE) {
                ref->color = GcColor::GREY; // Mark Discovered
                grey_worklist_.push_back(ref);
            }
        }

        // Finished scanning this object's children -> Promote to Black (+1)
        obj->color = GcColor::BLACK; // Trit +1: Preserved
    }
}

size_t TriColorGC::sweep() {
    size_t swept_bytes = 0;

    auto it_storage = managed_storage_.begin();
    while (it_storage != managed_storage_.end()) {
        GcObject* raw_ptr = it_storage->get();
        if (raw_ptr->color == GcColor::WHITE) {
            // Unreachable object (Trit -1) -> Reclaim
            swept_bytes += raw_ptr->size_bytes;
            it_storage = managed_storage_.erase(it_storage);
        } else {
            // Live object -> Reset color to WHITE (-1) for next cycle
            raw_ptr->color = GcColor::WHITE;
            ++it_storage;
        }
    }

    // Refresh active raw pointers list
    all_objects_.clear();
    for (const auto& ptr : managed_storage_) {
        all_objects_.push_back(ptr.get());
    }

    if (swept_bytes <= bytes_allocated_) {
        bytes_allocated_ -= swept_bytes;
    } else {
        bytes_allocated_ = 0;
    }

    return swept_bytes;
}

size_t TriColorGC::collect_garbage() {
    mark_roots();
    trace_references();
    return sweep();
}

} // namespace setun
