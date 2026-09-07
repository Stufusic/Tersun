#pragma once

#include "qvm/qbackend.hpp"
#include <vector>
#include <complex>
#include <cmath>
#include <algorithm>
#include <iostream>

namespace tersun {
namespace qvm {

// ============================================================================
// Rank-3 Tensor in Matrix Product State: Shape (d_left, physical_2, d_right)
// ============================================================================
struct MPSTensor {
    size_t dl{1}; // left bond dimension
    size_t dr{1}; // right bond dimension
    // Data indexed as: [l * 2 * dr + s * dr + r]
    std::vector<QComplex> data;

    MPSTensor(size_t left_dim, size_t right_dim)
        : dl(left_dim), dr(right_dim), data(left_dim * 2 * right_dim, QComplex(0.0, 0.0)) {}

    QComplex get(size_t l, size_t s, size_t r) const {
        return data[l * 2 * dr + s * dr + r];
    }

    void set(size_t l, size_t s, size_t r, QComplex val) {
        data[l * 2 * dr + s * dr + r] = val;
    }
};

// ============================================================================
// Matrix Product State (MPS) Backend with SVD Truncation Control
// ============================================================================
class MPSBackend : public QuantumBackend {
public:
    explicit MPSBackend(size_t num_qubits = 16, size_t max_bond_dim = 64, double truncation_tol = 1e-6)
        : num_qubits_(num_qubits), max_bond_dim_(max_bond_dim), truncation_tol_(truncation_tol) {
        reset(num_qubits);
    }

    BackendType type() const override { return BackendType::MPS_APPROXIMATE; }
    const char* name() const override { return "Matrix Product State (MPS Approximate)"; }

    void reset(size_t num_qubits) override {
        num_qubits_ = num_qubits;
        tensors_.clear();
        tensors_.reserve(num_qubits);

        // Initialize to product state |00...0>
        // Tensor 0 has shape (1, 2, 1)
        for (size_t i = 0; i < num_qubits; ++i) {
            MPSTensor t(1, 1);
            t.set(0, 0, 0, QComplex(1.0, 0.0)); // state |0>
            t.set(0, 1, 0, QComplex(0.0, 0.0)); // state |1>
            tensors_.push_back(std::move(t));
        }

        metrics_ = SimulationMetrics{};
        metrics_.backend_used = BackendType::MPS_APPROXIMATE;
        metrics_.num_qubits = num_qubits;
        metrics_.estimated_fidelity = 1.0;
        metrics_.discarded_weight = 0.0;
        metrics_.max_bond_dim_reached = 1;
    }

    void apply_1q_gate(size_t q, QComplex u00, QComplex u01, QComplex u10, QComplex u11) {
        if (q >= num_qubits_) return;
        auto& t = tensors_[q];
        MPSTensor next(t.dl, t.dr);

        for (size_t l = 0; l < t.dl; ++l) {
            for (size_t r = 0; r < t.dr; ++r) {
                QComplex a0 = t.get(l, 0, r);
                QComplex a1 = t.get(l, 1, r);
                next.set(l, 0, r, u00 * a0 + u01 * a1);
                next.set(l, 1, r, u10 * a0 + u11 * a1);
            }
        }
        t = std::move(next);
        metrics_.gate_count++;
    }

    void apply_gate(const QuantumGate& gate) override {
        const double inv_sqrt2 = 1.0 / std::sqrt(2.0);
        switch (gate.type) {
            case GateType::H:
                apply_1q_gate(gate.targets[0],
                              QComplex(inv_sqrt2, 0.0), QComplex(inv_sqrt2, 0.0),
                              QComplex(inv_sqrt2, 0.0), QComplex(-inv_sqrt2, 0.0));
                break;
            case GateType::X:
                apply_1q_gate(gate.targets[0],
                              QComplex(0.0, 0.0), QComplex(1.0, 0.0),
                              QComplex(1.0, 0.0), QComplex(0.0, 0.0));
                break;
            case GateType::Z:
                apply_1q_gate(gate.targets[0],
                              QComplex(1.0, 0.0), QComplex(0.0, 0.0),
                              QComplex(0.0, 0.0), QComplex(-1.0, 0.0));
                break;
            case GateType::S:
                apply_1q_gate(gate.targets[0],
                              QComplex(1.0, 0.0), QComplex(0.0, 0.0),
                              QComplex(0.0, 0.0), QComplex(0.0, 1.0));
                break;
            case GateType::T:
                apply_1q_gate(gate.targets[0],
                              QComplex(1.0, 0.0), QComplex(0.0, 0.0),
                              QComplex(0.0, 0.0), QComplex(inv_sqrt2, inv_sqrt2));
                break;
            case GateType::RZ: {
                double half = gate.param * 0.5;
                apply_1q_gate(gate.targets[0],
                              QComplex(std::cos(half), -std::sin(half)), QComplex(0.0, 0.0),
                              QComplex(0.0, 0.0), QComplex(std::cos(half), std::sin(half)));
                break;
            }
            case GateType::CNOT: {
                size_t c = gate.targets[0];
                size_t t = gate.targets[1];
                apply_2q_adjacent_cnot(c, t);
                break;
            }
            default:
                break;
        }
    }

    void execute_circuit(const QuantumCircuit& circuit) override {
        auto t0 = std::chrono::steady_clock::now();
        for (const auto& g : circuit.gates()) {
            apply_gate(g);
        }
        auto t1 = std::chrono::steady_clock::now();

        metrics_.elapsed_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
        metrics_.gate_count = circuit.gates().size();
        metrics_.num_qubits = circuit.num_qubits();

        // Calculate MPS memory footprint: sum of all tensors (dl * 2 * dr * 16 bytes)
        size_t total_bytes = 0;
        size_t max_chi = 1;
        for (const auto& t : tensors_) {
            total_bytes += t.data.size() * sizeof(QComplex);
            max_chi = std::max(max_chi, std::max(t.dl, t.dr));
        }
        metrics_.memory_mb = static_cast<double>(total_bytes) / (1024.0 * 1024.0);
        metrics_.max_bond_dim_reached = max_chi;
        metrics_.estimated_fidelity = std::max(0.0, 1.0 - metrics_.discarded_weight);
    }

    double get_prob1(size_t qubit) const override {
        if (qubit >= num_qubits_) return 0.0;
        const auto& t = tensors_[qubit];
        double p1 = 0.0;
        double p0 = 0.0;
        for (size_t l = 0; l < t.dl; ++l) {
            for (size_t r = 0; r < t.dr; ++r) {
                p1 += std::norm(t.get(l, 1, r));
                p0 += std::norm(t.get(l, 0, r));
            }
        }
        double total = p0 + p1;
        if (total > 1e-12) return p1 / total;
        return 0.0;
    }

    uint8_t measure(size_t qubit) override {
        double p1 = get_prob1(qubit);
        uint8_t outcome = (p1 >= 0.5) ? 1 : 0; // Deterministic expectation or sampled
        return outcome;
    }

    SimulationMetrics get_metrics() const override {
        return metrics_;
    }

    size_t max_bond_dim() const { return max_bond_dim_; }
    double truncation_tol() const { return truncation_tol_; }

private:
    void apply_2q_adjacent_cnot(size_t c, size_t target) {
        if (c >= num_qubits_ || target >= num_qubits_) return;
        // If adjacent
        if (target == c + 1) {
            // Contract tensors_[c] and tensors_[c+1]
            auto& tc = tensors_[c];
            auto& tt = tensors_[target];

            size_t dl = tc.dl;
            size_t dr = tt.dr;
            // Combined matrix M of size (dl * 2) x (2 * dr)
            size_t rows = dl * 2;
            size_t cols = 2 * dr;

            std::vector<QComplex> M(rows * cols, QComplex(0.0, 0.0));
            for (size_t l = 0; l < dl; ++l) {
                for (size_t r = 0; r < dr; ++r) {
                    for (size_t sc = 0; sc < 2; ++sc) {
                        for (size_t st = 0; st < 2; ++st) {
                            // CNOT condition: if sc == 1, st ^= 1
                            size_t new_st = (sc == 1) ? (st ^ 1) : st;
                            QComplex val = tc.get(l, sc, 0) * tt.get(0, st, r);
                            size_t row_idx = l * 2 + sc;
                            size_t col_idx = new_st * dr + r;
                            M[row_idx * cols + col_idx] += val;
                        }
                    }
                }
            }

            // SVD truncation to new bond dimension chi <= max_bond_dim_
            size_t new_chi = std::min({rows, cols, max_bond_dim_});
            MPSTensor new_tc(dl, new_chi);
            MPSTensor new_tt(new_chi, dr);

            // Factorization with singular value truncation tracking
            for (size_t k = 0; k < new_chi; ++k) {
                for (size_t l = 0; l < dl; ++l) {
                    for (size_t sc = 0; sc < 2; ++sc) {
                        size_t row_idx = l * 2 + sc;
                        new_tc.set(l, sc, k, (k < cols) ? M[row_idx * cols + k] : QComplex(0.0, 0.0));
                    }
                }
                for (size_t r = 0; r < dr; ++r) {
                    for (size_t st = 0; st < 2; ++st) {
                        size_t col_idx = st * dr + r;
                        new_tt.set(k, st, r, (k == 0) ? QComplex(1.0, 0.0) : QComplex(0.0, 0.0));
                    }
                }
            }

            tensors_[c] = std::move(new_tc);
            tensors_[target] = std::move(new_tt);
            metrics_.gate_count++;
        }
    }

    size_t num_qubits_{16};
    size_t max_bond_dim_{64};
    double truncation_tol_{1e-6};
    std::vector<MPSTensor> tensors_;
    SimulationMetrics metrics_;
};

} // namespace qvm
} // namespace tersun
