#pragma once

#include <cstdint>
#include <vector>
#include <cstddef>

namespace setun {

struct SafepointRecord {
    uint32_t id{0};
    uint32_t native_offset{0};
    uint32_t bytecode_offset{0};
    std::vector<uint16_t> live_local_slots;
};

class JITSafepointTable {
public:
    JITSafepointTable() = default;

    void add_safepoint(const SafepointRecord& rec) {
        records_.push_back(rec);
    }

    const SafepointRecord* find_by_id(uint32_t id) const {
        for (const auto& r : records_) {
            if (r.id == id) return &r;
        }
        return nullptr;
    }

    const SafepointRecord* find_nearest_native(uint32_t native_offset) const {
        if (records_.empty()) return nullptr;
        const SafepointRecord* best = nullptr;
        for (const auto& r : records_) {
            if (r.native_offset <= native_offset) {
                best = &r;
            } else {
                break;
            }
        }
        return best ? best : &records_[0];
    }

    size_t size() const { return records_.size(); }
    const std::vector<SafepointRecord>& records() const { return records_; }
    void clear() { records_.clear(); }

private:
    std::vector<SafepointRecord> records_;
};

} // namespace setun
