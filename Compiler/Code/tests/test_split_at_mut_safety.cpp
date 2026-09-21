#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/arena.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun::test {

void test_split_at_mut_safety_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.3] split_at_mut & Disjoint Memory Verification          \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------
    // Test 1: split_at_mut Type Signature & Tuple Destructure
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-1] split_at_mut signature returns (&mut [T], &mut [T])... ";
    {
        std::string src = R"(
            fn partition_buffer(buf: &mut [int]) {
                let (left, right) = split_at_mut(buf, 4);
                left[0] = 100;
                right[0] = 200;
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

        // Verify disjointness recorded in memory_facts
        const auto& facts = checker.memory_facts();
        assert(facts.are_disjoint("left", "right"));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 2: Concurrent Mutation of Disjoint Sub-Slices
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-2] Disjoint sub-slices allow concurrent mutation... ";
    {
        std::string src = R"(
            fn dual_write(a: &mut [int], b: &mut [int]) {
                a[0] = 1;
                b[0] = 2;
            }

            fn run_split(main_buf: &mut [int]) {
                let (p1, p2) = split_at_mut(main_buf, 8);
                dual_write(p1, p2);
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
        assert(checker.memory_facts().are_disjoint("p1", "p2"));
    }
    std::cout << "PASSED\n";

    // -------------------------------------------------------------
    // Test 3: Rejection of Overlapping / Duplicate Borrow of Mutable Slice
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-3] Static rejection of aliasing mutable borrow... ";
    {
        std::string src = R"(
            fn conflict_write(a: &mut [int], b: &mut [int]) {
                a[0] = 1;
                b[0] = 2;
            }

            fn run_aliasing(buf: &mut [int]) {
                // Passing the exact same mutable slice to two &mut params must fail alias check!
                conflict_write(buf, buf);
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
        bool found_alias_err = false;
        for (const auto& err : checker.errors()) {
            if (err.message.find("alias") != std::string::npos ||
                err.message.find("multiple mutable") != std::string::npos ||
                err.message.find("borrow") != std::string::npos ||
                err.message.find("conflict") != std::string::npos) {
                found_alias_err = true;
                break;
            }
        }
        assert(found_alias_err);
    }
    std::cout << "PASSED\n";
}

} // namespace setun::test
