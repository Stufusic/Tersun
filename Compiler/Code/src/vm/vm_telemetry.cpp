// ==============================================================================
// Tersun Gate 6 Rebuild (G6R.1) Performance Forensics Subsystem Implementation
// Exhaustive 8-group telemetry reporting & JSON export
// ==============================================================================

#include "vm/vm_telemetry.hpp"
#include <fstream>
#include <iomanip>
#include <cstring>
#include <sstream>

namespace tersun {

void VMTelemetryManager::reset() noexcept {
    wall_clock_ = WallClockTelemetry{};
    jit_telemetry_ = JITEconomicsTelemetry{};
    dispatch_telemetry_ = DispatchTelemetry{};
    op_telemetry_ = OpcodeTelemetry{};
    stack_telemetry_ = StackExecutionStateTelemetry{};
    tos_telemetry_ = TOSTelemetry{};
    call_frame_telemetry_ = CallFrameTelemetry{};
    array_telemetry_ = ArrayTelemetry{};
    fusion_telemetry_ = FusionTelemetry{};
    object_ic_telemetry_ = ObjectFieldICTelemetry{};
    gc_telemetry_ = GCTelemetry{};
    vectorization_telemetry_ = VectorizationTelemetry{};
}

void VMTelemetryManager::start_startup() noexcept {
    t_startup_start_ = std::chrono::high_resolution_clock::now();
}

void VMTelemetryManager::finish_startup() noexcept {
    auto now = std::chrono::high_resolution_clock::now();
    wall_clock_.startup_time_ns = std::chrono::duration_cast<std::chrono::nanoseconds>(now - t_startup_start_).count();
    wall_clock_.total_time_ns += wall_clock_.startup_time_ns;
}

void VMTelemetryManager::start_program() noexcept {
    t_program_start_ = std::chrono::high_resolution_clock::now();
}

void VMTelemetryManager::finish_program() noexcept {
    auto now = std::chrono::high_resolution_clock::now();
    wall_clock_.program_time_ns = std::chrono::duration_cast<std::chrono::nanoseconds>(now - t_program_start_).count();
    wall_clock_.total_time_ns += wall_clock_.program_time_ns;
}

void VMTelemetryManager::start_shutdown() noexcept {
    t_shutdown_start_ = std::chrono::high_resolution_clock::now();
}

void VMTelemetryManager::finish_shutdown() noexcept {
    auto now = std::chrono::high_resolution_clock::now();
    wall_clock_.shutdown_time_ns = std::chrono::duration_cast<std::chrono::nanoseconds>(now - t_shutdown_start_).count();
    wall_clock_.total_time_ns += wall_clock_.shutdown_time_ns;
}

void VMTelemetryManager::sync_external_metrics(uint64_t total_ops, const uint64_t* op_counts, uint64_t stack_r, uint64_t stack_w, uint64_t calls, uint64_t rets, uint64_t arr_flat_r, uint64_t arr_flat_w, uint64_t arr_gen_r, uint64_t arr_gen_w, uint64_t ic_h, uint64_t ic_m, uint64_t superinsts, uint64_t deopts, uint64_t jit_compiles, double jit_compile_ms) noexcept {
    if (total_ops > 0) {
        op_telemetry_.total_opcodes = total_ops;
        dispatch_telemetry_.total_opcode_dispatch = total_ops;
    }
    if (op_counts) {
        for (int i = 0; i < 256; ++i) {
            if (op_counts[i] > 0) {
                op_telemetry_.opcode_histogram[i] = op_counts[i];
                dispatch_telemetry_.opcode_counts[i] = op_counts[i];
            }
        }
    }
    if (stack_r > 0) stack_telemetry_.pop_count = stack_r;
    if (stack_w > 0) stack_telemetry_.push_count = stack_w;
    if (calls > 0) {
        op_telemetry_.call_count = calls;
        call_frame_telemetry_.call_count = calls;
    }
    if (rets > 0) {
        op_telemetry_.ret_count = rets;
        call_frame_telemetry_.return_count = rets;
    }
    if (arr_flat_r > 0 || arr_flat_w > 0) {
        array_telemetry_.typed_i64_load = arr_flat_r;
        array_telemetry_.typed_i64_store = arr_flat_w;
        array_telemetry_.i64_accesses = arr_flat_r + arr_flat_w;
    }
    if (arr_gen_r > 0 || arr_gen_w > 0) {
        array_telemetry_.generic_array_load = arr_gen_r;
        array_telemetry_.generic_array_store = arr_gen_w;
        array_telemetry_.generic_accesses = arr_gen_r + arr_gen_w;
    }
    if (ic_h > 0) object_ic_telemetry_.field_ic_hit = ic_h;
    if (ic_m > 0) object_ic_telemetry_.field_ic_miss = ic_m;
    if (superinsts > 0) {
        dispatch_telemetry_.superinstruction_count = superinsts;
        fusion_telemetry_.fused_opcode_execution_count = superinsts;
    }
    if (deopts > 0) jit_telemetry_.deopt_count = deopts;
    if (jit_compiles > 0) jit_telemetry_.jit_compile_count = jit_compiles;
    if (jit_compile_ms > 0.0) jit_telemetry_.jit_compile_time_ns = static_cast<uint64_t>(jit_compile_ms * 1e6);
}

void VMTelemetryManager::dump_summary(std::ostream& out) const {
    out << "\n================================================================================\n";
    out << "                 TERSUN G6R.1 VM FORENSICS & TELEMETRY SUMMARY                \n";
    out << "================================================================================\n";
    out << "  Profiling Mode       : " << (mode_ == ProfilingMode::OFF ? "OFF (0ns)" : (mode_ == ProfilingMode::LIGHT ? "LIGHT (<1% overhead)" : "FULL")) << "\n";
    out << "  Wall-clock (ms)      : Total=" << (wall_clock_.total_time_ns / 1e6)
        << ", Startup=" << (wall_clock_.startup_time_ns / 1e6)
        << ", Program=" << (wall_clock_.program_time_ns / 1e6)
        << ", Shutdown=" << (wall_clock_.shutdown_time_ns / 1e6) << "\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  Total Opcodes Exec   : " << op_telemetry_.total_opcodes << "\n";
    out << "  Branches / Calls     : Branches=" << op_telemetry_.branch_count << ", Calls=" << op_telemetry_.call_count << ", Returns=" << op_telemetry_.ret_count << "\n";
    out << "  Frames (Create/Dest) : " << call_frame_telemetry_.function_frame_create << " / " << call_frame_telemetry_.function_frame_destroy << " (Recursions: " << call_frame_telemetry_.recursive_call_count << ")\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  TOS Cache Hits       : TOS0=" << tos_telemetry_.tos0_hits 
        << ", TOS1=" << tos_telemetry_.tos1_hits 
        << " (Hit Rate: " << std::fixed << std::setprecision(2) << (tos_telemetry_.hit_rate() * 100.0) << "%)\n";
    out << "  TOS Flushes / Spills : Flushes=" << tos_telemetry_.flush_count 
        << ", Spills=" << tos_telemetry_.stack_spill_count << "\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  Superinstruction Fus : Candidates=" << fusion_telemetry_.candidate_patterns
        << ", Fused=" << fusion_telemetry_.fused_count
        << ", Executed=" << fusion_telemetry_.fused_opcode_execution_count
        << ", Rejected=" << fusion_telemetry_.rejected_count
        << " (Barrier: " << fusion_telemetry_.semantic_barrier_rejections 
        << ", JumpTarget: " << fusion_telemetry_.jump_target_rejections << ")\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  Array Access Profile : Flat=" << (array_telemetry_.i64_accesses + array_telemetry_.u8_accesses + array_telemetry_.f64_accesses + array_telemetry_.tafpu_accesses)
        << ", Generic=" << array_telemetry_.generic_accesses
        << " (Typed Ratio: " << (array_telemetry_.flat_access_ratio() * 100.0) << "%)\n";
    out << "  Bounds Checks        : Total=" << array_telemetry_.bounds_check_count 
        << ", Elided=" << array_telemetry_.bounds_check_elided << "\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  Object & Field IC    : Allocs=" << object_ic_telemetry_.object_alloc_count
        << ", Loads=" << object_ic_telemetry_.field_load_count
        << ", Stores=" << object_ic_telemetry_.field_store_count
        << ", IC Hits=" << object_ic_telemetry_.field_ic_hit
        << ", IC Misses=" << object_ic_telemetry_.field_ic_miss
        << " (IC Hit Rate: " << (object_ic_telemetry_.ic_hit_rate() * 100.0) << "%)\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  JIT Invocations / OSR: Invocations=" << jit_telemetry_.invocation_count
        << ", Backedges=" << jit_telemetry_.backedge_count
        << ", OSR=" << jit_telemetry_.osr_count
        << ", Deopts=" << jit_telemetry_.deopt_count << "\n";
    out << "  JIT Compile Times    : Total=" << (jit_telemetry_.jit_compile_time_ns / 1e6) << " ms"
        << ", Tier-1=" << jit_telemetry_.compile_time_tier1_us << " us"
        << ", Tier-2=" << jit_telemetry_.compile_time_tier2_us << " us\n";
    out << "--------------------------------------------------------------------------------\n";
    out << "  SIMD & Vectorization : Vector Loops=" << vectorization_telemetry_.vector_loop_count
        << ", Scalar Loops=" << vectorization_telemetry_.scalar_loop_count
        << ", Canonical Loops=" << vectorization_telemetry_.canonical_loop_count
        << ", Vector Width=" << vectorization_telemetry_.vector_width << "-bit\n";
    out << "  Vector Instructions  : Vector Ops=" << vectorization_telemetry_.vector_instruction_count
        << ", Scalar Ops=" << vectorization_telemetry_.scalar_instruction_count
        << ", Typed Ops=" << vectorization_telemetry_.typed_numeric_ops
        << ", Generic Ops=" << vectorization_telemetry_.generic_numeric_ops << "\n";
    out << "  Memory Normalization : Normalized=" << vectorization_telemetry_.normalized_memory_access
        << ", Rejected=" << vectorization_telemetry_.rejected_memory_access << "\n";
    out << "================================================================================\n\n";
}

void VMTelemetryManager::dump_json(const std::string& path) const {
    std::ofstream f(path);
    if (!f.is_open()) return;

    f << "{\n";
    f << "  \"profiling_mode\": \"" << (mode_ == ProfilingMode::OFF ? "OFF" : (mode_ == ProfilingMode::LIGHT ? "LIGHT" : "FULL")) << "\",\n";
    
    // Group 1: Wall-clock
    f << "  \"wall_clock\": {\n";
    f << "    \"total_time_ns\": " << wall_clock_.total_time_ns << ",\n";
    f << "    \"startup_time_ns\": " << wall_clock_.startup_time_ns << ",\n";
    f << "    \"program_time_ns\": " << wall_clock_.program_time_ns << ",\n";
    f << "    \"shutdown_time_ns\": " << wall_clock_.shutdown_time_ns << ",\n";
    f << "    \"startup_time_ms\": " << (wall_clock_.startup_time_ns / 1e6) << ",\n";
    f << "    \"program_time_ms\": " << (wall_clock_.program_time_ns / 1e6) << ",\n";
    f << "    \"total_time_ms\": " << (wall_clock_.total_time_ns / 1e6) << "\n";
    f << "  },\n";

    // Group 2: Tier & JIT
    f << "  \"tier_jit\": {\n";
    f << "    \"invocation_count\": " << jit_telemetry_.invocation_count << ",\n";
    f << "    \"backedge_count\": " << jit_telemetry_.backedge_count << ",\n";
    f << "    \"jit_compile_count\": " << jit_telemetry_.jit_compile_count << ",\n";
    f << "    \"jit_compile_time_ns\": " << jit_telemetry_.jit_compile_time_ns << ",\n";
    f << "    \"jit_compile_time_ms\": " << (jit_telemetry_.jit_compile_time_ns / 1e6) << ",\n";
    f << "    \"baseline_compile_count\": " << jit_telemetry_.baseline_compile_count << ",\n";
    f << "    \"baseline_compile_time_ns\": " << jit_telemetry_.baseline_compile_time_ns << ",\n";
    f << "    \"optimizing_compile_count\": " << jit_telemetry_.optimizing_compile_count << ",\n";
    f << "    \"optimizing_compile_time_ns\": " << jit_telemetry_.optimizing_compile_time_ns << ",\n";
    f << "    \"osr_count\": " << jit_telemetry_.osr_count << ",\n";
    f << "    \"osr_compile_count\": " << jit_telemetry_.osr_compile_count << ",\n";
    f << "    \"osr_compile_time_ns\": " << jit_telemetry_.osr_compile_time_ns << ",\n";
    f << "    \"deopt_count\": " << jit_telemetry_.deopt_count << ",\n";
    f << "    \"deopt_time_ns\": " << jit_telemetry_.deopt_time_ns << ",\n";
    f << "    \"tier0_execution_ns\": " << jit_telemetry_.tier0_execution_ns << ",\n";
    f << "    \"tier1_execution_ns\": " << jit_telemetry_.tier1_execution_ns << ",\n";
    f << "    \"tier2_execution_ns\": " << jit_telemetry_.tier2_execution_ns << ",\n";
    f << "    \"compile_requested\": " << jit_telemetry_.compile_requested << ",\n";
    f << "    \"compile_completed\": " << jit_telemetry_.compile_completed << ",\n";
    f << "    \"code_entered\": " << jit_telemetry_.code_entered << ",\n";
    f << "    \"code_executed\": " << jit_telemetry_.code_executed << "\n";
    f << "  },\n";

    // Group 3: Dispatch & Opcodes
    f << "  \"dispatch\": {\n";
    f << "    \"total_opcode_dispatch\": " << op_telemetry_.total_opcodes << ",\n";
    f << "    \"dispatch_loop_iterations\": " << dispatch_telemetry_.dispatch_loop_iterations << ",\n";
    f << "    \"indirect_dispatch_count\": " << dispatch_telemetry_.indirect_dispatch_count << ",\n";
    f << "    \"direct_dispatch_count\": " << dispatch_telemetry_.direct_dispatch_count << ",\n";
    f << "    \"superinstruction_count\": " << dispatch_telemetry_.superinstruction_count << ",\n";
    f << "    \"branch_count\": " << op_telemetry_.branch_count << ",\n";
    f << "    \"load_count\": " << op_telemetry_.load_count << ",\n";
    f << "    \"store_count\": " << op_telemetry_.store_count << ",\n";
    f << "    \"opcode_counts\": {\n";
    bool first_op = true;
    for (int i = 0; i < 256; ++i) {
        if (op_telemetry_.opcode_histogram[i] > 0) {
            if (!first_op) f << ",\n";
            f << "      \"0x" << std::hex << std::setw(2) << std::setfill('0') << i << std::dec << "\": " << op_telemetry_.opcode_histogram[i];
            first_op = false;
        }
    }
    f << "\n    }\n";
    f << "  },\n";

    // Group 4: Stack & ExecutionState
    f << "  \"stack_execution_state\": {\n";
    f << "    \"push_count\": " << stack_telemetry_.push_count << ",\n";
    f << "    \"pop_count\": " << stack_telemetry_.pop_count << ",\n";
    f << "    \"dup_count\": " << stack_telemetry_.dup_count << ",\n";
    f << "    \"swap_count\": " << stack_telemetry_.swap_count << ",\n";
    f << "    \"tos0_hits\": " << tos_telemetry_.tos0_hits << ",\n";
    f << "    \"tos1_hits\": " << tos_telemetry_.tos1_hits << ",\n";
    f << "    \"tos_hit\": " << (tos_telemetry_.tos0_hits + tos_telemetry_.tos1_hits) << ",\n";
    f << "    \"tos_miss\": " << tos_telemetry_.tos_misses << ",\n";
    f << "    \"tos_hit_rate\": " << tos_telemetry_.hit_rate() << ",\n";
    f << "    \"flush_count\": " << tos_telemetry_.flush_count << ",\n";
    f << "    \"materialize_count\": " << tos_telemetry_.materialize_count << ",\n";
    f << "    \"stack_spill_count\": " << tos_telemetry_.stack_spill_count << ",\n";
    f << "    \"stack_reload_count\": " << stack_telemetry_.stack_reload_count << ",\n";
    f << "    \"execution_state_loads\": " << stack_telemetry_.execution_state_loads << ",\n";
    f << "    \"execution_state_stores\": " << stack_telemetry_.execution_state_stores << ",\n";
    f << "    \"state_transition_count\": " << stack_telemetry_.state_transition_count << ",\n";
    f << "    \"state_sync_count\": " << stack_telemetry_.state_sync_count << ",\n";
    f << "    \"state_sync_bytes\": " << stack_telemetry_.state_sync_bytes << "\n";
    f << "  },\n";

    // Group 5: Call / Frame
    f << "  \"call_frame\": {\n";
    f << "    \"call_count\": " << op_telemetry_.call_count << ",\n";
    f << "    \"return_count\": " << op_telemetry_.ret_count << ",\n";
    f << "    \"function_frame_create\": " << call_frame_telemetry_.function_frame_create << ",\n";
    f << "    \"function_frame_destroy\": " << call_frame_telemetry_.function_frame_destroy << ",\n";
    f << "    \"recursive_call_count\": " << call_frame_telemetry_.recursive_call_count << ",\n";
    f << "    \"native_call_count\": " << call_frame_telemetry_.native_call_count << ",\n";
    f << "    \"managed_call_count\": " << call_frame_telemetry_.managed_call_count << ",\n";
    f << "    \"frame_alloc_count\": " << call_frame_telemetry_.frame_alloc_count << ",\n";
    f << "    \"frame_reuse_count\": " << call_frame_telemetry_.frame_reuse_count << ",\n";
    f << "    \"monomorphic_call\": " << call_frame_telemetry_.monomorphic_call << ",\n";
    f << "    \"polymorphic_call\": " << call_frame_telemetry_.polymorphic_call << ",\n";
    f << "    \"megamorphic_call\": " << call_frame_telemetry_.megamorphic_call << "\n";
    f << "  },\n";

    // Group 6: Array
    f << "  \"array\": {\n";
    f << "    \"generic_array_load\": " << array_telemetry_.generic_array_load << ",\n";
    f << "    \"generic_array_store\": " << array_telemetry_.generic_array_store << ",\n";
    f << "    \"generic_accesses\": " << array_telemetry_.generic_accesses << ",\n";
    f << "    \"typed_i32_load\": " << array_telemetry_.typed_i32_load << ",\n";
    f << "    \"typed_i32_store\": " << array_telemetry_.typed_i32_store << ",\n";
    f << "    \"typed_i64_load\": " << array_telemetry_.typed_i64_load << ",\n";
    f << "    \"typed_i64_store\": " << array_telemetry_.typed_i64_store << ",\n";
    f << "    \"typed_f64_load\": " << array_telemetry_.typed_f64_load << ",\n";
    f << "    \"typed_f64_store\": " << array_telemetry_.typed_f64_store << ",\n";
    f << "    \"i64_accesses\": " << array_telemetry_.i64_accesses << ",\n";
    f << "    \"u8_accesses\": " << array_telemetry_.u8_accesses << ",\n";
    f << "    \"f64_accesses\": " << array_telemetry_.f64_accesses << ",\n";
    f << "    \"tafpu_accesses\": " << array_telemetry_.tafpu_accesses << ",\n";
    f << "    \"bounds_check_count\": " << array_telemetry_.bounds_check_count << ",\n";
    f << "    \"bounds_check_elided\": " << array_telemetry_.bounds_check_elided << ",\n";
    f << "    \"boxing_count\": " << array_telemetry_.boxing_count << ",\n";
    f << "    \"unboxing_count\": " << array_telemetry_.unboxing_count << ",\n";
    f << "    \"array_representation_transition\": " << array_telemetry_.array_representation_transition << ",\n";
    f << "    \"typed_access_ratio\": " << array_telemetry_.typed_access_ratio() << ",\n";
    f << "    \"flat_access_ratio\": " << array_telemetry_.flat_access_ratio() << "\n";
    f << "  },\n";

    // Group 7: Fusion
    f << "  \"fusion\": {\n";
    f << "    \"candidate_patterns\": " << fusion_telemetry_.candidate_patterns << ",\n";
    f << "    \"fused_count\": " << fusion_telemetry_.fused_count << ",\n";
    f << "    \"rejected_count\": " << fusion_telemetry_.rejected_count << ",\n";
    f << "    \"semantic_barrier_rejections\": " << fusion_telemetry_.semantic_barrier_rejections << ",\n";
    f << "    \"jump_target_rejections\": " << fusion_telemetry_.jump_target_rejections << ",\n";
    f << "    \"fused_opcode_execution_count\": " << fusion_telemetry_.fused_opcode_execution_count << ",\n";
    f << "    \"normal_load_count\": " << fusion_telemetry_.normal_load_count << ",\n";
    f << "    \"normal_store_count\": " << fusion_telemetry_.normal_store_count << ",\n";
    f << "    \"normal_add_count\": " << fusion_telemetry_.normal_add_count << ",\n";
    f << "    \"normal_mul_count\": " << fusion_telemetry_.normal_mul_count << ",\n";
    f << "    \"normal_branch_count\": " << fusion_telemetry_.normal_branch_count << "\n";
    f << "  },\n";

    // Group 8: Object / Field IC & GC
    f << "  \"object_ic_gc\": {\n";
    f << "    \"object_alloc_count\": " << object_ic_telemetry_.object_alloc_count << ",\n";
    f << "    \"field_load_count\": " << object_ic_telemetry_.field_load_count << ",\n";
    f << "    \"field_store_count\": " << object_ic_telemetry_.field_store_count << ",\n";
    f << "    \"field_ic_hit\": " << object_ic_telemetry_.field_ic_hit << ",\n";
    f << "    \"field_ic_miss\": " << object_ic_telemetry_.field_ic_miss << ",\n";
    f << "    \"ic_hit_rate\": " << object_ic_telemetry_.ic_hit_rate() << ",\n";
    f << "    \"shape_transition_count\": " << object_ic_telemetry_.shape_transition_count << ",\n";
    f << "    \"monomorphic_ic\": " << object_ic_telemetry_.monomorphic_ic << ",\n";
    f << "    \"polymorphic_ic\": " << object_ic_telemetry_.polymorphic_ic << ",\n";
    f << "    \"megamorphic_ic\": " << object_ic_telemetry_.megamorphic_ic << ",\n";
    f << "    \"generic_property_lookup\": " << object_ic_telemetry_.generic_property_lookup << ",\n";
    f << "    \"specialized_property_lookup\": " << object_ic_telemetry_.specialized_property_lookup << ",\n";
    f << "    \"property_guard_fail\": " << object_ic_telemetry_.property_guard_fail << ",\n";
    f << "    \"shape_guard_fail\": " << object_ic_telemetry_.shape_guard_fail << ",\n";
    f << "    \"alloc_count\": " << gc_telemetry_.alloc_count << ",\n";
    f << "    \"allocated_bytes\": " << gc_telemetry_.allocated_bytes << ",\n";
    f << "    \"minor_gc_count\": " << gc_telemetry_.minor_gc_count << ",\n";
    f << "    \"minor_gc_time_ns\": " << gc_telemetry_.minor_gc_time_ns << ",\n";
    f << "    \"major_gc_count\": " << gc_telemetry_.major_gc_count << ",\n";
    f << "    \"major_gc_time_ns\": " << gc_telemetry_.major_gc_time_ns << ",\n";
    f << "    \"gc_pause_total_ns\": " << gc_telemetry_.gc_pause_total_ns << ",\n";
    f << "    \"promoted_bytes\": " << gc_telemetry_.promoted_bytes << ",\n";
    f << "    \"survived_bytes\": " << gc_telemetry_.survived_bytes << ",\n";
    f << "    \"heap_peak_bytes\": " << gc_telemetry_.heap_peak_bytes << ",\n";
    f << "    \"heap_end_bytes\": " << gc_telemetry_.heap_end_bytes << ",\n";
    f << "    \"gc_fraction\": " << gc_telemetry_.gc_fraction(wall_clock_.program_time_ns) << "\n";
    f << "  },\n";
    f << "  \"vectorization\": {\n";
    f << "    \"canonical_loop_count\": " << vectorization_telemetry_.canonical_loop_count << ",\n";
    f << "    \"noncanonical_loop_count\": " << vectorization_telemetry_.noncanonical_loop_count << ",\n";
    f << "    \"vector_loop_count\": " << vectorization_telemetry_.vector_loop_count << ",\n";
    f << "    \"scalar_loop_count\": " << vectorization_telemetry_.scalar_loop_count << ",\n";
    f << "    \"vector_instruction_count\": " << vectorization_telemetry_.vector_instruction_count << ",\n";
    f << "    \"scalar_instruction_count\": " << vectorization_telemetry_.scalar_instruction_count << ",\n";
    f << "    \"vector_width\": " << vectorization_telemetry_.vector_width << ",\n";
    f << "    \"generic_numeric_ops\": " << vectorization_telemetry_.generic_numeric_ops << ",\n";
    f << "    \"typed_numeric_ops\": " << vectorization_telemetry_.typed_numeric_ops << ",\n";
    f << "    \"normalized_memory_access\": " << vectorization_telemetry_.normalized_memory_access << ",\n";
    f << "    \"rejected_memory_access\": " << vectorization_telemetry_.rejected_memory_access << "\n";
    f << "  }\n";
    f << "}\n";
}

} // namespace tersun
