#pragma once

#include "compiler/emitter.hpp"
#include "vm/baseline_jit.hpp"
#include "vm/jit_buffer.hpp"
#include "vm/jit_frame.hpp"
#include "vm/jit_safepoint.hpp"
#include "vm/jit_osr.hpp"
#include "vm/jit_deopt.hpp"
#include <memory>
#include <unordered_map>
#include <cstdint>

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

struct JITCodeObject {
    JITCodeBuffer buffer;
    JITSafepointTable safepoints;
    OSREntryTable osr_table;
    DeoptTable deopt_table;
    JITCodeStatus status{JITCodeStatus::UNCOMPILED};
    CodeState state{CodeState::Active};
    uint32_t invocation_count{0};
    uint32_t backedge_count{0};
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
    uint32_t invocation_threshold{50};
    uint32_t backedge_threshold{200};
    uint32_t min_bytecode_size{4};

    bool should_compile(const JITCodeObject& obj) const {
        if (obj.status != JITCodeStatus::UNCOMPILED) return false;
        return obj.invocation_count >= invocation_threshold ||
               obj.backedge_count >= backedge_threshold;
    }
};

class JITManager {
public:
    JITManager();
    ~JITManager() = default;

    std::shared_ptr<JITCodeObject> get_or_create(size_t func_ip);
    bool compile_function(const Chunk& chunk, size_t func_ip, size_t end_ip);
    int64_t execute_native(VM* vm, size_t func_ip, JITFrame* frame);
    int64_t execute_osr(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame);
    JITExit execute_osr_advanced(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame);

    void record_invocation(size_t func_ip);
    void record_backedge(size_t func_ip);

    void invalidate(size_t func_ip);
    void clear();

    const TieringPolicy& policy() const { return policy_; }
    void set_policy(const TieringPolicy& policy) { policy_ = policy; }

    size_t compiled_count() const;

private:
    std::unordered_map<size_t, std::shared_ptr<JITCodeObject>> code_cache_;
    BaselineJITCompiler compiler_;
    TieringPolicy policy_;
};

} // namespace setun
