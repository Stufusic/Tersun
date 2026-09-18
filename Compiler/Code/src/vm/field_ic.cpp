// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Polymorphic Field Inline Cache Implementation
// ==============================================================================

#include "vm/field_ic.hpp"

namespace setun {

int FieldIC::resolve_slow_path(const VMShape* shape) noexcept {
    ++misses_;
    if (!shape) return -1;

    int slot = shape->get_slot(field_name_);
    if (slot < 0) return -1;

    // If cache not full, add to polymorphic entries
    if (entry_count_ < kMaxPolyEntries) {
        entries_[entry_count_].shape = shape;
        entries_[entry_count_].slot = static_cast<uint16_t>(slot);
        ++entry_count_;
    } else {
        // Exceeded polymorphic limit -> mark megamorphic
        is_megamorphic_ = true;
    }

    return slot;
}

} // namespace setun
