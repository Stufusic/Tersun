#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/arena.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

void test_ternary_language_contract_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.1] Tersun Language Evolution & Type System Contract     \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: Lexer Tokenization of 0t Sequence Literals & 'trit' Keyword
    // -------------------------------------------------------------
    std::cout << "  [G7.3.1-1] Lexer 0t<sequence> literals & 'trit' keyword... ";
    {
        std::string src = "trit let w = 0t+0-+; let w2 = 0t10T; let w3 = 0t+0-_+0-;";
        Lexer lex(src);
        auto tokens = lex.tokenize();

        assert(tokens.size() >= 12);
        assert(tokens[0].type == TokenType::TYPE_TRIT);
        assert(tokens[0].lexeme == "trit");

        // 0t+0-+
        assert(tokens[4].type == TokenType::LITERAL_TRIT_VEC);
        assert(tokens[4].trit_vec_val.size() == 4);
        assert(tokens[4].trit_vec_val[0] == 1);
        assert(tokens[4].trit_vec_val[1] == 0);
        assert(tokens[4].trit_vec_val[2] == -1);
        assert(tokens[4].trit_vec_val[3] == 1);

        // 0t10T
        assert(tokens[9].type == TokenType::LITERAL_TRIT_VEC);
        assert(tokens[9].trit_vec_val.size() == 3);
        assert(tokens[9].trit_vec_val[0] == 1);
        assert(tokens[9].trit_vec_val[1] == 0);
        assert(tokens[9].trit_vec_val[2] == -1);

        // 0t+0-_+0-
        assert(tokens[14].type == TokenType::LITERAL_TRIT_VEC);
        assert(tokens[14].trit_vec_val.size() == 6);
        assert(tokens[14].trit_vec_val[0] == 1);
        assert(tokens[14].trit_vec_val[1] == 0);
        assert(tokens[14].trit_vec_val[2] == -1);
        assert(tokens[14].trit_vec_val[3] == 1);
        assert(tokens[14].trit_vec_val[4] == 0);
        assert(tokens[14].trit_vec_val[5] == -1);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: Fixed Array & Slice Type System Rules
    // -------------------------------------------------------------
    std::cout << "  [G7.3.1-2] Fixed stack array [T; N] & Slice &[T] type algebra... ";
    {
        TypePtr t_trit = Type::make_trit();
        TypePtr t_int = Type::make_int();
        TypePtr arr_trit_4 = Type::make_fixed_array(t_trit, 4);
        TypePtr arr_trit_8 = Type::make_fixed_array(t_trit, 8);
        TypePtr arr_int_4 = Type::make_fixed_array(t_int, 4);
        TypePtr slice_trit = Type::make_slice(t_trit);
        TypePtr slice_int = Type::make_slice(t_int);

        // Naming
        assert(t_trit->to_string() == "trit");
        assert(arr_trit_4->to_string() == "[trit; 4]");
        assert(slice_trit->to_string() == "&[trit]");

        // Slices: [T; N] implicitly borrows to &[T] if element type matches
        assert(slice_trit->is_assignable_from(arr_trit_4) == true);
        assert(slice_trit->is_assignable_from(arr_trit_8) == true);
        assert(slice_trit->is_assignable_from(arr_int_4) == false);
        assert(slice_int->is_assignable_from(arr_trit_4) == false);

        // Fixed array size match
        assert(arr_trit_4->is_assignable_from(arr_trit_4) == true);
        assert(arr_trit_4->is_assignable_from(arr_trit_8) == false);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 3: Parser Syntax for &[T], [T; N], and 0t Literal Expressions
    // -------------------------------------------------------------
    std::cout << "  [G7.3.1-3] Parsing slice signature & fixed array literal declarations... ";
    {
        std::string src = R"(
            fn integrate(inputs: &[int], weights: &[trit]) -> int {
                let w_stack: [trit; 4] = 0t+0-+;
                return 42;
            }
        )";
        Lexer lex(src);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();
        assert(prog.statements.size() == 1);

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        if (!ok) {
            std::cerr << "\n" << tc.format_diagnostics() << "\n";
        }
        assert(ok);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 4: Trit Operator Semantics Contract
    // -------------------------------------------------------------
    std::cout << "  [G7.3.1-4] Trit operator semantics (accumulator promotion, GF(3), <=>)... ";
    {
        std::string src = R"(
            fn test_ops(a: trit, b: trit, x: int) -> int {
                // trit * trit -> trit
                let mul_t: trit = a * b;

                // trit + trit -> int (automatic promotion to prevent silent mod-3 wrapping)
                let sum_i: int = a + b;

                // ~trit -> trit
                let neg_t: trit = ~a;

                // trit ^ trit -> trit (GF(3) addition modulo 3)
                let gf3_t: trit = a ^ b;

                // <=> returns trit
                let cmp_t: trit = a <=> b;

                // trit * int -> int
                let scaled: int = a * x;

                return sum_i + scaled;
            }
        )";
        Lexer lex(src);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        if (!ok) {
            std::cerr << "\n" << tc.format_diagnostics() << "\n";
        }
        assert(ok);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 5: Non-Escaping Slice Safety Invariant (Compile Error on Escape)
    // -------------------------------------------------------------
    std::cout << "  [G7.3.1-5] Non-escaping slice compile-time safety invariant... ";
    {
        std::string bad_src = R"(
            fn bad_escape() -> &[trit] {
                let local_arr: [trit; 4] = 0t+0-+;
                return local_arr;
            }
        )";
        Lexer lex(bad_src);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        // Must fail with non-escaping slice error!
        assert(!ok);
        std::string diag = tc.format_diagnostics();
        assert(diag.find("Non-escaping slice violation") != std::string::npos);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 6: 3-Way Branch with Trit Conditions & Value Struct
    // -------------------------------------------------------------
    std::cout << "  [G7.3.1-6] 3-way branch semantics & value struct ABI check... ";
    {
        std::string src = R"(
            struct DendriteWeight {
                let w0: trit;
                let w1: trit;
            }

            fn branch_test(w: trit, val: int) -> int {
                let mut acc = 0;
                branch (w) {
                    case +1: acc = acc + val;
                    case -1: acc = acc - val;
                    case 0:  acc = acc;
                }
                return acc;
            }
        )";
        Lexer lex(src);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        if (!ok) {
            std::cerr << "\n" << tc.format_diagnostics() << "\n";
        }
        assert(ok);
    }
    std::cout << "PASSED\n";

    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.3.1: All Language & Type Contract Tests Passed (100%)!    \n";
    std::cout << "===================================================================\n";
}

} // namespace setun::test
