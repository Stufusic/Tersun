#pragma once

#include "compiler/ast.hpp"
#include "compiler/arena.hpp"
#include "compiler/optimization_pass.hpp"
#include "compiler/tree_canonicalize.hpp"
#include <vector>

namespace setun {

class TreeOptimizer {
public:
    static constexpr size_t MAX_OPT_ROUNDS = 8;

    explicit TreeOptimizer(ArenaAllocator& arena);

    // Run the full 8-pass dynamic fixed-point loop on a program
    bool optimize_program(Program& program);
    bool optimize_function(FnDeclStmt& fn);
    bool optimize_statement(Stmt*& stmt);
    bool optimize_expression(Expr*& expr);

    // The 8 individual passes
    static bool pass_constant_folding(TreeContext& ctx, Expr*& expr);
    static bool pass_constant_propagation(TreeContext& ctx, Expr*& expr);
    static bool pass_algebraic_simplification(TreeContext& ctx, Expr*& expr);
    static bool pass_dead_expression_elimination(TreeContext& ctx, Stmt*& stmt);
    static bool pass_branch_simplification(TreeContext& ctx, Stmt*& stmt);
    static bool pass_conditional_folding(TreeContext& ctx, Expr*& expr);
    static bool pass_strength_reduction(TreeContext& ctx, Expr*& expr);
    static bool pass_pure_cse_candidate_marking(TreeContext& ctx, Expr*& expr);

    const TreeContext& context() const { return ctx_; }

private:
    TreeContext ctx_;
    std::vector<TreeExprPass> expr_passes_;
    std::vector<TreeStmtPass> stmt_passes_;

    void init_passes();
};

} // namespace setun
