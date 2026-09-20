#include "vm/escape_analysis.hpp"
#include <queue>
#include <algorithm>

namespace setun {

EscapeState EscapeAnalysis::merge_states(EscapeState a, EscapeState b) {
    // Escape lattice ordering:
    // NoEscape (0) < ArgEscape (1) < ReturnEscape (2) < HeapEscape (3) < Unknown (4)
    return static_cast<EscapeState>(std::max(static_cast<uint8_t>(a), static_cast<uint8_t>(b)));
}

EscapeAnalysisResult EscapeAnalysis::analyze(const MIRFunction& func) {
    EscapeAnalysisResult result;
    uint32_t next_site_id = 1;

    // Step 1: Discover all allocation sites
    for (const auto& blk : func.blocks) {
        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::ALLOC_OBJECT) {
                AllocSiteInfo site;
                site.site_id = next_site_id++;
                site.bytecode_ip = inst.bytecode_ip;
                site.field_count = static_cast<uint32_t>(inst.imm64 & 0xFF);
                site.obj_vreg = inst.dest;
                site.state = EscapeState::NoEscape;
                site.alloc_count = 1;
                site.allocated_bytes = 32 + site.field_count * 8;
                result.sites.push_back(site);
            }
        }
    }

    result.total_candidates = result.sites.size();
    if (result.sites.empty()) {
        return result;
    }

    // Step 2: For each allocation site, perform SSA Dataflow Escape Propagation
    for (auto& site : result.sites) {
        vreg_t alloc_vreg = site.obj_vreg;
        std::unordered_set<vreg_t> aliases;
        aliases.insert(alloc_vreg);

        // Find all aliases through MOV and PHI
        bool changed = true;
        while (changed) {
            changed = false;
            for (const auto& blk : func.blocks) {
                for (const auto& inst : blk->instructions) {
                    if (inst.opcode == MIROpcode::MOV) {
                        if (aliases.count(inst.src1) && !aliases.count(inst.dest)) {
                            aliases.insert(inst.dest);
                            changed = true;
                        }
                    } else if (inst.opcode == MIROpcode::PHI) {
                        // Check if any source of PHI is in aliases
                        if (aliases.count(inst.src1) || aliases.count(inst.src2)) {
                            if (!aliases.count(inst.dest)) {
                                aliases.insert(inst.dest);
                                changed = true;
                            }
                        }
                    }
                }
            }
        }

        // Step 3: Inspect all uses of tracked aliases
        EscapeState site_state = EscapeState::NoEscape;

        for (const auto& blk : func.blocks) {
            for (const auto& inst : blk->instructions) {
                // Check if any alias is used as return value
                if (inst.opcode == MIROpcode::RET) {
                    if (inst.src1 != NO_VREG && aliases.count(inst.src1)) {
                        site_state = merge_states(site_state, EscapeState::ReturnEscape);
                    }
                }
                // Check if any alias is stored into another object's field or array
                else if (inst.opcode == MIROpcode::STORE_FIELD) {
                    // inst.src1 = target object, inst.src2 = value to store
                    if (inst.src2 != NO_VREG && aliases.count(inst.src2)) {
                        // Object being stored into another object -> HeapEscape
                        site_state = merge_states(site_state, EscapeState::HeapEscape);
                    }
                    // Writing into the object itself does not cause escape
                }
                else if (inst.opcode == MIROpcode::STORE_ELEMENT) {
                    // inst.src1 = target array, inst.src3 = value
                    if (inst.src3 != NO_VREG && aliases.count(inst.src3)) {
                        // Object being stored into an array -> HeapEscape
                        site_state = merge_states(site_state, EscapeState::HeapEscape);
                    }
                }
                // Check function / method calls
                else if (inst.opcode == MIROpcode::CALL_DIRECT ||
                         inst.opcode == MIROpcode::CALL_NATIVE ||
                         inst.opcode == MIROpcode::CALL_RUNTIME) {
                    if ((inst.src1 != NO_VREG && aliases.count(inst.src1)) ||
                        (inst.src2 != NO_VREG && aliases.count(inst.src2)) ||
                        (inst.src3 != NO_VREG && aliases.count(inst.src3))) {
                        // Passed as argument to un-inlined function -> ArgEscape
                        site_state = merge_states(site_state, EscapeState::ArgEscape);
                    }
                }
                else if (inst.opcode == MIROpcode::INVOKE_VIRTUAL) {
                    if ((inst.src1 != NO_VREG && aliases.count(inst.src1)) ||
                        (inst.src2 != NO_VREG && aliases.count(inst.src2)) ||
                        (inst.src3 != NO_VREG && aliases.count(inst.src3))) {
                        // Receiver or arg to un-inlined method -> ArgEscape
                        site_state = merge_states(site_state, EscapeState::ArgEscape);
                    }
                }
                // Normal field loads and stores on the object itself:
                else if (inst.opcode == MIROpcode::LOAD_FIELD) {
                    // Reading fields from the object does not escape
                    continue;
                }
                else if (inst.opcode == MIROpcode::GUARD_SHAPE ||
                         inst.opcode == MIROpcode::GUARD_TYPE ||
                         inst.opcode == MIROpcode::GUARD_VTABLE) {
                    // Guards test properties without causing escape
                    continue;
                }
                else if (inst.opcode == MIROpcode::MOV ||
                         inst.opcode == MIROpcode::PHI ||
                         inst.opcode == MIROpcode::NOP) {
                    continue;
                }
            }
        }

        site.state = site_state;
        for (vreg_t v : aliases) {
            result.vreg_escape_state[v] = site_state;
        }

        // Tally census counts
        switch (site_state) {
            case EscapeState::NoEscape:
                result.no_escape_count++;
                break;
            case EscapeState::ArgEscape:
                result.arg_escape_count++;
                break;
            case EscapeState::ReturnEscape:
                result.return_escape_count++;
                break;
            case EscapeState::HeapEscape:
                result.heap_escape_count++;
                break;
            case EscapeState::Unknown:
            default:
                result.unknown_escape_count++;
                break;
        }
    }

    return result;
}

} // namespace setun
