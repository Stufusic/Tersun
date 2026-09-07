#pragma once

#include "compiler/emitter.hpp"
#include "vm/opcode.hpp"
#include <cstdint>
#include <vector>
#include <unordered_map>
#include <memory>
#include <iostream>
#include <cstring>

namespace setun {

// ============================================================================
// Gate 4: Inline Cache Site Metadata (Shape-based object and index caching)
// ============================================================================
struct ICSite {
    uint32_t expected_shape{0};
    uint16_t cached_slot{0};
    uint16_t str_id{0};
};

// ============================================================================
// Gate 4: In-Memory Optimized Chunk (oBC Layer - Tier-1 Execution Buffer)
// Canonical .tbc remains completely immutable. Quickening & patching occur here.
// ============================================================================
struct OptimizedChunk : public Chunk {
    std::vector<ICSite> ic_sites;
    std::vector<uint8_t> warmup_counters;

    void init_warmup() {
        warmup_counters.assign(code.size(), 0);
    }

    size_t get_frame_size(size_t fn_idx, size_t min_needed = 0) const {
        size_t sz = 32;
        if (fn_idx < function_frame_sizes.size() && function_frame_sizes[fn_idx] > 0) {
            sz = function_frame_sizes[fn_idx];
        }
        if (sz < min_needed + 8) sz = min_needed + 8;
        return sz;
    }
};

// ============================================================================
// Gate 4 Ablation Flags for Scientific Experiments (V3 -> V4A..V4F)
// ============================================================================
struct OptFlags {
    bool enable_locals{true};         // Tier A: LOAD/STORE_LOCAL_0..3, INCR_LOCAL_IMM (4A)
    bool enable_array_indexing{true}; // Tier B: Array indexing superinstructions
    bool enable_loop_fusion{true};    // Tier C: LOOP_RANGE_FAST (4B)
    bool enable_quickening{true};     // Adaptive Quickening (4C)
    bool enable_field_ic{true};       // Shape-based Field Inline Cache (4D)
    bool enable_fast_frames{true};    // Zero dynamic allocation call frames (4E)

    static OptFlags all_enabled() { return OptFlags{true, true, true, true, true, true}; }
    static OptFlags baseline_v3() { return OptFlags{false, false, false, false, false, false}; }
    static OptFlags tier_a_only() { return OptFlags{true, false, false, false, false, false}; }
    static OptFlags tier_b_only() { return OptFlags{true, true, false, false, false, false}; }
};

class OptBytecodeOptimizer {
public:
    static inline size_t canonical_inst_len(uint8_t op) {
        switch (static_cast<OpCode>(op)) {
            case OpCode::OP_PUSH_INT:
            case OpCode::OP_PUSH_FLOAT:
                return 9;
            case OpCode::OP_PUSH_TRYTE:
            case OpCode::OP_PUSH_STRING:
            case OpCode::OP_LOAD_LOCAL:
            case OpCode::OP_STORE_LOCAL:
            case OpCode::OP_LOAD_GLOBAL:
            case OpCode::OP_STORE_GLOBAL:
            case OpCode::OP_JUMP:
            case OpCode::OP_JUMP_IF_FALSE:
            case OpCode::OP_GET_FIELD:
            case OpCode::OP_SET_FIELD:
            case OpCode::OP_NEW_ARRAY:
            case OpCode::OP_TRY:
                return 3;
            case OpCode::OP_NEW_INSTANCE:
            case OpCode::OP_INVOKE_METHOD:
            case OpCode::OP_CALL:
            case OpCode::OP_CLOSURE:
                return 4;
            case OpCode::OP_PUSH_BOOL:
            case OpCode::OP_CALL_INDIRECT:
                return 2;
            case OpCode::OP_BRANCH_3:
                return 7;
            case OpCode::OP_PUSH_TAFPU:
                return 21;
            default:
                return 1;
        }
    }

    // Transforms an immutable canonical Chunk into an in-memory OptimizedChunk (oBC)
    static OptimizedChunk optimize(const Chunk& src, OptFlags flags = OptFlags::all_enabled()) {
        OptimizedChunk opt;
        opt.string_table = src.string_table;
        opt.vtables = src.vtables;
        opt.function_table = src.function_table;
        opt.function_frame_sizes = src.function_frame_sizes;
        opt.toplevel_frame_size = src.toplevel_frame_size;

        if (src.code.empty()) return opt;

        // pc_map: maps canonical bytecode byte offset -> optimized bytecode byte offset
        std::vector<size_t> pc_map(src.code.size() + 1, 0);

        // Track jump patch sites that need relative offset recalculation in Pass 2
        struct JumpPatch {
            size_t opt_offset_pos;  // position in opt.code where int16 offset begins
            size_t orig_target_pc;  // target location in src.code
            size_t opt_inst_end;    // end of instruction in opt.code (PC base for relative jump)
        };
        std::vector<JumpPatch> jump_patches;

        size_t ip = 0;

        // ====================================================================
        // Pass 1: Pattern Recognition, Superinstruction Fusion & oBC Generation
        // ====================================================================
        while (ip < src.code.size()) {
            size_t orig_ip = ip;
            size_t opt_ip = opt.code.size();
            pc_map[orig_ip] = opt_ip;

            uint8_t op = src.code[ip];
            size_t line = (ip < src.lines.size()) ? src.lines[ip] : 1;

            // ----------------------------------------------------------------
            // Pattern: Tier C Loop Fusion (OP_LOOP_RANGE_FAST)
            // Canonical loop header from emitter.cpp is exactly 46 bytes:
            // 0x10 step (3B) + 0x01 0 (9B) + 0x34 (1B) + 0x10 var (3B) + 0x10 stop (3B)
            // + 0x32 (1B) + 0x27 (1B) + 0x10 step (3B) + 0x01 0 (9B) + 0x32 (1B)
            // + 0x10 var (3B) + 0x10 stop (3B) + 0x34 (1B) + 0x27 (1B) + 0x28 (1B)
            // + 0x51 exit_jump (3B)
            // ----------------------------------------------------------------
            if (flags.enable_loop_fusion && ip + 46 <= src.code.size() &&
                op == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 3] == static_cast<uint8_t>(OpCode::OP_PUSH_INT) &&
                src.code[ip + 12] == static_cast<uint8_t>(OpCode::OP_GT) &&
                src.code[ip + 13] == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 16] == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 19] == static_cast<uint8_t>(OpCode::OP_LT) &&
                src.code[ip + 20] == static_cast<uint8_t>(OpCode::OP_TERNARY_MIN) &&
                src.code[ip + 21] == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 24] == static_cast<uint8_t>(OpCode::OP_PUSH_INT) &&
                src.code[ip + 33] == static_cast<uint8_t>(OpCode::OP_LT) &&
                src.code[ip + 34] == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 37] == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 40] == static_cast<uint8_t>(OpCode::OP_GT) &&
                src.code[ip + 41] == static_cast<uint8_t>(OpCode::OP_TERNARY_MIN) &&
                src.code[ip + 42] == static_cast<uint8_t>(OpCode::OP_TERNARY_MAX) &&
                src.code[ip + 43] == static_cast<uint8_t>(OpCode::OP_JUMP_IF_FALSE))
            {
                uint16_t step_slot = static_cast<uint16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                uint16_t var_slot  = static_cast<uint16_t>(src.code[ip + 14] | (src.code[ip + 15] << 8));
                uint16_t stop_slot = static_cast<uint16_t>(src.code[ip + 17] | (src.code[ip + 18] << 8));
                int16_t orig_exit_off = static_cast<int16_t>(src.code[ip + 44] | (src.code[ip + 45] << 8));
                size_t orig_exit_target = ip + 46 + orig_exit_off;

                // Emit fused OP_LOOP_RANGE_FAST:
                // [opcode (1B), var_slot (2B), stop_slot (2B), step_slot (2B), exit_jump (2B)] = 9B total
                opt.write_opcode(OpCode::OP_LOOP_RANGE_FAST, line);
                opt.write_int16(static_cast<int16_t>(var_slot), line);
                opt.write_int16(static_cast<int16_t>(stop_slot), line);
                opt.write_int16(static_cast<int16_t>(step_slot), line);

                size_t patch_pos = opt.code.size();
                opt.write_int16(0, line); // placeholder
                size_t inst_end = opt.code.size();

                jump_patches.push_back(JumpPatch{patch_pos, orig_exit_target, inst_end});

                for (size_t k = orig_ip; k < orig_ip + 46; ++k) {
                    pc_map[k] = opt_ip;
                }
                ip += 46;
                continue;
            }

            // ----------------------------------------------------------------
            // Pattern: Tier A In-place Increment (OP_INCR_LOCAL_IMM)
            // OP_LOAD_LOCAL slot (3B) + OP_PUSH_INT val (9B) + OP_ADD (1B) + OP_STORE_LOCAL slot (3B) = 16B
            // ----------------------------------------------------------------
            if (flags.enable_locals && ip + 16 <= src.code.size() &&
                op == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) &&
                src.code[ip + 3] == static_cast<uint8_t>(OpCode::OP_PUSH_INT) &&
                src.code[ip + 12] == static_cast<uint8_t>(OpCode::OP_ADD) &&
                src.code[ip + 13] == static_cast<uint8_t>(OpCode::OP_STORE_LOCAL))
            {
                uint16_t slot1 = static_cast<uint16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                uint16_t slot2 = static_cast<uint16_t>(src.code[ip + 14] | (src.code[ip + 15] << 8));
                if (slot1 == slot2) {
                    int64_t imm = 0;
                    std::memcpy(&imm, &src.code[ip + 4], 8);
                    if (imm >= -32768 && imm <= 32767) {
                        opt.write_opcode(OpCode::OP_INCR_LOCAL_IMM, line);
                        opt.write_int16(static_cast<int16_t>(slot1), line);
                        opt.write_int16(static_cast<int16_t>(imm), line);

                        for (size_t k = orig_ip; k < orig_ip + 16; ++k) pc_map[k] = opt_ip;
                        ip += 16;
                        continue;
                    }
                }
            }

            // ----------------------------------------------------------------
            // Pattern: Tier A Small Local Slot Direct Access (0..3)
            // ----------------------------------------------------------------
            if (flags.enable_locals && op == static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL) && ip + 2 < src.code.size()) {
                uint16_t slot = static_cast<uint16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                if (slot <= 3) {
                    opt.write_opcode(static_cast<OpCode>(static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL_0) + slot), line);
                    for (size_t k = orig_ip; k < orig_ip + 3; ++k) pc_map[k] = opt_ip;
                    ip += 3;
                    continue;
                }
            }

            if (flags.enable_locals && op == static_cast<uint8_t>(OpCode::OP_STORE_LOCAL) && ip + 2 < src.code.size()) {
                uint16_t slot = static_cast<uint16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                if (slot <= 3) {
                    opt.write_opcode(static_cast<OpCode>(static_cast<uint8_t>(OpCode::OP_STORE_LOCAL_0) + slot), line);
                    for (size_t k = orig_ip; k < orig_ip + 3; ++k) pc_map[k] = opt_ip;
                    ip += 3;
                    continue;
                }
            }

            // ----------------------------------------------------------------
            // Pattern: Tier 4D Shape-based Field Access (OP_GET_FIELD_IC)
            // ----------------------------------------------------------------
            if (flags.enable_field_ic && op == static_cast<uint8_t>(OpCode::OP_GET_FIELD) && ip + 2 < src.code.size()) {
                uint16_t str_id = static_cast<uint16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                uint16_t ic_idx = static_cast<uint16_t>(opt.ic_sites.size());
                opt.ic_sites.push_back(ICSite{0, 0, str_id});

                opt.write_opcode(OpCode::OP_GET_FIELD_IC, line);
                opt.write_int16(static_cast<int16_t>(ic_idx), line);
                for (size_t k = orig_ip; k < orig_ip + 3; ++k) pc_map[k] = opt_ip;
                ip += 3;
                continue;
            }

            if (flags.enable_field_ic && op == static_cast<uint8_t>(OpCode::OP_SET_FIELD) && ip + 2 < src.code.size()) {
                uint16_t str_id = static_cast<uint16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                uint16_t ic_idx = static_cast<uint16_t>(opt.ic_sites.size());
                opt.ic_sites.push_back(ICSite{0, 0, str_id});

                opt.write_opcode(OpCode::OP_SET_FIELD_IC, line);
                opt.write_int16(static_cast<int16_t>(ic_idx), line);
                for (size_t k = orig_ip; k < orig_ip + 3; ++k) pc_map[k] = opt_ip;
                ip += 3;
                continue;
            }

            // ----------------------------------------------------------------
            // Standard Opcode Copy with Relative Jump Recording
            // ----------------------------------------------------------------
            size_t inst_len = canonical_inst_len(op);
            if (op == static_cast<uint8_t>(OpCode::OP_JUMP) || op == static_cast<uint8_t>(OpCode::OP_JUMP_IF_FALSE) ||
                op == static_cast<uint8_t>(OpCode::OP_TRY)) {
                int16_t orig_off = static_cast<int16_t>(src.code[ip + 1] | (src.code[ip + 2] << 8));
                size_t orig_target = ip + 3 + orig_off;

                opt.write_byte(op, line);
                size_t patch_pos = opt.code.size();
                opt.write_int16(0, line); // placeholder
                size_t inst_end = opt.code.size();

                jump_patches.push_back(JumpPatch{patch_pos, orig_target, inst_end});
            } else if (op == static_cast<uint8_t>(OpCode::OP_BRANCH_3)) {
                opt.write_byte(op, line);
                for (int arm = 0; arm < 3; ++arm) {
                    int16_t orig_off = static_cast<int16_t>(src.code[ip + 1 + arm * 2] | (src.code[ip + 2 + arm * 2] << 8));
                    size_t rel_base_orig = (arm == 0) ? (ip + 3) : ((arm == 1) ? (ip + 5) : (ip + 7));
                    size_t rel_base_opt = (arm == 0) ? (opt_ip + 3) : ((arm == 1) ? (opt_ip + 5) : (opt_ip + 7));
                    size_t orig_target = rel_base_orig + orig_off;
                    size_t patch_pos = opt.code.size();
                    opt.write_int16(0, line);
                    jump_patches.push_back(JumpPatch{patch_pos, orig_target, rel_base_opt});
                }
            } else {
                for (size_t k = 0; k < inst_len && (ip + k) < src.code.size(); ++k) {
                    opt.write_byte(src.code[ip + k], line);
                }
            }

            for (size_t k = orig_ip; k < orig_ip + inst_len && k < src.code.size(); ++k) {
                pc_map[k] = opt_ip;
            }
            ip += inst_len;
        }

        pc_map[src.code.size()] = opt.code.size();

        // ====================================================================
        // Pass 2: Re-patch All Relative Jump Targets According to pc_map
        // ====================================================================
        for (const auto& jp : jump_patches) {
            size_t opt_target = (jp.orig_target_pc < pc_map.size()) ? pc_map[jp.orig_target_pc] : opt.code.size();
            int16_t new_off = static_cast<int16_t>(static_cast<int64_t>(opt_target) - static_cast<int64_t>(jp.opt_inst_end));
            opt.code[jp.opt_offset_pos] = static_cast<uint8_t>(new_off & 0xFF);
            opt.code[jp.opt_offset_pos + 1] = static_cast<uint8_t>((new_off >> 8) & 0xFF);
        }

        // Re-patch function table absolute entries
        for (auto& fn_entry : opt.function_table) {
            if (fn_entry < pc_map.size()) {
                fn_entry = static_cast<uint32_t>(pc_map[fn_entry]);
            }
        }

        // Re-patch vtable method offsets (only for legacy v1 chunks without function table)
        if (opt.function_table.empty()) {
            for (auto& [cname, method_map] : opt.vtables) {
                for (auto& [mname, moffset] : method_map) {
                    if (moffset < pc_map.size()) {
                        moffset = static_cast<uint16_t>(pc_map[moffset]);
                    }
                }
            }
        }
        // Ensure function_frame_sizes is large enough
        if (opt.function_frame_sizes.size() < opt.function_table.size()) {
            opt.function_frame_sizes.resize(opt.function_table.size(), 32);
        }
        if (opt.toplevel_frame_size < 32) opt.toplevel_frame_size = 32;

        // Static verification pass: scan all bytecode to enforce:
        // current_frame_size >= max_local_slot + 1
        int toplevel_max = -1;
        std::vector<int> fn_max(opt.function_table.size(), -1);

        auto opt_inst_len = [](uint8_t op) -> size_t {
            switch (static_cast<OpCode>(op)) {
                case OpCode::OP_PUSH_INT:
                case OpCode::OP_PUSH_FLOAT:
                    return 9;
                case OpCode::OP_PUSH_TRYTE:
                case OpCode::OP_PUSH_STRING:
                case OpCode::OP_LOAD_LOCAL:
                case OpCode::OP_STORE_LOCAL:
                case OpCode::OP_LOAD_GLOBAL:
                case OpCode::OP_STORE_GLOBAL:
                case OpCode::OP_JUMP:
                case OpCode::OP_JUMP_IF_FALSE:
                case OpCode::OP_GET_FIELD:
                case OpCode::OP_SET_FIELD:
                case OpCode::OP_NEW_ARRAY:
                case OpCode::OP_TRY:
                    return 3;
                case OpCode::OP_NEW_INSTANCE:
                case OpCode::OP_INVOKE_METHOD:
                case OpCode::OP_CALL:
                case OpCode::OP_CLOSURE:
                    return 4;
                case OpCode::OP_PUSH_BOOL:
                case OpCode::OP_CALL_INDIRECT:
                    return 2;
                case OpCode::OP_BRANCH_3:
                    return 7;
                case OpCode::OP_PUSH_TAFPU:
                    return 21;
                case OpCode::OP_INCR_LOCAL_IMM:
                    return 5;
                case OpCode::OP_LOOP_RANGE_FAST:
                    return 9;
                case OpCode::OP_GET_FIELD_IC:
                case OpCode::OP_SET_FIELD_IC:
                    return 7;
                default:
                    return 1;
            }
        };

        size_t scan_ip = 0;
        while (scan_ip < opt.code.size()) {
            uint8_t op = opt.code[scan_ip];
            int cur_fn = -1;
            for (size_t f = 1; f < opt.function_table.size(); ++f) {
                if (scan_ip >= opt.function_table[f]) {
                    cur_fn = static_cast<int>(f);
                }
            }

            auto update_slot = [&](int slot) {
                if (cur_fn >= 0 && static_cast<size_t>(cur_fn) < fn_max.size()) {
                    if (slot > fn_max[cur_fn]) fn_max[cur_fn] = slot;
                } else {
                    if (slot > toplevel_max) toplevel_max = slot;
                }
            };

            switch (static_cast<OpCode>(op)) {
                case OpCode::OP_LOAD_LOCAL:
                case OpCode::OP_STORE_LOCAL:
                    if (scan_ip + 2 < opt.code.size()) {
                        uint16_t s = static_cast<uint16_t>(opt.code[scan_ip + 1] | (opt.code[scan_ip + 2] << 8));
                        update_slot(s);
                    }
                    break;
                case OpCode::OP_LOAD_LOCAL_0:
                case OpCode::OP_STORE_LOCAL_0:
                    update_slot(0); break;
                case OpCode::OP_LOAD_LOCAL_1:
                case OpCode::OP_STORE_LOCAL_1:
                    update_slot(1); break;
                case OpCode::OP_LOAD_LOCAL_2:
                case OpCode::OP_STORE_LOCAL_2:
                    update_slot(2); break;
                case OpCode::OP_LOAD_LOCAL_3:
                case OpCode::OP_STORE_LOCAL_3:
                    update_slot(3); break;
                case OpCode::OP_INCR_LOCAL_IMM:
                    if (scan_ip + 2 < opt.code.size()) {
                        uint16_t s = static_cast<uint16_t>(opt.code[scan_ip + 1] | (opt.code[scan_ip + 2] << 8));
                        update_slot(s);
                    }
                    break;
                case OpCode::OP_LOOP_RANGE_FAST:
                    if (scan_ip + 6 < opt.code.size()) {
                        uint16_t s = static_cast<uint16_t>(opt.code[scan_ip + 1] | (opt.code[scan_ip + 2] << 8));
                        uint16_t stop_s = static_cast<uint16_t>(opt.code[scan_ip + 3] | (opt.code[scan_ip + 4] << 8));
                        uint16_t step_s = static_cast<uint16_t>(opt.code[scan_ip + 5] | (opt.code[scan_ip + 6] << 8));
                        update_slot(s);
                        update_slot(stop_s);
                        update_slot(step_s);
                    }
                    break;
                default:
                    break;
            }
            scan_ip += opt_inst_len(op);
        }

        if (toplevel_max >= 0) {
            size_t needed = static_cast<size_t>(toplevel_max + 1 + 8);
            if (needed > opt.toplevel_frame_size) opt.toplevel_frame_size = needed;
        }
        for (size_t f = 0; f < fn_max.size(); ++f) {
            if (fn_max[f] >= 0) {
                uint16_t needed = static_cast<uint16_t>(fn_max[f] + 1 + 8);
                if (needed > opt.function_frame_sizes[f]) opt.function_frame_sizes[f] = needed;
            }
        }

        opt.init_warmup();
        return opt;
    }
};

} // namespace setun
