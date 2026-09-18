#pragma once

#include "vm/value.hpp"
#include "vm/runtime_metadata.hpp"
#include <cstdint>
#include <vector>
#include <unordered_map>
#include <memory>
#include <string>

namespace setun {

// ============================================================================
// Gate 5.9.2: Polymorphic Inline Caching (PIC) & Direct CallSite IC
// ============================================================================

enum class ICState : uint8_t {
    Uninitialized = 0,
    Monomorphic = 1,
    Polymorphic = 2,
    Megamorphic = 3
};

constexpr size_t MAX_PIC_ENTRIES = 4;

struct MethodICEntry {
    uint32_t shape_id{0};
    const VTable* vtable{nullptr};
    uint32_t fn_entry{0};
    size_t callee_frame_size{32};
    JITNativeEntryPoint native_entry{nullptr};
};

struct MethodIC {
    uint8_t state{static_cast<uint8_t>(ICState::Uninitialized)};
    uint8_t count{0};
    uint16_t hits{0};
    uint16_t misses{0};
    MethodICEntry entries[MAX_PIC_ENTRIES]{};

    bool is_uninitialized() const { return state == static_cast<uint8_t>(ICState::Uninitialized); }
    bool is_monomorphic() const { return state == static_cast<uint8_t>(ICState::Monomorphic); }
    bool is_polymorphic() const { return state == static_cast<uint8_t>(ICState::Polymorphic); }
    bool is_megamorphic() const { return state == static_cast<uint8_t>(ICState::Megamorphic); }

    inline const MethodICEntry* probe(uint32_t shape_id, const VTable* vt) {
        if (state == static_cast<uint8_t>(ICState::Uninitialized) ||
            state == static_cast<uint8_t>(ICState::Megamorphic)) {
            misses++;
            return nullptr;
        }

        // Fast sequential search for 1 to 4 entries
        for (uint8_t i = 0; i < count; ++i) {
            if ((shape_id > 0 && entries[i].shape_id == shape_id) ||
                (vt != nullptr && entries[i].vtable == vt)) {
                hits++;
                return &entries[i];
            }
        }
        misses++;
        return nullptr;
    }

    bool update(uint32_t shape_id, const VTable* vt, uint32_t fn_entry, size_t frame_sz, JITNativeEntryPoint ne) {
        // If already Megamorphic, stay Megamorphic
        if (state == static_cast<uint8_t>(ICState::Megamorphic)) {
            return false;
        }

        // Check if entry already exists (update existing)
        for (uint8_t i = 0; i < count; ++i) {
            if ((shape_id > 0 && entries[i].shape_id == shape_id) ||
                (vt != nullptr && entries[i].vtable == vt)) {
                entries[i].fn_entry = fn_entry;
                entries[i].callee_frame_size = frame_sz;
                entries[i].native_entry = ne;
                return true;
            }
        }

        // Add new entry if space remains
        if (count < MAX_PIC_ENTRIES) {
            entries[count].shape_id = shape_id;
            entries[count].vtable = vt;
            entries[count].fn_entry = fn_entry;
            entries[count].callee_frame_size = frame_sz;
            entries[count].native_entry = ne;
            count++;
            if (count == 1) {
                state = static_cast<uint8_t>(ICState::Monomorphic);
            } else {
                state = static_cast<uint8_t>(ICState::Polymorphic);
            }
            return true;
        }

        // Capacity exceeded -> degrade to Megamorphic
        state = static_cast<uint8_t>(ICState::Megamorphic);
        return false;
    }

    void invalidate_vtable(const VTable* vt) {
        if (vt == nullptr) return;
        uint8_t write_idx = 0;
        for (uint8_t i = 0; i < count; ++i) {
            if (entries[i].vtable != vt) {
                if (write_idx != i) {
                    entries[write_idx] = entries[i];
                }
                write_idx++;
            }
        }
        count = write_idx;
        if (count == 0) {
            state = static_cast<uint8_t>(ICState::Uninitialized);
        } else if (count == 1) {
            state = static_cast<uint8_t>(ICState::Monomorphic);
        } else {
            state = static_cast<uint8_t>(ICState::Polymorphic);
        }
    }

    void clear() {
        state = static_cast<uint8_t>(ICState::Uninitialized);
        count = 0;
        hits = 0;
        misses = 0;
        for (size_t i = 0; i < MAX_PIC_ENTRIES; ++i) {
            entries[i] = MethodICEntry{};
        }
    }
};

struct CallSiteIC {
    uint32_t expected_fn_idx{UINT32_MAX};
    uint32_t fn_entry{0};
    size_t callee_frame_size{32};
    JITNativeEntryPoint native_entry{nullptr};
    uint32_t hits{0};
    uint32_t misses{0};

    inline bool matches(uint32_t fn_idx) {
        if (expected_fn_idx == fn_idx) {
            hits++;
            return true;
        }
        misses++;
        return false;
    }

    void update(uint32_t fn_idx, uint32_t entry, size_t frame_sz, JITNativeEntryPoint ne) {
        expected_fn_idx = fn_idx;
        fn_entry = entry;
        callee_frame_size = frame_sz;
        native_entry = ne;
    }

    void clear() {
        expected_fn_idx = UINT32_MAX;
        fn_entry = 0;
        callee_frame_size = 32;
        native_entry = nullptr;
        hits = 0;
        misses = 0;
    }
};

class ChunkInlineCacheTable {
public:
    ChunkInlineCacheTable() = default;

    MethodIC& get_or_create_method_ic(uint32_t bytecode_ip) {
        return method_ics_[bytecode_ip];
    }

    CallSiteIC& get_or_create_call_ic(uint32_t bytecode_ip) {
        return call_ics_[bytecode_ip];
    }

    MethodIC* find_method_ic(uint32_t bytecode_ip) {
        auto it = method_ics_.find(bytecode_ip);
        return (it != method_ics_.end()) ? &it->second : nullptr;
    }

    CallSiteIC* find_call_ic(uint32_t bytecode_ip) {
        auto it = call_ics_.find(bytecode_ip);
        return (it != call_ics_.end()) ? &it->second : nullptr;
    }

    void invalidate_vtable(const VTable* vt) {
        for (auto& [_, ic] : method_ics_) {
            ic.invalidate_vtable(vt);
        }
    }

    void clear() {
        method_ics_.clear();
        call_ics_.clear();
    }

    size_t method_ic_count() const { return method_ics_.size(); }
    size_t call_ic_count() const { return call_ics_.size(); }
    size_t total_method_ic_count() const { return method_ics_.size(); }
    size_t total_call_ic_count() const { return call_ics_.size(); }

    uint64_t total_hits() const {
        uint64_t sum = 0;
        for (const auto& [_, ic] : method_ics_) sum += ic.hits;
        for (const auto& [_, ic] : call_ics_) sum += ic.hits;
        return sum;
    }

    uint64_t total_misses() const {
        uint64_t sum = 0;
        for (const auto& [_, ic] : method_ics_) sum += ic.misses;
        for (const auto& [_, ic] : call_ics_) sum += ic.misses;
        return sum;
    }

    double hit_ratio() const {
        uint64_t h = total_hits();
        uint64_t m = total_misses();
        if (h + m == 0) return 1.0;
        return static_cast<double>(h) / static_cast<double>(h + m);
    }

private:
    std::unordered_map<uint32_t, MethodIC> method_ics_;
    std::unordered_map<uint32_t, CallSiteIC> call_ics_;
};

} // namespace setun
