#pragma once

#include "compiler/ast.hpp"
#include "qvm/qvm.hpp"
#include <string>
#include <unordered_map>

namespace tersun {
namespace compiler {

using setun::Program;
using setun::Stmt;
using setun::Expr;

class QEmitter {
public:
    QEmitter();

    // Directly compile AST into QVM bytecode chunk
    qvm::QChunk compile(const Program& program);

    // Directly compile AST into QuantumCircuit
    qvm::QuantumCircuit compile_to_circuit(const Program& program);

    // Compile AST directly to a .qbc file
    bool compile_file(const Program& program, const std::string& out_path);

    // Export AST directly to OpenQASM 3.0 string
    std::string emit_qasm(const Program& program, const std::string& circuit_name = "tersun_native_qasm");

private:
    qvm::QuantumCircuit circuit_{16};
    std::unordered_map<std::string, size_t> var_to_qubit_;
    size_t next_qubit_id_{0};

    size_t get_or_allocate_qubit(const std::string& name);
    void emit_stmt(Stmt* stmt, qvm::QChunk& chunk);
    void emit_expr(Expr* expr, size_t dst_q, qvm::QChunk& chunk);
};

} // namespace compiler
} // namespace tersun
