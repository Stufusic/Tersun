#pragma once

#include "qvm/qvm.hpp"
#include <string>
#include <vector>
#include <unordered_map>

namespace tersun {
namespace compiler {

class LLVM2QVMTranslator {
public:
    LLVM2QVMTranslator();

    // Translate LLVM IR text into QVM Bytecode (.qbc)
    bool translate_ir(const std::string& llvm_ir, qvm::QChunk& out_chunk);

    // Translate an LLVM IR file directly to QVM Bytecode file
    bool translate_file(const std::string& ll_path, const std::string& qbc_path);

    // Export translated circuit to OpenQASM 3.0
    std::string to_openqasm() const;

private:
    qvm::QuantumCircuit circuit_{16};
    std::unordered_map<std::string, size_t> var_to_qubit_;
    size_t next_qubit_id_{0};

    size_t allocate_qubit_for(const std::string& var_name);
};

} // namespace compiler
} // namespace tersun
