#pragma once

#include "compiler/ast.hpp"
#include "compiler/arena.hpp"
#include <cstdint>
#include <string>

namespace setun {

struct TreeNodeMetadata {
    DataType deduced_type{DataType::ANY};
    bool has_side_effect{false};
    bool may_trap{false};
    SourceLocation loc;
};

class TreeCanonicalizer {
public:
    // Analysis queries
    static bool has_side_effects(const Expr* expr);
    static bool may_trap(const Expr* expr);
    static TreeNodeMetadata analyze_metadata(const Expr* expr);

    // Canonical ordering comparison for commutative operators
    static int compare_structural(const Expr* a, const Expr* b);

    // Main canonicalization transforms (idempotent: norm(norm(T)) == norm(T))
    static Expr* canonicalize_expr(Expr* expr, ArenaAllocator& arena);
    static Stmt* canonicalize_stmt(Stmt* stmt, ArenaAllocator& arena);
    static void canonicalize_program(Program& program, ArenaAllocator& arena);

private:
    static Expr* canonicalize_binary(BinaryExpr& bin, SourceLocation loc, ArenaAllocator& arena);
    static Expr* canonicalize_unary(UnaryExpr& un, SourceLocation loc, ArenaAllocator& arena);
};

} // namespace setun
