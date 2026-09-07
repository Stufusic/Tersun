#include "compiler/q_emitter.hpp"
#include <iostream>

namespace tersun {
namespace compiler {

using namespace setun;

QEmitter::QEmitter()
    : circuit_(kMaxQubits) {}

size_t QEmitter::allocate_qubit() {
    if (next_qubit_id_ >= kMaxQubits) {
        throw CompilerException("[Q-ISA] quantum register exhausted: this program needs more than " + std::to_string(kMaxQubits) + " qubits.");
    }
    return next_qubit_id_++;
}

size_t QEmitter::get_or_allocate_qubit(const std::string& name) {
    auto it = var_to_qubit_.find(name);
    if (it != var_to_qubit_.end()) return it->second;
    size_t q = allocate_qubit();
    var_to_qubit_[name] = q;
    return q;
}

// Constant integer detection for unrolling: literals and -literals.
bool QEmitter::is_const_int(Expr* expr, int64_t& out_value) {
    if (!expr) return false;
    if (std::holds_alternative<setun::IntLiteralExpr>(expr->data)) {
        out_value = std::get<setun::IntLiteralExpr>(expr->data).value;
        return true;
    }
    if (std::holds_alternative<setun::UnaryExpr>(expr->data)) {
        auto& u = std::get<setun::UnaryExpr>(expr->data);
        if (u.op == setun::UnaryOp::NEG) {
            int64_t inner = 0;
            if (is_const_int(u.operand, inner)) {
                out_value = -inner;
                return true;
            }
        }
    }
    return false;
}

// Serialize gates appended to circuit_ since from_index into Q-ISA bytes,
// keeping the QuantumCircuit (QASM/execute view) and the .qbc stream in sync.
void QEmitter::emit_gates_to_chunk(size_t from_index, qvm::QChunk& chunk) {
    const std::vector<qvm::QuantumGate>& gates = circuit_.gates();
    for (size_t i = from_index; i < gates.size(); ++i) {
        const qvm::QuantumGate& g = gates[i];
        switch (g.type) {
            case qvm::GateType::H:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_H));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                break;
            case qvm::GateType::X:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                break;
            case qvm::GateType::Y:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_Y));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                break;
            case qvm::GateType::Z:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_Z));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                break;
            case qvm::GateType::S:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_S));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                break;
            case qvm::GateType::T:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_T));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                break;
            case qvm::GateType::RX:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_RX));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_f64(g.param);
                break;
            case qvm::GateType::RY:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_RY));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_f64(g.param);
                break;
            case qvm::GateType::RZ:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_RZ));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_f64(g.param);
                break;
            case qvm::GateType::CNOT:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[1]));
                break;
            case qvm::GateType::CZ:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CZ));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[1]));
                break;
            case qvm::GateType::SWAP:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_SWAP));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[1]));
                break;
            case qvm::GateType::TOFFOLI:
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_TOFFOLI));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[0]));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[1]));
                chunk.emit_byte(static_cast<uint8_t>(g.targets[2]));
                break;
            default:
                throw CompilerException("[Q-ISA] gate kind is not serializable to Q-ISA bytecode.");
        }
    }
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
            // Quantum algorithm builtins (M6): statement-style, like the
            // bitnet_* builtins on the classical targets. qft/grover expand
            // into primitive Q-ISA gates on qubits [0, n); qmeasure collapses
            // qubit q into classical register q so run-qvm can report it.
            if (e.callee == "qft" || e.callee == "grover" || e.callee == "qmeasure") {
                std::vector<int64_t> args;
                for (Expr* a : e.args) {
                    int64_t v = 0;
                    if (!is_const_int(a, v)) {
                        throw CompilerException("[Q-ISA] " + e.callee + "() arguments must be compile-time integer constants.");
                    }
                    args.push_back(v);
                }
                if (e.callee == "qft") {
                    if (args.size() != 1 || args[0] < 1 || args[0] > static_cast<int64_t>(kMaxQubits)) {
                        throw CompilerException("[Q-ISA] qft(n) requires one constant n with 1 <= n <= " + std::to_string(kMaxQubits) + ".");
                    }
                    size_t from = circuit_.gates().size();
                    circuit_.qft(static_cast<size_t>(args[0]));
                    emit_gates_to_chunk(from, chunk);
                } else if (e.callee == "grover") {
                    if (args.size() != 2 || args[0] < 1 || args[0] > 3) {
                        throw CompilerException("[Q-ISA] grover(n, target) requires constant n with 1 <= n <= 3.");
                    }
                    int64_t n = args[0];
                    if (args[1] < 0 || args[1] >= (int64_t(1) << n)) {
                        throw CompilerException("[Q-ISA] grover target must lie in [0, 2^n).");
                    }
                    size_t from = circuit_.gates().size();
                    circuit_.grover(static_cast<size_t>(n), static_cast<size_t>(args[1]));
                    emit_gates_to_chunk(from, chunk);
                } else { // qmeasure(q)
                    if (args.size() != 1 || args[0] < 0 || args[0] >= static_cast<int64_t>(kMaxQubits)) {
                        throw CompilerException("[Q-ISA] qmeasure(q) requires one constant q with 0 <= q < " + std::to_string(kMaxQubits) + ".");
                    }
                    uint8_t q = static_cast<uint8_t>(args[0]);
                    chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_MEASURE));
                    chunk.emit_byte(q); // classical register q
                    chunk.emit_byte(q); // qubit q
                }
                return;
            }
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
        else if constexpr (std::is_same_v<T, setun::AmbiguousTripleExpr>) {
            // Checker-less fallback: legacy TAFPU interpretation.
            size_t qb = allocate_qubit();
            size_t qc = allocate_qubit();
            emit_expr(e.elements[0], dst_q, chunk);
            emit_expr(e.elements[1], qb, chunk);
            if (e.elements.size() == 3) {
                emit_expr(e.elements[2], qc, chunk);
            }
            circuit_.h(dst_q);
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_H));
            chunk.emit_byte(static_cast<uint8_t>(dst_q));
            circuit_.cnot(qb, dst_q);
            chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
            chunk.emit_byte(static_cast<uint8_t>(qb));
            chunk.emit_byte(static_cast<uint8_t>(dst_q));
        }
        else if constexpr (std::is_same_v<T, setun::FStringExpr>) {
            throw CompilerException("[Q-ISA] f-strings are not supported on the quantum target.");
        }
        else if constexpr (std::is_same_v<T, setun::MethodCallExpr>) {
            throw CompilerException("[Q-ISA] method calls are not supported on the quantum target.");
        }
        else {
            throw CompilerException("[Q-ISA] unsupported expression kind on the quantum target.");
        }
    }, expr->data);
}

void QEmitter::emit_unroll_stmt(Stmt* stmt, qvm::QChunk& chunk) {
    if (!stmt) return;
    if (std::holds_alternative<setun::BreakContinueStmt>(stmt->data)) {
        if (unroll_stack_.empty()) {
            throw CompilerException("[Q-ISA] 'break'/'continue' outside of an unrolled loop.");
        }
        auto& bc = std::get<setun::BreakContinueStmt>(stmt->data);
        UnrollContext& ctx = unroll_stack_.back();
        if (!bc.label.empty() && bc.label != ctx.label) {
            throw CompilerException("[Q-ISA] break/continue may only reference the immediately enclosing unrolled loop.");
        }
        if (bc.is_break) {
            ctx.broke = true;
        } else {
            ctx.continued = true;
        }
        return;
    }
    emit_stmt(stmt, chunk);
}

void QEmitter::emit_unroll_body(Stmt* body, qvm::QChunk& chunk) {
    if (!body) return;
    if (std::holds_alternative<setun::BlockStmt>(body->data)) {
        auto& block = std::get<setun::BlockStmt>(body->data);
        for (Stmt* st : block.statements) {
            if (unroll_stack_.empty()) return;
            if (unroll_stack_.back().broke || unroll_stack_.back().continued) return;
            emit_unroll_stmt(st, chunk);
        }
        return;
    }
    if (unroll_stack_.empty()) return;
    if (unroll_stack_.back().broke || unroll_stack_.back().continued) return;
    emit_unroll_stmt(body, chunk);
}

void QEmitter::emit_for_unroll(const setun::ForStmt& stmt, qvm::QChunk& chunk) {
    struct IterItem {
        bool is_const{false};
        int64_t cval{0};
        Expr* e{nullptr};
    };
    std::vector<IterItem> items;

    if (stmt.is_for_in) {
        const setun::CallExpr* range_call = nullptr;
        if (stmt.iterable && std::holds_alternative<setun::CallExpr>(stmt.iterable->data)) {
            auto& ce = std::get<setun::CallExpr>(stmt.iterable->data);
            if (ce.callee == "range") range_call = &ce;
        }

        if (range_call) {
            int64_t start = 0, stop = 0, step = 1;
            bool ok = false;
            if (range_call->args.size() == 1
                && is_const_int(range_call->args[0], stop)) {
                ok = true;
            } else if (range_call->args.size() == 2
                       && is_const_int(range_call->args[0], start)
                       && is_const_int(range_call->args[1], stop)) {
                ok = true;
            } else if (range_call->args.size() == 3
                       && is_const_int(range_call->args[0], start)
                       && is_const_int(range_call->args[1], stop)
                       && is_const_int(range_call->args[2], step)) {
                ok = true;
            }
            if (!ok || step == 0) {
                throw CompilerException("[Q-ISA] range() bounds must be compile-time integer constants with a non-zero step.");
            }
            int64_t trips = step > 0 ? (stop > start ? (stop - start + step - 1) / step : 0)
                                     : (start > stop ? (start - stop - step - 1) / (0 - step) : 0);
            if (trips > kMaxUnrollTrips) {
                throw CompilerException("[Q-ISA] loop unrolling exceeds the 256-iteration limit on the quantum target.");
            }
            for (int64_t v = start; step > 0 ? v < stop : v > stop; v += step) {
                IterItem it;
                it.is_const = true;
                it.cval = v;
                items.push_back(it);
            }
        } else if (stmt.iterable && std::holds_alternative<setun::ArrayLiteralExpr>(stmt.iterable->data)) {
            for (Expr* el : std::get<setun::ArrayLiteralExpr>(stmt.iterable->data).elements) {
                IterItem it;
                it.e = el;
                items.push_back(it);
            }
        } else if (stmt.iterable && std::holds_alternative<setun::TafpuConstructExpr>(stmt.iterable->data)) {
            auto& tc = std::get<setun::TafpuConstructExpr>(stmt.iterable->data);
            for (Expr* el : {tc.a, tc.b, tc.s}) {
                IterItem it;
                it.e = el;
                items.push_back(it);
            }
        } else if (stmt.iterable && std::holds_alternative<setun::AmbiguousTripleExpr>(stmt.iterable->data)) {
            for (Expr* el : std::get<setun::AmbiguousTripleExpr>(stmt.iterable->data).elements) {
                IterItem it;
                it.e = el;
                items.push_back(it);
            }
        } else {
            throw CompilerException("[Q-ISA] for-in iterables must be constant range(...), array literals, or taf3 values on the quantum target.");
        }
    } else {
        throw CompilerException("[Q-ISA] C-style 'for' is not supported on the quantum target; use 'for x in range(...)' with constant bounds.");
    }

    unroll_stack_.push_back(UnrollContext{stmt.label, false, false});
    const size_t my_index = unroll_stack_.size() - 1;

    for (const IterItem& item : items) {
        if (unroll_stack_[my_index].broke) break;
        unroll_stack_[my_index].continued = false;
        size_t q = allocate_qubit();
        if (item.is_const) {
            if (item.cval > 0) {
                circuit_.x(q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(q));
            } else if (item.cval < 0) {
                circuit_.x(q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_X));
                chunk.emit_byte(static_cast<uint8_t>(q));
                circuit_.z(q);
                chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_Z));
                chunk.emit_byte(static_cast<uint8_t>(q));
            }
        } else {
            emit_expr(item.e, q, chunk);
        }
        var_to_qubit_[stmt.loop_var] = q;
        emit_unroll_body(stmt.body, chunk);
    }

    unroll_stack_.pop_back();
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
            std::cerr << "[Q-ISA] warning: 'while' is emitted as a single pass (quantum circuits are acyclic).\n";
            size_t cond_q = allocate_qubit();
            emit_expr(s.condition, cond_q, chunk);
            if (s.body) emit_stmt(s.body, chunk);
        }
        else if constexpr (std::is_same_v<T, ForStmt>) {
            emit_for_unroll(s, chunk);
        }
        else if constexpr (std::is_same_v<T, TryCatchStmt>
                           || std::is_same_v<T, ThrowStmt>) {
            throw CompilerException("[Q-ISA] exceptions (try/catch/throw) are not supported on the quantum target.");
        }
        else if constexpr (std::is_same_v<T, BreakContinueStmt>) {
            if (unroll_stack_.empty()) {
                throw CompilerException("[Q-ISA] 'break'/'continue' outside of an unrolled for loop.");
            }
            UnrollContext& ctx = unroll_stack_.back();
            if (!s.label.empty() && s.label != ctx.label) {
                throw CompilerException("[Q-ISA] break/continue may only reference the immediately enclosing unrolled loop.");
            }
            if (s.is_break) {
                ctx.broke = true;
            } else {
                ctx.continued = true;
            }
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
                if (!unroll_stack_.empty()
                    && (unroll_stack_.back().broke || unroll_stack_.back().continued)) {
                    break; // statements after break/continue are dead code
                }
                emit_stmt(st, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, FnDeclStmt>) {
            if (s.body) {
                emit_stmt(s.body, chunk);
            }
        }
        else if constexpr (std::is_same_v<T, StructDeclStmt>
                           || std::is_same_v<T, setun::ClassDeclStmt>
                           || std::is_same_v<T, setun::InterfaceDeclStmt>
                           || std::is_same_v<T, setun::EnumDeclStmt>
                           || std::is_same_v<T, setun::ImportStmt>
                           || std::is_same_v<T, setun::FnDeclStmt>) {
            // Declarations consume no runtime gates (function bodies are
            // emitted when their call sites are expanded).
        }
        else {
            throw CompilerException("[Q-ISA] unsupported statement kind on the quantum target.");
        }
    }, stmt->data);
}

qvm::QChunk QEmitter::compile(const Program& program) {
    qvm::QChunk chunk;
    chunk.num_qubits = kMaxQubits;
    chunk.code.clear();
    next_qubit_id_ = 0;
    var_to_qubit_.clear();
    circuit_ = qvm::QuantumCircuit(kMaxQubits);

    chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_INIT));
    chunk.emit_byte(static_cast<uint8_t>(kMaxQubits));

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
