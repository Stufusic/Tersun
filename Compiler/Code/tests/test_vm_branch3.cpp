#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"
#include <cassert>
#include <iostream>

namespace setun {

void test_vm_3way_branching() {
    std::cout << "  [Test] VM 3-Way Branching (-1, 0, +1)...\n";

    auto test_branch = [](int test_val, int expected_res) {
        std::string code = "let result = 0;\n"
                           "let val = " + std::to_string(test_val) + ";\n"
                           "branch (val) {\n"
                           "  case -1: { result = 100; }\n"
                           "  case 0:  { result = 200; }\n"
                           "  case 1:  { result = 300; }\n"
                           "}\n";

        ArenaAllocator arena;
        Lexer lexer(code);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        BytecodeEmitter emitter;
        Chunk chunk = emitter.compile(program);

        VM vm;
        vm.run(chunk);

        assert(vm.globals()[0].as_int() == expected_res);
    };

    // Test negative input
    test_branch(-1, 100);
    test_branch(-42, 100);

    // Test zero input
    test_branch(0, 200);

    // Test positive input
    test_branch(1, 300);
    test_branch(99, 300);

    std::cout << "    -> PASSED: 3-way Branching correctly routed negative, zero, and positive paths!\n";
}

void test_vm_tafpu_script() {
    std::cout << "  [Test] VM Executing TAFPU Algebraic Script...\n";
    std::string code = "let a: taf3 = [1, 1, 0];\n"
                       "let b: taf3 = [1, -1, 0];\n"
                       "let c = a * b;\n"; // c = (1+sqrt(3))*(1-sqrt(3)) = -2

    ArenaAllocator arena;
    Lexer lexer(code);
    auto tokens = lexer.tokenize();

    Parser parser(tokens, arena);
    Program program = parser.parse_program();

    BytecodeEmitter emitter;
    Chunk chunk = emitter.compile(program);

    VM vm;
    vm.run(chunk);

    VMValue c_val = vm.globals()[2];
    assert(c_val.is_tafpu());
    assert(c_val.as_tafpu().a == -2);
    assert(c_val.as_tafpu().b == 0);

    std::cout << "    -> PASSED: TAFPU algebraic multiplication executed seamlessly on Setun-70 VM.\n";
}

} // namespace setun
