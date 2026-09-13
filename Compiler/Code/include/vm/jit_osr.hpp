#pragma once

#include <cstdint>
#include <vector>
#include <unordered_map>
#include <cstddef>

namespace setun {

// ============================================================================
// Gate 5.8 (Advanced): OSR Location & Entry Metadata
// ============================================================================

struct Location {
    enum Kind : uint8_t {
        Register = 0,
        StackSlot = 1,
        Constant = 2,
        Rematerialize = 3
    };

    Kind kind{StackSlot};
    uint16_t reg_index{0}; // GPR index (0:RAX, 1:RCX, etc.)
    int32_t offset{0};     // Byte offset relative to RBP / RSP
    int64_t constant_val{0};

    static Location make_reg(uint16_t reg) {
        Location l;
        l.kind = Register;
        l.reg_index = reg;
        return l;
    }

    static Location make_stack(int32_t off) {
        Location l;
        l.kind = StackSlot;
        l.offset = off;
        return l;
    }

    static Location make_const(int64_t val) {
        Location l;
        l.kind = Constant;
        l.constant_val = val;
        return l;
    }
};

struct OSRValueLocation {
    uint32_t vm_slot{0};
    Location loc;
};

struct OSREntryRecord {
    uint32_t function_id{0};
    uint32_t loop_id{0};
    uint32_t loop_header_bytecode_ip{0};
    uint32_t osr_native_entry_offset{0};
    uint32_t operand_stack_depth{0};
    size_t num_live_locals{0};
    std::vector<OSRValueLocation> live_values;
};

class OSREntryTable {
public:
    OSREntryTable() = default;

    void add_entry(const OSREntryRecord& rec) {
        entries_[rec.loop_header_bytecode_ip] = rec;
    }

    const OSREntryRecord* find_by_bytecode_ip(uint32_t ip) const {
        auto it = entries_.find(ip);
        if (it != entries_.end()) return &it->second;
        return nullptr;
    }

    bool has_entry(uint32_t ip) const {
        return entries_.find(ip) != entries_.end();
    }

    const std::unordered_map<uint32_t, OSREntryRecord>& entries() const {
        return entries_;
    }

    void clear() { entries_.clear(); }
    size_t size() const { return entries_.size(); }

private:
    std::unordered_map<uint32_t, OSREntryRecord> entries_;
};

} // namespace setun
