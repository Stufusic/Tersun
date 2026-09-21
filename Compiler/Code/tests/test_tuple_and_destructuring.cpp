#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/arena.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

void test_tuple_and_destructuring_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.3] Tuples & Destructuring Type Contract                \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: Tuple Type Algebra & String Representation
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-1] Tuple type algebra & string representation... ";
    {
        TypePtr t_int = Type::make_int();
        TypePtr t_trit = Type::make_trit();
        TypePtr t_bool = Type::make_bool();

        TypePtr tup2 = Type::make_tuple({t_int, t_trit});
        TypePtr tup3 = Type::make_tuple({t_int, t_trit, t_bool});
        TypePtr tup_empty = Type::make_tuple({});

        assert(tup2->kind == TypeKind::TUPLE);
        assert(tup2->tuple_elements.size() == 2);
        assert(tup2->to_string() == "(int, trit)");
        assert(tup3->to_string() == "(int, trit, bool)");
        assert(tup_empty->to_string() == "()");

        // Assignability
        TypePtr tup2_same = Type::make_tuple({t_int, t_trit});
        TypePtr tup2_diff = Type::make_tuple({t_trit, t_int});
        assert(tup2->is_assignable_from(tup2_same));
        assert(!tup2->is_assignable_from(tup2_diff));
        assert(!tup2->is_assignable_from(tup3));
        assert(!tup2->is_assignable_from(t_int));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: Parsing Tuple Literals & Destructure Statements
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-2] Parsing tuple literals & destructure let stmts... ";
    {
        std::string src = R"(
            fn test_tuple_parsing() {
                let pair: (int, trit) = (42, 0t+);
                let (x, y) = pair;
                let (a, b, c) = (10, 20, 30);
            }
        )";

        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        auto program = parser.parse_program();
        assert(!program.statements.empty());

        const auto* fn = &std::get<FnDeclStmt>(program.statements[0]->data);
        assert(fn->body != nullptr);
        const auto* block = &std::get<BlockStmt>(fn->body->data);
        assert(block->statements.size() == 3);

        // Statement 0: VarDecl with TupleLiteralExpr
        const auto* s0 = &std::get<VarDeclStmt>(block->statements[0]->data);
        assert(s0->name == "pair");
        assert(s0->init != nullptr);
        assert(std::holds_alternative<TupleLiteralExpr>(s0->init->data));
        const auto& tlit = std::get<TupleLiteralExpr>(s0->init->data);
        assert(tlit.elements.size() == 2);

        // Statement 1: TupleDestructureStmt (x, y) = pair
        assert(std::holds_alternative<TupleDestructureStmt>(block->statements[1]->data));
        const auto& d1 = std::get<TupleDestructureStmt>(block->statements[1]->data);
        assert(d1.names.size() == 2);
        assert(d1.names[0] == "x");
        assert(d1.names[1] == "y");

        // Statement 2: TupleDestructureStmt (a, b, c) = (10, 20, 30)
        assert(std::holds_alternative<TupleDestructureStmt>(block->statements[2]->data));
        const auto& d2 = std::get<TupleDestructureStmt>(block->statements[2]->data);
        assert(d2.names.size() == 3);
        assert(d2.names[0] == "a");
        assert(d2.names[1] == "b");
        assert(d2.names[2] == "c");
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 3: Type Checking of Tuple Destructuring
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-3] Type checking of tuple destructure bindings... ";
    {
        std::string src = R"(
            fn run_tuple_check() -> int {
                let pair: (int, trit) = (42, 0t+);
                let (first, second) = pair;
                return first;
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
    // Test 4: Negative Test - Tuple Arity Mismatch Rejection
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-4] Rejecting tuple arity mismatch at compile-time... ";
    {
        std::string src = R"(
            fn run_mismatch() {
                let (a, b, c) = (1, 2);
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
        bool found_error = false;
        for (const auto& err : checker.errors()) {
            if (err.message.find("destructure") != std::string::npos ||
                err.message.find("arity") != std::string::npos ||
                err.message.find("elements") != std::string::npos ||
                err.message.find("does not match") != std::string::npos) {
                found_error = true;
                break;
            }
        }
        assert(found_error);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 5: End-to-End VM Execution of Tuple Operations
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-5] VM execution of tuple destructuring & function returns... ";
    {
        std::string src = R"(
            // 1. Destructure tuple literal
            let (a, b) = (10, 20);
            assert_eq(a, 10);
            assert_eq(b, 20);

            // 2. Destructure annotated tuple
            let pair: (int, trit) = (42, 0t+);
            let (first, second) = pair;
            assert_eq(first, 42);
            assert_eq(second, 1);

            // 3. Nested tuple destructuring
            let ((na, nb), nc) = ((1, 2), 3);
            assert_eq(na, 1);
            assert_eq(nb, 2);
            assert_eq(nc, 3);

            // 4. Function returning tuple
            fn divmod(x: int, y: int) -> (int, int) {
                return (x / y, x % y);
            }
            let (q, r) = divmod(10, 3);
            assert_eq(q, 3);
            assert_eq(r, 1);
        )";

        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        auto program = parser.parse_program();

        TypeChecker checker;
        bool ok = checker.check_program(program);
        assert(ok && !checker.has_errors());

        BytecodeEmitter emitter;
        Chunk chunk = emitter.compile(program);

        VM vm;
        vm.run(chunk);
    }
    std::cout << "PASSED\n";
}

} // namespace setun::test
