#include "compiler/q_emitter.hpp"
#include <iostream>

namespace tersun {
namespace compiler {

using namespace setun;

QEmitter::QEmitter()
    : circuit_(16) {}

size_t QEmitter::get_or_allocate_qubit(const std::string& name) {
    auto it = var_to_qubit_.find(name);
    if (it != var_to_qubit_.end()) return it->second;
    size_t q = next_qubit_id_++;
    var_to_qubit_[name] = q;
    return q;
}

void QEmitter::emit_expr(Expr* expr, size_t dst_q, qvm::QChunk& chunk) {
    if (!expr) return;

    std::visit([&](const auto& e) {
        using T = std::decay_t<decltype(e)>;

        if constexpr (std::is_same_v<T, IntLiteralExpr>) {
            int64_t val = e.value;
            if (val > 0) {
                circuit_.x(dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            } else if (val < 0) {
                circuit_.x(dst_q);
                circuit_.z(dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_Z));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            }
        }
        else if constexpr (std::is_same_v<T, BoolLiteralExpr>) {
            if (e.value) {
                circuit_.x(dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            }
        }
        else if constexpr (std::is_same_v<T, IdentifierExpr>) {
            size_t src_q = get_or_allocate_qubit(e.name);
            // Copy state using CNOT: src_q (ctrl) -> dst_q (target)
            circuit_.cnot(src_q, dst_q);
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
            chunk.emit_byte(static_cast<uint8_t>(src_q));
            chunk.emit_byte(static_cast<uint8_t>(dst_q));
        }
        else if constexpr (std::is_same_v<T, BinaryExpr>) {
            size_t q_left = next_qubit_id_++;
            size_t q_right = next_qubit_id_++;
            emit_expr(e.left, q_left, chunk);
            emit_expr(e.right, q_right, chunk);

            if (e.op == BinaryOp::ADD) {
                // Quantum CNOT represents reversible addition/XOR
                circuit_.cnot(q_left, dst_q);
                circuit_.cnot(q_right, dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(q_left));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(q_right));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            } else if (e.op == BinaryOp::SUB) {
                // Subtraction / Phase Invert
                circuit_.cnot(q_left, dst_q);
                circuit_.ternary_invert(q_right);
                circuit_.cnot(q_right, dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(q_left));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_TRIT_INV));
                chunk.emit_byte(static_cast<uint8_t>(q_right));
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(q_right));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            } else {
                circuit_.cnot(q_left, dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(q_left));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            }
        }
        else if constexpr (std::is_same_v<T, UnaryExpr>) {
            emit_expr(e.operand, dst_q, chunk);
            if (e.op == UnaryOp::NEG || e.op == UnaryOp::TILDE) {
                circuit_.ternary_invert(dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_TRIT_INV));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            } else if (e.op == UnaryOp::NOT) {
                circuit_.x(dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            }
        }
        else if constexpr (std::is_same_v<T, MemberAccessExpr>) {
            size_t src_q = get_or_allocate_qubit("field_" + e.member);
            circuit_.cnot(src_q, dst_q);
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
            chunk.emit_byte(static_cast<uint8_t>(src_q));
            chunk.emit_byte(static_cast<uint8_t>(dst_q));
        }
        else if constexpr (std::is_same_v<T, CallExpr>) {
            for (Expr* a : e.args) {
                size_t arg_q = next_qubit_id_++;
                emit_expr(a, arg_q, chunk);
                circuit_.cnot(arg_q, dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(arg_q));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            }
        }
        else if constexpr (std::is_same_v<T, TafpuConstructExpr>) {
            size_t qa = next_qubit_id_++;
            size_t qb = next_qubit_id_++;
            emit_expr(e.a, qa, chunk);
            emit_expr(e.b, qb, chunk);
            circuit_.h(dst_q);
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_H));
            chunk.emit_byte(static_cast<uint8_t>(dst_q));
            circuit_.cnot(qa, dst_q);
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
            chunk.emit_byte(static_cast<uint8_t>(qa));
            chunk.emit_byte(static_cast<uint8_t>(dst_q));
        }
        else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) {
            for (Expr* elem : e.elements) {
                size_t el_q = next_qubit_id_++;
                emit_expr(elem, el_q, chunk);
                circuit_.cnot(el_q, dst_q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(el_q));
                chunk.emit_byte(static_cast<uint8_t>(dst_q));
            }
        }
    }, expr->data);
}

void QEmitter::emit_stmt(Stmt* stmt, qvm::QChunk& chunk) {
    if (!stmt) return;

    std::visit([&](const auto& s) {
        using T = std::decay_t<decltype(s)>;

        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            size_t q = get_or_allocate_qubit(s.name);
            if (s.init) {
                emit_expr(s.init, q, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, AssignStmt>) {
            size_t q = get_or_allocate_qubit(s.name);
            if (s.value) {
                emit_expr(s.value, q, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, ExprStmt>) {
            if (s.expr) {
                size_t temp_q = next_qubit_id_++;
                emit_expr(s.expr, temp_q, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, IfStmt>) {
            size_t cond_q = next_qubit_id_++;
            emit_expr(s.condition, cond_q, chunk);
            if (s.then_branch) emit_stmt(s.then_branch, chunk);
            if (s.else_branch) emit_stmt(s.else_branch, chunk);
        }
        else if constexpr (std::is_same_v<T, WhileStmt>) {
            size_t cond_q = next_qubit_id_++;
            emit_expr(s.condition, cond_q, chunk);
            if (s.body) emit_stmt(s.body, chunk);
        }
        else if constexpr (std::is_same_v<T, ReturnStmt>) {
            if (s.value) {
                emit_expr(s.value, 0, chunk);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_UNPACK2));
                chunk.emit_byte(0); // target reg 0
                chunk.emit_byte(0); // qubit 0
            }
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_HALT));
        }
        else if constexpr (std::is_same_v<T, Branch3Stmt>) {
            size_t cond_q = next_qubit_id_++;
            emit_expr(s.condition, cond_q, chunk);

            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_MEASURE_TRIT));
            chunk.emit_byte(0); // store into reg 0
            chunk.emit_byte(static_cast<uint8_t>(cond_q));
        }
        else if constexpr (std::is_same_v<T, BlockStmt>) {
            for (Stmt* st : s.statements) {
                emit_stmt(st, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, FnDeclStmt>) {
            if (s.body) {
                emit_stmt(s.body, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, StructDeclStmt>) {
            // Declarations consume no runtime gates
        }
    }, stmt->data);
}

qvm::QChunk QEmitter::compile(const Program& program) {
    qvm::QChunk chunk;
    chunk.num_qubits = 16;
    chunk.code.clear();
    next_qubit_id_ = 0;
    var_to_qubit_.clear();
    circuit_ = qvm::QuantumCircuit(16);

    chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_INIT));
    chunk.emit_byte(16);

    for (Stmt* stmt : program.statements) {
        emit_stmt(stmt, chunk);
    }

    if (chunk.code.empty() || chunk.code.back() != static_cast<uint8_t>(qvm::QOpCode::OP_HALT)) {
        chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_HALT));
    }

    return chunk;
}

qvm::QuantumCircuit QEmitter::compile_to_circuit(const Program& program) {
    compile(program);
    return circuit_;
}

bool QEmitter::compile_file(const Program& program, const std::string& out_path) {
    qvm::QChunk chunk = compile(program);
    return chunk.save_to_file(out_path);
}

std::string QEmitter::emit_qasm(const Program& program, const std::string& circuit_name) {
    compile(program);
    return circuit_.to_openqasm(circuit_name);
}

} // namespace compiler
} // namespace tersun
