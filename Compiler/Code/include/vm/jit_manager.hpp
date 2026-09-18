#pragma once

#include "compiler/emitter.hpp"
#include "vm/baseline_jit.hpp"
#include "vm/jit_buffer.hpp"
#include "vm/jit_frame.hpp"
#include "vm/jit_safepoint.hpp"
#include "vm/jit_osr.hpp"
#include "vm/jit_deopt.hpp"
#include "vm/type_feedback.hpp"
#include "vm/mir_optimizer.hpp"
#include <memory>
#include <unordered_map>
#include <cstdint>

#include "vm/runtime_metadata.hpp"

namespace setun {

enum class JITCodeStatus : uint8_t {
    UNCOMPILED = 0,
    COMPILING  = 1,
    COMPILED   = 2,
    FAILED     = 3,
    INVALIDATED = 4
};

enum class CodeState : uint8_t {
    Active = 0,
    Invalidated = 1,
    Retired = 2
};

enum class JITEntryKind : uint8_t {
    Function = 0,
    OSR = 1
};

enum class JITTier : uint8_t {
    Tier0_Interpreter = 0,
    Tier1_Baseline = 1,
    Tier2_Optimizing = 2
};

struct JITCodeObject {
    JITCodeBuffer buffer;
    JITSafepointTable safepoints;
    OSREntryTable osr_table;
    DeoptTable deopt_table;
    JITCodeStatus status{JITCodeStatus::UNCOMPILED};
    CodeState state{CodeState::Active};
    JITTier tier{JITTier::Tier1_Baseline};
    uint32_t invocation_count{0};
    uint32_t backedge_count{0};
    uint32_t deopt_count{0};
    bool is_poisoned{false};
    DeoptReason last_deopt_reason{DeoptReason::UNKNOWN};
    uint32_t last_deopt_ip{0};
    size_t start_ip{0};
    size_t end_ip{0};
    JITNativeEntryPoint entry_point{nullptr};

    bool is_executable() const {
        return status == JITCodeStatus::COMPILED && state == CodeState::Active && entry_point != nullptr;
    }

    bool has_osr_entry(uint32_t loop_header_ip) const {
        return is_executable() && osr_table.has_entry(loop_header_ip);
    }
};

struct TieringPolicy {
    union {
        uint32_t tier1_call_threshold{50};
        uint32_t invocation_threshold;
        uint32_t tier1_invocation_threshold;
    };
    union {
        uint32_t tier1_backedge_threshold{200};
        uint32_t backedge_threshold;
    };
    union {
        uint32_t tier2_call_threshold{1000};
        uint32_t tier2_invocation_threshold;
    };
    uint32_t tier2_backedge_threshold{3000};
    uint32_t tier2_min_hotness{2000};
    uint32_t max_mir_instructions_tier2{5000}; // Compile budget protection
    uint32_t max_tier2_compile_time_budget_us{50000};
    uint32_t deopt_window{1000};
    uint32_t deopt_limit{3};
    uint32_t repromotion_threshold{20000};     // Hysteresis threshold
    uint32_t cooldown_period{2000};            // Cooldown executions
    uint32_t min_bytecode_size{4};

    bool enable_auto_tiering{true};
    bool force_tier1_only{false};
    bool force_tier2_eager{false};
    bool trace_tiering{false};

    bool should_compile(const JITCodeObject& obj) const {
        if (obj.status != JITCodeStatus::UNCOMPILED) return false;
        return obj.invocation_count >= tier1_call_threshold ||
               obj.backedge_count >= tier1_backedge_threshold;
    }
};

struct JITStats {
    uint64_t tier0_invocations{0};
    uint64_t tier1_compilations{0};
    uint64_t tier2_compilations{0};
    uint64_t tier1_executions{0};
    uint64_t tier2_executions{0};
    uint64_t tier1_osr_transitions{0};
    uint64_t tier2_osr_transitions{0};
    uint64_t total_deopts{0};
    uint64_t deopts_type_guard{0};
    uint64_t deopts_shape_guard{0};
    uint64_t deopts_overflow{0};
    uint64_t deopts_other{0};
    uint64_t poisoned_functions{0};
    uint64_t cooldown_events{0};
    uint64_t repromotions{0};

    void reset() { *this = JITStats{}; }
};

class JITManager {
public:
    JITManager();
    ~JITManager() = default;

    std::shared_ptr<JITCodeObject> get_or_create(size_t func_ip);
    bool compile_function(const Chunk& chunk, size_t func_ip, size_t end_ip);
    bool compile_tier2(const Chunk& chunk, size_t func_ip, const ProfileSnapshot* profile = nullptr);
    int64_t execute_native(VM* vm, size_t func_ip, JITFrame* frame);
    int64_t execute_osr(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame);
    JITExit execute_osr_advanced(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame);

    // Auto-Tiering Coordinator Slow-Paths (Called ONLY when fast hotness threshold reached)
    bool slow_tiering_coordinator_call(VM* vm, const Chunk& chunk, size_t func_ip, FunctionHotData& hot);
    bool slow_tiering_coordinator_osr(VM* vm, const Chunk& chunk, size_t func_ip, uint32_t loop_target, LoopHotData& lhot);
    void handle_deopt_feedback(size_t func_ip, uint32_t loop_ip, DeoptReason reason);

    // Fast path helpers
    inline bool fast_should_tier1(const FunctionHotData& hot) const {
        return (hot.tier == 0) && (hot.invocation_counter >= hot.tier1_threshold);
    }
    inline bool fast_should_tier2(const FunctionHotData& hot) const {
        return (hot.tier == 1) && !(hot.flags & JIT_FLAG_COOLDOWN) &&
               (hot.invocation_counter >= hot.tier2_threshold);
    }

    void record_invocation(size_t func_ip);
    void record_backedge(size_t func_ip);

    void invalidate(size_t func_ip);
    void clear();

    const TieringPolicy& policy() const { return policy_; }
    TieringPolicy& policy() { return policy_; }
    void set_policy(const TieringPolicy& policy) { policy_ = policy; }

    OptimizationFlags& opt_flags() { return opt_flags_; }
    const OptimizationFlags& opt_flags() const { return opt_flags_; }

    ChunkRuntimeMetadata& runtime_metadata() { return runtime_metadata_; }
    const ChunkRuntimeMetadata& runtime_metadata() const { return runtime_metadata_; }

    TypeFeedbackVector& get_or_create_feedback(size_t func_ip) {
        auto it = feedback_vectors_.find(func_ip);
        if (it == feedback_vectors_.end()) {
            feedback_vectors_[func_ip] = std::make_shared<TypeFeedbackVector>(static_cast<uint32_t>(func_ip));
        }
        return *feedback_vectors_[func_ip];
    }

    TypeFeedbackVector& type_feedback(size_t func_ip = 0) {
        return get_or_create_feedback(func_ip);
    }

    size_t compiled_count() const;

    JITStats& stats() { return stats_; }
    const JITStats& stats() const { return stats_; }
    void print_stats() const;
    void dump_code_buffers(const std::string& prefix) const;
    const std::unordered_map<size_t, std::shared_ptr<JITCodeObject>>& code_cache() const { return code_cache_; }

private:
    std::unordered_map<size_t, std::shared_ptr<JITCodeObject>> code_cache_;
    std::unordered_map<size_t, std::shared_ptr<TypeFeedbackVector>> feedback_vectors_;
    BaselineJITCompiler compiler_;
    TieringPolicy policy_;
    OptimizationFlags opt_flags_;
    ChunkRuntimeMetadata runtime_metadata_;
    JITStats stats_;
};

} // namespace setun
