#pragma once

#include <cstddef>
#include <cstdint>
#include <algorithm>

namespace setun::tensor::nn {

// ============================================================================
// Parallel Domain: Single Owner of Parallelism Policy
// ============================================================================

enum class ParallelDomain : uint8_t {
    Serial,      // Khối lượng quá nhỏ -> chạy tuần tự để loại bỏ overhead đồng bộ
    Rows,        // GEMM Prefill: phân chia theo hàng tokens M
    Columns,     // GEMV Decode: phân chia theo cột đặc trưng N
    Tiles,       // 2D Blocked GEMM
    QueryBlocks, // Attention Prefill: chia theo Query Blocks
    Heads,       // Attention Decode: chia theo Q Heads
    GQAGroups    // Attention: chia theo GQA Groups x Query Blocks
};

struct ParallelPlan {
    ParallelDomain domain{ParallelDomain::Serial};
    uint32_t num_threads{1};
    uint32_t grain_size{1};

    bool is_parallel() const noexcept {
        return domain != ParallelDomain::Serial && num_threads > 1;
    }
};

struct WorkEstimate {
    size_t M{1};
    size_t N{1};
    size_t K{1};

    size_t total_ops() const noexcept { return 2 * M * N * K; }
    size_t total_bytes() const noexcept { return (M * K + K * N + M * N) * sizeof(float); }
};

// ============================================================================
// ParallelPlanner: Deterministic Central Parallelism Policy
// ============================================================================

class ParallelPlanner {
public:
    static constexpr size_t MIN_OPS_THRESHOLD = 65536; // 64K FLOPs threshold for OpenMP overhead

    // Plan for GEMM / BitLinear projections (QKV, Out, FFN Gate/Up/Down)
    static ParallelPlan plan_gemm(const WorkEstimate& work, uint32_t max_threads) noexcept;

    // Plan for Attention Execution (Dual Mode: Decode vs Prefill)
    static ParallelPlan plan_attention(
        size_t q_heads,
        size_t kv_heads,
        size_t seq_len,
        uint32_t max_threads) noexcept;
};

} // namespace setun::tensor::nn
