#include "compiler/tree_optimizer.hpp"
#include <iostream>

namespace setun {

TreeOptimizer::TreeOptimizer(ArenaAllocator& arena) : ctx_(arena) {
    init_passes();
}

void TreeOptimizer::init_passes() {
    expr_passes_ = {
        pass_constant_folding,
        pass_constant_propagation,
        pass_algebraic_simplification,
        pass_conditional_folding,
        pass_strength_reduction,
        pass_pure_cse_candidate_marking
    };

    stmt_passes_ = {
        pass_dead_expression_elimination,
        pass_branch_simplification
    };
}

bool TreeOptimizer::pass_constant_folding(TreeContext& ctx, Expr*& expr) {
    if (!expr) return false;
    bool changed = false;

    // Recursively fold children first (bottom-up)
    std::visit([&](auto& node) {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, BinaryExpr>) {
            changed |= pass_constant_folding(ctx, node.left);
            changed |= pass_constant_folding(ctx, node.right);
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            changed |= pass_constant_folding(ctx, node.operand);
        }
    }, expr->data);

    // Now attempt folding current node
    if (auto* bin = std::get_if<BinaryExpr>(&expr->data)) {
        if (!bin->left || !bin->right) return changed;

        // 1. Both operands are IntLiteralExpr
        auto* l_int = std::get_if<IntLiteralExpr>(&bin->left->data);
        auto* r_int = std::get_if<IntLiteralExpr>(&bin->right->data);
        if (l_int && r_int) {
            int64_t a = l_int->value;
            int64_t b = r_int->value;
            SourceLocation loc = expr->loc;

            switch (bin->op) {
                case BinaryOp::ADD:
                    expr = ctx.arena.make<Expr>(IntLiteralExpr{a + b, loc}, loc);
                    return true;
                case BinaryOp::SUB:
                    expr = ctx.arena.make<Expr>(IntLiteralExpr{a - b, loc}, loc);
                    return true;
                case BinaryOp::MUL:
                    expr = ctx.arena.make<Expr>(IntLiteralExpr{a * b, loc}, loc);
                    return true;
                case BinaryOp::DIV:
                    if (b != 0) {
                        expr = ctx.arena.make<Expr>(IntLiteralExpr{a / b, loc}, loc);
                        return true;
                    }
                    break;
                case BinaryOp::MOD:
                    if (b != 0) {
                        expr = ctx.arena.make<Expr>(IntLiteralExpr{a % b, loc}, loc);
                        return true;
                    }
                    break;
                case BinaryOp::BIT_AND:
                    expr = ctx.arena.make<Expr>(IntLiteralExpr{a & b, loc}, loc);
                    return true;
                case BinaryOp::BIT_OR:
                    expr = ctx.arena.make<Expr>(IntLiteralExpr{a | b, loc}, loc);
                    return true;
                case BinaryOp::BIT_XOR:
                    expr = ctx.arena.make<Expr>(IntLiteralExpr{a ^ b, loc}, loc);
                    return true;
                case BinaryOp::EQ:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a == b, loc}, loc);
                    return true;
                case BinaryOp::NEQ:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a != b, loc}, loc);
                    return true;
                case BinaryOp::LT:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a < b, loc}, loc);
                    return true;
                case BinaryOp::LE:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a <= b, loc}, loc);
                    return true;
                case BinaryOp::GT:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a > b, loc}, loc);
                    return true;
                case BinaryOp::GE:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a >= b, loc}, loc);
                    return true;
                case BinaryOp::SHL:
                    if (b >= 0 && b < 64) {
                        expr = ctx.arena.make<Expr>(IntLiteralExpr{a << b, loc}, loc);
                        return true;
                    }
                    break;
                case BinaryOp::SHR:
                    if (b >= 0 && b < 64) {
                        expr = ctx.arena.make<Expr>(IntLiteralExpr{a >> b, loc}, loc);
                        return true;
                    }
                    break;
                default:
                    break;
            }
        }

        // 2. Both operands are FloatLiteralExpr
        auto* l_flt = std::get_if<FloatLiteralExpr>(&bin->left->data);
        auto* r_flt = std::get_if<FloatLiteralExpr>(&bin->right->data);
        if (l_flt && r_flt) {
            double a = l_flt->value;
            double b = r_flt->value;
            SourceLocation loc = expr->loc;

            switch (bin->op) {
                case BinaryOp::ADD:
                    expr = ctx.arena.make<Expr>(FloatLiteralExpr{a + b, loc}, loc);
                    return true;
                case BinaryOp::SUB:
                    expr = ctx.arena.make<Expr>(FloatLiteralExpr{a - b, loc}, loc);
                    return true;
                case BinaryOp::MUL:
                    expr = ctx.arena.make<Expr>(FloatLiteralExpr{a * b, loc}, loc);
                    return true;
                case BinaryOp::DIV:
                    if (b != 0.0) {
                        expr = ctx.arena.make<Expr>(FloatLiteralExpr{a / b, loc}, loc);
                        return true;
                    }
                    break;
                case BinaryOp::EQ:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a == b, loc}, loc);
                    return true;
                case BinaryOp::NEQ:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a != b, loc}, loc);
                    return true;
                case BinaryOp::LT:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a < b, loc}, loc);
                    return true;
                case BinaryOp::LE:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a <= b, loc}, loc);
                    return true;
                case BinaryOp::GT:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a > b, loc}, loc);
                    return true;
                case BinaryOp::GE:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a >= b, loc}, loc);
                    return true;
                default:
                    break;
            }
        }

        // 3. Both operands are BoolLiteralExpr
        auto* l_bool = std::get_if<BoolLiteralExpr>(&bin->left->data);
        auto* r_bool = std::get_if<BoolLiteralExpr>(&bin->right->data);
        if (l_bool && r_bool) {
            bool a = l_bool->value;
            bool b = r_bool->value;
            SourceLocation loc = expr->loc;

            switch (bin->op) {
                case BinaryOp::LOGICAL_AND:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a && b, loc}, loc);
                    return true;
                case BinaryOp::LOGICAL_OR:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a || b, loc}, loc);
                    return true;
                case BinaryOp::EQ:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a == b, loc}, loc);
                    return true;
                case BinaryOp::NEQ:
                    expr = ctx.arena.make<Expr>(BoolLiteralExpr{a != b, loc}, loc);
                    return true;
                default:
                    break;
            }
        }
    } else if (auto* un = std::get_if<UnaryExpr>(&expr->data)) {
        if (!un->operand) return changed;
        SourceLocation loc = expr->loc;

        if (un->op == UnaryOp::NEG) {
            if (auto* val = std::get_if<IntLiteralExpr>(&un->operand->data)) {
                expr = ctx.arena.make<Expr>(IntLiteralExpr{-val->value, loc}, loc);
                return true;
            }
            if (auto* val = std::get_if<FloatLiteralExpr>(&un->operand->data)) {
                expr = ctx.arena.make<Expr>(FloatLiteralExpr{-val->value, loc}, loc);
                return true;
            }
        } else if (un->op == UnaryOp::NOT) {
            if (auto* val = std::get_if<BoolLiteralExpr>(&un->operand->data)) {
                expr = ctx.arena.make<Expr>(BoolLiteralExpr{!val->value, loc}, loc);
                return true;
            }
        }
    }

    return changed;
}

bool TreeOptimizer::pass_constant_propagation(TreeContext& ctx, Expr*& expr) {
    if (!expr) return false;

    if (auto* id = std::get_if<IdentifierExpr>(&expr->data)) {
        auto it = ctx.const_ints.find(id->name);
        if (it != ctx.const_ints.end()) {
            expr = ctx.arena.make<Expr>(IntLiteralExpr{it->second, expr->loc}, expr->loc);
            return true;
        }
        auto it_f = ctx.const_floats.find(id->name);
        if (it_f != ctx.const_floats.end()) {
            expr = ctx.arena.make<Expr>(FloatLiteralExpr{it_f->second, expr->loc}, expr->loc);
            return true;
        }
        auto it_b = ctx.const_bools.find(id->name);
        if (it_b != ctx.const_bools.end()) {
            expr = ctx.arena.make<Expr>(BoolLiteralExpr{it_b->second, expr->loc}, expr->loc);
            return true;
        }
    }

    // Traverse recursively
    bool changed = false;
    std::visit([&](auto& node) {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, BinaryExpr>) {
            changed |= pass_constant_propagation(ctx, node.left);
            changed |= pass_constant_propagation(ctx, node.right);
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            changed |= pass_constant_propagation(ctx, node.operand);
        } else if constexpr (std::is_same_v<T, CallExpr>) {
            for (auto*& arg : node.args) changed |= pass_constant_propagation(ctx, arg);
        } else if constexpr (std::is_same_v<T, MethodCallExpr>) {
            changed |= pass_constant_propagation(ctx, node.object);
            for (auto*& arg : node.args) changed |= pass_constant_propagation(ctx, arg);
        }
    }, expr->data);

    return changed;
}

bool TreeOptimizer::pass_algebraic_simplification(TreeContext& ctx, Expr*& expr) {
    if (!expr) return false;
    bool changed = false;

    auto* bin = std::get_if<BinaryExpr>(&expr->data);
    if (!bin || !bin->left || !bin->right) return false;

    changed |= pass_algebraic_simplification(ctx, bin->left);
    changed |= pass_algebraic_simplification(ctx, bin->right);

    // Rule 1: x + 0 -> x (if !has_side_effects(x))
    if (bin->op == BinaryOp::ADD) {
        if (auto* r = std::get_if<IntLiteralExpr>(&bin->right->data)) {
            if (r->value == 0 && !TreeCanonicalizer::has_side_effects(bin->left)) {
                expr = bin->left;
                return true;
            }
        }
        if (auto* l = std::get_if<IntLiteralExpr>(&bin->left->data)) {
            if (l->value == 0 && !TreeCanonicalizer::has_side_effects(bin->right)) {
                expr = bin->right;
                return true;
            }
        }
    }
    // Rule 2: x - 0 -> x
    else if (bin->op == BinaryOp::SUB) {
        if (auto* r = std::get_if<IntLiteralExpr>(&bin->right->data)) {
            if (r->value == 0 && !TreeCanonicalizer::has_side_effects(bin->left)) {
                expr = bin->left;
                return true;
            }
        }
        // x - x -> 0 (if pure and cannot trap)
        if (TreeCanonicalizer::compare_structural(bin->left, bin->right) == 0 &&
            !TreeCanonicalizer::has_side_effects(bin->left) &&
            !TreeCanonicalizer::may_trap(bin->left)) {
            expr = ctx.arena.make<Expr>(IntLiteralExpr{0, expr->loc}, expr->loc);
            return true;
        }
    }
    // Rule 3: x * 1 -> x
    else if (bin->op == BinaryOp::MUL) {
        if (auto* r = std::get_if<IntLiteralExpr>(&bin->right->data)) {
            if (r->value == 1 && !TreeCanonicalizer::has_side_effects(bin->left)) {
                expr = bin->left;
                return true;
            }
            if (r->value == 0 && !TreeCanonicalizer::has_side_effects(bin->left) &&
                !TreeCanonicalizer::may_trap(bin->left)) {
                expr = bin->right;
                return true;
            }
        }
        if (auto* l = std::get_if<IntLiteralExpr>(&bin->left->data)) {
            if (l->value == 1 && !TreeCanonicalizer::has_side_effects(bin->right)) {
                expr = bin->right;
                return true;
            }
            if (l->value == 0 && !TreeCanonicalizer::has_side_effects(bin->right) &&
                !TreeCanonicalizer::may_trap(bin->right)) {
                expr = bin->left;
                return true;
            }
        }
    }
    // Rule 4: x / 1 -> x
    else if (bin->op == BinaryOp::DIV) {
        if (auto* r = std::get_if<IntLiteralExpr>(&bin->right->data)) {
            if (r->value == 1 && !TreeCanonicalizer::has_side_effects(bin->left)) {
                expr = bin->left;
                return true;
            }
        }
    }

    return changed;
}

bool TreeOptimizer::pass_dead_expression_elimination(TreeContext& ctx, Stmt*& stmt) {
    if (!stmt) return false;
    bool changed = false;

    if (auto* block = std::get_if<BlockStmt>(&stmt->data)) {
        auto it = block->statements.begin();
        while (it != block->statements.end()) {
            if (auto* ex_stmt = std::get_if<ExprStmt>(&(*it)->data)) {
                if (ex_stmt->expr &&
                    !TreeCanonicalizer::has_side_effects(ex_stmt->expr) &&
                    !TreeCanonicalizer::may_trap(ex_stmt->expr)) {
                    // Pure expression statement whose result is discarded -> eliminate!
                    it = block->statements.erase(it);
                    changed = true;
                    continue;
                }
            }
            ++it;
        }
    }

    return changed;
}

bool TreeOptimizer::pass_branch_simplification(TreeContext& ctx, Stmt*& stmt) {
    if (!stmt) return false;

    if (auto* if_stmt = std::get_if<IfStmt>(&stmt->data)) {
        if (if_stmt->condition) {
            if (auto* b_lit = std::get_if<BoolLiteralExpr>(&if_stmt->condition->data)) {
                if (b_lit->value) {
                    // if (true) A else B -> A
                    stmt = if_stmt->then_branch ? if_stmt->then_branch : ctx.arena.make<Stmt>(BlockStmt{{}, stmt->loc}, stmt->loc);
                    return true;
                } else {
                    // if (false) A else B -> B
                    if (if_stmt->else_branch) {
                        stmt = if_stmt->else_branch;
                    } else {
                        stmt = ctx.arena.make<Stmt>(BlockStmt{{}, stmt->loc}, stmt->loc);
                    }
                    return true;
                }
            }
        }
    }

    return false;
}

bool TreeOptimizer::pass_conditional_folding(TreeContext& ctx, Expr*& expr) {
    // Identity boolean reductions
    return false;
}

bool TreeOptimizer::pass_strength_reduction(TreeContext& ctx, Expr*& expr) {
    // Leave machine-level shifts to IR / backend, maintain canonical forms
    return false;
}

bool TreeOptimizer::pass_pure_cse_candidate_marking(TreeContext& ctx, Expr*& expr) {
    if (!expr) return false;

    if (auto* bin = std::get_if<BinaryExpr>(&expr->data)) {
        if (!TreeCanonicalizer::has_side_effects(expr) && !TreeCanonicalizer::may_trap(expr)) {
            // Register as pure candidate for Module 5.4 IR CSE
            ctx.cse_candidates.push_back(expr);
        }
    }
    return false;
}

bool TreeOptimizer::optimize_expression(Expr*& expr) {
    if (!expr) return false;
    bool changed = false;
    for (auto pass : expr_passes_) {
        changed |= pass(ctx_, expr);
    }
    return changed;
}

bool TreeOptimizer::optimize_statement(Stmt*& stmt) {
    if (!stmt) return false;
    bool changed = false;

    // First optimize child statements and expressions
    std::visit([&](auto& node) {
        using T = std::decay_t<decltype(node)>;
        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            if (node.init) {
                changed |= optimize_expression(node.init);
                // Record for local propagation ONLY if explicitly declared const
                if (node.is_const) {
                    if (auto* lit = std::get_if<IntLiteralExpr>(&node.init->data)) {
                        ctx_.const_ints[node.name] = lit->value;
                    } else if (auto* flt = std::get_if<FloatLiteralExpr>(&node.init->data)) {
                        ctx_.const_floats[node.name] = flt->value;
                    } else if (auto* b = std::get_if<BoolLiteralExpr>(&node.init->data)) {
                        ctx_.const_bools[node.name] = b->value;
                    }
                }
            }
        } else if constexpr (std::is_same_v<T, AssignStmt>) {
            if (node.value) {
                changed |= optimize_expression(node.value);
                ctx_.const_ints.erase(node.name);
                ctx_.const_floats.erase(node.name);
                ctx_.const_bools.erase(node.name);
            }
        } else if constexpr (std::is_same_v<T, ExprStmt>) {
            if (node.expr) changed |= optimize_expression(node.expr);
        } else if constexpr (std::is_same_v<T, BlockStmt>) {
            for (auto*& s : node.statements) {
                changed |= optimize_statement(s);
            }
        } else if constexpr (std::is_same_v<T, IfStmt>) {
            if (node.condition) changed |= optimize_expression(node.condition);
            if (node.then_branch) changed |= optimize_statement(node.then_branch);
            if (node.else_branch) changed |= optimize_statement(node.else_branch);
        } else if constexpr (std::is_same_v<T, WhileStmt>) {
            if (node.condition) changed |= optimize_expression(node.condition);
            if (node.body) changed |= optimize_statement(node.body);
        } else if constexpr (std::is_same_v<T, ForStmt>) {
            if (node.init) changed |= optimize_statement(node.init);
            if (node.cond) changed |= optimize_expression(node.cond);
            if (node.update) changed |= optimize_statement(node.update);
            if (node.iterable) changed |= optimize_expression(node.iterable);
            if (node.body) changed |= optimize_statement(node.body);
        } else if constexpr (std::is_same_v<T, ReturnStmt>) {
            if (node.value) changed |= optimize_expression(node.value);
        } else if constexpr (std::is_same_v<T, FnDeclStmt>) {
            auto saved_ints = ctx_.const_ints;
            auto saved_floats = ctx_.const_floats;
            auto saved_bools = ctx_.const_bools;
            for (const auto& param : node.params) {
                ctx_.const_ints.erase(param.name);
                ctx_.const_floats.erase(param.name);
                ctx_.const_bools.erase(param.name);
            }
            if (node.body) changed |= optimize_statement(node.body);
            ctx_.const_ints = std::move(saved_ints);
            ctx_.const_floats = std::move(saved_floats);
            ctx_.const_bools = std::move(saved_bools);
        } else if constexpr (std::is_same_v<T, ClassDeclStmt>) {
            for (auto& m : node.methods) {
                if (m.body) changed |= optimize_statement(m.body);
            }
        } else if constexpr (std::is_same_v<T, StructDeclStmt>) {
            for (auto& m : node.methods) {
                if (m.body) changed |= optimize_statement(m.body);
            }
        }
    }, stmt->data);

    // Apply statement-level passes
    for (auto pass : stmt_passes_) {
        changed |= pass(ctx_, stmt);
    }

    return changed;
}

bool TreeOptimizer::optimize_function(FnDeclStmt& fn) {
    if (!fn.body) return false;
    ctx_.const_ints.clear();
    ctx_.const_floats.clear();
    ctx_.const_bools.clear();
    ctx_.cse_candidates.clear();

    bool any_changed = false;
    for (size_t round = 0; round < MAX_OPT_ROUNDS; ++round) {
        ctx_.round = round;
        bool round_changed = optimize_statement(fn.body);
        if (!round_changed) break;
        any_changed = true;
    }
    return any_changed;
}

bool TreeOptimizer::optimize_program(Program& program) {
    bool changed = false;
    for (size_t round = 0; round < MAX_OPT_ROUNDS; ++round) {
        ctx_.round = round;
        bool round_changed = false;
        for (auto*& stmt : program.statements) {
            round_changed |= optimize_statement(stmt);
        }
        if (!round_changed) break;
        changed = true;
    }
    return changed;
}

} // namespace setun
