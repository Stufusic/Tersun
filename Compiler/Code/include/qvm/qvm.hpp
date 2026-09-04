#pragma once

#include "qvm/qreg.hpp"
#include "qvm/qgate.hpp"
#include "qvm/qopcode.hpp"
#include <vector>
#include <memory>
#include <iostream>

namespace tersun {
namespace qvm {

class QVM {
public:
    explicit QVM(size_t num_qubits = 16);

    // Reset machine state
    void reset();

    // Execute a compiled QChunk
    int64_t run(const QChunk& chunk);

    // Execute a QuantumCircuit directly
    void run_circuit(const QuantumCircuit& circuit);

    // Access Qubit Register
    QubitRegister& qreg() { return qreg_; }
    const QubitRegister& qreg() const { return qreg_; }

    // Access Classical Registers
    int64_t get_reg(size_t idx) const {
        if (idx < classical_regs_.size()) return classical_regs_[idx];
        return 0;
    }
    void set_reg(size_t idx, int64_t val) {
        if (idx >= classical_regs_.size()) classical_regs_.resize(idx + 1, 0);
        classical_regs_[idx] = val;
    }

    // Dump internal state for debugging
    void dump(std::ostream& os = std::cout) const;

private:
    QubitRegister qreg_;
    std::vector<int64_t> classical_regs_;
    size_t pc_{0};
    bool halted_{false};
};

} // namespace qvm
} // namespace tersun
