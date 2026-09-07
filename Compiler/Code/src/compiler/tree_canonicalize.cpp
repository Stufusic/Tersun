#include "compiler/tree_canonicalize.hpp"
#include <algorithm>

namespace setun {

bool TreeCanonicalizer::has_side_effects(const Expr* expr) {
    if (!expr) return false;

    return std::visit([&](const auto& node) -> bool {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, IntLiteralExpr> ||
                      std::is_same_v<T, TryteLiteralExpr> ||
                      std::is_same_v<T, TafpuLiteralExpr> ||
                      std::is_same_v<T, FloatLiteralExpr> ||
                      std::is_same_v<T, StringLiteralExpr> ||
                      std::is_same_v<T, BoolLiteralExpr> ||
                      std::is_same_v<T, IdentifierExpr> ||
                      std::is_same_v<T, LambdaExpr> ||
                      std::is_same_v<T, ComptimeExpr>) {
            return false;
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            return has_side_effects(node.operand);
        } else if constexpr (std::is_same_v<T, BinaryExpr>) {
            return has_side_effects(node.left) || has_side_effects(node.right);
        } else if constexpr (std::is_same_v<T, CallExpr> ||
                             std::is_same_v<T, MethodCallExpr>) {
            // Function or method calls can have arbitrary side effects
            return true;
        } else if constexpr (std::is_same_v<T, MemberAccessExpr>) {
            return has_side_effects(node.object);
        } else if constexpr (std::is_same_v<T, IndexExpr>) {
            return has_side_effects(node.object) || has_side_effects(node.index);
        } else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) {
            for (const auto* elem : node.elements) {
                if (has_side_effects(elem)) return true;
            }
            return false;
        } else if constexpr (std::is_same_v<T, AmbiguousTripleExpr>) {
            for (const auto* elem : node.elements) {
                if (has_side_effects(elem)) return true;
            }
            return false;
        } else if constexpr (std::is_same_v<T, FStringExpr>) {
            for (const auto* ex : node.expressions) {
                if (has_side_effects(ex)) return true;
            }
            return false;
        } else if constexpr (std::is_same_v<T, TafpuConstructExpr>) {
            return has_side_effects(node.a) || has_side_effects(node.b) || has_side_effects(node.s);
        }
        return true;
    }, expr->data);
}

bool TreeCanonicalizer::may_trap(const Expr* expr) {
    if (!expr) return false;

    return std::visit([&](const auto& node) -> bool {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, IntLiteralExpr> ||
                      std::is_same_v<T, TryteLiteralExpr> ||
                      std::is_same_v<T, TafpuLiteralExpr> ||
                      std::is_same_v<T, FloatLiteralExpr> ||
                      std::is_same_v<T, StringLiteralExpr> ||
                      std::is_same_v<T, BoolLiteralExpr> ||
                      std::is_same_v<T, IdentifierExpr> ||
                      std::is_same_v<T, LambdaExpr> ||
                      std::is_same_v<T, ComptimeExpr>) {
            return false;
        } else if constexpr (std::is_same_v<T, BinaryExpr>) {
            if (node.op == BinaryOp::DIV || node.op == BinaryOp::MOD) {
                if (node.right) {
                    if (auto* r_int = std::get_if<IntLiteralExpr>(&node.right->data)) {
                        if (r_int->value != 0) {
                            return may_trap(node.left);
                        }
                    }
                }
                return true; // Possible divide by zero
            }
            return may_trap(node.left) || may_trap(node.right);
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            return may_trap(node.operand);
        } else if constexpr (std::is_same_v<T, IndexExpr>) {
            return true; // Out-of-bounds indexing can trap
        } else if constexpr (std::is_same_v<T, CallExpr> ||
                             std::is_same_v<T, MethodCallExpr>) {
            return true;
        }
        return false;
    }, expr->data);
}

TreeNodeMetadata TreeCanonicalizer::analyze_metadata(const Expr* expr) {
    TreeNodeMetadata meta;
    if (!expr) return meta;
    meta.loc = expr->loc;
    meta.has_side_effect = has_side_effects(expr);
    meta.may_trap = may_trap(expr);
    return meta;
}

int TreeCanonicalizer::compare_structural(const Expr* a, const Expr* b) {
    if (!a && !b) return 0;
    if (!a) return -1;
    if (!b) return 1;

    size_t idx_a = a->data.index();
    size_t idx_b = b->data.index();
    if (idx_a != idx_b) {
        // Order literals after identifiers and expressions so constants sort to right
        return static_cast<int>(idx_a) - static_cast<int>(idx_b);
    }

    // Same variant type: compare contents
    return std::visit([&](const auto& node_a) -> int {
        using T = std::decay_t<decltype(node_a)>;
        const auto& node_b = std::get<T>(b->data);

        if constexpr (std::is_same_v<T, IntLiteralExpr>) {
            if (node_a.value < node_b.value) return -1;
            if (node_a.value > node_b.value) return 1;
            return 0;
        } else if constexpr (std::is_same_v<T, FloatLiteralExpr>) {
            if (node_a.value < node_b.value) return -1;
            if (node_a.value > node_b.value) return 1;
            return 0;
        } else if constexpr (std::is_same_v<T, IdentifierExpr>) {
            return node_a.name.compare(node_b.name);
        } else if constexpr (std::is_same_v<T, StringLiteralExpr>) {
            return node_a.value.compare(node_b.value);
        } else if constexpr (std::is_same_v<T, BoolLiteralExpr>) {
            return static_cast<int>(node_a.value) - static_cast<int>(node_b.value);
        } else if constexpr (std::is_same_v<T, BinaryExpr>) {
            if (node_a.op != node_b.op) {
                return static_cast<int>(node_a.op) - static_cast<int>(node_b.op);
            }
            int c_left = compare_structural(node_a.left, node_b.left);
            if (c_left != 0) return c_left;
            return compare_structural(node_a.right, node_b.right);
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            if (node_a.op != node_b.op) {
                return static_cast<int>(node_a.op) - static_cast<int>(node_b.op);
            }
            return compare_structural(node_a.operand, node_b.operand);
        }
        return 0;
    }, a->data);
}

static bool is_commutative_op(BinaryOp op) {
    switch (op) {
        case BinaryOp::ADD:
        case BinaryOp::MUL:
        case BinaryOp::BIT_AND:
        case BinaryOp::BIT_OR:
        case BinaryOp::BIT_XOR:
        case BinaryOp::EQ:
        case BinaryOp::NEQ:
        case BinaryOp::MIN:
        case BinaryOp::MAX:
            return true;
        default:
            return false;
    }
}

Expr* TreeCanonicalizer::canonicalize_binary(BinaryExpr& bin, SourceLocation loc, ArenaAllocator& arena) {
    bin.left = canonicalize_expr(bin.left, arena);
    bin.right = canonicalize_expr(bin.right, arena);

    // 1. Commutative normalization: only safe if NEITHER operand has side effects
    if (is_commutative_op(bin.op)) {
        if (!has_side_effects(bin.left) && !has_side_effects(bin.right)) {
            // Push literals to the right side
            bool left_is_lit = std::holds_alternative<IntLiteralExpr>(bin.left->data) ||
                               std::holds_alternative<FloatLiteralExpr>(bin.left->data);
            bool right_is_lit = std::holds_alternative<IntLiteralExpr>(bin.right->data) ||
                                std::holds_alternative<FloatLiteralExpr>(bin.right->data);

            if (left_is_lit && !right_is_lit) {
                std::swap(bin.left, bin.right);
            } else if (!left_is_lit && !right_is_lit) {
                if (compare_structural(bin.left, bin.right) > 0) {
                    std::swap(bin.left, bin.right);
                }
            }
        }
    }

    // 2. Identity canonicalization
    if (bin.op == BinaryOp::ADD) {
        if (auto* r_int = std::get_if<IntLiteralExpr>(&bin.right->data)) {
            if (r_int->value == 0 && !has_side_effects(bin.left)) {
                return bin.left;
            }
        }
        // Associative flattening: (x + C1) + C2 -> x + (C1 + C2)
        if (auto* r_int = std::get_if<IntLiteralExpr>(&bin.right->data)) {
            if (auto* l_bin = std::get_if<BinaryExpr>(&bin.left->data)) {
                if (l_bin->op == BinaryOp::ADD && l_bin->right) {
                    if (auto* l_r_int = std::get_if<IntLiteralExpr>(&l_bin->right->data)) {
                        int64_t combined = l_r_int->value + r_int->value;
                        Expr* new_const = arena.make<Expr>(IntLiteralExpr{combined, loc}, loc);
                        bin.left = l_bin->left;
                        bin.right = new_const;
                    }
                }
            }
        }
    } else if (bin.op == BinaryOp::SUB) {
        if (auto* r_int = std::get_if<IntLiteralExpr>(&bin.right->data)) {
            if (r_int->value == 0 && !has_side_effects(bin.left)) {
                return bin.left;
            }
        }
    } else if (bin.op == BinaryOp::MUL) {
        if (auto* r_int = std::get_if<IntLiteralExpr>(&bin.right->data)) {
            if (r_int->value == 1 && !has_side_effects(bin.left)) {
                return bin.left;
            }
            if (r_int->value == 0 && !has_side_effects(bin.left) && !may_trap(bin.left)) {
                return bin.right;
            }
        }
    }

    return arena.make<Expr>(bin, loc);
}

Expr* TreeCanonicalizer::canonicalize_unary(UnaryExpr& un, SourceLocation loc, ArenaAllocator& arena) {
    un.operand = canonicalize_expr(un.operand, arena);

    // Double negation: -(-x) -> x (if pure)
    if (un.op == UnaryOp::NEG) {
        if (auto* inner = std::get_if<UnaryExpr>(&un.operand->data)) {
            if (inner->op == UnaryOp::NEG && !has_side_effects(inner->operand)) {
                return inner->operand;
            }
        }
    } else if (un.op == UnaryOp::NOT) {
        if (auto* inner = std::get_if<UnaryExpr>(&un.operand->data)) {
            if (inner->op == UnaryOp::NOT && !has_side_effects(inner->operand)) {
                return inner->operand;
            }
        }
    }

    return arena.make<Expr>(un, loc);
}

Expr* TreeCanonicalizer::canonicalize_expr(Expr* expr, ArenaAllocator& arena) {
    if (!expr) return nullptr;

    return std::visit([&](auto& node) -> Expr* {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, BinaryExpr>) {
            return canonicalize_binary(node, expr->loc, arena);
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            return canonicalize_unary(node, expr->loc, arena);
        } else if constexpr (std::is_same_v<T, CallExpr>) {
            for (auto*& arg : node.args) {
                arg = canonicalize_expr(arg, arena);
            }
            return expr;
        } else if constexpr (std::is_same_v<T, MethodCallExpr>) {
            node.object = canonicalize_expr(node.object, arena);
            for (auto*& arg : node.args) {
                arg = canonicalize_expr(arg, arena);
            }
            return expr;
        } else if constexpr (std::is_same_v<T, MemberAccessExpr>) {
            node.object = canonicalize_expr(node.object, arena);
            return expr;
        } else if constexpr (std::is_same_v<T, IndexExpr>) {
            node.object = canonicalize_expr(node.object, arena);
            node.index = canonicalize_expr(node.index, arena);
            return expr;
        } else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) {
            for (auto*& el : node.elements) {
                el = canonicalize_expr(el, arena);
            }
            return expr;
        }
        return expr;
    }, expr->data);
}

Stmt* TreeCanonicalizer::canonicalize_stmt(Stmt* stmt, ArenaAllocator& arena) {
    if (!stmt) return nullptr;

    std::visit([&](auto& node) {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            if (node.init) {
                node.init = canonicalize_expr(node.init, arena);
            }
        } else if constexpr (std::is_same_v<T, AssignStmt>) {
            if (node.value) {
                node.value = canonicalize_expr(node.value, arena);
            }
        } else if constexpr (std::is_same_v<T, ExprStmt>) {
            if (node.expr) {
                node.expr = canonicalize_expr(node.expr, arena);
            }
        } else if constexpr (std::is_same_v<T, BlockStmt>) {
            for (auto*& s : node.statements) {
                s = canonicalize_stmt(s, arena);
            }
        } else if constexpr (std::is_same_v<T, IfStmt>) {
            node.condition = canonicalize_expr(node.condition, arena);
            node.then_branch = canonicalize_stmt(node.then_branch, arena);
            if (node.else_branch) {
                node.else_branch = canonicalize_stmt(node.else_branch, arena);
            }
        } else if constexpr (std::is_same_v<T, WhileStmt>) {
            node.condition = canonicalize_expr(node.condition, arena);
            node.body = canonicalize_stmt(node.body, arena);
        } else if constexpr (std::is_same_v<T, ForStmt>) {
            if (node.init) node.init = canonicalize_stmt(node.init, arena);
            if (node.cond) node.cond = canonicalize_expr(node.cond, arena);
            if (node.update) node.update = canonicalize_stmt(node.update, arena);
            if (node.iterable) node.iterable = canonicalize_expr(node.iterable, arena);
            node.body = canonicalize_stmt(node.body, arena);
        } else if constexpr (std::is_same_v<T, ReturnStmt>) {
            if (node.value) {
                node.value = canonicalize_expr(node.value, arena);
            }
        } else if constexpr (std::is_same_v<T, FnDeclStmt>) {
            if (node.body) node.body = canonicalize_stmt(node.body, arena);
        } else if constexpr (std::is_same_v<T, ClassDeclStmt>) {
            for (auto& m : node.methods) {
                if (m.body) m.body = canonicalize_stmt(m.body, arena);
            }
        } else if constexpr (std::is_same_v<T, StructDeclStmt>) {
            for (auto& m : node.methods) {
                if (m.body) m.body = canonicalize_stmt(m.body, arena);
            }
        }
    }, stmt->data);

    return stmt;
}

void TreeCanonicalizer::canonicalize_program(Program& program, ArenaAllocator& arena) {
    for (auto*& stmt : program.statements) {
        stmt = canonicalize_stmt(stmt, arena);
    }
}

} // namespace setun
