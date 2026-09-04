#pragma once

#include <cstdint>
#include <vector>
#include <complex>
#include <string>
#include <random>
#include <cmath>
#include <stdexcept>
#include <iostream>

namespace tersun {
namespace qvm {

// ============================================================================
// 1. 2-Bit Classical Encoding of 1 Qubit State
// ============================================================================
// 00_2 -> |0>       (Trit 0, Ground state)
// 01_2 -> |1>       (Trit +1, Excited state)
// 10_2 -> |->       (Trit -1, Phase-inverted state: (|0> - |1>)/sqrt(2))
// 11_2 -> |+> / NIL (Superposition state: (|0> + |1>)/sqrt(2) in Quantum mode;
//                    Nil / NaN / Zero-cost Hardware Exception in Classical mode)
enum class QubitState2Bit : uint8_t {
    ZERO         = 0b00, // Trit 0  (|0>)
    ONE          = 0b01, // Trit +1 (|1>)
    MINUS        = 0b10, // Trit -1 (|->)
    PLUS_OR_NIL  = 0b11  // Dual-role: |+> Superposition or Nil/Exception
};

inline const char* qubit_state_to_str(QubitState2Bit s) {
    switch (s) {
        case QubitState2Bit::ZERO: return "|0> (Trit 0)";
        case QubitState2Bit::ONE: return "|1> (Trit +1)";
        case QubitState2Bit::MINUS: return "|-> (Trit -1)";
        case QubitState2Bit::PLUS_OR_NIL: return "|+> (Superposition / Nil)";
        default: return "Unknown";
    }
}

// Exact representation for amplitudes
using QComplex = std::complex<double>;

// ============================================================================
// 2. Packed Qubit Word: 64-bit holding 32 virtual Qubits (2 bits each)
// ============================================================================
struct PackedQubitWord {
    uint64_t raw{0};

    PackedQubitWord() = default;
    explicit PackedQubitWord(uint64_t val) : raw(val) {}

    // Get 2-bit state of qubit k (0 <= k < 32)
    inline QubitState2Bit get(size_t k) const {
        if (k >= 32) return QubitState2Bit::PLUS_OR_NIL;
        uint64_t shift = k * 2;
        return static_cast<QubitState2Bit>((raw >> shift) & 0x3ULL);
    }

    // Set 2-bit state of qubit k (0 <= k < 32)
    inline void set(size_t k, QubitState2Bit state) {
        if (k >= 32) return;
        uint64_t shift = k * 2;
        uint64_t mask = ~(0x3ULL << shift);
        raw = (raw & mask) | (static_cast<uint64_t>(state) << shift);
    }

    // Convert trit value (-1, 0, +1) to 2-bit state
    static inline QubitState2Bit trit_to_qubit(int trit) {
        if (trit == 0) return QubitState2Bit::ZERO;
        if (trit == 1 || trit > 0) return QubitState2Bit::ONE;
        return QubitState2Bit::MINUS; // trit == -1
    }

    // Convert 2-bit state to trit value (-1, 0, +1, or 0 for superposition fallback)
    static inline int qubit_to_trit(QubitState2Bit s) {
        switch (s) {
            case QubitState2Bit::ZERO: return 0;
            case QubitState2Bit::ONE: return 1;
            case QubitState2Bit::MINUS: return -1;
            case QubitState2Bit::PLUS_OR_NIL: return 0; // Collapses or defaults to zero
            default: return 0;
        }
    }
};

// ============================================================================
// 3. Qubit Register File: Hybrid Packed 2-Bit & Complex State Vector
// ============================================================================
class QubitRegister {
public:
    explicit QubitRegister(size_t num_qubits);

    size_t size() const { return num_qubits_; }
    bool is_statevector_active() const { return statevector_active_; }

    // Pure 2-bit packed interface
    QubitState2Bit get_discrete_state(size_t q) const;
    void set_discrete_state(size_t q, QubitState2Bit state);

    // Pack 2 classical bits into qubit q
    void pack_2bits(size_t q, uint8_t two_bits);

    // Unpack qubit q to 2 classical bits
    uint8_t unpack_2bits(size_t q);

    // Promote to full StateVector representation (size 2^N)
    void promote_to_statevector();

    // Reset all qubits to |0>
    void reset();

    // Direct access to statevector amplitudes
    const std::vector<QComplex>& amplitudes() const { return state_vector_; }
    std::vector<QComplex>& amplitudes() { return state_vector_; }

    // Measurement on single qubit with wavefunction collapse
    // Returns 0 (|0>) or 1 (|1>)
    int measure(size_t q);

    // Measure as 3-way ternary trit (-1, 0, +1)
    int measure_trit(size_t q);

    // Measure all qubits into bitstring
    std::vector<int> measure_all();

    // Probability of measuring |1> on qubit q
    double prob1(size_t q) const;

    // Print quantum state summary
    void dump_state(std::ostream& os = std::cout) const;

private:
    size_t num_qubits_{0};
    std::vector<PackedQubitWord> packed_words_;
    std::vector<QComplex> state_vector_;
    bool statevector_active_{false};

    static inline std::mt19937_64& get_rng() {
        static std::mt19937_64 rng{std::random_device{}()};
        return rng;
    }
};

} // namespace qvm
} // namespace tersun
