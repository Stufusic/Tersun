#include "vm/runtime_metadata.hpp"

namespace setun {

void ChunkRuntimeMetadata::initialize(size_t num_functions, size_t num_loops,
                                      uint32_t default_tier1_inv,
                                      uint32_t default_tier2_inv,
                                      uint32_t default_osr) {
    if (num_functions == 0) num_functions = 128;
    if (num_loops == 0) num_loops = 128;

    FunctionHotData default_fn;
    default_fn.tier1_threshold = default_tier1_inv;
    default_fn.tier2_threshold = default_tier2_inv;

    LoopHotData default_loop;
    default_loop.osr_threshold = default_osr;

    function_hot_.assign(num_functions, default_fn);
    loop_hot_.assign(num_loops, default_loop);
    function_cold_.clear();
}

FunctionHotData& ChunkRuntimeMetadata::get_function_hot(size_t fn_idx) {
    if (fn_idx >= function_hot_.size()) {
        function_hot_.resize(fn_idx + 16, FunctionHotData{});
    }
    return function_hot_[fn_idx];
}

LoopHotData& ChunkRuntimeMetadata::get_loop_hot(size_t loop_idx) {
    if (loop_idx >= loop_hot_.size()) {
        loop_hot_.resize(loop_idx + 32, LoopHotData{});
    }
    return loop_hot_[loop_idx];
}

FunctionColdData& ChunkRuntimeMetadata::get_or_create_cold(size_t fn_idx) {
    auto it = function_cold_.find(fn_idx);
    if (it == function_cold_.end()) {
        FunctionColdData cold;
        cold.func_ip = fn_idx;
        function_cold_[fn_idx] = cold;
    }
    return function_cold_[fn_idx];
}

void ChunkRuntimeMetadata::clear() {
    function_hot_.clear();
    loop_hot_.clear();
    function_cold_.clear();
}

} // namespace setun
