#include "vm/jit_manager.hpp"
#include "vm/optimizing_jit.hpp"
#include <fstream>

namespace setun {

JITManager::JITManager() = default;

std::shared_ptr<JITCodeObject> JITManager::get_or_create(size_t func_ip) {
    auto it = code_cache_.find(func_ip);
    if (it != code_cache_.end()) {
        return it->second;
    }
    auto obj = std::make_shared<JITCodeObject>();
    obj->start_ip = func_ip;
    code_cache_[func_ip] = obj;
    return obj;
}

bool JITManager::compile_function(const Chunk& chunk, size_t func_ip, size_t end_ip) {
    auto obj = get_or_create(func_ip);
    if (obj->status == JITCodeStatus::COMPILED) return true;

    obj->status = JITCodeStatus::COMPILING;
    obj->start_ip = func_ip;
    obj->end_ip = end_ip;

    if (!compiler_.compile_chunk(chunk, func_ip, end_ip, obj->buffer, obj->safepoints, obj->osr_table, obj->deopt_table)) {
        obj->status = JITCodeStatus::FAILED;
        return false;
    }

    obj->entry_point = reinterpret_cast<JITNativeEntryPoint>(const_cast<void*>(obj->buffer.entry_point()));
    obj->status = JITCodeStatus::COMPILED;
    obj->tier = JITTier::Tier1_Baseline;
    return true;
}

bool JITManager::compile_tier2(const Chunk& chunk, size_t func_ip, const ProfileSnapshot* profile) {
    OptimizingJITCompiler opt_compiler(opt_flags_);
    auto opt_obj = opt_compiler.compile_tier2(chunk, static_cast<uint32_t>(func_ip), profile);
    if (!opt_obj || !opt_obj->is_executable()) {
        return false;
    }

    opt_obj->tier = JITTier::Tier2_Optimizing;
    code_cache_[func_ip] = opt_obj;
    return true;
}

int64_t JITManager::execute_native(VM* vm, size_t func_ip, JITFrame* frame) {
    auto it = code_cache_.find(func_ip);
    if (it == code_cache_.end() || !it->second->is_executable()) {
        return 0;
    }
    return it->second->entry_point(vm, frame);
}

int64_t JITManager::execute_osr(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame) {
    auto it = code_cache_.find(func_ip);
    if (it == code_cache_.end() || !it->second->is_executable()) {
        return 0;
    }
    const auto* osr_rec = it->second->osr_table.find_by_bytecode_ip(loop_header_ip);
    if (!osr_rec) {
        return 0;
    }
    auto osr_entry = reinterpret_cast<JITNativeEntryPoint>(
        const_cast<uint8_t*>(it->second->buffer.data() + osr_rec->osr_native_entry_offset));
    return osr_entry(vm, frame);
}

JITExit JITManager::execute_osr_advanced(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame) {
    JITExit exit_info;
    auto it = code_cache_.find(func_ip);
    if (it == code_cache_.end() || !it->second->is_executable()) {
        exit_info.reason = JITExitReason::Bailout;
        return exit_info;
    }
    const auto* osr_rec = it->second->osr_table.find_by_bytecode_ip(loop_header_ip);
    if (!osr_rec) {
        exit_info.reason = JITExitReason::Bailout;
        return exit_info;
    }
    auto osr_entry = reinterpret_cast<JITNativeEntryPoint>(
        const_cast<uint8_t*>(it->second->buffer.data() + osr_rec->osr_native_entry_offset));

    int64_t raw_res = osr_entry(vm, frame);
    exit_info.value = VMValue::from_raw(static_cast<uint64_t>(raw_res));
    exit_info.reason = frame->exit_reason;
    exit_info.continuation = frame->continuation;
    return exit_info;
}

void JITManager::record_invocation(size_t func_ip) {
    auto obj = get_or_create(func_ip);
    obj->invocation_count++;
}

void JITManager::record_backedge(size_t func_ip) {
    auto obj = get_or_create(func_ip);
    obj->backedge_count++;
}

bool JITManager::slow_tiering_coordinator_call(VM* vm, const Chunk& chunk, size_t func_ip, FunctionHotData& hot) {
    if (!policy_.enable_auto_tiering) return false;

    // Multi-factor metrics computation (Doc/rv newg6.md Section 10):
    // Invocation count + Backedge count + Code size + Compile cost + Expected speedup
    size_t code_size = (hot.bytecode_size > 0) ? hot.bytecode_size : (chunk.code.size() > func_ip ? chunk.code.size() - func_ip : 0);
    auto it = code_cache_.find(func_ip);
    uint32_t backedge_count = (it != code_cache_.end()) ? it->second->backedge_count : 0;

    // 1. Tier-0 -> Tier-1 Baseline JIT promotion
    if (hot.tier == 0) {
        // Trivial function without loops where JIT compile cost outweighs execution benefit
        if (code_size < policy_.min_bytecode_size && backedge_count == 0) {
            return false;
        }

        uint32_t compute_weight = hot.invocation_counter + (backedge_count * 10);
        if (compute_weight >= hot.tier1_threshold) {
            bool ok = compile_function(chunk, func_ip, chunk.code.size());
            if (ok) {
                auto obj = get_or_create(func_ip);
                hot.native_entry = obj->entry_point;
                hot.tier = 1;
                hot.flags |= JIT_FLAG_TIER1_READY;
                stats_.tier1_compilations++;
                if (policy_.trace_tiering) {
                    std::cout << "[AutoTiering] Function func_ip=" << func_ip
                              << " promoted Tier-0 -> Tier-1 (calls=" << hot.invocation_counter
                              << ", backedges=" << backedge_count
                              << ", code_size=" << code_size << ")\n";
                }
                return true;
            }
        }
        return false;
    }

    // 2. Tier-1 -> Tier-2 Optimizing JIT promotion
    if (hot.tier == 1) {
        if (policy_.force_tier1_only) return true;

        // Check cooldown status
        if (hot.flags & JIT_FLAG_COOLDOWN) {
            if (hot.cooldown_budget > 0) {
                hot.cooldown_budget--;
                return true;
            } else {
                hot.flags &= ~JIT_FLAG_COOLDOWN; // Cooldown expired, re-eligible for promotion
                stats_.repromotions++;
            }
        }

        // Check hysteresis: if poisoned or previously deopted, require repromotion_threshold
        uint32_t target_thresh = (hot.deopt_count > 0) ? policy_.repromotion_threshold : hot.tier2_threshold;

        // Compile budget protection: function too large for Tier-2 optimization budget
        if (code_size > policy_.max_mir_instructions_tier2) {
            return true;
        }

        uint32_t compute_weight = hot.invocation_counter + (backedge_count * 20);
        if (compute_weight >= target_thresh) {
            // Check compile budget
            if (hot.bytecode_size > policy_.max_mir_instructions_tier2) {
                // Function too large for Tier-2 optimization budget, stay Tier-1
                return true;
            }

            // Get frozen profile snapshot
            auto& feedback = get_or_create_feedback(func_ip);
            auto snapshot = feedback.freeze_snapshot();

            // Set optimization flags based on reason-specific flags
            OptimizationFlags cur_opt = opt_flags_;
            if (hot.flags & JIT_FLAG_NO_TYPE_SPEC) {
                cur_opt.enable_rge = false; // Disable speculative type guards
            }
            if (hot.flags & JIT_FLAG_NO_MIC) {
                cur_opt.enable_mic = false; // Disable ShapeID MIC
            }
            if (hot.flags & JIT_FLAG_NO_SRA) {
                cur_opt.enable_scalar_replacement = false;
            }

            OptimizingJITCompiler opt_compiler(cur_opt);
            auto opt_obj = opt_compiler.compile_tier2(chunk, static_cast<uint32_t>(func_ip), snapshot.get());
            if (opt_obj && opt_obj->is_executable()) {
                opt_obj->tier = JITTier::Tier2_Optimizing;
                code_cache_[func_ip] = opt_obj;

                hot.native_entry = opt_obj->entry_point;
                hot.tier = 2;
                hot.flags |= JIT_FLAG_TIER2_READY;
                stats_.tier2_compilations++;
                if (policy_.trace_tiering) {
                    std::cout << "[AutoTiering] Function func_ip=" << func_ip
                              << " promoted Tier-1 -> Tier-2 (calls=" << hot.invocation_counter << ")\n";
                }
                return true;
            }
        }
    }

    return true;
}

bool JITManager::slow_tiering_coordinator_osr(VM* vm, const Chunk& chunk, size_t func_ip, uint32_t loop_target, LoopHotData& lhot) {
    if (!policy_.enable_auto_tiering) return false;

    // 1. Tier-0 -> Tier-1 OSR
    if (lhot.tier == 0) {
        if (lhot.backedge_counter >= lhot.osr_threshold) {
            auto obj = get_or_create(func_ip);
            if (obj->status == JITCodeStatus::UNCOMPILED) {
                compile_function(chunk, func_ip, chunk.code.size());
            }
            if (obj->has_osr_entry(loop_target)) {
                const auto* rec = obj->osr_table.find_by_bytecode_ip(loop_target);
                if (rec) {
                    lhot.osr_entry = reinterpret_cast<JITNativeEntryPoint>(
                        const_cast<uint8_t*>(obj->buffer.data() + rec->osr_native_entry_offset));
                    lhot.tier = 1;
                    lhot.flags |= JIT_FLAG_OSR_ELIGIBLE;
                    stats_.tier1_osr_transitions++;
                    if (policy_.trace_tiering) {
                        std::cout << "[AutoTiering] Loop loop_ip=" << loop_target
                                  << " OSR Tier-0 -> Tier-1 (backedges=" << lhot.backedge_counter << ")\n";
                    }
                    return true;
                }
            }
        }
        return false;
    }

    // 2. Tier-1 -> Tier-2 OSR (Deep hot loop)
    if (lhot.tier == 1) {
        if (policy_.force_tier1_only) return true;

        if (lhot.backedge_counter >= policy_.tier2_backedge_threshold) {
            auto& feedback = get_or_create_feedback(func_ip);
            auto snapshot = feedback.freeze_snapshot();

            bool ok = compile_tier2(chunk, func_ip, snapshot.get());
            if (ok) {
                auto obj = get_or_create(func_ip);
                if (obj->has_osr_entry(loop_target)) {
                    const auto* rec = obj->osr_table.find_by_bytecode_ip(loop_target);
                    if (rec) {
                        lhot.osr_entry = reinterpret_cast<JITNativeEntryPoint>(
                            const_cast<uint8_t*>(obj->buffer.data() + rec->osr_native_entry_offset));
                    }
                }
                lhot.tier = 2;
                stats_.tier2_osr_transitions++;
                if (policy_.trace_tiering) {
                    std::cout << "[AutoTiering] Loop loop_ip=" << loop_target
                              << " OSR Tier-1 -> Tier-2 (backedges=" << lhot.backedge_counter << ")\n";
                }
                return true;
            }
        }
    }

    return true;
}

void JITManager::handle_deopt_feedback(size_t func_ip, uint32_t loop_ip, DeoptReason reason) {
    stats_.total_deopts++;
    switch (reason) {
        case DeoptReason::TYPE_GUARD_FAILURE: stats_.deopts_type_guard++; break;
        case DeoptReason::SHAPE_GUARD_FAILURE: stats_.deopts_shape_guard++; break;
        case DeoptReason::ARITHMETIC_OVERFLOW: stats_.deopts_overflow++; break;
        default: stats_.deopts_other++; break;
    }

    auto obj = get_or_create(func_ip);
    obj->deopt_count++;
    obj->last_deopt_reason = reason;
    obj->last_deopt_ip = loop_ip;

    // Granular reason-specific poisoning & cooldown
    FunctionHotData& hot = runtime_metadata_.get_function_hot(func_ip);
    hot.deopt_count++;

    if (reason == DeoptReason::TYPE_GUARD_FAILURE) {
        hot.flags |= JIT_FLAG_NO_TYPE_SPEC; // Disable type specialization on next re-promote
    } else if (reason == DeoptReason::SHAPE_GUARD_FAILURE) {
        hot.flags |= JIT_FLAG_NO_MIC;       // Disable shape MIC
    }

    // Set cooldown period
    hot.flags |= JIT_FLAG_COOLDOWN;
    hot.cooldown_budget = policy_.cooldown_period;
    stats_.cooldown_events++;

    // Demote back to Tier-1 Baseline JIT
    obj->tier = JITTier::Tier1_Baseline;
    hot.tier = 1;

    // If deopt threshold exceeded within deopt window -> mark poisoned
    if (obj->deopt_count >= policy_.deopt_limit) {
        obj->is_poisoned = true;
        stats_.poisoned_functions++;
        hot.tier2_threshold = policy_.repromotion_threshold; // Raise bar with hysteresis
        if (policy_.trace_tiering) {
            std::cout << "[AutoTiering] Function func_ip=" << func_ip
                      << " poisoned (deopts=" << obj->deopt_count << "), demoted to Tier-1\n";
        }
    }
}

void JITManager::print_stats() const {
    std::cout << "\n===================================================================\n";
    std::cout << "                 TERSUN RUNTIME JIT TELEMETRY                      \n";
    std::cout << "===================================================================\n";
    std::cout << "  Compilations:\n";
    std::cout << "    Tier-1 Baseline JIT Compilations : " << stats_.tier1_compilations << "\n";
    std::cout << "    Tier-2 Optimizing Compilations   : " << stats_.tier2_compilations << "\n";
    std::cout << "  Executions & OSR Transitions:\n";
    std::cout << "    Tier-1 Function Calls Dispatched : " << stats_.tier1_executions << "\n";
    std::cout << "    Tier-2 Function Calls Dispatched : " << stats_.tier2_executions << "\n";
    std::cout << "    Tier-1 OSR Loop Transitions      : " << stats_.tier1_osr_transitions << "\n";
    std::cout << "    Tier-2 OSR Loop Transitions      : " << stats_.tier2_osr_transitions << "\n";
    std::cout << "  Deoptimizations & Adaptive Poisoning:\n";
    std::cout << "    Total Deopts Bailouts            : " << stats_.total_deopts << "\n";
    std::cout << "    - Type Guard Failures            : " << stats_.deopts_type_guard << "\n";
    std::cout << "    - Shape Guard Failures           : " << stats_.deopts_shape_guard << "\n";
    std::cout << "    - Arithmetic Overflows           : " << stats_.deopts_overflow << "\n";
    std::cout << "    Cooldown Events Triggered        : " << stats_.cooldown_events << "\n";
    std::cout << "    Poisoned Functions (Demoted)     : " << stats_.poisoned_functions << "\n";
    std::cout << "    Re-promotions via Hysteresis     : " << stats_.repromotions << "\n";
    std::cout << "===================================================================\n";
}

void JITManager::invalidate(size_t func_ip) {
    auto it = code_cache_.find(func_ip);
    if (it != code_cache_.end()) {
        it->second->status = JITCodeStatus::INVALIDATED;
        it->second->state = CodeState::Invalidated;
        it->second->entry_point = nullptr;
    }
}

void JITManager::clear() {
    code_cache_.clear();
    feedback_vectors_.clear();
    runtime_metadata_.clear();
    stats_.reset();
}

size_t JITManager::compiled_count() const {
    size_t count = 0;
    for (const auto& [_, obj] : code_cache_) {
        if (obj->status == JITCodeStatus::COMPILED) count++;
    }
    return count;
}

void JITManager::dump_code_buffers(const std::string& prefix) const {
    for (const auto& [func_ip, obj] : code_cache_) {
        if (!obj || obj->buffer.size() == 0) continue;
        std::string filename = prefix + "_func_" + std::to_string(func_ip) + ".bin";
        std::ofstream ofs(filename, std::ios::binary);
        if (ofs.is_open()) {
            ofs.write(reinterpret_cast<const char*>(obj->buffer.data()), obj->buffer.size());
            std::cout << "[JIT Dump] Wrote " << obj->buffer.size() << " bytes machine code to " << filename << "\n";
        }
    }
}

} // namespace setun
