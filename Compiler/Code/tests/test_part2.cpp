#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"
#include <cassert>
#include <iostream>
#include <fstream>
#include <filesystem>

namespace setun {

// Module 5 - Test Case 1: Variable Scoping
void test_part2_variable_scoping() {
    std::cout << "  [Test] Module 5 - Test Case 1: Variable Scoping...\n";
    std::string code = 
        "let x = 10;\n"
        "let y = 20;\n"
        "{\n"
        "    let x = 99;\n"
        "    let inner = 500;\n"
        "    y = x + inner;\n" // y = 99 + 500 = 599
        "}\n"
        "x = x + 1;\n"; // outer x should be 10 + 1 = 11

    ArenaAllocator arena;
    Lexer lexer(code);
    auto tokens = lexer.tokenize();

    Parser parser(tokens, arena);
    Program program = parser.parse_program();

    BytecodeEmitter emitter;
    Chunk chunk = emitter.compile(program);

    VM vm;
    vm.run(chunk);

    assert(vm.globals()[0].as_int() == 11);
    assert(vm.globals()[1].as_int() == 599);
    std::cout << "    -> PASSED: Nested scope shadowing and assignment executed properly!\n";
}

// Module 5 - Test Case 2: Nested 3-Way Branching
void test_part2_nested_branch3() {
    std::cout << "  [Test] Module 5 - Test Case 2: Nested 3-Way Branching (with -> syntax)...\n";
    std::string code = 
        "let res = 0;\n"
        "let a = -1;\n"
        "let b = 1;\n"
        "branch (a) {\n"
        "    -1 -> {\n"
        "        branch (b) {\n"
        "            -1 -> { res = 11; }\n"
        "             0 -> { res = 12; }\n"
        "            +1 -> { res = 13; }\n"
        "        }\n"
        "    }\n"
        "     0 -> { res = 20; }\n"
        "    +1 -> { res = 30; }\n"
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

    assert(vm.globals()[0].as_int() == 13);
    std::cout << "    -> PASSED: Nested 3-way branching with backpatching routed to res = 13 accurately!\n";
}

// Module 5 - Test Case 3: Recursive TAFPU Functions
void test_part2_recursive_tafpu_function() {
    std::cout << "  [Test] Module 5 - Test Case 3: Recursive TAFPU Functions in Q(sqrt(3))...\n";
    // Recursive algebraic power: power([1, 1, 0], n)
    // (1 + sqrt(3))^2 = (1 + 3) + 2*sqrt(3) = 4 + 2*sqrt(3)
    // (1 + sqrt(3))^3 = (4 + 2*sqrt(3))*(1 + sqrt(3)) = (4 + 6) + (4 + 2)*sqrt(3) = 10 + 6*sqrt(3)
    std::string code = 
        "fn tafpu_power(base: taf3, n: int) -> taf3 {\n"
        "    if (n <= 0) {\n"
        "        return [1, 0, 0];\n"
        "    }\n"
        "    return base * tafpu_power(base, n - 1);\n"
        "}\n"
        "let x: taf3 = [1, 1, 0];\n"
        "let p3 = tafpu_power(x, 3);\n";

    ArenaAllocator arena;
    Lexer lexer(code);
    auto tokens = lexer.tokenize();

    Parser parser(tokens, arena);
    Program program = parser.parse_program();

    BytecodeEmitter emitter;
    Chunk chunk = emitter.compile(program);

    VM vm;
    vm.run(chunk);

    VMValue p3_val = vm.globals()[1];
    assert(p3_val.is_tafpu());
    assert(p3_val.as_tafpu().a == 10);
    assert(p3_val.as_tafpu().b == 6);
    assert(p3_val.as_tafpu().s == 0);
    std::cout << "    -> PASSED: Recursive TAFPU power calculation returned exact [10, 6, 0] (10 + 6*sqrt(3))!\n";
}

// Module 5 - Test Case 4: Pipeline Toàn diện (End-to-End Compile to .tbc & Run)
void test_part2_end_to_end_binary() {
    std::cout << "  [Test] Module 5 - Test Case 4: End-to-End Binary (.tbc) Serialization & VM Execution...\n";
    std::string code = 
        "let a: taf3 = [1, 1, 0];\n"
        "let b: taf3 = [1, -1, 0];\n"
        "let c = a * b;\n" // c = -2
        "let status = 0;\n"
        "branch (c) {\n"
        "    -1 -> { status = 42; }\n"
        "     0 -> { status = 99; }\n"
        "    +1 -> { status = 100; }\n"
        "}\n";

    ArenaAllocator arena;
    Lexer lexer(code);
    auto tokens = lexer.tokenize();

    Parser parser(tokens, arena);
    Program program = parser.parse_program();

    BytecodeEmitter emitter;
    Chunk original_chunk = emitter.compile(program);

    // Save to binary .tbc file
    std::string test_tbc_file = "test_pipeline.tbc";
    bool saved = original_chunk.save_to_file(test_tbc_file);
    assert(saved);

    // Load from binary .tbc file
    Chunk loaded_chunk;
    bool loaded = Chunk::load_from_file(test_tbc_file, loaded_chunk);
    assert(loaded);
    assert(loaded_chunk.code.size() == original_chunk.code.size());

    // Execute loaded chunk in VM
    VM vm;
    vm.run(loaded_chunk);

    assert(vm.globals()[3].as_int() == 42);

    // Clean up temporary binary test file
    std::filesystem::remove(test_tbc_file);
    std::cout << "    -> PASSED: Full binary .tbc compile, serialize, deserialize, and execution pipeline verified!\n";
}

} // namespace setun
