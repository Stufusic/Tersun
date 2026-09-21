#pragma once

#include "tensor/nn/core/layer.hpp"
#include "tensor/nn/format/model_schema.hpp"
#include "tensor/nn/models/decoder_block.hpp"
#include "tensor/nn/ops/rmsnorm.hpp"
#include "tensor/nn/ops/bit_linear.hpp"
#include <memory>
#include <vector>
#include <string>

namespace setun::tensor::nn {

// ============================================================================
// BitNetModel: Complete Transformer Decoder Stack for Microsoft BitNet-b1.58
// Components:
//   - Token Embeddings [Vocab, Hidden]
//   - N x DecoderBlock (Pre-RMSNorm + GQA Self-Attention + SquaredReLU FFN)
//   - Final RMSNorm ("model.norm")
//   - LM Head [Hidden, Vocab]
// Supports both parallel Prefill mode and autoregressive Decode mode with
// strictly zero heap allocations in the hot path.
// ============================================================================
class BitNetModel {
public:
    explicit BitNetModel(const BitNetConfig& config);
    ~BitNetModel() = default;

    // Model configuration
    const BitNetConfig& config() const noexcept { return config_; }

    // Parameter inspection and checkpoint binding
    Span<const ParameterRef> parameters() const noexcept;
    size_t num_parameters() const noexcept { return param_refs_.size(); }

    // Initialization with synthetic deterministic weights (e.g. for self-tests)
    void init_synthetic(uint32_t seed);

    // Forward pass in Prefill / Evaluation mode (Sequence Length S)
    // token_ids: array of uint32_t token indices [S]
    // logits: output TensorView of shape [S, Vocab] or [1, Vocab] (last token only)
    Status forward(
        ExecutionContext& ctx,
        const uint32_t* token_ids,
        size_t num_tokens,
        TensorView& logits
    ) noexcept;

    // Forward pass in Decode mode for a single generated token at step
    // token_id: input token index
    // step: current sequence position (0-indexed)
    // logits: output TensorView of shape [1, Vocab]
    Status forward_decode_step(
        ExecutionContext& ctx,
        uint32_t token_id,
        size_t step,
        TensorView& logits
    ) noexcept;

    // Sub-component accessors
    Tensor& embed_tokens() noexcept { return embed_tokens_; }
    const Tensor& embed_tokens() const noexcept { return embed_tokens_; }

    DecoderBlock& layer(size_t idx) { return *layers_[idx]; }
    const DecoderBlock& layer(size_t idx) const { return *layers_[idx]; }

    RMSNorm& norm() noexcept { return norm_; }
    const RMSNorm& norm() const noexcept { return norm_; }

    BitLinear& lm_head() noexcept { return lm_head_; }
    const BitLinear& lm_head() const noexcept { return lm_head_; }

private:
    BitNetConfig config_;

    Tensor embed_tokens_;
    std::vector<std::unique_ptr<DecoderBlock>> layers_;
    RMSNorm norm_;
    BitLinear lm_head_;

    std::vector<ParameterRef> param_refs_;
    void update_param_refs();
};

} // namespace setun::tensor::nn
