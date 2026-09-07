#pragma once

#include "qvm/qbackend.hpp"
#include "qvm/qbackend_statevector.hpp"
#include "qvm/qbackend_mps.hpp"

namespace tersun {
namespace qvm {

class AutoBackend : public QuantumBackend {
public:
    explicit AutoBackend(size_t num_qubits = 16, size_t exact_threshold = 26)
        : exact_threshold_(exact_threshold) {
        reset(num_qubits);
    }

    BackendType type() const override { return BackendType::AUTO_ADAPTIVE; }
    const char* name() const override {
        if (active_backend_) return active_backend_->name();
        return "AutoBackend (Adaptive)";
    }

    void reset(size_t num_qubits) override {
        num_qubits_ = num_qubits;
        if (num_qubits <= exact_threshold_) {
            active_backend_ = std::make_unique<StatevectorBackend>(num_qubits);
        } else {
            active_backend_ = std::make_unique<MPSBackend>(num_qubits);
        }
        active_backend_->reset(num_qubits);
    }

    void apply_gate(const QuantumGate& gate) override {
        if (active_backend_) active_backend_->apply_gate(gate);
    }

    void execute_circuit(const QuantumCircuit& circuit) override {
        if (circuit.num_qubits() != num_qubits_) {
            reset(circuit.num_qubits());
        }
        if (active_backend_) active_backend_->execute_circuit(circuit);
    }

    double get_prob1(size_t qubit) const override {
        if (active_backend_) return active_backend_->get_prob1(qubit);
        return 0.0;
    }

    uint8_t measure(size_t qubit) override {
        if (active_backend_) return active_backend_->measure(qubit);
        return 0;
    }

    SimulationMetrics get_metrics() const override {
        if (active_backend_) return active_backend_->get_metrics();
        return SimulationMetrics{};
    }

private:
    size_t num_qubits_{16};
    size_t exact_threshold_{26};
    std::unique_ptr<QuantumBackend> active_backend_;
};

} // namespace qvm
} // namespace tersun
