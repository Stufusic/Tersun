#pragma once

#include <cstdint>
#include <cstddef>
#include <cstring>
#include <vector>
#include <string>
#include <sstream>
#include <iomanip>

namespace setun::tensor::nn {

// ============================================================================
// NumericalForensics: Sub-Layer Numerical Checkpointing & Drift Forensics
// Calculates cryptographic FNV-1a 64-bit checksums over sublayer activations
// to diagnose quantization divergences, ISA differences, and numerical drift.
// ============================================================================
class NumericalForensics {
public:
    // Compute 64-bit FNV-1a hash over float buffer
    static uint64_t hash_floats(const float* data, size_t count) noexcept {
        if (!data || count == 0) return 0;
        uint64_t hash = 14695981039346656037ULL; // FNV offset basis

        for (size_t i = 0; i < count; ++i) {
            float v = data[i];
            // Normalize -0.0f to +0.0f
            if (v == 0.0f) v = 0.0f;
            uint32_t bits = 0;
            std::memcpy(&bits, &v, sizeof(float));

            const uint8_t* byte_ptr = reinterpret_cast<const uint8_t*>(&bits);
            for (size_t b = 0; b < 4; ++b) {
                hash ^= static_cast<uint64_t>(byte_ptr[b]);
                hash *= 1099511628211ULL; // FNV prime
            }
        }
        return hash;
    }

    struct LayerChecksums {
        size_t layer_idx{0};
        uint64_t norm1_hash{0};
        uint64_t q_hash{0};
        uint64_t k_hash{0};
        uint64_t v_hash{0};
        uint64_t attn_hash{0};
        uint64_t norm2_hash{0};
        uint64_t ffn_hash{0};
        uint64_t residual_hash{0};

        std::string to_string() const {
            std::ostringstream oss;
            oss << "Layer " << layer_idx << " Forensics: "
                << "norm1=" << std::hex << norm1_hash
                << " attn=" << std::hex << attn_hash
                << " norm2=" << std::hex << norm2_hash
                << " ffn=" << std::hex << ffn_hash
                << " res=" << std::hex << residual_hash;
            return oss.str();
        }
    };
};

} // namespace setun::tensor::nn
