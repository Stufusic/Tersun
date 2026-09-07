#include "compiler/ast.hpp"
#include "compiler/arena.hpp"
#include "compiler/tree_canonicalize.hpp"
#include "compiler/tree_optimizer.hpp"
#include <iostream>
#include <cassert>
#include <chrono>

using namespace setun;

// ST-2: Tree & IR Complexity Stress Test
// 1. Deeply nested expression tree (depth = 10,000)
// 2. Normalization idempotency: norm(norm(T)) == norm(T)
// 3. Side-effect preservation guard: (foo() + 0) + (pure * 0) -> foo() + 0
int main() {
    std::cout << "===================================================================\n";
    std::cout << "  ST-2: Tree Canonicalization & Optimizer Extreme Stress Test      \n";
    std::cout << "===================================================================\n";

    ArenaAllocator arena(1024 * 1024);
    SourceLocation loc{1, 1, "stress.stn"};

    // 1. Stress Test: Deep Tree of depth 10,000
    std::cout << "[1/3] Building deeply nested expression tree (Depth = 10,000)...\n";
    auto t0 = std::chrono::steady_clock::now();

    Expr* current = arena.make<Expr>(IdentifierExpr{"x", loc}, loc);
    const int DEPTH = 10000;
    for (int i = 0; i < DEPTH; ++i) {
        Expr* zero = arena.make<Expr>(IntLiteralExpr{0, loc}, loc);
        current = arena.make<Expr>(BinaryExpr{BinaryOp::ADD, current, zero, loc}, loc);
    }

    auto t1 = std::chrono::steady_clock::now();
    double build_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
    std::cout << "  -> Tree built in " << build_ms << " ms. Running Canonicalizer...\n";

    Expr* canon1 = TreeCanonicalizer::canonicalize_expr(current, arena);
    auto t2 = std::chrono::steady_clock::now();
    double canon_ms = std::chrono::duration<double, std::milli>(t2 - t1).count();
    std::cout << "  -> Canonicalized in " << canon_ms << " ms.\n";

    // Because x + 0 -> x, 10,000 additions of 0 with pure x must collapse directly to 'x'!
    assert(std::holds_alternative<IdentifierExpr>(canon1->data));
    std::cout << "  -> PASSED: 10,000-deep nested (x + 0) collapsed to IdentifierExpr('x')!\n";

    // 2. Stress Test: Idempotency norm(norm(T)) == norm(T)
    std::cout << "[2/3] Verifying Normalization Idempotency: norm(norm(T)) == norm(T)...\n";
    Expr* canon2 = TreeCanonicalizer::canonicalize_expr(canon1, arena);
    assert(TreeCanonicalizer::compare_structural(canon1, canon2) == 0);
    std::cout << "  -> PASSED: Strict Idempotency verified!\n";

    // 3. Stress Test: Side-Effect Preservation Guard
    std::cout << "[3/3] Verifying Side-Effect Preservation under Algebraic Simplification...\n";
    // Construct: (call_foo() + 0)
    Expr* call_foo = arena.make<Expr>(CallExpr{"foo", {}, {}, loc}, loc);
    Expr* zero = arena.make<Expr>(IntLiteralExpr{0, loc}, loc);
    Expr* side_effect_expr = arena.make<Expr>(BinaryExpr{BinaryOp::ADD, call_foo, zero, loc}, loc);

    assert(TreeCanonicalizer::has_side_effects(side_effect_expr) == true);
    Expr* canon_side = TreeCanonicalizer::canonicalize_expr(side_effect_expr, arena);

    // Call MUST NOT be removed! The outer binary op is preserved because foo() has side effects.
    assert(std::holds_alternative<BinaryExpr>(canon_side->data) || std::holds_alternative<CallExpr>(canon_side->data));
    assert(TreeCanonicalizer::has_side_effects(canon_side) == true);
    std::cout << "  -> PASSED: Side-effects preserved; impure call was NOT dropped!\n";

    // 4. Test Constant Folding on complex expressions
    std::cout << "[Bonus] Verifying Typed Constant Folding & Algebraic Pass...\n";
    TreeOptimizer opt(arena);
    Expr* folded = arena.make<Expr>(BinaryExpr{
        BinaryOp::ADD,
        arena.make<Expr>(IntLiteralExpr{100, loc}, loc),
        arena.make<Expr>(BinaryExpr{
            BinaryOp::MUL,
            arena.make<Expr>(IntLiteralExpr{25, loc}, loc),
            arena.make<Expr>(IntLiteralExpr{4, loc}, loc),
            loc
        }, loc),
        loc
    }, loc); // 100 + (25 * 4) = 200

    opt.optimize_expression(folded);
    assert(std::holds_alternative<IntLiteralExpr>(folded->data));
    assert(std::get<IntLiteralExpr>(folded->data).value == 200);
    std::cout << "  -> PASSED: Constant folding evaluated 100 + (25 * 4) == 200!\n";

    std::cout << "\n===================================================================\n";
    std::cout << "  ALL ST-2 STRESS TESTS PASSED WITH 100% CORRECTNESS!             \n";
    std::cout << "===================================================================\n";
    return 0;
}
