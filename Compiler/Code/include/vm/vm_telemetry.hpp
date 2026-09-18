#pragma once
// ==============================================================================
// Tersun Gate 6 Rebuild (G6R.1) Comprehensive Performance Forensics Subsystem
// Supports 3 profiling modes:
//   - VM_PROFILING_OFF   (0ns overhead, inline no-ops)
//   - VM_PROFILING_LIGHT (Loop & call sampling, overhead < 1%)
//   - VM_PROFILING_FULL  (Exhaustive 8-group forensic counters)
//
// Conforms to G6R.1 8 Telemetry Groups:
//   1. WallClockTelemetry
//   2. JITEconomicsTelemetry (Tier & JIT economics)
//   3. DispatchTelemetry (Opcode census & dispatch modes)
//   4. StackExecutionStateTelemetry (TOS & execution state)
//   5. CallFrameTelemetry (Function frames & recursion)
//   6. ArrayTelemetry (Specialization & bounds checks)
//   7. FusionTelemetry (Superinstruction pipeline)
//   8. ObjectFieldICTelemetry & GCTelemetry
// ==============================================================================

#include <cstdint>
#include <cstddef>
#include <string>
#include <string_view>
#include <vector>
#include <unordered_map>
#include <chrono>
#include <iostream>

namespace tersun {

enum class ProfilingMode : uint8_t {
    OFF = 0,
    LIGHT = 1,
    FULL = 2
};

// -----------------------------------------------------------------------------
// 1. Wall-clock Telemetry
// -----------------------------------------------------------------------------
struct WallClockTelemetry {
    uint64_t total_time_ns{0};
    uint64_t startup_time_ns{0};
    uint64_t program_time_ns{0};
    uint64_t shutdown_time_ns{0};
};

// -----------------------------------------------------------------------------
// 2. Tier / JIT Telemetry
// -----------------------------------------------------------------------------
struct JITEconomicsTelemetry {
    uint64_t invocation_count{0};
    uint64_t backedge_count{0};
    uint64_t bytecode_size{0};
    
    uint64_t jit_compile_count{0};
    uint64_t jit_compile_time_ns{0};
    uint64_t jit_compile_time_total_ns{0};
    
    uint64_t baseline_compile_count{0};
    uint64_t baseline_compile_time_ns{0};
    
    uint64_t optimizing_compile_count{0};
    uint64_t optimizing_compile_time_ns{0};
    
    uint64_t osr_count{0};
    uint64_t osr_compile_count{0};
    uint64_t osr_compile_time_ns{0};
    
    uint64_t deopt_count{0};
    uint64_t deopt_time_ns{0};
    
    uint64_t tier0_execution_ns{0};
    uint64_t tier1_execution_ns{0};
    uint64_t tier2_execution_ns{0};
    
    uint64_t compile_requested{0};
    uint64_t compile_completed{0};
    uint64_t code_entered{0};
    uint64_t code_executed{0};

    // Legacy fields for backwards compatibility
    double compile_time_tier1_us{0.0};
    double compile_time_tier2_us{0.0};
    double native_execution_time_us{0.0};
    double interpreter_execution_time_us{0.0};
    double estimated_time_saved_us{0.0};
};

// -----------------------------------------------------------------------------
// 3. Dispatch Telemetry
// -----------------------------------------------------------------------------
struct DispatchTelemetry {
    uint64_t total_opcode_dispatch{0};
    uint64_t opcode_counts[256]{0};
    uint64_t dispatch_loop_iterations{0};
    uint64_t indirect_dispatch_count{0};
    uint64_t direct_dispatch_count{0};
    uint64_t superinstruction_count{0};
};

// Legacy OpcodeTelemetry mapping
struct OpcodeTelemetry {
    uint64_t total_opcodes{0};
    uint64_t branch_count{0};
    uint64_t call_count{0};
    uint64_t ret_count{0};
    uint64_t load_count{0};
    uint64_t store_count{0};
    uint64_t array_get_count{0};
    uint64_t array_set_count{0};
    uint64_t field_get_count{0};
    uint64_t field_set_count{0};
    uint64_t allocation_count{0};
    uint64_t gc_count{0};
    uint64_t safepoint_count{0};
    uint64_t opcode_histogram[256]{0};
};

// -----------------------------------------------------------------------------
// 4. Stack & ExecutionState Telemetry
// -----------------------------------------------------------------------------
struct StackExecutionStateTelemetry {
    uint64_t push_count{0};
    uint64_t pop_count{0};
    uint64_t dup_count{0};
    uint64_t swap_count{0};
    
    uint64_t tos_hit{0};
    uint64_t tos_miss{0};
    
    uint64_t stack_spill_count{0};
    uint64_t stack_reload_count{0};
    
    uint64_t execution_state_loads{0};
    uint64_t execution_state_stores{0};
    
    uint64_t state_transition_count{0};
    uint64_t state_sync_count{0};
    uint64_t state_sync_bytes{0};

    [[nodiscard]] double tos_hit_rate() const noexcept {
        uint64_t total = tos_hit + tos_miss;
        return total > 0 ? static_cast<double>(tos_hit) / static_cast<double>(total) : 0.0;
    }
};

struct TOSTelemetry {
    uint64_t tos0_hits{0};
    uint64_t tos1_hits{0};
    uint64_t tos_misses{0};
    uint64_t flush_count{0};
    uint64_t materialize_count{0};
    uint64_t stack_spill_count{0};

    [[nodiscard]] double hit_rate() const noexcept {
        uint64_t total = tos0_hits + tos1_hits + tos_misses;
        return total > 0 ? static_cast<double>(tos0_hits + tos1_hits) / static_cast<double>(total) : 0.0;
    }

    [[nodiscard]] double flush_rate() const noexcept {
        uint64_t total_ops = tos0_hits + tos1_hits + tos_misses;
        return total_ops > 0 ? static_cast<double>(flush_count) / static_cast<double>(total_ops) : 0.0;
    }
};

// -----------------------------------------------------------------------------
// 5. Call & Frame Telemetry (W1 critical)
// -----------------------------------------------------------------------------
struct CallFrameTelemetry {
    uint64_t call_count{0};
    uint64_t return_count{0};
    
    uint64_t function_frame_create{0};
    uint64_t function_frame_destroy{0};
    
    uint64_t recursive_call_count{0};
    
    uint64_t native_call_count{0};
    uint64_t managed_call_count{0};
    
    uint64_t frame_alloc_count{0};
    uint64_t frame_reuse_count{0};
    
    uint64_t monomorphic_call{0};
    uint64_t polymorphic_call{0};
    uint64_t megamorphic_call{0};
};

// -----------------------------------------------------------------------------
// 6. Array Telemetry (W2 critical)
// -----------------------------------------------------------------------------
struct ArrayTelemetry {
    uint64_t generic_array_load{0};
    uint64_t generic_array_store{0};
    
    uint64_t typed_i32_load{0};
    uint64_t typed_i32_store{0};
    uint64_t typed_i64_load{0};
    uint64_t typed_i64_store{0};
    uint64_t typed_f64_load{0};
    uint64_t typed_f64_store{0};
    
    uint64_t bounds_check_count{0};
    uint64_t bounds_check_elided{0};
    
    uint64_t boxing_count{0};
    uint64_t unboxing_count{0};
    
    uint64_t array_representation_transition{0};

    // Legacy fields
    uint64_t generic_accesses{0};
    uint64_t i64_accesses{0};
    uint64_t u8_accesses{0};
    uint64_t f64_accesses{0};
    uint64_t tafpu_accesses{0};
    uint64_t promotions{0};
    uint64_t degradations{0};
    uint64_t representation_conversions{0};

    [[nodiscard]] double flat_access_ratio() const noexcept {
        uint64_t flat = i64_accesses + u8_accesses + f64_accesses + tafpu_accesses 
                      + typed_i32_load + typed_i32_store + typed_i64_load + typed_i64_store + typed_f64_load + typed_f64_store;
        uint64_t total = flat + generic_accesses + generic_array_load + generic_array_store;
        return total > 0 ? static_cast<double>(flat) / static_cast<double>(total) : 0.0;
    }

    [[nodiscard]] double typed_access_ratio() const noexcept {
        return flat_access_ratio();
    }
};

// -----------------------------------------------------------------------------
// 7. Fusion Telemetry (W3 critical)
// -----------------------------------------------------------------------------
struct FusionTelemetry {
    uint64_t candidate_patterns{0};
    uint64_t fused_count{0};
    uint64_t rejected_count{0};
    uint64_t semantic_barrier_rejections{0};
    uint64_t jump_target_rejections{0};
    uint64_t fused_opcode_execution_count{0};

    uint64_t normal_load_count{0};
    uint64_t normal_store_count{0};
    uint64_t normal_add_count{0};
    uint64_t normal_mul_count{0};
    uint64_t normal_branch_count{0};

    std::unordered_map<uint8_t, uint64_t> executed_fused_opcodes;
};

// -----------------------------------------------------------------------------
// 8. Object / Field IC & GC Telemetry (W4 critical)
// -----------------------------------------------------------------------------
struct ObjectFieldICTelemetry {
    uint64_t object_alloc_count{0};
    
    uint64_t field_load_count{0};
    uint64_t field_store_count{0};
    
    uint64_t field_ic_hit{0};
    uint64_t field_ic_miss{0};
    
    uint64_t shape_transition_count{0};
    
    uint64_t monomorphic_ic{0};
    uint64_t polymorphic_ic{0};
    uint64_t megamorphic_ic{0};
    
    uint64_t generic_property_lookup{0};
    uint64_t specialized_property_lookup{0};
    
    uint64_t property_guard_fail{0};
    uint64_t shape_guard_fail{0};

    [[nodiscard]] double ic_hit_rate() const noexcept {
        uint64_t total = field_ic_hit + field_ic_miss;
        return total > 0 ? static_cast<double>(field_ic_hit) / static_cast<double>(total) : 0.0;
    }
};

struct GCTelemetry {
    uint64_t alloc_count{0};
    uint64_t allocated_bytes{0};
    
    uint64_t minor_gc_count{0};
    uint64_t minor_gc_time_ns{0};
    
    uint64_t major_gc_count{0};
    uint64_t major_gc_time_ns{0};
    
    uint64_t gc_pause_total_ns{0};
    
    uint64_t promoted_bytes{0};
    uint64_t survived_bytes{0};
    
    uint64_t heap_peak_bytes{0};
    uint64_t heap_end_bytes{0};

    [[nodiscard]] double gc_fraction(uint64_t total_exec_ns) const noexcept {
        return total_exec_ns > 0 ? static_cast<double>(gc_pause_total_ns) / static_cast<double>(total_exec_ns) : 0.0;
    }
};

// -----------------------------------------------------------------------------
// 9. SIMD & Loop Vectorization Telemetry (W3 G6R.2.1 critical)
// -----------------------------------------------------------------------------
struct VectorizationTelemetry {
    uint64_t canonical_loop_count{0};
    uint64_t noncanonical_loop_count{0};
    uint64_t vector_loop_count{0};
    uint64_t scalar_loop_count{0};
    uint64_t vector_instruction_count{0};
    uint64_t scalar_instruction_count{0};
    uint32_t vector_width{0}; // 256 for AVX2, 128 for SSE
    uint64_t generic_numeric_ops{0};
    uint64_t typed_numeric_ops{0};
    uint64_t normalized_memory_access{0};
    uint64_t rejected_memory_access{0};
};

// -----------------------------------------------------------------------------
// Master Telemetry Manager
// -----------------------------------------------------------------------------
class VMTelemetryManager {
public:
    static VMTelemetryManager& instance() noexcept {
        static VMTelemetryManager s_mgr;
        return s_mgr;
    }

    void set_mode(ProfilingMode mode) noexcept { mode_ = mode; }
    [[nodiscard]] ProfilingMode mode() const noexcept { return mode_; }

    void reset() noexcept;

    // Timer controls
    void start_startup() noexcept;
    void finish_startup() noexcept;
    void start_program() noexcept;
    void finish_program() noexcept;
    void start_shutdown() noexcept;
    void finish_shutdown() noexcept;

    // Opcode & Dispatch tracing
    inline void record_opcode(uint8_t op) noexcept {
        if (mode_ == ProfilingMode::OFF) return;
        op_telemetry_.total_opcodes++;
        dispatch_telemetry_.total_opcode_dispatch++;
        if (mode_ == ProfilingMode::FULL) {
            op_telemetry_.opcode_histogram[op]++;
            dispatch_telemetry_.opcode_counts[op]++;
        }
    }

    inline void record_branch() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.branch_count++;
            fusion_telemetry_.normal_branch_count++;
        }
    }
    inline void record_call() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.call_count++;
            call_frame_telemetry_.call_count++;
        }
    }
    inline void record_ret() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.ret_count++;
            call_frame_telemetry_.return_count++;
        }
    }
    inline void record_load() noexcept {
        if (mode_ == ProfilingMode::FULL) {
            op_telemetry_.load_count++;
            fusion_telemetry_.normal_load_count++;
        }
    }
    inline void record_store() noexcept {
        if (mode_ == ProfilingMode::FULL) {
            op_telemetry_.store_count++;
            fusion_telemetry_.normal_store_count++;
        }
    }
    inline void record_array_get() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.array_get_count++;
            array_telemetry_.generic_array_load++;
        }
    }
    inline void record_array_set() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.array_set_count++;
            array_telemetry_.generic_array_store++;
        }
    }
    inline void record_field_get() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.field_get_count++;
            object_ic_telemetry_.field_load_count++;
        }
    }
    inline void record_field_set() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.field_set_count++;
            object_ic_telemetry_.field_store_count++;
        }
    }
    inline void record_allocation() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.allocation_count++;
            object_ic_telemetry_.object_alloc_count++;
            gc_telemetry_.alloc_count++;
        }
    }
    inline void record_gc() noexcept {
        if (mode_ != ProfilingMode::OFF) {
            op_telemetry_.gc_count++;
            gc_telemetry_.minor_gc_count++;
        }
    }
    inline void record_safepoint() noexcept { if (mode_ != ProfilingMode::OFF) op_telemetry_.safepoint_count++; }

    // TOS tracing
    inline void record_tos0_hit() noexcept {
        if (mode_ == ProfilingMode::FULL) {
            tos_telemetry_.tos0_hits++;
            stack_telemetry_.tos_hit++;
        }
    }
    inline void record_tos1_hit() noexcept {
        if (mode_ == ProfilingMode::FULL) {
            tos_telemetry_.tos1_hits++;
            stack_telemetry_.tos_hit++;
        }
    }
    inline void record_tos_miss() noexcept {
        if (mode_ == ProfilingMode::FULL) {
            tos_telemetry_.tos_misses++;
            stack_telemetry_.tos_miss++;
        }
    }
    inline void record_tos_flush() noexcept { if (mode_ != ProfilingMode::OFF) tos_telemetry_.flush_count++; }
    inline void record_tos_materialize() noexcept { if (mode_ != ProfilingMode::OFF) tos_telemetry_.materialize_count++; }
    inline void record_tos_spill() noexcept {
        if (mode_ == ProfilingMode::FULL) {
            tos_telemetry_.stack_spill_count++;
            stack_telemetry_.stack_spill_count++;
        }
    }

    // Stack operations
    inline void record_stack_push() noexcept { if (mode_ == ProfilingMode::FULL) stack_telemetry_.push_count++; }
    inline void record_stack_pop() noexcept { if (mode_ == ProfilingMode::FULL) stack_telemetry_.pop_count++; }
    inline void record_stack_dup() noexcept { if (mode_ == ProfilingMode::FULL) stack_telemetry_.dup_count++; }
    inline void record_stack_swap() noexcept { if (mode_ == ProfilingMode::FULL) stack_telemetry_.swap_count++; }
    inline void record_stack_reload() noexcept { if (mode_ == ProfilingMode::FULL) stack_telemetry_.stack_reload_count++; }

    // Call / Frame
    inline void record_frame_create() noexcept { if (mode_ != ProfilingMode::OFF) call_frame_telemetry_.function_frame_create++; }
    inline void record_frame_destroy() noexcept { if (mode_ != ProfilingMode::OFF) call_frame_telemetry_.function_frame_destroy++; }
    inline void record_recursive_call() noexcept { if (mode_ != ProfilingMode::OFF) call_frame_telemetry_.recursive_call_count++; }

    // Fusion tracing
    inline void record_fusion_candidate() noexcept { if (mode_ == ProfilingMode::FULL) fusion_telemetry_.candidate_patterns++; }
    inline void record_fusion_success() noexcept { if (mode_ != ProfilingMode::OFF) fusion_telemetry_.fused_count++; }
    inline void record_fusion_rejected(bool barrier, bool jump_target) noexcept {
        if (mode_ == ProfilingMode::FULL) {
            fusion_telemetry_.rejected_count++;
            if (barrier) fusion_telemetry_.semantic_barrier_rejections++;
            if (jump_target) fusion_telemetry_.jump_target_rejections++;
        }
    }
    inline void record_fused_opcode_execution(uint8_t op) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            fusion_telemetry_.fused_opcode_execution_count++;
            fusion_telemetry_.executed_fused_opcodes[op]++;
            dispatch_telemetry_.superinstruction_count++;
        }
    }

    // Array tracing
    inline void record_array_generic() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.generic_accesses++; }
    inline void record_array_i64() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.i64_accesses++; }
    inline void record_array_u8() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.u8_accesses++; }
    inline void record_array_f64() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.f64_accesses++; }
    inline void record_array_tafpu() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.tafpu_accesses++; }
    inline void record_array_promotion() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.promotions++; }
    inline void record_array_degradation() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.degradations++; }
    inline void record_array_conversion() noexcept { if (mode_ != ProfilingMode::OFF) array_telemetry_.representation_conversions++; }
    inline void record_bounds_check(bool elided) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            array_telemetry_.bounds_check_count++;
            if (elided) array_telemetry_.bounds_check_elided++;
        }
    }

    // Object & Field IC tracing
    inline void record_ic_hit() noexcept { if (mode_ != ProfilingMode::OFF) object_ic_telemetry_.field_ic_hit++; }
    inline void record_ic_miss() noexcept { if (mode_ != ProfilingMode::OFF) object_ic_telemetry_.field_ic_miss++; }
    inline void record_shape_transition() noexcept { if (mode_ != ProfilingMode::OFF) object_ic_telemetry_.shape_transition_count++; }

    // JIT economics tracing
    inline void record_jit_invocation() noexcept { if (mode_ != ProfilingMode::OFF) jit_telemetry_.invocation_count++; }
    inline void record_jit_backedge() noexcept { if (mode_ != ProfilingMode::OFF) jit_telemetry_.backedge_count++; }
    inline void record_jit_osr() noexcept { if (mode_ != ProfilingMode::OFF) jit_telemetry_.osr_count++; }
    inline void record_jit_deopt() noexcept { if (mode_ != ProfilingMode::OFF) jit_telemetry_.deopt_count++; }
    inline void record_jit_tier1_compile(double us) noexcept { 
        if (mode_ != ProfilingMode::OFF) {
            jit_telemetry_.compile_time_tier1_us += us;
            jit_telemetry_.jit_compile_time_ns += static_cast<uint64_t>(us * 1000.0);
            jit_telemetry_.jit_compile_count++;
        }
    }
    inline void record_jit_tier2_compile(double us) noexcept { 
        if (mode_ != ProfilingMode::OFF) {
            jit_telemetry_.compile_time_tier2_us += us;
            jit_telemetry_.jit_compile_time_ns += static_cast<uint64_t>(us * 1000.0);
            jit_telemetry_.jit_compile_count++;
        }
    }

    // SIMD & Vectorization tracing
    inline void record_canonical_loop(bool canonical) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            if (canonical) vectorization_telemetry_.canonical_loop_count++;
            else vectorization_telemetry_.noncanonical_loop_count++;
        }
    }
    inline void record_vector_loop(uint32_t width, uint64_t inst_count) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            vectorization_telemetry_.vector_loop_count++;
            vectorization_telemetry_.vector_instruction_count += inst_count;
            vectorization_telemetry_.vector_width = width;
        }
    }
    inline void record_scalar_loop(uint64_t inst_count) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            vectorization_telemetry_.scalar_loop_count++;
            vectorization_telemetry_.scalar_instruction_count += inst_count;
        }
    }
    inline void record_numeric_op(bool typed) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            if (typed) vectorization_telemetry_.typed_numeric_ops++;
            else vectorization_telemetry_.generic_numeric_ops++;
        }
    }
    inline void record_memory_access_norm(bool normalized) noexcept {
        if (mode_ != ProfilingMode::OFF) {
            if (normalized) vectorization_telemetry_.normalized_memory_access++;
            else vectorization_telemetry_.rejected_memory_access++;
        }
    }

    // Accessors
    [[nodiscard]] const WallClockTelemetry& wall_clock() const noexcept { return wall_clock_; }
    [[nodiscard]] const JITEconomicsTelemetry& jit() const noexcept { return jit_telemetry_; }
    [[nodiscard]] const DispatchTelemetry& dispatch() const noexcept { return dispatch_telemetry_; }
    [[nodiscard]] const OpcodeTelemetry& opcodes() const noexcept { return op_telemetry_; }
    [[nodiscard]] const StackExecutionStateTelemetry& stack() const noexcept { return stack_telemetry_; }
    [[nodiscard]] const TOSTelemetry& tos() const noexcept { return tos_telemetry_; }
    [[nodiscard]] const CallFrameTelemetry& call_frame() const noexcept { return call_frame_telemetry_; }
    [[nodiscard]] const ArrayTelemetry& array() const noexcept { return array_telemetry_; }
    [[nodiscard]] const FusionTelemetry& fusion() const noexcept { return fusion_telemetry_; }
    [[nodiscard]] const ObjectFieldICTelemetry& object_ic() const noexcept { return object_ic_telemetry_; }
    [[nodiscard]] const GCTelemetry& gc() const noexcept { return gc_telemetry_; }
    [[nodiscard]] const VectorizationTelemetry& vectorization() const noexcept { return vectorization_telemetry_; }
    [[nodiscard]] VectorizationTelemetry& vectorization_mut() noexcept { return vectorization_telemetry_; }

    void sync_external_metrics(uint64_t total_ops, const uint64_t* op_counts, uint64_t stack_r, uint64_t stack_w, uint64_t calls, uint64_t rets, uint64_t arr_flat_r, uint64_t arr_flat_w, uint64_t arr_gen_r, uint64_t arr_gen_w, uint64_t ic_h, uint64_t ic_m, uint64_t superinsts, uint64_t deopts, uint64_t jit_compiles, double jit_compile_ms) noexcept;

    void dump_summary(std::ostream& out = std::cout) const;
    void dump_json(const std::string& path) const;

private:
    VMTelemetryManager() = default;
    ProfilingMode mode_{ProfilingMode::LIGHT};

    WallClockTelemetry wall_clock_;
    JITEconomicsTelemetry jit_telemetry_;
    DispatchTelemetry dispatch_telemetry_;
    OpcodeTelemetry op_telemetry_;
    StackExecutionStateTelemetry stack_telemetry_;
    TOSTelemetry tos_telemetry_;
    CallFrameTelemetry call_frame_telemetry_;
    ArrayTelemetry array_telemetry_;
    FusionTelemetry fusion_telemetry_;
    ObjectFieldICTelemetry object_ic_telemetry_;
    GCTelemetry gc_telemetry_;
    VectorizationTelemetry vectorization_telemetry_;

    std::chrono::high_resolution_clock::time_point t_startup_start_;
    std::chrono::high_resolution_clock::time_point t_program_start_;
    std::chrono::high_resolution_clock::time_point t_shutdown_start_;
};

} // namespace tersun
