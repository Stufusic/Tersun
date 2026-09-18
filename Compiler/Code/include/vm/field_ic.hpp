#pragma once
// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Polymorphic Field Inline Cache (Field IC)
// Implements Mono IC -> Poly IC (up to 4 shapes) -> Megamorphic Fallback.
// Caches (VMShape*, cached_slot) pairs for O(1) field offsets without string lookups.
// Supports cache invalidation upon shape mutations.
// ==============================================================================

#include "vm/value.hpp"
#include <cstdint>
#include <cstddef>
#include <string>
#include <array>

namespace setun {

struct FieldICEntry {
    const VMShape* shape{nullptr};
    uint16_t slot{0};
};

class alignas(32) FieldIC {
public:
    static constexpr size_t kMaxPolyEntries = 4;

    explicit FieldIC(std::string field_name = "") : field_name_(std::move(field_name)) {}

    [[nodiscard]] const std::string& field_name() const noexcept { return field_name_; }
    void set_field_name(std::string name) { field_name_ = std::move(name); clear(); }

    [[nodiscard]] uint32_t hits() const noexcept { return hits_; }
    [[nodiscard]] uint32_t misses() const noexcept { return misses_; }
    [[nodiscard]] uint8_t entry_count() const noexcept { return entry_count_; }
    [[nodiscard]] bool is_megamorphic() const noexcept { return is_megamorphic_; }

    // Fast-path inline slot lookup
    inline int get_slot(const VMShape* shape) noexcept {
        if (__builtin_expect(!shape, 0)) return -1;

        // 1. Mono / Poly fast lookup
        for (uint8_t i = 0; i < entry_count_; ++i) {
            if (entries_[i].shape == shape) {
                ++hits_;
                return entries_[i].slot;
            }
        }

        // 2. Cache miss -> slow path
        return resolve_slow_path(shape);
    }

    // Invalidate / reset cache
    void clear() noexcept {
        for (auto& entry : entries_) {
            entry.shape = nullptr;
            entry.slot = 0;
        }
        entry_count_ = 0;
        is_megamorphic_ = false;
    }

private:
    int resolve_slow_path(const VMShape* shape) noexcept;

    std::string field_name_;
    std::array<FieldICEntry, kMaxPolyEntries> entries_{};
    uint32_t hits_{0};
    uint32_t misses_{0};
    uint8_t entry_count_{0};
    bool is_megamorphic_{false};
};

} // namespace setun
