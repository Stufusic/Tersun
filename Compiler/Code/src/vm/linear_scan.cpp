#include "vm/linear_scan.hpp"
#include <algorithm>
#include <map>
#include <vector>
#include <cassert>

namespace setun {

std::vector<uint8_t> RegisterSet::get_allocatable_registers() {
    // Windows x64 ABI allocatable registers (excluding RSP=4, RBP=5, R10=10, R11=11)
    // Callee-saved registers first for long-lived loop variables (RBX, RSI, RDI, R12, R13, R14, R15),
    // followed by safe caller-saved (R8, R9, RCX), and scratch registers (RDX=2, RAX=0) last
    // to avoid clobber by idiv / cqo.
    return {
        3,  // RBX (callee-saved)
        6,  // RSI (callee-saved)
        7,  // RDI (callee-saved)
        12, // R12 (callee-saved)
        13, // R13 (callee-saved)
        14, // R14 (callee-saved)
        15, // R15 (callee-saved)
        8,  // R8  (caller-saved)
        9,  // R9  (caller-saved)
        1,  // RCX (caller-saved)
        2,  // RDX (caller-saved scratch)
        0   // RAX (caller-saved scratch)
    };
}

bool RegisterSet::is_callee_saved(uint8_t reg) {
    return reg == 3 || reg == 6 || reg == 7 || (reg >= 12 && reg <= 15);
}

RegisterAllocationResult LinearScanAllocator::allocate(const MIRFunction& func) {
    RegisterAllocationResult result;

    // Step 1: Compute Live Intervals
    std::map<vreg_t, uint32_t> def_points;
    std::map<vreg_t, uint32_t> last_use_points;
    std::vector<uint32_t> call_points;

    uint32_t inst_idx = 0;
    for (const auto& blk : func.blocks) {
        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::CALL_RUNTIME ||
                inst.opcode == MIROpcode::CALL_DIRECT ||
                inst.opcode == MIROpcode::INVOKE_VIRTUAL) {
                call_points.push_back(inst_idx);
            }
            if (inst.dest != NO_VREG) {
                if (def_points.find(inst.dest) == def_points.end()) {
                    def_points[inst.dest] = inst_idx;
                }
                last_use_points[inst.dest] = std::max(last_use_points[inst.dest], inst_idx);
            }
            if (inst.src1 != NO_VREG) last_use_points[inst.src1] = std::max(last_use_points[inst.src1], inst_idx);
            if (inst.src2 != NO_VREG) last_use_points[inst.src2] = std::max(last_use_points[inst.src2], inst_idx);
            if (inst.src3 != NO_VREG) last_use_points[inst.src3] = std::max(last_use_points[inst.src3], inst_idx);
            if (inst.guard.input_vreg != NO_VREG) last_use_points[inst.guard.input_vreg] = std::max(last_use_points[inst.guard.input_vreg], inst_idx);
            for (vreg_t v : inst.extra_args) {
                if (v != NO_VREG) last_use_points[v] = std::max(last_use_points[v], inst_idx);
            }

            inst_idx++;
        }
    }

    // Any vreg used but not defined is an incoming local parameter defined at entry (0)
    for (const auto& [v, last_use] : last_use_points) {
        if (def_points.find(v) == def_points.end()) {
            def_points[v] = 0;
        }
    }

    // Step 1b: Loop Live-Range Extension
    std::map<uint32_t, uint32_t> block_start;
    std::map<uint32_t, uint32_t> block_end;
    {
        uint32_t cur_idx = 0;
        for (const auto& blk : func.blocks) {
            block_start[blk->id] = cur_idx;
            if (!blk->instructions.empty()) {
                cur_idx += blk->instructions.size();
                block_end[blk->id] = cur_idx - 1;
            } else {
                block_end[blk->id] = cur_idx;
            }
        }
    }

    struct LoopRange { uint32_t start_inst; uint32_t end_inst; };
    std::vector<LoopRange> loops;
    for (const auto& blk : func.blocks) {
        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::JMP || inst.opcode == MIROpcode::JCC) {
                uint32_t target_blk = inst.target_block;
                if (block_start.count(target_blk) && block_start[target_blk] <= block_start[blk->id]) {
                    loops.push_back({block_start[target_blk], block_end[blk->id]});
                }
            }
        }
    }

    for (const auto& loop : loops) {
        for (auto& [v, last_use] : last_use_points) {
            if (last_use >= loop.start_inst) {
                uint32_t def_pos = def_points.count(v) ? def_points[v] : 0;
                if (def_pos < loop.start_inst) {
                    last_use = std::max(last_use, loop.end_inst);
                }
            }
        }
    }

    std::set<vreg_t> loop_carried_vars;
    for (const auto& loop : loops) {
        for (const auto& [v, last_use] : last_use_points) {
            if (last_use >= loop.end_inst) {
                uint32_t def_pos = def_points.count(v) ? def_points[v] : 0;
                if (def_pos < loop.start_inst) {
                    loop_carried_vars.insert(v);
                }
            }
        }
    }

    std::vector<LiveInterval> intervals;
    for (vreg_t v = 0; v < func.next_vreg; ++v) {
        if (def_points.count(v)) {
            LiveInterval li;
            li.vreg = v;
            li.start_point = def_points[v];
            li.end_point = last_use_points.count(v) ? last_use_points[v] : def_points[v];
            intervals.push_back(li);
        }
    }

    // Sort intervals by start_point
    std::sort(intervals.begin(), intervals.end(), [](const LiveInterval& a, const LiveInterval& b) {
        return a.start_point < b.start_point;
    });

    // Step 2: Linear Scan Allocation
    std::vector<uint8_t> free_regs = RegisterSet::get_allocatable_registers();
    std::vector<LiveInterval*> active;

    auto expire_old_intervals = [&](uint32_t cur_start) {
        auto it = active.begin();
        while (it != active.end()) {
            LiveInterval* act = *it;
            if (act->end_point < cur_start) {
                if (act->assigned_reg >= 0) {
                    free_regs.push_back(static_cast<uint8_t>(act->assigned_reg));
                }
                it = active.erase(it);
            } else {
                ++it;
            }
        }
    };

    uint32_t spill_counter = 0;

    for (auto& cur : intervals) {
        expire_old_intervals(cur.start_point);

        bool crosses_call = false;
        for (uint32_t cp : call_points) {
            if (cp >= cur.start_point && cp <= cur.end_point) {
                crosses_call = true;
                break;
            }
        }
        bool needs_callee_saved = crosses_call || loop_carried_vars.count(cur.vreg);

        auto reg_it = free_regs.end();
        if (needs_callee_saved) {
            for (auto it = free_regs.begin(); it != free_regs.end(); ++it) {
                if (RegisterSet::is_callee_saved(*it)) {
                    reg_it = it;
                    break;
                }
            }
            // If the variable does NOT cross any function call, falling back to a caller-saved register is 100% safe
            if (reg_it == free_regs.end() && !crosses_call && !free_regs.empty()) {
                reg_it = free_regs.begin();
            }
        } else if (!free_regs.empty()) {
            reg_it = free_regs.begin();
        }

        if (reg_it != free_regs.end()) {
            uint8_t r = *reg_it;
            free_regs.erase(reg_it);
            cur.assigned_reg = static_cast<int8_t>(r);
            if (RegisterSet::is_callee_saved(r)) {
                result.used_callee_saved_regs.insert(r);
            }

            active.push_back(&cur);
            std::sort(active.begin(), active.end(), [](const LiveInterval* a, const LiveInterval* b) {
                return a->end_point < b->end_point;
            });
        } else {
            // Spill candidate
            cur.assigned_reg = -1;
            cur.spill_offset = static_cast<int32_t>(spill_counter++ * 8);
        }
    }

    result.total_spill_slots = spill_counter;

    // Step 3: Populate Result Locations
    for (const auto& li : intervals) {
        Location loc;
        if (li.assigned_reg >= 0) {
            loc.kind = Location::Register;
            loc.reg_index = static_cast<uint16_t>(li.assigned_reg);
            loc.offset = 0;
        } else {
            loc.kind = Location::StackSlot;
            loc.reg_index = 0;
            loc.offset = li.spill_offset;
        }
        result.vreg_locations[li.vreg] = loc;
    }

    return result;
}

} // namespace setun
