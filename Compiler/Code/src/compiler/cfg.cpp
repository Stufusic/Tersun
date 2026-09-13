#include "compiler/cfg.hpp"
#include <queue>
#include <algorithm>
#include <iostream>

namespace setun {

std::shared_ptr<CFG> CFG::build_from_function(IRFunction& fn) {
    auto cfg = std::make_shared<CFG>();
    if (fn.instructions.empty()) return cfg;

    std::unordered_map<std::string, size_t> label_to_inst;
    std::unordered_set<size_t> leaders;
    leaders.insert(0);

    for (size_t i = 0; i < fn.instructions.size(); ++i) {
        const auto& inst = fn.instructions[i];
        if (inst.op == IROp::LABEL) {
            leaders.insert(i);
            label_to_inst[inst.dst.val_s] = i;
        } else if (inst.op == IROp::JUMP || inst.op == IROp::BRANCH_IF_TRUE ||
                   inst.op == IROp::BRANCH_IF_FALSE || inst.op == IROp::BRANCH3 ||
                   inst.op == IROp::RETURN) {
            if (i + 1 < fn.instructions.size()) {
                leaders.insert(i + 1);
            }
        }
    }

    std::vector<size_t> sorted_leaders(leaders.begin(), leaders.end());
    std::sort(sorted_leaders.begin(), sorted_leaders.end());

    std::unordered_map<std::string, BasicBlock*> label_to_block;

    for (size_t k = 0; k < sorted_leaders.size(); ++k) {
        size_t start = sorted_leaders[k];
        size_t end = (k + 1 < sorted_leaders.size()) ? sorted_leaders[k + 1] : fn.instructions.size();

        auto bb = std::make_unique<BasicBlock>();
        bb->id = k;

        for (size_t i = start; i < end; ++i) {
            const auto& inst = fn.instructions[i];
            if (inst.op == IROp::LABEL) {
                if (bb->label.empty()) bb->label = inst.dst.val_s;
                label_to_block[inst.dst.val_s] = bb.get();
            }
            bb->instructions.push_back(inst);
        }

        if (bb->label.empty()) {
            bb->label = "bb_" + std::to_string(bb->id);
        }

        if (k == 0) cfg->entry_ = bb.get();
        cfg->blocks_.push_back(std::move(bb));
    }

    // Connect control flow edges
    for (size_t k = 0; k < cfg->blocks_.size(); ++k) {
        auto* bb = cfg->blocks_[k].get();
        if (bb->instructions.empty()) continue;

        const auto& term = bb->instructions.back();
        BasicBlock* next_fallthrough = (k + 1 < cfg->blocks_.size()) ? cfg->blocks_[k + 1].get() : nullptr;

        if (term.op == IROp::JUMP) {
            std::string target = term.src1.val_s;
            auto it = label_to_block.find(target);
            if (it != label_to_block.end()) {
                cfg->add_edge(bb, it->second);
            }
        } else if (term.op == IROp::BRANCH_IF_TRUE || term.op == IROp::BRANCH_IF_FALSE) {
            std::string target = term.src2.val_s;
            auto it = label_to_block.find(target);
            if (it != label_to_block.end()) {
                cfg->add_edge(bb, it->second);
            }
            if (next_fallthrough) {
                cfg->add_edge(bb, next_fallthrough);
            }
        } else if (term.op == IROp::BRANCH3) {
            for (const auto& a : term.args) {
                auto it = label_to_block.find(a.val_s);
                if (it != label_to_block.end()) {
                    cfg->add_edge(bb, it->second);
                }
            }
        } else if (term.op == IROp::RETURN) {
            // Function exit, no successors
        } else {
            // Fallthrough to next block
            if (next_fallthrough) {
                cfg->add_edge(bb, next_fallthrough);
            }
        }
    }

    cfg->detect_loops();
    fn.cfg = cfg;
    return cfg;
}

void CFG::add_edge(BasicBlock* from, BasicBlock* to) {
    if (!from || !to) return;
    if (std::find(from->successors.begin(), from->successors.end(), to) == from->successors.end()) {
        from->successors.push_back(to);
    }
    if (std::find(to->predecessors.begin(), to->predecessors.end(), from) == to->predecessors.end()) {
        to->predecessors.push_back(from);
    }
}

void CFG::remove_edge(BasicBlock* from, BasicBlock* to) {
    if (!from || !to) return;
    from->successors.erase(std::remove(from->successors.begin(), from->successors.end(), to), from->successors.end());
    to->predecessors.erase(std::remove(to->predecessors.begin(), to->predecessors.end(), from), to->predecessors.end());
}

void CFG::detect_loops() {
    back_edges_.clear();
    if (!entry_) return;

    // 0: WHITE (unvisited), 1: GREY (in stack), 2: BLACK (done)
    std::unordered_map<BasicBlock*, int> color;
    for (const auto& b : blocks_) {
        color[b.get()] = 0;
        b->is_loop_header = false;
        b->loop_depth = 0;
    }

    auto dfs = [&](auto& self, BasicBlock* u, size_t depth) -> void {
        color[u] = 1;
        u->loop_depth = std::max(u->loop_depth, depth);

        for (auto* v : u->successors) {
            if (color[v] == 1) {
                // Back-edge detected! v is loop header
                back_edges_.push_back({u, v});
                v->is_loop_header = true;
            } else if (color[v] == 0) {
                self(self, v, depth + (v->is_loop_header ? 1 : 0));
            }
        }
        color[u] = 2;
    };

    dfs(dfs, entry_, 0);
}

bool CFG::merge_blocks() {
    bool changed = false;

    for (size_t i = 0; i < blocks_.size(); ++i) {
        BasicBlock* a = blocks_[i].get();
        if (!a || a->is_unreachable) continue;

        if (a->successors.size() == 1) {
            BasicBlock* b = a->successors[0];
            if (b && b != a && b != entry_ && b->predecessors.size() == 1) {
                // Safe to merge B into A!
                // 1. Remove unconditional jump at end of A if it targets B
                if (!a->instructions.empty() && a->instructions.back().op == IROp::JUMP) {
                    if (a->instructions.back().src1.val_s == b->label) {
                        a->instructions.pop_back();
                    }
                }

                // 2. Append instructions of B into A (skipping B's leading label if identical)
                for (const auto& inst : b->instructions) {
                    if (inst.op == IROp::LABEL && inst.dst.val_s == b->label) {
                        continue;
                    }
                    a->instructions.push_back(inst);
                }

                // 3. Update edges: A inherits B's successors
                a->successors = b->successors;
                for (auto* s : a->successors) {
                    for (size_t p = 0; p < s->predecessors.size(); ++p) {
                        if (s->predecessors[p] == b) {
                            s->predecessors[p] = a;
                        }
                    }
                }

                b->is_unreachable = true;
                b->predecessors.clear();
                b->successors.clear();

                changed = true;
                break; // Restart iteration after structural change
            }
        }
    }

    if (changed) {
        // Clean up unreachable merged blocks
        blocks_.erase(
            std::remove_if(blocks_.begin(), blocks_.end(),
                           [](const std::unique_ptr<BasicBlock>& b) { return b->is_unreachable; }),
            blocks_.end());
        detect_loops();
    }

    return changed;
}

bool CFG::eliminate_unreachable() {
    if (!entry_) return false;

    std::unordered_set<BasicBlock*> reachable;
    std::queue<BasicBlock*> q;

    reachable.insert(entry_);
    q.push(entry_);

    while (!q.empty()) {
        BasicBlock* curr = q.front();
        q.pop();

        for (auto* succ : curr->successors) {
            if (succ && reachable.find(succ) == reachable.end()) {
                reachable.insert(succ);
                q.push(succ);
            }
        }
    }

    bool changed = false;
    for (auto& b : blocks_) {
        if (reachable.find(b.get()) == reachable.end()) {
            b->is_unreachable = true;
            changed = true;
        }
    }

    if (changed) {
        // Remove dead predecessors from living blocks
        for (auto& b : blocks_) {
            if (!b->is_unreachable) {
                b->predecessors.erase(
                    std::remove_if(b->predecessors.begin(), b->predecessors.end(),
                                   [](BasicBlock* p) { return p->is_unreachable; }),
                    b->predecessors.end());
            }
        }

        blocks_.erase(
            std::remove_if(blocks_.begin(), blocks_.end(),
                           [](const std::unique_ptr<BasicBlock>& b) { return b->is_unreachable; }),
            blocks_.end());
        detect_loops();
    }

    return changed;
}

void CFG::rebuild_instructions(IRFunction& fn) {
    fn.instructions.clear();

    for (const auto& bb : blocks_) {
        // Only emit block label if it has predecessors or is target of jump
        if (!bb->predecessors.empty() && bb.get() != entry_) {
            bool has_label = false;
            for (const auto& inst : bb->instructions) {
                if (inst.op == IROp::LABEL && inst.dst.val_s == bb->label) {
                    has_label = true;
                    break;
                }
            }
            if (!has_label) {
                IRInstruction lbl;
                lbl.op = IROp::LABEL;
                lbl.dst = IROperand::label(bb->label);
                fn.instructions.push_back(lbl);
            }
        }

        for (const auto& inst : bb->instructions) {
            fn.instructions.push_back(inst);
        }
    }
}

std::string CFG::dump_dot(const std::string& fn_name) const {
    std::ostringstream oss;
    oss << "digraph " << fn_name << " {\n";
    oss << "  node [shape=box, fontname=\"Consolas\"];\n";

    for (const auto& bb : blocks_) {
        oss << "  bb" << bb->id << " [label=\"" << bb->label;
        if (bb->is_loop_header) oss << " [LOOP HEADER depth=" << bb->loop_depth << "]";
        oss << "\\n";
        for (const auto& inst : bb->instructions) {
            if (inst.op != IROp::LABEL) {
                oss << inst.to_string() << "\\n";
            }
        }
        oss << "\"];\n";

        for (auto* succ : bb->successors) {
            oss << "  bb" << bb->id << " -> bb" << succ->id;
            // Check if back edge
            for (const auto& be : back_edges_) {
                if (be.first == bb.get() && be.second == succ) {
                    oss << " [color=red, label=\"backedge\"]";
                    break;
                }
            }
            oss << ";\n";
        }
    }
    oss << "}\n";
    return oss.str();
}

std::string CFG::dump_text() const {
    std::ostringstream oss;
    for (const auto& bb : blocks_) {
        oss << "--- Block " << bb->id << " (" << bb->label << ") ";
        if (bb->is_loop_header) oss << "[LOOP HEADER, depth=" << bb->loop_depth << "] ";
        oss << "---\n";
        oss << "  Predecessors: ";
        for (auto* p : bb->predecessors) oss << p->label << " ";
        oss << "\n";
        for (const auto& inst : bb->instructions) {
            oss << "  " << inst.to_string() << "\n";
        }
        oss << "  Successors: ";
        for (auto* s : bb->successors) oss << s->label << " ";
        oss << "\n\n";
    }
    return oss.str();
}

} // namespace setun
