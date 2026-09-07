#include "qvm/qgate.hpp"
#include <sstream>
#include <cmath>
#include <stdexcept>

namespace tersun {
namespace qvm {

static constexpr double pi = 3.14159265358979323846;

// ============================================================================
// QuantumCircuit Builder
// ============================================================================

QuantumCircuit& QuantumCircuit::h(size_t q) {
    gates_.emplace_back(GateType::H, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::x(size_t q) {
    gates_.emplace_back(GateType::X, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::y(size_t q) {
    gates_.emplace_back(GateType::Y, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::z(size_t q) {
    gates_.emplace_back(GateType::Z, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::s(size_t q) {
    gates_.emplace_back(GateType::S, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::t(size_t q) {
    gates_.emplace_back(GateType::T, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::rx(size_t q, double theta) {
    gates_.emplace_back(GateType::RX, q, theta);
    return *this;
}

QuantumCircuit& QuantumCircuit::ry(size_t q, double theta) {
    gates_.emplace_back(GateType::RY, q, theta);
    return *this;
}

QuantumCircuit& QuantumCircuit::rz(size_t q, double theta) {
    gates_.emplace_back(GateType::RZ, q, theta);
    return *this;
}

QuantumCircuit& QuantumCircuit::cnot(size_t ctrl, size_t target) {
    gates_.emplace_back(GateType::CNOT, ctrl, target);
    return *this;
}

QuantumCircuit& QuantumCircuit::cz(size_t ctrl, size_t target) {
    gates_.emplace_back(GateType::CZ, ctrl, target);
    return *this;
}

QuantumCircuit& QuantumCircuit::swap(size_t q1, size_t q2) {
    gates_.emplace_back(GateType::SWAP, q1, q2);
    return *this;
}

QuantumCircuit& QuantumCircuit::cphase(size_t ctrl, size_t target, double theta) {
    if (ctrl >= num_qubits_ || target >= num_qubits_ || ctrl == target) {
        throw std::invalid_argument("cphase requires two distinct in-register qubits");
    }
    // Standard CP(theta) = diag(1,1,1,e^{i*theta}) decomposition into
    // primitives only; exact up to the global phase e^{-i*theta/4}:
    //   RZ(theta/2) on ctrl; CNOT; RZ(-theta/2) on target; CNOT; RZ(theta/2) on target.
    rz(ctrl, theta * 0.5);
    cnot(ctrl, target);
    rz(target, -theta * 0.5);
    cnot(ctrl, target);
    rz(target, theta * 0.5);
    return *this;
}

QuantumCircuit& QuantumCircuit::toffoli(size_t c1, size_t c2, size_t target) {
    gates_.emplace_back(GateType::TOFFOLI, c1, c2, target);
    return *this;
}

QuantumCircuit& QuantumCircuit::qft(size_t n) {
    if (n == 0 || n > num_qubits_) {
        throw std::invalid_argument("qft requires 1 <= n <= circuit qubit count");
    }
    // Bit convention: qubit q carries bit q of the basis index (qubit 0 = LSB).
    // Phase ladder on the MSB first, then bit-reversal swaps. With qubit
    // b as the "control of history", cphase(b, c, pi / 2^(b-c)) accumulates
    // the binary-fraction phases of the product-form QFT exactly.
    for (size_t b = n; b-- > 0;) {
        h(b);
        for (size_t c = b; c-- > 0;) {
            cphase(b, c, pi / std::pow(2.0, static_cast<double>(b - c)));
        }
    }
    for (size_t q = 0; q < n / 2; ++q) {
        swap(q, n - 1 - q);
    }
    return *this;
}

QuantumCircuit& QuantumCircuit::grover(size_t n, size_t target) {
    if (n == 0 || n > 3 || n > num_qubits_) {
        throw std::invalid_argument("grover supports 1 <= n <= 3 qubits on the Q-ISA gate set");
    }
    const size_t dim = size_t(1) << n;
    if (target >= dim) {
        throw std::invalid_argument("grover target must be a basis state inside [0, 2^n)");
    }

    // Phase flip on |1...1> using only primitive gates:
    //   n=1: Z          n=2: CZ           n=3: H * TOFFOLI * H (= CCZ)
    auto phase_flip_all_ones = [&]() {
        if (n == 1) {
            z(0);
        } else if (n == 2) {
            cz(0, 1);
        } else {
            h(2);
            toffoli(0, 1, 2);
            h(2);
        }
    };

    // Oracle: mask |target> into |1...1>, phase-flip, unmask.
    auto apply_oracle = [&]() {
        for (size_t q = 0; q < n; ++q) {
            if (!((target >> q) & size_t(1))) x(q);
        }
        phase_flip_all_ones();
        for (size_t q = 0; q < n; ++q) {
            if (!((target >> q) & size_t(1))) x(q);
        }
    };

    // Diffusion: H^n X^n (phase flip on |1...1>) X^n H^n == H^n P(|0...0>) H^n.
    auto apply_diffusion = [&]() {
        for (size_t q = 0; q < n; ++q) h(q);
        for (size_t q = 0; q < n; ++q) x(q);
        phase_flip_all_ones();
        for (size_t q = 0; q < n; ++q) x(q);
        for (size_t q = 0; q < n; ++q) h(q);
    };

    for (size_t q = 0; q < n; ++q) h(q); // uniform superposition over [0, N)
    const size_t iterations = static_cast<size_t>(
        std::floor(pi / 4.0 * std::sqrt(static_cast<double>(dim))));
    for (size_t it = 0; it < iterations; ++it) {
        apply_oracle();
        apply_diffusion();
    }
    return *this;
}

QuantumCircuit& QuantumCircuit::ternary_cycle(size_t q) {
    gates_.emplace_back(GateType::TERNARY_CYCLE, q);
    return *this;
}

QuantumCircuit& QuantumCircuit::ternary_invert(size_t q) {
    gates_.emplace_back(GateType::TERNARY_INVERT, q);
    return *this;
}

void QuantumCircuit::execute(QubitRegister& reg) const {
    for (const auto& g : gates_) {
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
            case GateType::SWAP: GateOps::apply_swap(reg, g.targets[0], g.targets[1]); break;
            case GateType::TOFFOLI: GateOps::apply_toffoli(reg, g.targets[0], g.targets[1], g.targets[2]); break;
            case GateType::TERNARY_CYCLE:  GateOps::apply_ternary_cycle(reg, g.targets[0]); break;
            case GateType::TERNARY_INVERT: GateOps::apply_ternary_invert(reg, g.targets[0]); break;
            default: break;
        }
    }
}

std::string QuantumCircuit::to_openqasm(const std::string& circuit_name) const {
    std::ostringstream oss;
    oss << "// ============================================================================\n";
    oss << "// OpenQASM 3.0 Generated by Tersun 1.0.2 Quantum Compiler (QVM)\n";
    oss << "// Circuit: " << circuit_name << " (" << num_qubits_ << " Qubits)\n";
    oss << "// ============================================================================\n\n";
    oss << "OPENQASM 3.0;\n";
    oss << "include \"stdgates.inc\";\n\n";
    oss << "// Quantum and Classical Register Declarations\n";
    oss << "qubit[" << num_qubits_ << "] q;\n";
    oss << "bit[" << num_qubits_ << "] c;\n\n";

    for (const auto& g : gates_) {
        switch (g.type) {
            case GateType::H:  oss << "h q[" << g.targets[0] << "];\n"; break;
            case GateType::X:  oss << "x q[" << g.targets[0] << "];\n"; break;
            case GateType::Y:  oss << "y q[" << g.targets[0] << "];\n"; break;
            case GateType::Z:  oss << "z q[" << g.targets[0] << "];\n"; break;
            case GateType::S:  oss << "s q[" << g.targets[0] << "];\n"; break;
            case GateType::T:  oss << "t q[" << g.targets[0] << "];\n"; break;
            case GateType::RX: oss << "rx(" << g.param << ") q[" << g.targets[0] << "];\n"; break;
            case GateType::RY: oss << "ry(" << g.param << ") q[" << g.targets[0] << "];\n"; break;
            case GateType::RZ: oss << "rz(" << g.param << ") q[" << g.targets[0] << "];\n"; break;
            case GateType::CNOT: oss << "cx q[" << g.targets[0] << "], q[" << g.targets[1] << "];\n"; break;
            case GateType::CZ:   oss << "cz q[" << g.targets[0] << "], q[" << g.targets[1] << "];\n"; break;
            case GateType::SWAP: oss << "swap q[" << g.targets[0] << "], q[" << g.targets[1] << "];\n"; break;
            case GateType::TOFFOLI: oss << "ccx q[" << g.targets[0] << "], q[" << g.targets[1] << "], q[" << g.targets[2] << "];\n"; break;
            case GateType::TERNARY_CYCLE:
                oss << "// Tersun Ternary Cycle (0 -> +1 -> -1 -> 0)\n";
                oss << "x q[" << g.targets[0] << "];\n";
                break;
            case GateType::TERNARY_INVERT:
                oss << "// Tersun Ternary Invert (+1 <-> -1)\n";
                oss << "z q[" << g.targets[0] << "];\n";
                break;
            default: break;
        }
    }

    oss << "\n// Projective Measurement into Classical Register\n";
    oss << "c = measure q;\n";
    return oss.str();
}

// ============================================================================
// GateOps Direct Implementation
// ============================================================================

namespace GateOps {

// Helper: Apply a 2x2 single-qubit unitary matrix to the full statevector
static void apply_1q_unitary(QubitRegister& reg, size_t q,
                             QComplex u00, QComplex u01,
                             QComplex u10, QComplex u11) {
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;

    for (size_t i = 0; i < dim; i += (step << 1)) {
        for (size_t j = 0; j < step; ++j) {
            size_t i0 = i + j;
            size_t i1 = i0 + step;
            QComplex a0 = sv[i0];
            QComplex a1 = sv[i1];
            sv[i0] = u00 * a0 + u01 * a1;
            sv[i1] = u10 * a0 + u11 * a1;
        }
    }
}

void apply_h(QubitRegister& reg, size_t q) {
    // Fast path: if not statevector and pure state
    if (!reg.is_statevector_active()) {
        auto s = reg.get_discrete_state(q);
        if (s == QubitState2Bit::ZERO) {
            reg.set_discrete_state(q, QubitState2Bit::PLUS_OR_NIL); // H|0> = |+>
            return;
        } else if (s == QubitState2Bit::ONE) {
            reg.set_discrete_state(q, QubitState2Bit::MINUS);       // H|1> = |->
            return;
        } else if (s == QubitState2Bit::PLUS_OR_NIL) {
            reg.set_discrete_state(q, QubitState2Bit::ZERO);        // H|+> = |0>
            return;
        } else if (s == QubitState2Bit::MINUS) {
            reg.set_discrete_state(q, QubitState2Bit::ONE);         // H|-> = |1>
            return;
        }
    }

    const double inv_sqrt2 = 1.0 / std::sqrt(2.0);
    apply_1q_unitary(reg, q,
                     QComplex(inv_sqrt2, 0.0), QComplex(inv_sqrt2, 0.0),
                     QComplex(inv_sqrt2, 0.0), QComplex(-inv_sqrt2, 0.0));
}

void apply_x(QubitRegister& reg, size_t q) {
    if (!reg.is_statevector_active()) {
        auto s = reg.get_discrete_state(q);
        if (s == QubitState2Bit::ZERO) {
            reg.set_discrete_state(q, QubitState2Bit::ONE);
            return;
        } else if (s == QubitState2Bit::ONE) {
            reg.set_discrete_state(q, QubitState2Bit::ZERO);
            return;
        } else if (s == QubitState2Bit::MINUS) {
            reg.set_discrete_state(q, QubitState2Bit::PLUS_OR_NIL);
            return;
        } else if (s == QubitState2Bit::PLUS_OR_NIL) {
            reg.set_discrete_state(q, QubitState2Bit::MINUS);
            return;
        }
    }

    apply_1q_unitary(reg, q,
                     QComplex(0.0, 0.0), QComplex(1.0, 0.0),
                     QComplex(1.0, 0.0), QComplex(0.0, 0.0));
}

void apply_y(QubitRegister& reg, size_t q) {
    apply_1q_unitary(reg, q,
                     QComplex(0.0, 0.0), QComplex(0.0, -1.0),
                     QComplex(0.0, 1.0), QComplex(0.0, 0.0));
}

void apply_z(QubitRegister& reg, size_t q) {
    if (!reg.is_statevector_active()) {
        auto s = reg.get_discrete_state(q);
        if (s == QubitState2Bit::PLUS_OR_NIL) {
            reg.set_discrete_state(q, QubitState2Bit::MINUS);
            return;
        } else if (s == QubitState2Bit::MINUS) {
            reg.set_discrete_state(q, QubitState2Bit::PLUS_OR_NIL);
            return;
        }
        return; // Z|0> = |0>, Z|1> = -|1> (only global phase change for classical probabilities)
    }

    apply_1q_unitary(reg, q,
                     QComplex(1.0, 0.0), QComplex(0.0, 0.0),
                     QComplex(0.0, 0.0), QComplex(-1.0, 0.0));
}

void apply_s(QubitRegister& reg, size_t q) {
    apply_1q_unitary(reg, q,
                     QComplex(1.0, 0.0), QComplex(0.0, 0.0),
                     QComplex(0.0, 0.0), QComplex(0.0, 1.0));
}

void apply_t(QubitRegister& reg, size_t q) {
    const double inv_sqrt2 = 1.0 / std::sqrt(2.0);
    apply_1q_unitary(reg, q,
                     QComplex(1.0, 0.0), QComplex(0.0, 0.0),
                     QComplex(0.0, 0.0), QComplex(inv_sqrt2, inv_sqrt2));
}

void apply_rx(QubitRegister& reg, size_t q, double theta) {
    double half = theta * 0.5;
    double c = std::cos(half);
    double s = std::sin(half);
    apply_1q_unitary(reg, q,
                     QComplex(c, 0.0), QComplex(0.0, -s),
                     QComplex(0.0, -s), QComplex(c, 0.0));
}

void apply_ry(QubitRegister& reg, size_t q, double theta) {
    double half = theta * 0.5;
    double c = std::cos(half);
    double s = std::sin(half);
    apply_1q_unitary(reg, q,
                     QComplex(c, 0.0), QComplex(-s, 0.0),
                     QComplex(s, 0.0), QComplex(c, 0.0));
}

void apply_rz(QubitRegister& reg, size_t q, double theta) {
    double half = theta * 0.5;
    apply_1q_unitary(reg, q,
                     QComplex(std::cos(-half), std::sin(-half)), QComplex(0.0, 0.0),
                     QComplex(0.0, 0.0), QComplex(std::cos(half), std::sin(half)));
}

void apply_cnot(QubitRegister& reg, size_t ctrl, size_t target) {
    if (!reg.is_statevector_active()) {
        auto sc = reg.get_discrete_state(ctrl);
        if (sc == QubitState2Bit::ZERO) {
            // Control is 0 -> target unchanged
            return;
        } else if (sc == QubitState2Bit::ONE) {
            // Control is 1 -> flip target
            apply_x(reg, target);
            return;
        }
        // Control is in superposition -> must promote to statevector to model entanglement!
    }

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    for (size_t i = 0; i < dim; ++i) {
        // Only flip target if control bit is 1 and target bit is 0 (to swap pair)
        if (((i >> ctrl) & 1ULL) && !((i >> target) & 1ULL)) {
            size_t paired = i | (1ULL << target);
            std::swap(sv[i], sv[paired]);
        }
    }
}

void apply_cz(QubitRegister& reg, size_t ctrl, size_t target) {
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    for (size_t i = 0; i < dim; ++i) {
        if (((i >> ctrl) & 1ULL) && ((i >> target) & 1ULL)) {
            sv[i] = -sv[i];
        }
    }
}

void apply_swap(QubitRegister& reg, size_t q1, size_t q2) {
    if (!reg.is_statevector_active()) {
        auto s1 = reg.get_discrete_state(q1);
        auto s2 = reg.get_discrete_state(q2);
        reg.set_discrete_state(q1, s2);
        reg.set_discrete_state(q2, s1);
        return;
    }

    apply_cnot(reg, q1, q2);
    apply_cnot(reg, q2, q1);
    apply_cnot(reg, q1, q2);
}

void apply_toffoli(QubitRegister& reg, size_t c1, size_t c2, size_t target) {
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    for (size_t i = 0; i < dim; ++i) {
        if (((i >> c1) & 1ULL) && ((i >> c2) & 1ULL) && !((i >> target) & 1ULL)) {
            size_t paired = i | (1ULL << target);
            std::swap(sv[i], sv[paired]);
        }
    }
}

void apply_ternary_cycle(QubitRegister& reg, size_t q) {
    auto s = reg.get_discrete_state(q);
    switch (s) {
        case QubitState2Bit::ZERO:
            reg.set_discrete_state(q, QubitState2Bit::ONE);   // 0 -> +1
            break;
        case QubitState2Bit::ONE:
            reg.set_discrete_state(q, QubitState2Bit::MINUS); // +1 -> -1
            break;
        case QubitState2Bit::MINUS:
            reg.set_discrete_state(q, QubitState2Bit::ZERO);  // -1 -> 0
            break;
        default:
            reg.set_discrete_state(q, QubitState2Bit::ZERO);
            break;
    }
}

void apply_ternary_invert(QubitRegister& reg, size_t q) {
    auto s = reg.get_discrete_state(q);
    if (s == QubitState2Bit::ONE) {
        reg.set_discrete_state(q, QubitState2Bit::MINUS);
    } else if (s == QubitState2Bit::MINUS) {
        reg.set_discrete_state(q, QubitState2Bit::ONE);
    }
}

} // namespace GateOps
} // namespace qvm
} // namespace tersun
