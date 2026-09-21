#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/arena.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

void test_tensor_view_indexing_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.3] TensorView & Multi-Dimensional Indexing Contract    \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: TensorView Type Algebra & String Representation
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-1] TensorView type algebra & rank verification... ";
    {
        TypePtr t_int = Type::make_int();
        TypePtr t_trit = Type::make_trit();

        TypePtr tv_int_2d = Type::make_tensor_view(t_int, 2);
        TypePtr tv_trit_2d = Type::make_tensor_view(t_trit, 2);
        TypePtr tv_int_3d = Type::make_tensor_view(t_int, 3);

        assert(tv_int_2d->kind == TypeKind::TENSOR_VIEW);
        assert(tv_int_2d->rank == 2);
        assert(tv_int_2d->to_string() == "TensorView<int, 2>");
        assert(tv_trit_2d->to_string() == "TensorView<trit, 2>");
        assert(tv_int_3d->to_string() == "TensorView<int, 3>");

        // Assignability
        TypePtr tv_int_2d_same = Type::make_tensor_view(t_int, 2);
        assert(tv_int_2d->is_assignable_from(tv_int_2d_same));
        assert(!tv_int_2d->is_assignable_from(tv_trit_2d));
        assert(!tv_int_2d->is_assignable_from(tv_int_3d));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: Parsing Multi-Dimensional Index Expressions & Stmts
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-2] Parsing multi-dimensional indexing w[r, c]... ";
    {
        std::string src = R"(
            fn read_write_2d(view: TensorView<int, 2>, r: int, c: int, val: int) -> int {
                view[r, c] = val;
                return view[r, c];
            }
        )";

        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        auto program = parser.parse_program();
        assert(!program.statements.empty());

        const auto* fn = &std::get<FnDeclStmt>(program.statements[0]->data);
        assert(fn->params.size() == 4);
        assert(fn->params[0].name == "view");

        const auto* block = &std::get<BlockStmt>(fn->body->data);
        assert(block->statements.size() == 2);

        // Statement 0: IndexAssignStmt with 2 indices
        assert(std::holds_alternative<IndexAssignStmt>(block->statements[0]->data));
        const auto& assign = std::get<IndexAssignStmt>(block->statements[0]->data);
        assert(assign.indices.size() == 2);

        // Statement 1: ReturnStmt with IndexExpr of 2 indices
        assert(std::holds_alternative<ReturnStmt>(block->statements[1]->data));
        const auto& ret = std::get<ReturnStmt>(block->statements[1]->data);
        assert(ret.value != nullptr);
        assert(std::holds_alternative<IndexExpr>(ret.value->data));
        const auto& ie = std::get<IndexExpr>(ret.value->data);
        assert(ie.indices.size() == 2);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 3: Type Checker TensorView Rank Validation
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-3] Type checking 2D TensorView indexing... ";
    {
        std::string src = R"(
            fn kernel_step(w: TensorView<int, 2>, r: int, c: int) -> int {
                return w[r, c];
            }
        )";

        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        auto program = parser.parse_program();

        TypeChecker checker;
        bool ok = checker.check_program(program);
        assert(ok);
        assert(!checker.has_errors());
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 4: Negative Test - TensorView Rank Mismatch Rejection
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-4] Rejecting 2D TensorView indexing with 1 index... ";
    {
        std::string src = R"(
            fn bad_rank(w: TensorView<int, 2>, r: int) -> int {
                return w[r];
            }
        )";

        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        auto program = parser.parse_program();

        TypeChecker checker;
        bool ok = checker.check_program(program);
        assert(!ok || checker.has_errors());
        bool found_rank_err = false;
        for (const auto& err : checker.errors()) {
            if (err.message.find("rank") != std::string::npos ||
                err.message.find("dimension") != std::string::npos ||
                err.message.find("indices") != std::string::npos) {
                found_rank_err = true;
                break;
            }
        }
        assert(found_rank_err);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 5: Region Safety - Structs Cannot Store Borrowed Views
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-5] Enforcing region safety (no borrowed views in structs)... ";
    {
        std::string src = R"(
            struct LeakyState {
                view: TensorView<int, 2>,
            }
        )";

        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        auto program = parser.parse_program();

        TypeChecker checker;
        bool ok = checker.check_program(program);
        assert(!ok || checker.has_errors());
        bool found_lifetime_err = false;
        for (const auto& err : checker.errors()) {
            if (err.message.find("borrowed view") != std::string::npos ||
                err.message.find("escape") != std::string::npos ||
                err.message.find("lifetime") != std::string::npos ||
                err.message.find("cannot be stored") != std::string::npos) {
                found_lifetime_err = true;
                break;
            }
        }
        assert(found_lifetime_err);
    }
    std::cout << "PASSED\n";
}

} // namespace setun::test
