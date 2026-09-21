#pragma once

#include "tensor/edge_arena.hpp"
#include "tensor/tensor_view.hpp"
#include "tensor/nn/core/status.hpp"
#include "tensor/nn/core/span.hpp"
#include "runtime/target_capabilities.hpp"
#include <cstdint>
#include <cstddef>
#include <string_view>

namespace setun::tensor::nn {

enum class ExecutionMode : uint8_t {
    Prefill = 0, // Parallel sequence evaluation (prompt tokens)
    Decode = 1   // Autoregressive single-token generation with KV Cache
};

// Forward declaration of KV Cache
class KVCache;

// ============================================================================
// ExecutionContext: Non-Allocating Execution Environment
// Enforces 4 disjoint memory classes + dual execution modes (Prefill / Decode)
// ============================================================================
class ExecutionContext {
public:
    ExecutionContext(
        EdgeArena& activation_arena,
        EdgeArena& workspace_arena,
        KVCache* kv_cache = nullptr,
        ExecutionMode mode = ExecutionMode::Prefill)
        : activation_arena_(activation_arena),
          workspace_arena_(workspace_arena),
          kv_cache_(kv_cache),
          mode_(mode),
          caps_(runtime::detect_host_capabilities()) {}

    // Memory Class 1: Transient Activation Arena (Liveness-managed)
    EdgeArena& activation_arena() noexcept { return activation_arena_; }
    const EdgeArena& activation_arena() const noexcept { return activation_arena_; }

    // Memory Class 2: Temporary Kernel Workspace (Scratchpad)
    EdgeArena& workspace_arena() noexcept { return workspace_arena_; }
    const EdgeArena& workspace_arena() const noexcept { return workspace_arena_; }

    // Memory Class 3: Persistent Runtime State (KV Cache)
    KVCache* kv_cache() noexcept { return kv_cache_; }
    const KVCache* kv_cache() const noexcept { return kv_cache_; }
    void set_kv_cache(KVCache* cache) noexcept { kv_cache_ = cache; }

    // Execution Mode
    ExecutionMode mode() const noexcept { return mode_; }
    void set_mode(ExecutionMode m) noexcept { mode_ = m; }
    bool is_prefill() const noexcept { return mode_ == ExecutionMode::Prefill; }
    bool is_decode() const noexcept { return mode_ == ExecutionMode::Decode; }

    // Sequence & Step Control
    size_t sequence_length() const noexcept { return seq_len_; }
    void set_sequence_length(size_t len) noexcept { seq_len_ = len; }

    size_t current_step() const noexcept { return current_step_; }
    void set_current_step(size_t step) noexcept { current_step_ = step; }
    void increment_step() noexcept { current_step_++; }

    // Hardware Capabilities & Backend
    const runtime::TargetCapabilities& capabilities() const noexcept { return caps_; }
    void set_capabilities(const runtime::TargetCapabilities& caps) noexcept { caps_ = caps; }

    // Scoped Arena Markers for Sub-Graph Isolation
    void reset_activation_arena() noexcept {
        activation_arena_.reset();
    }

    void reset_workspace() noexcept {
        workspace_arena_.reset();
    }

private:
    EdgeArena& activation_arena_;
    EdgeArena& workspace_arena_;
    KVCache* kv_cache_{nullptr};
    ExecutionMode mode_{ExecutionMode::Prefill};
    size_t seq_len_{1};
    size_t current_step_{0};
    runtime::TargetCapabilities caps_;
};

} // namespace setun::tensor::nn
