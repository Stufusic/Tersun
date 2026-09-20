#include "qvm/qcircuit_opt.hpp"
#include "qvm/qsimd.hpp"
#include <cmath>
#include <numbers>

namespace tersun {
namespace qvm {

static constexpr double kPi = 3.14159265358979323846;

// ============================================================================
// Specialized QFT Ladder Phase Kernel (Gate QVM-OPT 3: AVX2 + OpenMP)
// ============================================================================
static void apply_qft_ladder_phase(QubitRegister& reg, size_t b) {
    if (b == 0) return;
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    size_t num_phases = 1ULL << b;
    double dtheta = kPi / static_cast<double>(num_phases);

    // Precompute lookup table for the 2^b phase factors in this ladder
    // Eliminates all transcendental sin/cos calls from the hot statevector loop!
    std::vector<QComplex> phase_lut(num_phases);
    for (size_t k = 0; k < num_phases; ++k) {
        double th = static_cast<double>(k) * dtheta;
        phase_lut[k] = QComplex(std::cos(th), std::sin(th));
    }

    size_t mask_b = 1ULL << b;
    size_t step = mask_b << 1;

    // Multithread the outer dimension loop across available CPU cores (OpenMP)
    // Threshold set to dim >= 524288 (8 MB) to prevent thread barrier overhead on small states
    #if TERSUN_QVM_HAS_OPENMP
    #pragma omp parallel for schedule(static) if (dim >= 524288)
    #endif
    for (int64_t high = 0; high < static_cast<int64_t>(dim); high += step) {
        size_t base = static_cast<size_t>(high) | mask_b;

        #if TERSUN_QVM_HAS_AVX2
        size_t k = 1;
        for (; k + 1 < num_phases; k += 2) {
            size_t idx = base | k;
            __m256d v = _mm256_loadu_pd(reinterpret_cast<const double*>(&sv[idx]));
            __m256d p = _mm256_loadu_pd(reinterpret_cast<const double*>(&phase_lut[k]));
            __m256d res = simd::cmul_pd(v, p);
            _mm256_storeu_pd(reinterpret_cast<double*>(&sv[idx]), res);
        }
        for (; k < num_phases; ++k) {
            size_t idx = base | k;
            QComplex val = sv[idx];
            QComplex p = phase_lut[k];
            sv[idx] = QComplex(val.real() * p.real() - val.imag() * p.imag(),
                               val.real() * p.imag() + val.imag() * p.real());
        }
        #else
        for (size_t k = 1; k < num_phases; ++k) { // k=0 has phase 1.0 (identity)
            size_t idx = base | k;
            QComplex val = sv[idx];
            QComplex p = phase_lut[k];
            sv[idx] = QComplex(val.real() * p.real() - val.imag() * p.imag(),
                               val.real() * p.imag() + val.imag() * p.real());
        }
        #endif
    }
}

// ============================================================================
// Circuit Optimizer Implementation
// ============================================================================
std::vector<FusedCircuitOp> CircuitOptimizer::optimize(const QuantumCircuit& circuit) {
    std::vector<FusedCircuitOp> plan;
    const auto& gates = circuit.gates();

    std::vector<GateOps::DiagonalPhaseOp> current_diag_ops;

    auto flush_diagonal_layer = [&]() {
        if (!current_diag_ops.empty()) {
            FusedCircuitOp op;
            op.type = FusedOpType::DIAGONAL_LAYER;
            op.diagonal_ops = std::move(current_diag_ops);
            plan.push_back(std::move(op));
            current_diag_ops.clear();
        }
    };

    for (size_t i = 0; i < gates.size(); ++i) {
        const auto& g = gates[i];

        if (g.type == GateType::CPHASE) {
            GateOps::DiagonalPhaseOp dop;
            dop.control_mask = 1ULL << g.targets[0];
            dop.target_mask  = 1ULL << g.targets[1];
            dop.phase_cos    = std::cos(g.param);
            dop.phase_sin    = std::sin(g.param);
            current_diag_ops.push_back(dop);
        } else if (g.type == GateType::CZ) {
            GateOps::DiagonalPhaseOp dop;
            dop.control_mask = 1ULL << g.targets[0];
            dop.target_mask  = 1ULL << g.targets[1];
            dop.phase_cos    = -1.0;
            dop.phase_sin    = 0.0;
            current_diag_ops.push_back(dop);
        } else {
            // Non-diagonal gate: must flush accumulated commuting diagonal layer
            flush_diagonal_layer();

            if (g.type == GateType::SWAP) {
                FusedCircuitOp op;
                op.type = FusedOpType::SWAP_PAIR;
                op.q1 = g.targets[0];
                op.q2 = g.targets[1];
                plan.push_back(std::move(op));
            } else {
                FusedCircuitOp op;
                op.type = FusedOpType::SINGLE_GATE;
                op.gate = g;
                plan.push_back(std::move(op));
            }
        }
    }

    flush_diagonal_layer();
    return plan;
}

void CircuitOptimizer::execute_plan(const std::vector<FusedCircuitOp>& plan, QubitRegister& reg) {
    for (const auto& op : plan) {
        switch (op.type) {
            case FusedOpType::SINGLE_GATE: {
                const auto& g = op.gate;
                switch (g.type) {
                    case GateType::H:  GateOps::apply_h(reg, g.targets[0]); break;
                    case GateType::X:  GateOps::apply_x(reg, g.targets[0]); break;
                    case GateType::Y:  GateOps::apply_y(reg, g.targets[0]); break;
                    case GateType::Z:  GateOps::apply_z(reg, g.targets[0]); break;
                    case GateType::S:  GateOps::apply_s(reg, g.targets[0]); break;
                    case GateType::T:  GateOps::apply_t(reg, g.targets[0]); break;
                    case GateType::RX: GateOps::apply_rx(reg, g.targets[0], g.param); break;
                    case GateType::RY: GateOps::apply_ry(reg, g.targets[0], g.param); break;
                    case GateType::RZ: GateOps::apply_rz(reg, g.targets[0], g.param); break;
                    case GateType::CNOT: GateOps::apply_cnot(reg, g.targets[0], g.targets[1]); break;
                    case GateType::CZ:   GateOps::apply_cz(reg, g.targets[0], g.targets[1]); break;
                    case GateType::CPHASE: GateOps::apply_cphase(reg, g.targets[0], g.targets[1], g.param); break;
                    case GateType::SWAP: GateOps::apply_swap(reg, g.targets[0], g.targets[1]); break;
                    case GateType::TOFFOLI: GateOps::apply_toffoli(reg, g.targets[0], g.targets[1], g.targets[2]); break;
                    case GateType::TERNARY_CYCLE:  GateOps::apply_ternary_cycle(reg, g.targets[0]); break;
                    case GateType::TERNARY_INVERT: GateOps::apply_ternary_invert(reg, g.targets[0]); break;
                    default: break;
                }
                break;
            }
            case FusedOpType::DIAGONAL_LAYER: {
                GateOps::apply_diagonal_phase_layer(reg, op.diagonal_ops);
                break;
            }
            case FusedOpType::QFT_LADDER_PHASE: {
                apply_qft_ladder_phase(reg, op.q_ctrl);
                break;
            }
            case FusedOpType::SWAP_PAIR: {
                GateOps::apply_swap(reg, op.q1, op.q2);
                break;
            }
        }
    }
}

// ============================================================================
// QFT Planner Implementation
// ============================================================================
std::vector<FusedCircuitOp> QFTPlanner::build_plan(size_t n, size_t total_qubits) {
    std::vector<FusedCircuitOp> plan;

    for (size_t b = n; b-- > 0;) {
        // 1. Single Hadamard on qubit b
        FusedCircuitOp h_op;
        h_op.type = FusedOpType::SINGLE_GATE;
        h_op.gate = QuantumGate(GateType::H, b);
        plan.push_back(std::move(h_op));

        // 2. Fused QFT Ladder Phase: all b controlled-phase gates collapsed into 1 pass!
        if (b > 0) {
            FusedCircuitOp ladder_op;
            ladder_op.type = FusedOpType::QFT_LADDER_PHASE;
            ladder_op.q_ctrl = b;
            plan.push_back(std::move(ladder_op));
        }
    }

    // 3. Bit-reversal direct swaps
    for (size_t q = 0; q < n / 2; ++q) {
        FusedCircuitOp swap_op;
        swap_op.type = FusedOpType::SWAP_PAIR;
        swap_op.q1 = q;
        swap_op.q2 = n - 1 - q;
        plan.push_back(std::move(swap_op));
    }

    return plan;
}

void QFTPlanner::execute_qft(size_t n, QubitRegister& reg) {
    auto plan = build_plan(n, reg.size());
    CircuitOptimizer::execute_plan(plan, reg);
}

} // namespace qvm
} // namespace tersun
