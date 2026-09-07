#pragma once

#include "compiler/ast.hpp"
#include "qvm/qvm.hpp"
#include <string>
#include <unordered_map>
#include <vector>

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
    static constexpr size_t kMaxQubits = 24;
    static constexpr int kMaxUnrollTrips = 256;

    qvm::QuantumCircuit circuit_{kMaxQubits};
    std::unordered_map<std::string, size_t> var_to_qubit_;
    size_t next_qubit_id_{0};

    // Constant-trip unroll state for the Q-ISA target (circuits are acyclic,
    // so loops can only be unrolled at compile time).
    struct UnrollContext {
        std::string label;
        bool broke{false};
        bool continued{false};
    };
    std::vector<UnrollContext> unroll_stack_;

    size_t get_or_allocate_qubit(const std::string& name);
    size_t allocate_qubit();
    // Serialize circuit_ gates appended since from_index into Q-ISA bytecode
    // (used by the quantum algorithm builtins qft/grover).
    void emit_gates_to_chunk(size_t from_index, qvm::QChunk& chunk);
    void emit_stmt(Stmt* stmt, qvm::QChunk& chunk);
    void emit_unroll_stmt(Stmt* stmt, qvm::QChunk& chunk);
    void emit_unroll_body(Stmt* body, qvm::QChunk& chunk);
    void emit_for_unroll(const setun::ForStmt& stmt, qvm::QChunk& chunk);
    void emit_expr(Expr* expr, size_t dst_q, qvm::QChunk& chunk);

    static bool is_const_int(Expr* expr, int64_t& out_value);
};

} // namespace compiler
} // namespace tersun
