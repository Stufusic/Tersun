#include "qvm/qgate.hpp"
#include "qvm/qsimd.hpp"
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
    gates_.emplace_back(GateType::CPHASE, ctrl, target, theta);
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
            case GateType::CNOT:   GateOps::apply_cnot(reg, g.targets[0], g.targets[1]); break;
            case GateType::CZ:     GateOps::apply_cz(reg, g.targets[0], g.targets[1]); break;
            case GateType::CPHASE: GateOps::apply_cphase(reg, g.targets[0], g.targets[1], g.param); break;
            case GateType::SWAP:   GateOps::apply_swap(reg, g.targets[0], g.targets[1]); break;
            case GateType::TOFFOLI: GateOps::apply_toffoli(reg, g.targets[0], g.targets[1], g.targets[2]); break;
            case GateType::TERNARY_CYCLE:  GateOps::apply_ternary_cycle(reg, g.targets[0]); break;
            case GateType::TERNARY_INVERT: GateOps::apply_ternary_invert(reg, g.targets[0]); break;
            default: break;
        }
    }
}

std::string QuantumCircuit::to_openqasm(const std::string& circuit_name, bool decompose_cphase) const {
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
            case GateType::CPHASE:
                if (decompose_cphase) {
                    oss << "// Decomposed CP(theta) = RZ(th/2) CX RZ(-th/2) CX RZ(th/2)\n";
                    oss << "rz(" << (g.param * 0.5) << ") q[" << g.targets[0] << "];\n";
                    oss << "cx q[" << g.targets[0] << "], q[" << g.targets[1] << "];\n";
                    oss << "rz(" << (-g.param * 0.5) << ") q[" << g.targets[1] << "];\n";
                    oss << "cx q[" << g.targets[0] << "], q[" << g.targets[1] << "];\n";
                    oss << "rz(" << (g.param * 0.5) << ") q[" << g.targets[1] << "];\n";
                } else {
                    oss << "cp(" << g.param << ") q[" << g.targets[0] << "], q[" << g.targets[1] << "];\n";
                }
                break;
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
// GateOps Direct Implementation (Gate QVM-OPT 1: Specialized & Branch-Free)
// ============================================================================

namespace GateOps {

// Helper: Apply a 2x2 single-qubit unitary matrix to the full statevector (Fallback)
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

// Specialized Scalar Kernel: Hadamard Gate (only 2 real muls per complex pair)
void apply_h(QubitRegister& reg, size_t q) {
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

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;
    const double inv_sqrt2 = 1.0 / std::sqrt(2.0);

#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
    for (int64_t i = 0; i < static_cast<int64_t>(dim); i += (step << 1)) {
        for (size_t j = 0; j < step; ++j) {
            size_t i0 = i + j;
            size_t i1 = i0 + step;
            QComplex a0 = sv[i0];
            QComplex a1 = sv[i1];
            sv[i0] = (a0 + a1) * inv_sqrt2;
            sv[i1] = (a0 - a1) * inv_sqrt2;
        }
    }
}

// Specialized Scalar Kernel: Pauli-X (NOT) - Zero multiplications, pure in-place swap
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

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;

    for (size_t i = 0; i < dim; i += (step << 1)) {
        for (size_t j = 0; j < step; ++j) {
            std::swap(sv[i + j], sv[i + j + step]);
        }
    }
}

// Specialized Scalar Kernel: Pauli-Y - Swap with complex sign rotation
void apply_y(QubitRegister& reg, size_t q) {
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
            // Y|0> = i|1>, Y|1> = -i|0>
            sv[i0] = QComplex(a1.imag(), -a1.real());
            sv[i1] = QComplex(-a0.imag(), a0.real());
        }
    }
}

// Specialized Scalar Kernel: Pauli-Z - Zero work on |0>, only negate |1> branch
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
        return; // Z|0> = |0>, Z|1> = -|1>
    }

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;

    for (size_t i = 0; i < dim; i += (step << 1)) {
        size_t base = i + step;
        for (size_t j = 0; j < step; ++j) {
            sv[base + j] = -sv[base + j];
        }
    }
}

// Specialized Scalar Kernel: Phase S Gate (multiply |1> by i = (-imag, real))
void apply_s(QubitRegister& reg, size_t q) {
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;

    for (size_t i = 0; i < dim; i += (step << 1)) {
        size_t base = i + step;
        for (size_t j = 0; j < step; ++j) {
            QComplex v = sv[base + j];
            sv[base + j] = QComplex(-v.imag(), v.real());
        }
    }
}

// Specialized Scalar Kernel: T Gate (multiply |1> by e^{i*pi/4} = (1+i)/sqrt(2))
void apply_t(QubitRegister& reg, size_t q) {
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;
    const double inv_sqrt2 = 1.0 / std::sqrt(2.0);

    for (size_t i = 0; i < dim; i += (step << 1)) {
        size_t base = i + step;
        for (size_t j = 0; j < step; ++j) {
            QComplex v = sv[base + j];
            sv[base + j] = QComplex((v.real() - v.imag()) * inv_sqrt2,
                                    (v.real() + v.imag()) * inv_sqrt2);
        }
    }
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

// Specialized Scalar Kernel: RZ Gate (two phase factors e^{-i*th/2} and e^{i*th/2})
void apply_rz(QubitRegister& reg, size_t q, double theta) {
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();
    size_t step = 1ULL << q;
    double half = theta * 0.5;
    double c0 = std::cos(-half), s0 = std::sin(-half);
    double c1 = std::cos(half),  s1 = std::sin(half);

    for (size_t i = 0; i < dim; i += (step << 1)) {
        for (size_t j = 0; j < step; ++j) {
            size_t i0 = i + j;
            size_t i1 = i0 + step;
            QComplex a0 = sv[i0];
            QComplex a1 = sv[i1];
            sv[i0] = QComplex(a0.real() * c0 - a0.imag() * s0,
                              a0.real() * s0 + a0.imag() * c0);
            sv[i1] = QComplex(a1.real() * c1 - a1.imag() * s1,
                              a1.real() * s1 + a1.imag() * c1);
        }
    }
}

// Branch-Free Strided CNOT Planner (Eliminates 100% of bit shifts & branches in inner loop)
void apply_cnot(QubitRegister& reg, size_t ctrl, size_t target) {
    if (!reg.is_statevector_active()) {
        auto sc = reg.get_discrete_state(ctrl);
        if (sc == QubitState2Bit::ZERO) {
            return;
        } else if (sc == QubitState2Bit::ONE) {
            apply_x(reg, target);
            return;
        }
    }

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    size_t c = std::min(ctrl, target);
    size_t t = std::max(ctrl, target);
    size_t mask_c = 1ULL << c;
    size_t mask_t = 1ULL << t;

    if (ctrl < target) {
        // bit c (ctrl) = 1, bit t (target) = 0 for i0; i1 = i0 | mask_t
#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
        for (int64_t high = 0; high < static_cast<int64_t>(dim); high += (mask_t << 1)) {
            for (size_t mid = 0; mid < mask_t; mid += (mask_c << 1)) {
                for (size_t low = 0; low < mask_c; ++low) {
                    size_t i0 = static_cast<size_t>(high) | mid | mask_c | low;
                    size_t i1 = i0 | mask_t;
                    std::swap(sv[i0], sv[i1]);
                }
            }
        }
    } else {
        // ctrl > target: bit t (ctrl) = 1, bit c (target) = 0 for i0; i1 = i0 | mask_c
#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
        for (int64_t high = 0; high < static_cast<int64_t>(dim); high += (mask_t << 1)) {
            for (size_t mid = 0; mid < mask_t; mid += (mask_c << 1)) {
                for (size_t low = 0; low < mask_c; ++low) {
                    size_t i0 = static_cast<size_t>(high) | mask_t | mid | low;
                    size_t i1 = i0 | mask_c;
                    std::swap(sv[i0], sv[i1]);
                }
            }
        }
    }
}

// Branch-Free Strided CZ Planner (Direct negation on |11> states)
void apply_cz(QubitRegister& reg, size_t ctrl, size_t target) {
    if (!reg.is_statevector_active()) {
        auto sc = reg.get_discrete_state(ctrl);
        auto st = reg.get_discrete_state(target);
        if (sc == QubitState2Bit::ZERO || st == QubitState2Bit::ZERO) {
            return;
        } else if (sc == QubitState2Bit::ONE) {
            apply_z(reg, target);
            return;
        } else if (st == QubitState2Bit::ONE) {
            apply_z(reg, ctrl);
            return;
        }
    }

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    size_t c = std::min(ctrl, target);
    size_t t = std::max(ctrl, target);
    size_t mask_c = 1ULL << c;
    size_t mask_t = 1ULL << t;

#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
    for (int64_t high = 0; high < static_cast<int64_t>(dim); high += (mask_t << 1)) {
        for (size_t mid = 0; mid < mask_t; mid += (mask_c << 1)) {
            for (size_t low = 0; low < mask_c; ++low) {
                size_t idx = static_cast<size_t>(high) | mask_t | mid | mask_c | low;
                sv[idx] = -sv[idx];
            }
        }
    }
}

// Native Controlled-Phase: CP(theta) = diag(1, 1, 1, e^{i*theta})
// Single-pass diagonal transformation on the 25% amplitudes where both ctrl & target are 1
void apply_cphase(QubitRegister& reg, size_t ctrl, size_t target, double theta) {
    if (!reg.is_statevector_active()) {
        auto sc = reg.get_discrete_state(ctrl);
        auto st = reg.get_discrete_state(target);
        if (sc == QubitState2Bit::ZERO || st == QubitState2Bit::ZERO) {
            return;
        } else if (sc == QubitState2Bit::ONE) {
            apply_rz(reg, target, theta);
            return;
        } else if (st == QubitState2Bit::ONE) {
            apply_rz(reg, ctrl, theta);
            return;
        }
    }

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    size_t c = std::min(ctrl, target);
    size_t t = std::max(ctrl, target);
    size_t mask_c = 1ULL << c;
    size_t mask_t = 1ULL << t;

    double cos_th = std::cos(theta);
    double sin_th = std::sin(theta);

#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
    for (int64_t high = 0; high < static_cast<int64_t>(dim); high += (mask_t << 1)) {
        for (size_t mid = 0; mid < mask_t; mid += (mask_c << 1)) {
            for (size_t low = 0; low < mask_c; ++low) {
                size_t idx = static_cast<size_t>(high) | mask_t | mid | mask_c | low;
                QComplex val = sv[idx];
                sv[idx] = QComplex(val.real() * cos_th - val.imag() * sin_th,
                                   val.real() * sin_th + val.imag() * cos_th);
            }
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

    // Direct swap without 3 CNOT passes!
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    size_t c = std::min(q1, q2);
    size_t t = std::max(q1, q2);
    size_t mask_c = 1ULL << c;
    size_t mask_t = 1ULL << t;

    // Only swap pairs where bit c != bit t (i.e. |01> <-> |10>)
#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
    for (int64_t high = 0; high < static_cast<int64_t>(dim); high += (mask_t << 1)) {
        for (size_t mid = 0; mid < mask_t; mid += (mask_c << 1)) {
            for (size_t low = 0; low < mask_c; ++low) {
                size_t i01 = static_cast<size_t>(high) | mid | mask_c | low; // bit c = 1, bit t = 0
                size_t i10 = static_cast<size_t>(high) | mask_t | mid | low; // bit c = 0, bit t = 1
                std::swap(sv[i01], sv[i10]);
            }
        }
    }
}

// Branch-Free Strided Toffoli (CCX) Planner
void apply_toffoli(QubitRegister& reg, size_t c1, size_t c2, size_t target) {
    if (!reg.is_statevector_active()) {
        auto s1 = reg.get_discrete_state(c1);
        auto s2 = reg.get_discrete_state(c2);
        if (s1 == QubitState2Bit::ZERO || s2 == QubitState2Bit::ZERO) {
            return;
        } else if (s1 == QubitState2Bit::ONE && s2 == QubitState2Bit::ONE) {
            apply_x(reg, target);
            return;
        }
    }

    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

    size_t q[3] = {c1, c2, target};
    if (q[0] > q[1]) std::swap(q[0], q[1]);
    if (q[1] > q[2]) std::swap(q[1], q[2]);
    if (q[0] > q[1]) std::swap(q[0], q[1]);

    size_t m0 = 1ULL << q[0];
    size_t m1 = 1ULL << q[1];
    size_t m2 = 1ULL << q[2];
    size_t mask_target = 1ULL << target;
    size_t fixed_ctrls = (1ULL << c1) | (1ULL << c2);

    for (size_t high = 0; high < dim; high += (m2 << 1)) {
        for (size_t b2 = 0; b2 < m2; b2 += (m1 << 1)) {
            for (size_t b1 = 0; b1 < m1; b1 += (m0 << 1)) {
                for (size_t low = 0; low < m0; ++low) {
                    size_t free_bits = high | b2 | b1 | low;
                    size_t i0 = free_bits | fixed_ctrls;
                    size_t i1 = i0 ^ mask_target;
                    if (i0 < i1) {
                        std::swap(sv[i0], sv[i1]);
                    }
                }
            }
        }
    }
}

// Gate QVM-OPT 2: Multi-Op Fused Diagonal Phase Layer (Single memory sweep for commuting phases)
void apply_diagonal_phase_layer(QubitRegister& reg, const std::vector<DiagonalPhaseOp>& ops) {
    if (ops.empty()) return;
    reg.promote_to_statevector();
    auto& sv = reg.amplitudes();
    size_t dim = sv.size();

#if TERSUN_QVM_HAS_OPENMP
#pragma omp parallel for schedule(static) if (dim >= 524288)
#endif
    for (int64_t i = 0; i < static_cast<int64_t>(dim); ++i) {
        double acc_cos = 1.0;
        double acc_sin = 0.0;
        bool modified = false;

        for (const auto& op : ops) {
            uint64_t match_mask = op.control_mask | op.target_mask;
            if ((static_cast<uint64_t>(i) & match_mask) == match_mask) {
                double new_cos = acc_cos * op.phase_cos - acc_sin * op.phase_sin;
                double new_sin = acc_cos * op.phase_sin + acc_sin * op.phase_cos;
                acc_cos = new_cos;
                acc_sin = new_sin;
                modified = true;
            }
        }

        if (modified) {
            QComplex val = sv[i];
            sv[i] = QComplex(val.real() * acc_cos - val.imag() * acc_sin,
                             val.real() * acc_sin + val.imag() * acc_cos);
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
