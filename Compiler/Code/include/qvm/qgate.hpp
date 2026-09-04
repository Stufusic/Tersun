#pragma once

#include "qvm/qreg.hpp"
#include <string>
#include <vector>

namespace tersun {
namespace qvm {

enum class GateType {
    // 1-Qubit Clifford + T
    H,
    X,
    Y,
    Z,
    S,
    T,
    RX,
    RY,
    RZ,
    // 2-Qubit Entangling
    CNOT,
    CZ,
    SWAP,
    // 3-Qubit Universal
    TOFFOLI,
    // Ternary Specific Gates
    TERNARY_CYCLE,
    TERNARY_INVERT,
    // Measurement & Reset
    MEASURE,
    RESET
};

struct QuantumGate {
    GateType type;
    std::vector<size_t> targets; // [0] = target or control, [1] = target, etc.
    double param{0.0};          // Angle for rotation gates (Rx, Ry, Rz)
    std::string comment;

    QuantumGate(GateType t, size_t target)
        : type(t), targets{target} {}
    QuantumGate(GateType t, size_t ctrl, size_t target)
        : type(t), targets{ctrl, target} {}
    QuantumGate(GateType t, size_t c1, size_t c2, size_t target)
        : type(t), targets{c1, c2, target} {}
    QuantumGate(GateType t, size_t target, double theta)
        : type(t), targets{target}, param(theta) {}
};

class QuantumCircuit {
public:
    explicit QuantumCircuit(size_t num_qubits) : num_qubits_(num_qubits) {}

    size_t num_qubits() const { return num_qubits_; }
    const std::vector<QuantumGate>& gates() const { return gates_; }

    // 1-Qubit Gate Application
    QuantumCircuit& h(size_t q);
    QuantumCircuit& x(size_t q);
    QuantumCircuit& y(size_t q);
    QuantumCircuit& z(size_t q);
    QuantumCircuit& s(size_t q);
    QuantumCircuit& t(size_t q);
    QuantumCircuit& rx(size_t q, double theta);
    QuantumCircuit& ry(size_t q, double theta);
    QuantumCircuit& rz(size_t q, double theta);

    // 2-Qubit Gate Application
    QuantumCircuit& cnot(size_t ctrl, size_t target);
    QuantumCircuit& cz(size_t ctrl, size_t target);
    QuantumCircuit& swap(size_t q1, size_t q2);

    // 3-Qubit Gate Application
    QuantumCircuit& toffoli(size_t c1, size_t c2, size_t target);

    // Ternary Gates
    QuantumCircuit& ternary_cycle(size_t q);
    QuantumCircuit& ternary_invert(size_t q);

    // Execute the circuit on a QubitRegister
    void execute(QubitRegister& reg) const;

    // Export circuit to OpenQASM 3.0 string
    std::string to_openqasm(const std::string& circuit_name = "tersun_quantum_circuit") const;

private:
    size_t num_qubits_{0};
    std::vector<QuantumGate> gates_;
};

// Direct gate application functions on a QubitRegister
namespace GateOps {
    void apply_h(QubitRegister& reg, size_t q);
    void apply_x(QubitRegister& reg, size_t q);
    void apply_y(QubitRegister& reg, size_t q);
    void apply_z(QubitRegister& reg, size_t q);
    void apply_s(QubitRegister& reg, size_t q);
    void apply_t(QubitRegister& reg, size_t q);
    void apply_rx(QubitRegister& reg, size_t q, double theta);
    void apply_ry(QubitRegister& reg, size_t q, double theta);
    void apply_rz(QubitRegister& reg, size_t q, double theta);

    void apply_cnot(QubitRegister& reg, size_t ctrl, size_t target);
    void apply_cz(QubitRegister& reg, size_t ctrl, size_t target);
    void apply_swap(QubitRegister& reg, size_t q1, size_t q2);
    void apply_toffoli(QubitRegister& reg, size_t c1, size_t c2, size_t target);

    void apply_ternary_cycle(QubitRegister& reg, size_t q);
    void apply_ternary_invert(QubitRegister& reg, size_t q);
}

} // namespace qvm
} // namespace tersun
