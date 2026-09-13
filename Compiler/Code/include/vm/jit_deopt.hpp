#pragma once

#include "vm/value.hpp"
#include "vm/jit_frame.hpp"
#include "vm/jit_osr.hpp"
#include <cstdint>
#include <vector>
#include <unordered_map>
#include <string>

namespace setun {

class VM;

enum class DeoptReason : uint8_t {
    UNKNOWN = 0,
    TYPE_GUARD_FAILURE = 1,
    ARITHMETIC_OVERFLOW = 2,
    DIVISION_BY_ZERO = 3,
    UNSUPPORTED_OPCODE = 4,
    EXPLICIT_BAILOUT = 5
};

struct DeoptRecord {
    uint32_t deopt_id{0};
    uint32_t native_offset{0};
    uint32_t target_bytecode_ip{0};
    uint32_t stack_depth{0};
    DeoptReason reason{DeoptReason::TYPE_GUARD_FAILURE};
    std::vector<Location> locals_mapping;
    std::vector<Location> stack_mapping;
};

class DeoptTable {
public:
    DeoptTable() = default;

    void add_deopt(const DeoptRecord& rec) {
        records_[rec.deopt_id] = rec;
    }

    const DeoptRecord* find_by_id(uint32_t id) const {
        auto it = records_.find(id);
        if (it != records_.end()) return &it->second;
        return nullptr;
    }

    const std::unordered_map<uint32_t, DeoptRecord>& records() const {
        return records_;
    }

    void clear() { records_.clear(); }
    size_t size() const { return records_.size(); }

private:
    std::unordered_map<uint32_t, DeoptRecord> records_;
};

// Reconstruct interpreter state upon deoptimization bailout
bool reconstruct_interpreter_state(VM* vm, JITFrame* frame, const DeoptRecord& rec);

// Advanced state reconstruction with MachineState register extraction
bool reconstruct_interpreter_state_advanced(
    VM* vm, JITFrame* frame, const MachineState& machine, const DeoptRecord& rec, DeoptContinuation& out_cont);

} // namespace setun
