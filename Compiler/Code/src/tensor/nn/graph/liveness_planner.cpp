#include "tensor/nn/graph/liveness_planner.hpp"
#include <map>
#include <set>

namespace setun::tensor::nn {

static inline size_t align_up(size_t size, size_t alignment) {
    return (size + alignment - 1) & ~(alignment - 1);
}

MemoryPlan LivenessPlanner::plan(std::vector<TensorInterval> intervals, size_t alignment) {
    MemoryPlan result;
    if (intervals.empty()) {
        return result;
    }

    // Align all interval sizes
    for (auto& it : intervals) {
        it.size_bytes = align_up(it.size_bytes, alignment);
    }

    // Sort by birth_step, then by descending size
    std::sort(intervals.begin(), intervals.end(), [](const TensorInterval& a, const TensorInterval& b) {
        if (a.birth_step != b.birth_step) return a.birth_step < b.birth_step;
        return a.size_bytes > b.size_bytes;
    });

    size_t peak_memory = 0;

    for (size_t i = 0; i < intervals.size(); ++i) {
        auto& current = intervals[i];

        // Collect occupied offset ranges by all previously scheduled intervals that overlap in lifetime
        std::vector<std::pair<size_t, size_t>> occupied;
        for (size_t j = 0; j < i; ++j) {
            const auto& prev = intervals[j];
            if (current.overlaps_with(prev)) {
                occupied.push_back({prev.assigned_offset, prev.assigned_offset + prev.size_bytes});
            }
        }

        // Sort occupied ranges by start offset
        std::sort(occupied.begin(), occupied.end());

        // Find the first-fit free offset
        size_t candidate_offset = 0;
        for (const auto& [occ_start, occ_end] : occupied) {
            if (candidate_offset + current.size_bytes <= occ_start) {
                // Fits in the gap before occ_start
                break;
            }
            if (candidate_offset < occ_end) {
                candidate_offset = align_up(occ_end, alignment);
            }
        }

        current.assigned_offset = candidate_offset;
        peak_memory = std::max(peak_memory, candidate_offset + current.size_bytes);
    }

    result.peak_arena_bytes = peak_memory;
    result.intervals = std::move(intervals);
    return result;
}

} // namespace setun::tensor::nn
