#pragma once

#include "compiler/opt_ir.hpp"
#include <vector>
#include <string>
#include <memory>
#include <unordered_set>
#include <unordered_map>
#include <sstream>

namespace setun {

struct BasicBlock {
    size_t id{0};
    std::string label;
    std::vector<IRInstruction> instructions;

    std::vector<BasicBlock*> predecessors;
    std::vector<BasicBlock*> successors;

    // Loop & Control Flow Metadata
    size_t loop_depth{0};
    bool is_loop_header{false};
    bool is_loop_exit{false};
    bool is_unreachable{false};

    bool has_terminator() const {
        if (instructions.empty()) return false;
        const auto& op = instructions.back().op;
        return op == IROp::JUMP || op == IROp::BRANCH_IF_TRUE ||
               op == IROp::BRANCH_IF_FALSE || op == IROp::BRANCH3 ||
               op == IROp::RETURN;
    }

    bool has_unconditional_jump() const {
        if (instructions.empty()) return false;
        return instructions.back().op == IROp::JUMP;
    }

    bool has_return() const {
        if (instructions.empty()) return false;
        return instructions.back().op == IROp::RETURN;
    }
};

class CFG {
public:
    CFG() = default;

    static std::shared_ptr<CFG> build_from_function(IRFunction& fn);

    BasicBlock* entry_block() const { return entry_; }
    const std::vector<std::unique_ptr<BasicBlock>>& blocks() const { return blocks_; }
    const std::vector<std::pair<BasicBlock*, BasicBlock*>>& back_edges() const { return back_edges_; }

    void detect_loops();
    bool merge_blocks();
    bool eliminate_unreachable();
    void rebuild_instructions(IRFunction& fn);

    std::string dump_dot(const std::string& fn_name = "func") const;
    std::string dump_text() const;

private:
    void add_edge(BasicBlock* from, BasicBlock* to);
    void remove_edge(BasicBlock* from, BasicBlock* to);

    BasicBlock* entry_{nullptr};
    std::vector<std::unique_ptr<BasicBlock>> blocks_;
    std::vector<std::pair<BasicBlock*, BasicBlock*>> back_edges_;
};

} // namespace setun
