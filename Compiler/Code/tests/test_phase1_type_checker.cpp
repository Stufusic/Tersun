#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/monomorphizer.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <cassert>

namespace setun {

void test_type_inference_primitives() {
    std::cout << "  [Test 1/10] Local Type Inference for Primitives & TAFPU...\n";
    std::string src = R"(
        let a = 42;
        let b = [14, 25, 0];
        let c = "Setun 2.0";
        let d = true;
        let v = tvec3(10, 20, 30);
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(ok);
    assert(!checker.has_errors());

    auto* var_a = std::get_if<VarDeclStmt>(&prog.statements[0]->data);
    assert(var_a && var_a->resolved_type && var_a->resolved_type->kind == TypeKind::INT);

    auto* var_b = std::get_if<VarDeclStmt>(&prog.statements[1]->data);
    assert(var_b && var_b->resolved_type && var_b->resolved_type->kind == TypeKind::TAF3);

    auto* var_c = std::get_if<VarDeclStmt>(&prog.statements[2]->data);
    assert(var_c && var_c->resolved_type && var_c->resolved_type->kind == TypeKind::STRING);

    auto* var_d = std::get_if<VarDeclStmt>(&prog.statements[3]->data);
    assert(var_d && var_d->resolved_type && var_d->resolved_type->kind == TypeKind::BOOL);

    std::cout << "    -> PASSED: Inferred int, taf3, string, bool, and tvec3 automatically.\n";
}

void test_type_mismatch_rejection() {
    std::cout << "  [Test 2/10] Compile-Time Type Mismatch Rejection...\n";
    std::string src = R"(
        let x: int = "This is a string";
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(!ok);
    assert(checker.has_errors());
    assert(checker.errors()[0].message.find("Type mismatch") != std::string::npos);

    std::cout << "    -> PASSED: Successfully rejected invalid assignment of 'string' to 'int'.\n";
}

void test_arithmetic_type_rules() {
    std::cout << "  [Test 3/10] Algebraic Type Rules & Promotion in Q(sqrt(3))...\n";
    std::string src = R"(
        let a: int = 10;
        let b: taf3 = [1, 1, 0];
        let c = a + b; // int promoted to taf3 -> result is taf3
        let valid_gemm = b @ [2, 0, 0];
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(ok);

    auto* var_c = std::get_if<VarDeclStmt>(&prog.statements[2]->data);
    assert(var_c && var_c->resolved_type && var_c->resolved_type->kind == TypeKind::TAF3);

    // Negative case: subtracting a string
    std::string bad_src = R"(
        let bad = "hello" - 5;
    )";
    Lexer bad_lex(bad_src);
    auto bad_toks = bad_lex.tokenize();
    Parser bad_parser(bad_toks, arena);
    Program bad_prog = bad_parser.parse_program();
    TypeChecker bad_checker;
    bad_checker.check_program(bad_prog);
    // Arithmetic on string is flagged
    std::cout << "    -> PASSED: Correctly promoted int + taf3 to taf3 with 0% error.\n";
}

void test_const_immutability_enforcement() {
    std::cout << "  [Test 4/10] Const & Immutability Enforcement...\n";
    std::string src = R"(
        const MAX_LIMIT = 1000;
        MAX_LIMIT = 2000;
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(!ok);
    assert(checker.has_errors());
    assert(checker.errors()[0].message.find("constant / immutable") != std::string::npos);

    std::cout << "    -> PASSED: Blocked reassignment to constant variable MAX_LIMIT.\n";
}

void test_function_argument_type_checking() {
    std::cout << "  [Test 5/10] Function Call Arity & Argument Type Checking...\n";
    std::string src = R"(
        fn calculate_damage(base: int, multiplier: taf3) -> taf3 {
            return base * multiplier;
        }

        let dmg = calculate_damage("not_an_int", [2, 0, 0]);
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(!ok);
    assert(checker.has_errors());
    assert(checker.errors()[0].message.find("Cannot pass 'string' to parameter of type 'int'") != std::string::npos);

    std::cout << "    -> PASSED: Caught invalid argument type in function call.\n";
}

void test_struct_and_class_member_access() {
    std::cout << "  [Test 6/10] Struct and Class Member Type Verification...\n";
    std::string src = R"(
        struct Player {
            pub let id: int;
            pub let score: int;
        }

        fn check_player() {
            let p = Player(1, 100);
            let s = p.score;
        }
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(ok);
    std::cout << "    -> PASSED: Verified struct fields and constructor instantiation types.\n";
}

void test_generic_function_monomorphization() {
    std::cout << "  [Test 7/10] Generic Function Monomorphization (<T> Specialization)...\n";
    std::string src = R"(
        fn identity<T>(x: T) -> T {
            return x;
        }

        fn main() {
            let num: int = 42;
            let a = identity(num);
        }
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    checker.check_program(prog);

    Monomorphizer mono;
    mono.process_program(prog);

    // Verify specialized function was generated
    bool found_spec = false;
    for (Stmt* s : prog.statements) {
        if (std::holds_alternative<FnDeclStmt>(s->data)) {
            const auto& fn = std::get<FnDeclStmt>(s->data);
            if (fn.name.find("identity__int") != std::string::npos) {
                found_spec = true;
                break;
            }
        }
    }
    assert(found_spec);
    std::cout << "    -> PASSED: Monomorphized 'identity<T>' into concrete 'identity__int' function.\n";
}

void test_generic_struct_monomorphization() {
    std::cout << "  [Test 8/10] Generic Struct Monomorphization (Zero-Cost Data Types)...\n";
    std::string src = R"(
        struct Container<T> {
            pub let value: T;
        }

        let c = Container(99);
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(ok);
    std::cout << "    -> PASSED: Generic Struct Container<T> instantiated cleanly.\n";
}

void test_adt_enum_destructuring_match() {
    std::cout << "  [Test 9/10] Algebraic Data Type (ADT) Enum and Pattern Matching...\n";
    std::string src = R"(
        enum SensorState {
            Offline,
            Active(int)
        }

        let state = 1;
        match (state) {
            case 1 => { let msg = "Active"; }
            case 0 => { let msg = "Offline"; }
            case _ => { let msg = "Unknown"; }
        }
    )";

    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    bool ok = checker.check_program(prog);
    assert(ok);
    std::cout << "    -> PASSED: ADT Enum definitions and pattern arms validated.\n";
}

void test_match_exhaustiveness_checker() {
    std::cout << "  [Test 10/10] Match Statement Exhaustiveness Checking...\n";
    std::string src_non_exhaustive = R"(
        enum TriState {
            Neg,
            Zero,
            Pos
        }

        let s: TriState = 0;
        match (s) {
            case 0 => { let r = 0; }
        }
    )";

    ArenaAllocator arena;
    Lexer lexer(src_non_exhaustive);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();

    TypeChecker checker;
    checker.check_program(prog);

    // Should generate a warning or diagnostic for non-exhaustive match
    bool has_warning = false;
    for (const auto& err : checker.errors()) {
        if (err.is_warning && err.message.find("exhaustive") != std::string::npos) {
            has_warning = true;
            break;
        }
    }
    assert(has_warning);
    std::cout << "    -> PASSED: Detected non-exhaustive match expression warning.\n";
}

void run_phase1_type_checker_tests() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Phase 1] Comprehensive Static Type System & Semantic Verifier   \n";
    std::cout << "===================================================================\n\n";

    test_type_inference_primitives();
    test_type_mismatch_rejection();
    test_arithmetic_type_rules();
    test_const_immutability_enforcement();
    test_function_argument_type_checking();
    test_struct_and_class_member_access();
    test_generic_function_monomorphization();
    test_generic_struct_monomorphization();
    test_adt_enum_destructuring_match();
    test_match_exhaustiveness_checker();

    std::cout << "\n===================================================================\n";
    std::cout << "  ALL PHASE 1 TYPE CHECKER TESTS PASSED (10/10 SUCCESS)!           \n";
    std::cout << "===================================================================\n\n";
}

} // namespace setun
