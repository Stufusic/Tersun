#pragma once

#include "qvm/qreg.hpp"
#include "qvm/qgate.hpp"
#include <vector>
#include <string>
#include <memory>
#include <iostream>

namespace tersun {
namespace qvm {

enum class BackendType {
    STATEVECTOR_EXACT = 0,
    MPS_APPROXIMATE   = 1,
    AUTO_ADAPTIVE     = 2
};

struct SimulationMetrics {
    BackendType backend_used{BackendType::STATEVECTOR_EXACT};
    size_t num_qubits{0};
    size_t gate_count{0};
    double elapsed_ms{0.0};
    double memory_mb{0.0};
    double estimated_fidelity{1.0}; // 1.0 = exact
    double discarded_weight{0.0};   // For MPS truncation tracking
    size_t max_bond_dim_reached{1};
};

class QuantumBackend {
public:
    virtual ~QuantumBackend() = default;

    virtual BackendType type() const = 0;
    virtual const char* name() const = 0;

    virtual void reset(size_t num_qubits) = 0;
    virtual void apply_gate(const QuantumGate& gate) = 0;
    virtual void execute_circuit(const QuantumCircuit& circuit) = 0;

    virtual double get_prob1(size_t qubit) const = 0;
    virtual uint8_t measure(size_t qubit) = 0;

    virtual SimulationMetrics get_metrics() const = 0;
};

} // namespace qvm
} // namespace tersun
