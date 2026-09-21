#pragma once

#include "tensor/packed_ternary_layout.hpp"
#include "tensor/nn/core/status.hpp"
#include "tensor/nn/core/span.hpp"
#include <cstdint>
#include <cstddef>
#include <cmath>
#include <algorithm>

namespace setun::tensor::nn {

// ============================================================================
// Tersun Complete Ternary Neuron Specification (First Principles)
// ============================================================================

enum class SomaActivationMode : uint8_t {
    Linear = 0,         // a = z (no non-linearity)
    ReLU = 1,           // a = max(0, z)
    SquaredReLU = 2,    // a = (max(0, z))^2  (Official BitNet 2B-4T FFN)
    DiscreteTernary = 3,// a in {-1, 0, +1} via thresholds (theta+, theta-)
    Normalized = 4      // a = z / sqrt(variance + eps) (SubLN)
};

// 4-Phase Complete Ternary Neuron Model
class TernaryNeuron {
public:
    // -------------------------------------------------------------------------
    // Phase 1: Synaptic Weight State
    // -------------------------------------------------------------------------
    static constexpr int8_t SYNAPSE_INHIBITORY = -1; // Ức chế: -X
    static constexpr int8_t SYNAPSE_SILENT     =  0; // Bất hoạt: 0
    static constexpr int8_t SYNAPSE_EXCITATORY =  1; // Hưng phấn: +X

    static constexpr int8_t decode_synapse(uint8_t trit_code) noexcept {
        return decode_trit(trit_code);
    }

    // -------------------------------------------------------------------------
    // Phase 2: Dendritic Integration (Multiplication-Free Adder Tree)
    // -------------------------------------------------------------------------
    static inline int32_t integrate_dendrites_scalar(
        const int32_t* inputs,
        const uint8_t* packed_weights,
        size_t K,
        int32_t bias = 0) noexcept
    {
        int32_t accumulator = bias;
        size_t full_bytes = K / TRITS_PER_BYTE;

        for (size_t b = 0; b < full_bytes; ++b) {
            uint8_t byte = packed_weights[b];
            size_t base = b * TRITS_PER_BYTE;

            int8_t t0 = decode_trit((byte >> 0) & 0b11);
            int8_t t1 = decode_trit((byte >> 2) & 0b11);
            int8_t t2 = decode_trit((byte >> 4) & 0b11);
            int8_t t3 = decode_trit((byte >> 6) & 0b11);

            if (t0 ==  1) accumulator += inputs[base + 0];
            else if (t0 == -1) accumulator -= inputs[base + 0];

            if (t1 ==  1) accumulator += inputs[base + 1];
            else if (t1 == -1) accumulator -= inputs[base + 1];

            if (t2 ==  1) accumulator += inputs[base + 2];
            else if (t2 == -1) accumulator -= inputs[base + 2];

            if (t3 ==  1) accumulator += inputs[base + 3];
            else if (t3 == -1) accumulator -= inputs[base + 3];
        }

        size_t tail_start = full_bytes * TRITS_PER_BYTE;
        if (tail_start < K) {
            uint8_t byte = packed_weights[full_bytes];
            for (size_t i = tail_start; i < K; ++i) {
                size_t pos = i - tail_start;
                int8_t t = decode_trit((byte >> (pos * 2)) & 0b11);
                if (t == 1) accumulator += inputs[i];
                else if (t == -1) accumulator -= inputs[i];
            }
        }

        return accumulator;
    }

    // -------------------------------------------------------------------------
    // Phase 3: Soma Activation (Thresholding & Non-Linearity)
    // -------------------------------------------------------------------------
    static inline float activate_soma(
        int32_t z,
        SomaActivationMode mode,
        int32_t theta_pos = 10,
        int32_t theta_neg = -10,
        float rms_scale = 1.0f) noexcept
    {
        switch (mode) {
            case SomaActivationMode::Linear:
                return static_cast<float>(z);

            case SomaActivationMode::ReLU:
                return static_cast<float>(z > 0 ? z : 0);

            case SomaActivationMode::SquaredReLU: {
                // ReLU²: f(z) = (max(0, z))^2
                // Official BitNet 2B-4T FFN non-linearity
                if (z <= 0) return 0.0f;
                float z_f = static_cast<float>(z);
                return z_f * z_f;
            }

            case SomaActivationMode::DiscreteTernary: {
                // Self-quantizing 3-state output
                if (z >= theta_pos) return 1.0f;
                if (z <= theta_neg) return -1.0f;
                return 0.0f;
            }

            case SomaActivationMode::Normalized:
                return static_cast<float>(z) * rms_scale;

            default:
                return static_cast<float>(z);
        }
    }

    // -------------------------------------------------------------------------
    // Phase 4: Synaptic Plasticity & Output Scaling
    // -------------------------------------------------------------------------
    static inline float apply_plasticity_scale(float soma_output, float gamma_gain) noexcept {
        return soma_output * gamma_gain;
    }

    // -------------------------------------------------------------------------
    // Full 4-Phase Neuron Forward Pass
    // -------------------------------------------------------------------------
    static inline float forward_neuron(
        const int32_t* inputs,
        const uint8_t* packed_weights,
        size_t K,
        int32_t bias,
        SomaActivationMode mode,
        float gamma_gain = 1.0f,
        int32_t theta_pos = 10,
        int32_t theta_neg = -10) noexcept
    {
        // 1 & 2. Dendritic Integration
        int32_t z = integrate_dendrites_scalar(inputs, packed_weights, K, bias);

        // 3. Soma Activation
        float a = activate_soma(z, mode, theta_pos, theta_neg);

        // 4. Plasticity & Scaling
        return apply_plasticity_scale(a, gamma_gain);
    }
};

} // namespace setun::tensor::nn
