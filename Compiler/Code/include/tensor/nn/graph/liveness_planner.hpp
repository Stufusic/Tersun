#pragma once

#include <cstddef>
#include <vector>
#include <algorithm>
#include <string>

namespace setun::tensor::nn {

struct TensorInterval {
    size_t id{0};
    std::string name{};
    size_t size_bytes{0};
    size_t birth_step{0};
    size_t last_use_step{0};
    size_t assigned_offset{0};

    bool overlaps_with(const TensorInterval& other) const noexcept {
        return !(last_use_step < other.birth_step || other.last_use_step < birth_step);
    }
};

struct MemoryPlan {
    size_t peak_arena_bytes{0};
    std::vector<TensorInterval> intervals;

    size_t get_offset(size_t tensor_id) const noexcept {
        for (const auto& it : intervals) {
            if (it.id == tensor_id) return it.assigned_offset;
        }
        return 0;
    }
};

// Static Ahead-of-Time Liveness Memory Planner
// Assigns memory offsets in EdgeArena via Interval Coloring with 64-byte SIMD alignment
class LivenessPlanner {
public:
    static MemoryPlan plan(std::vector<TensorInterval> intervals, size_t alignment = 64);
};

} // namespace setun::tensor::nn
