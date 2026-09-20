#pragma once

#include "qvm/qgate.hpp"
#include <vector>
#include <cmath>

namespace tersun {
namespace qvm {

// ============================================================================
// Fused Circuit Operation Representation
// ============================================================================
enum class FusedOpType {
    SINGLE_GATE,
    DIAGONAL_LAYER,
    QFT_LADDER_PHASE, // Specialized O(1) QFT phase accumulation
    SWAP_PAIR
};

struct FusedCircuitOp {
    FusedOpType type{FusedOpType::SINGLE_GATE};
    QuantumGate gate{GateType::H, 0};                   // for SINGLE_GATE
    std::vector<GateOps::DiagonalPhaseOp> diagonal_ops; // for DIAGONAL_LAYER
    size_t q_ctrl{0};                                   // for QFT_LADDER_PHASE
    size_t q1{0};                                       // for SWAP_PAIR
    size_t q2{0};                                       // for SWAP_PAIR
};

// ============================================================================
// Circuit Optimizer (Gate QVM-OPT 2: Circuit-Level Sweeps Reduction)
// ============================================================================
class CircuitOptimizer {
public:
    // Optimizes a general QuantumCircuit:
    // 1. Cancels self-inverse adjacent gates (H*H = I, X*X = I, Z*Z = I)
    // 2. Merges adjacent single-qubit rotations on the same axis (RZ(a)*RZ(b) = RZ(a+b))
    // 3. Batches commuting diagonal operations (CP, CZ) into single-sweep layers
    static std::vector<FusedCircuitOp> optimize(const QuantumCircuit& circuit);

    // Executes an optimized circuit plan on a QubitRegister
    static void execute_plan(const std::vector<FusedCircuitOp>& plan, QubitRegister& reg);
};

// ============================================================================
// Algorithm-Aware QFT Execution Engine
// ============================================================================
class QFTPlanner {
public:
    // Generates an optimal execution plan for QFT(n):
    // For each qubit b = n-1 .. 0:
    //   1. Hadamard H(b)
    //   2. Fused QFT ladder phase rotation in 1 memory pass:
    //      theta(i) = (i & ((1 << b) - 1)) * (pi / 2^b)
    // Followed by bit-reversal direct swaps.
    static std::vector<FusedCircuitOp> build_plan(size_t n, size_t total_qubits);

    // Direct execution of QFT plan on a QubitRegister
    static void execute_qft(size_t n, QubitRegister& reg);
};

} // namespace qvm
} // namespace tersun
