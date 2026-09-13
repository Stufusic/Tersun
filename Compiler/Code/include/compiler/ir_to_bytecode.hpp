#pragma once

#include "compiler/opt_ir.hpp"
#include "compiler/emitter.hpp"
#include "compiler/cfg.hpp"
#include <unordered_map>
#include <string>
#include <vector>

namespace setun {

// ============================================================================
// Gate 5.5B: IR to Bytecode Emitter
// Lowers optimized 3-Address Linear IR & CFG directly into Tersun VM Chunk.
// Preserves CSE, Copy Propagation, DCE, and Block Merging benefits.
// ============================================================================

class IRToBytecodeEmitter {
public:
    IRToBytecodeEmitter() = default;

    // Emits a VM Chunk from an optimized IRModule
    Chunk emit(const IRModule& module, const Program* program = nullptr);

private:
    struct UnresolvedJump {
        size_t patch_offset;
        std::string target_label;
        size_t line;
    };

    struct UnresolvedBranch3 {
        size_t patch_offset_neg;
        size_t patch_offset_zero;
        size_t patch_offset_pos;
        std::string label_neg;
        std::string label_zero;
        std::string label_pos;
        size_t line;
    };

    struct UnresolvedCall {
        size_t patch_offset;
        std::string fn_name;
        size_t line;
    };

    void emit_function(const IRFunction& fn, bool is_toplevel);
    void emit_instruction(const IRInstruction& inst, const IRFunction& fn);

    void push_operand(const IROperand& op, size_t line, const IRFunction& fn);
    void store_dst(const IROperand& dst, size_t line, const IRFunction& fn);

    uint16_t get_local_slot(const IROperand& op, const IRFunction& fn);
    uint16_t get_global_slot(const std::string& name);
    uint16_t register_function(const std::string& name);

    Chunk chunk_;
    std::unordered_map<std::string, uint16_t> functions_;
    std::unordered_map<std::string, uint16_t> globals_;
    uint16_t next_global_slot_{0};
    uint16_t next_fn_index_{0};

    // Label resolution per function
    std::unordered_map<std::string, size_t> label_offsets_;
    std::vector<UnresolvedJump> unresolved_jumps_;
    std::vector<UnresolvedBranch3> unresolved_branch3_;
    std::vector<UnresolvedCall> unresolved_calls_;
};

} // namespace setun
