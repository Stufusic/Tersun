#pragma once

#include "vm/jit_buffer.hpp"
#include "vm/jit_frame.hpp"
#include <cstdint>
#include <vector>
#include <memory>
#include <unordered_map>

namespace setun {

// ============================================================================
// Gate 5.9.1: Runtime Metadata & Hot/Cold Separation
// Designed for cache locality: Hot metadata is exactly 32-byte aligned,
// contiguous in memory, and accessible via O(1) direct indexing.
// ============================================================================

enum JITHotFlags : uint8_t {
    JIT_FLAG_NONE          = 0x00,
    JIT_FLAG_TIER1_READY   = 0x01,
    JIT_FLAG_TIER2_READY   = 0x02,
    JIT_FLAG_COMPILING     = 0x04,
    JIT_FLAG_COOLDOWN      = 0x08,
    JIT_FLAG_OSR_ELIGIBLE  = 0x10,
    JIT_FLAG_NO_TYPE_SPEC  = 0x20, // Reason-specific poison: disable type specialization
    JIT_FLAG_NO_SRA        = 0x40, // Reason-specific poison: disable scalar replacement
    JIT_FLAG_NO_MIC        = 0x80  // Reason-specific poison: disable shape MIC
};

struct alignas(32) FunctionHotData {
    JITNativeEntryPoint native_entry{nullptr}; // 8 bytes (offset 0..7)
    uint32_t invocation_counter{0};            // 4 bytes (offset 8..11)
    uint32_t tier1_threshold{50};              // 4 bytes (offset 12..15)
    uint32_t tier2_threshold{1000};            // 4 bytes (offset 16..19)
    uint16_t cooldown_budget{0};               // 2 bytes (offset 20..21)
    uint16_t bytecode_size{0};                 // 2 bytes (offset 22..23)
    uint8_t tier{0};                           // 1 byte  (offset 24)
    uint8_t flags{JIT_FLAG_NONE};              // 1 byte  (offset 25)
    uint8_t deopt_count{0};                    // 1 byte  (offset 26)
    uint8_t reserved[5]{0};                    // 5 bytes (offset 27..31)

    bool is_tier1() const { return tier == 1 && native_entry != nullptr; }
    bool is_tier2() const { return tier == 2 && native_entry != nullptr; }
    bool in_cooldown() const { return (flags & JIT_FLAG_COOLDOWN) != 0; }
};

static_assert(sizeof(FunctionHotData) == 32, "FunctionHotData must fit in exactly 32 bytes for cache line efficiency");

struct alignas(32) LoopHotData {
    JITNativeEntryPoint osr_entry{nullptr};    // 8 bytes (offset 0..7)
    uint32_t backedge_counter{0};              // 4 bytes (offset 8..11)
    uint32_t osr_threshold{200};               // 4 bytes (offset 12..15)
    uint16_t loop_header_bytecode_ip{0};       // 2 bytes (offset 16..17)
    uint16_t parent_func_ip{0};                // 2 bytes (offset 18..19)
    uint16_t osr_native_offset{0};             // 2 bytes (offset 20..21)
    uint8_t tier{0};                           // 1 byte  (offset 22)
    uint8_t flags{JIT_FLAG_NONE};              // 1 byte  (offset 23)
    uint8_t deopt_count{0};                    // 1 byte  (offset 24)
    uint8_t reserved[7]{0};                    // 7 bytes (offset 25..31)
};

static_assert(sizeof(LoopHotData) == 32, "LoopHotData must fit in exactly 32 bytes for cache line efficiency");

// Cold data structure isolated from hot path CPU caches
struct FunctionColdData {
    size_t func_ip{0};
    uint32_t total_deopts{0};
    uint32_t deopts_type_mismatch{0};
    uint32_t deopts_shape_mismatch{0};
    uint32_t deopts_overflow{0};
    uint32_t guards_eliminated{0};
    uint32_t licm_hoisted_loops{0};
    uint64_t compile_time_us_tier1{0};
    uint64_t compile_time_us_tier2{0};
};

// Contiguous Runtime Metadata Container for a Chunk
class ChunkRuntimeMetadata {
public:
    ChunkRuntimeMetadata() = default;

    void initialize(size_t num_functions = 128, size_t num_loops = 128,
                    uint32_t default_tier1_inv = 50,
                    uint32_t default_tier2_inv = 1000,
                    uint32_t default_osr = 200);

    FunctionHotData* function_hot_table() { return function_hot_.data(); }
    const FunctionHotData* function_hot_table() const { return function_hot_.data(); }
    size_t function_count() const { return function_hot_.size(); }

    LoopHotData* loop_hot_table() { return loop_hot_.data(); }
    const LoopHotData* loop_hot_table() const { return loop_hot_.data(); }
    size_t loop_count() const { return loop_hot_.size(); }

    FunctionHotData& get_function_hot(size_t fn_idx);
    LoopHotData& get_loop_hot(size_t loop_idx);

    FunctionColdData& get_or_create_cold(size_t fn_idx);

    void clear();

private:
    std::vector<FunctionHotData> function_hot_;
    std::vector<LoopHotData> loop_hot_;
    std::unordered_map<size_t, FunctionColdData> function_cold_;
};

} // namespace setun
