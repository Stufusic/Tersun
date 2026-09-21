#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/arena.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

void test_mutable_slice_contract_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.2] Mutable Slice Views (&mut [T]) & Aliasing Contract  \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: Mutable Slice Type Algebra & Assignability
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-1] Mutable slice type algebra & subtyping rules... ";
    {
        TypePtr t_int = Type::make_int();
        TypePtr t_trit = Type::make_trit();
        TypePtr arr_int_8 = Type::make_fixed_array(t_int, 8);
        TypePtr arr_trit_8 = Type::make_fixed_array(t_trit, 8);
        TypePtr imm_slice_int = Type::make_slice(t_int);
        TypePtr mut_slice_int = Type::make_mut_slice(t_int);
        TypePtr imm_slice_trit = Type::make_slice(t_trit);
        TypePtr mut_slice_trit = Type::make_mut_slice(t_trit);

        // String representation
        assert(mut_slice_int->to_string() == "&mut [int]");
        assert(mut_slice_trit->to_string() == "&mut [trit]");

        // Type predicates
        assert(mut_slice_int->is_mut_slice);
        assert(!imm_slice_int->is_mut_slice);
        assert(imm_slice_int->kind == TypeKind::SLICE_VIEW);

        // Subtyping / Assignability:
        // 1. [int; 8] can be borrowed as &mut [int]
        assert(mut_slice_int->is_assignable_from(arr_int_8));
        // 2. [trit; 8] cannot be borrowed as &mut [int]
        assert(!mut_slice_int->is_assignable_from(arr_trit_8));
        // 3. &mut [int] can be downgraded to &[int] (re-borrow as const)
        assert(imm_slice_int->is_assignable_from(mut_slice_int));
        // 4. &[int] CANNOT be assigned to &mut [int] (cannot upgrade const to mut)
        assert(!mut_slice_int->is_assignable_from(imm_slice_int));
        // 5. &mut [int] can be assigned to &mut [int]
        assert(mut_slice_int->is_assignable_from(mut_slice_int));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: Parsing & AST for &mut [T]
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-2] Parser support for &mut [T] function signatures... ";
    {
        std::string src = R"(
            fn bit_linear_gemv(
                x: &[int],
                w: &[trit],
                bias: &[int],
                out: &mut [int],
                rows: int,
                cols: int
            ) -> void {
                out[0] = 0;
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
    // Test 3: Compile Error on Mutating Immutable Slice &[T]
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-3] Compile-time rejection of writes through &[T]... ";
    {
        std::string bad_src = R"(
            fn mutate_imm(buf: &[int], n: int) -> void {
                let mut i = 0;
                while (i < n) {
                    buf[i] = 42;
                    i = i + 1;
                }
            }
        )";
        Lexer lex(bad_src);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        assert(!ok);
        std::string diag = tc.format_diagnostics();
        assert(diag.find("Cannot mutate elements through immutable slice view") != std::string::npos);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 4: Static Alias Detection at Call Site (&mut [T] vs &[T])
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-4] Single-writer multiple-reader static alias detection... ";
    {
        std::string bad_alias_src = R"(
            fn update(src: &[int], out: &mut [int], n: int) -> void {
                let mut i = 0;
                while (i < n) {
                    out[i] = src[i];
                    i = i + 1;
                }
            }

            fn run(buf: &mut [int], n: int) -> void {
                update(buf, buf, n);
            }
        )";
        Lexer lex(bad_alias_src);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        assert(!ok);
        std::string diag = tc.format_diagnostics();
        assert(diag.find("Aliasing violation in call to 'update'") != std::string::npos);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 5: Non-Escaping Return Invariant for &mut [T]
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-5] Non-escaping invariant for returned mutable slice... ";
    {
        std::string bad_escape = R"(
            fn leak_stack() -> &mut [int] {
                let local_arr: [int; 4] = [1, 2, 3, 4];
                return local_arr;
            }
        )";
        Lexer lex(bad_escape);
        auto tokens = lex.tokenize();
        ArenaAllocator arena;
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker tc;
        bool ok = tc.check_program(prog);
        assert(!ok);
        std::string diag = tc.format_diagnostics();
        assert(diag.find("Non-escaping slice violation") != std::string::npos);
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 6: Built-in slice(src, offset, len) Zero-Copy Subviews
    // -------------------------------------------------------------
    std::cout << "  [G7.3.2-6] Built-in slice(src, offset, len) subview type inference... ";
    {
        std::string subslice_src = R"(
            fn test_subviews(src_imm: &[int], src_mut: &mut [int]) -> int {
                let v_imm = slice(src_imm, 2, 4);
                let v_mut = slice(src_mut, 0, 4);
                v_mut[0] = v_imm[0];
                return v_mut[0];
            }
        )";
        Lexer lex(subslice_src);
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
    std::cout << "  Gate 7.3.2: Mutable Slice Contract Tests Passed (100%)!           \n";
    std::cout << "===================================================================\n";
}

} // namespace setun::test
