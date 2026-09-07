#pragma once

#include "qvm/qbackend.hpp"
#include <chrono>

namespace tersun {
namespace qvm {

class StatevectorBackend : public QuantumBackend {
public:
    explicit StatevectorBackend(size_t num_qubits = 16)
        : reg_(num_qubits) {
        metrics_.backend_used = BackendType::STATEVECTOR_EXACT;
        metrics_.num_qubits = num_qubits;
        metrics_.estimated_fidelity = 1.0;
        metrics_.discarded_weight = 0.0;
    }

    BackendType type() const override { return BackendType::STATEVECTOR_EXACT; }
    const char* name() const override { return "Statevector (Exact)"; }

    void reset(size_t num_qubits) override {
        reg_ = QubitRegister(num_qubits);
        metrics_ = SimulationMetrics{};
        metrics_.backend_used = BackendType::STATEVECTOR_EXACT;
        metrics_.num_qubits = num_qubits;
        metrics_.estimated_fidelity = 1.0;
    }

    void apply_gate(const QuantumGate& gate) override {
        QuantumCircuit single_gate(reg_.size());
        // Delegate to circuit runner
        switch (gate.type) {
            case GateType::H: GateOps::apply_h(reg_, gate.targets[0]); break;
            case GateType::X: GateOps::apply_x(reg_, gate.targets[0]); break;
            case GateType::Y: GateOps::apply_y(reg_, gate.targets[0]); break;
            case GateType::Z: GateOps::apply_z(reg_, gate.targets[0]); break;
            case GateType::S: GateOps::apply_s(reg_, gate.targets[0]); break;
            case GateType::T: GateOps::apply_t(reg_, gate.targets[0]); break;
            case GateType::RX: GateOps::apply_rx(reg_, gate.targets[0], gate.param); break;
            case GateType::RY: GateOps::apply_ry(reg_, gate.targets[0], gate.param); break;
            case GateType::RZ: GateOps::apply_rz(reg_, gate.targets[0], gate.param); break;
            case GateType::CNOT: GateOps::apply_cnot(reg_, gate.targets[0], gate.targets[1]); break;
            case GateType::CZ:   GateOps::apply_cz(reg_, gate.targets[0], gate.targets[1]); break;
            case GateType::SWAP: GateOps::apply_swap(reg_, gate.targets[0], gate.targets[1]); break;
            case GateType::TOFFOLI: GateOps::apply_toffoli(reg_, gate.targets[0], gate.targets[1], gate.targets[2]); break;
            case GateType::TERNARY_CYCLE:  GateOps::apply_ternary_cycle(reg_, gate.targets[0]); break;
            case GateType::TERNARY_INVERT: GateOps::apply_ternary_invert(reg_, gate.targets[0]); break;
            default: break;
        }
        metrics_.gate_count++;
    }

    void execute_circuit(const QuantumCircuit& circuit) override {
        auto t0 = std::chrono::steady_clock::now();
        circuit.execute(reg_);
        auto t1 = std::chrono::steady_clock::now();

        metrics_.elapsed_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
        metrics_.gate_count = circuit.gates().size();
        metrics_.num_qubits = circuit.num_qubits();
        if (reg_.is_statevector_active()) {
            metrics_.memory_mb = static_cast<double>(reg_.amplitudes().size() * sizeof(QComplex)) / (1024.0 * 1024.0);
        } else {
            metrics_.memory_mb = 0.001; // Packed discrete mode
        }
    }

    double get_prob1(size_t qubit) const override {
        return reg_.prob1(qubit);
    }

    uint8_t measure(size_t qubit) override {
        return reg_.measure(qubit);
    }

    SimulationMetrics get_metrics() const override {
        return metrics_;
    }

    QubitRegister& reg() { return reg_; }
    const QubitRegister& reg() const { return reg_; }

private:
    QubitRegister reg_;
    SimulationMetrics metrics_;
};

} // namespace qvm
} // namespace tersun
