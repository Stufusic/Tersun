#include "tensor/nn/runtime/parallel_planner.hpp"

#if defined(_OPENMP)
#include <omp.h>
#endif

namespace setun::tensor::nn {

ParallelPlan ParallelPlanner::plan_gemm(const WorkEstimate& work, uint32_t max_threads) noexcept {
    if (max_threads <= 1 || work.total_ops() < MIN_OPS_THRESHOLD) {
        return ParallelPlan{ParallelDomain::Serial, 1, 1};
    }

    // Decode Mode (M == 1): Parallelize across N columns (GEMV)
    if (work.M == 1) {
        // We partition N into thread chunks. Minimum 64 output features per thread
        uint32_t possible_threads = static_cast<uint32_t>(std::max<size_t>(1, work.N / 64));
        uint32_t threads = std::min(max_threads, possible_threads);
        if (threads <= 1) {
            return ParallelPlan{ParallelDomain::Serial, 1, 1};
        }
        uint32_t grain = static_cast<uint32_t>((work.N + threads - 1) / threads);
        return ParallelPlan{ParallelDomain::Columns, threads, grain};
    }

    // Prefill Mode (M > 1): Parallelize across M rows
    uint32_t threads = std::min(max_threads, static_cast<uint32_t>(work.M));
    if (threads <= 1) {
        return ParallelPlan{ParallelDomain::Serial, 1, 1};
    }
    uint32_t grain = static_cast<uint32_t>((work.M + threads - 1) / threads);
    return ParallelPlan{ParallelDomain::Rows, threads, grain};
}

ParallelPlan ParallelPlanner::plan_attention(
    size_t q_heads,
    size_t kv_heads,
    size_t seq_len,
    uint32_t max_threads) noexcept
{
    if (max_threads <= 1) {
        return ParallelPlan{ParallelDomain::Serial, 1, 1};
    }

    // Decode Mode: Parallelize across Q heads
    if (seq_len == 1) {
        uint32_t threads = std::min(max_threads, static_cast<uint32_t>(q_heads));
        return ParallelPlan{ParallelDomain::Heads, threads, 1};
    }

    // Prefill Mode: Parallelize across GQA Groups x Query Blocks (Bq=4)
    size_t num_q_blocks = (seq_len + 3) / 4;
    size_t total_work_units = kv_heads * num_q_blocks;
    uint32_t threads = std::min(max_threads, static_cast<uint32_t>(total_work_units));
    return ParallelPlan{ParallelDomain::GQAGroups, threads, 1};
}

} // namespace setun::tensor::nn
