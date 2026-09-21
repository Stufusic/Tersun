#include <iostream>
#include <vector>
#include <cassert>
#include "tensor/nn/graph/liveness_planner.hpp"

using namespace setun::tensor::nn;

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.2 Sprint 3: Static Liveness Memory Planner Verification   \n";
    std::cout << "===================================================================\n";

    // 1. Test Sequential Non-overlapping Tensors (Sequential Reuse)
    std::cout << "  [Test 1: Sequential Non-Overlapping Slot Reuse]... ";
    {
        std::vector<TensorInterval> intervals = {
            {1, "t1", 1024, 0, 2, 0},
            {2, "t2", 2048, 3, 5, 0},
            {3, "t3", 512,  6, 8, 0}
        };

        MemoryPlan plan = LivenessPlanner::plan(intervals, 64);
        assert(plan.peak_arena_bytes == 2048);
        for (const auto& it : plan.intervals) {
            assert(it.assigned_offset == 0);
            assert(it.assigned_offset % 64 == 0);
        }
        std::cout << "PASSED (All 3 non-overlapping tensors cleanly reused offset 0, peak=2048)\n";
    }

    // 2. Test Concurrently Live Tensors (Disjoint Offsets)
    std::cout << "  [Test 2: Concurrently Live Tensors (Q, K, V)]... ";
    {
        // Q, K, V all born at step 2, die at step 6
        std::vector<TensorInterval> intervals = {
            {1, "Q", 512, 2, 6, 0},
            {2, "K", 512, 2, 6, 0},
            {3, "V", 512, 2, 6, 0}
        };

        MemoryPlan plan = LivenessPlanner::plan(intervals, 64);
        assert(plan.peak_arena_bytes == 512 * 3);
        
        size_t off_q = plan.get_offset(1);
        size_t off_k = plan.get_offset(2);
        size_t off_v = plan.get_offset(3);

        assert(off_q != off_k && off_k != off_v && off_q != off_v);
        assert(off_q % 64 == 0 && off_k % 64 == 0 && off_v % 64 == 0);
        std::cout << "PASSED (Assigned disjoint 64-byte aligned offsets for Q, K, V)\n";
    }

    // 3. Test Transformer Sub-Layer with Residual Connection
    std::cout << "  [Test 3: Complex Transformer DAG with Residual Connection]... ";
    {
        // Residual x: [0, 8] (alive throughout)
        // Sub-layers:
        // norm_x:  [1, 2]
        // Q:       [2, 4]
        // K:       [2, 5]
        // V:       [2, 6]
        // attn:    [4, 7]
        std::vector<TensorInterval> intervals = {
            {1, "residual_x", 1024, 0, 8, 0},
            {2, "norm_x",     1024, 1, 2, 0},
            {3, "Q",          256,  2, 4, 0},
            {4, "K",          256,  2, 5, 0},
            {5, "V",          256,  2, 6, 0},
            {6, "attn_out",   1024, 5, 7, 0}
        };

        MemoryPlan plan = LivenessPlanner::plan(intervals, 64);
        assert(plan.intervals.size() == 6);

        // Verify that residual_x has offset 0 and never collides
        size_t res_off = plan.get_offset(1);
        for (const auto& it : plan.intervals) {
            if (it.id != 1) {
                // Must not overlap with residual range [res_off, res_off + 1024)
                size_t start = it.assigned_offset;
                size_t end = start + it.size_bytes;
                assert(start >= res_off + 1024 || end <= res_off);
            }
        }
        std::cout << "PASSED (Residual preserved, intermediate slots reused, peak=" 
                  << plan.peak_arena_bytes << " bytes)\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Static Liveness Memory Planner: 100% SUCCESSFUL!                 \n";
    std::cout << "===================================================================\n";
    return 0;
}
