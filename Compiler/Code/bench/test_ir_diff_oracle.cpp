#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/tree_canonicalize.hpp"
#include "compiler/tree_optimizer.hpp"
#include "compiler/opt_ir.hpp"
#include "compiler/cfg.hpp"
#include "compiler/ir_optimizer.hpp"
#include "compiler/ir_to_bytecode.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <cassert>

using namespace setun;

struct TestCase {
    std::string name;
    std::string source;
};

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 5.5: DIFFERENTIAL VM TESTING SUITE (AST vs IR-TO-BYTECODE)\n";
    std::cout << "===================================================================\n\n";

    std::vector<TestCase> test_cases = {
        {
            "T1: Arithmetic & Operator Precedence",
            "let a = 10 + 20 * 30 - (40 / 2);\n"
            "println(a);\n"
        },
        {
            "T2: Bitwise & Logical Operations",
            "let a = 123;\n"
            "let b = 456;\n"
            "let c = (a & b) | (a ^ b);\n"
            "println(c);\n"
        },
        {
            "T3: Conditional Branching (If-Else)",
            "let x = 50;\n"
            "let y = 100;\n"
            "if (x < y) {\n"
            "    println(1);\n"
            "} else {\n"
            "    println(0);\n"
            "}\n"
        },
        {
            "T4: While Loop Accumulator",
            "let sum = 0;\n"
            "let i = 0;\n"
            "while (i <= 100) {\n"
            "    sum = sum + i;\n"
            "    i = i + 1;\n"
            "}\n"
            "println(sum);\n"
        },
        {
            "T5: Nested While Loops",
            "let count = 0;\n"
            "let i = 0;\n"
            "while (i < 20) {\n"
            "    let j = 0;\n"
            "    while (j < 15) {\n"
            "        count = count + 1;\n"
            "        j = j + 1;\n"
            "    }\n"
            "    i = i + 1;\n"
            "}\n"
            "println(count);\n"
        },
        {
            "T6: Function Calls with Multiple Parameters",
            "fn compute(a: int, b: int, c: int) -> int {\n"
            "    return a * 100 + b * 10 + c;\n"
            "}\n"
            "fn main() {\n"
            "    let res = compute(3, 7, 9);\n"
            "    println(res);\n"
            "}\n"
        },
        {
            "T7: Recursive Fibonacci (N=14)",
            "fn fib(n: int) -> int {\n"
            "    if (n <= 1) { return n; }\n"
            "    return fib(n - 1) + fib(n - 2);\n"
            "}\n"
            "fn main() {\n"
            "    println(fib(14));\n"
            "}\n"
        },
        {
            "T8: Factorial with Recursion",
            "fn fact(n: int) -> int {\n"
            "    if (n <= 1) { return 1; }\n"
            "    return n * fact(n - 1);\n"
            "}\n"
            "fn main() {\n"
            "    println(fact(8));\n"
            "}\n"
        },
        {
            "T9: Dynamic Array Literal & Index Mutation",
            "fn main() {\n"
            "    let arr = [10, 20, 30, 40, 50];\n"
            "    arr[2] = 99;\n"
            "    let sum = arr[0] + arr[1] + arr[2] + arr[3] + arr[4];\n"
            "    println(sum);\n"
            "}\n"
        },
        {
            "T10: Local CSE & Redundant Subexpression Elimination",
            "let a = 12;\n"
            "let b = 34;\n"
            "let c = (a * b + 7) + (a * b + 7) + (a * b + 7);\n"
            "println(c);\n"
        },
        {
            "T11: Copy Propagation & Dead Variable Elimination",
            "let x = 100;\n"
            "let y = x;\n"
            "let z = y;\n"
            "let dead = 999 * 888;\n"
            "println(z + 50);\n"
        },
        {
            "T12: Multi-Path If-Else Control Flow",
            "let score = 85;\n"
            "if (score >= 90) {\n"
            "    println(1);\n"
            "} else if (score >= 80) {\n"
            "    println(2);\n"
            "} else {\n"
            "    println(3);\n"
            "}\n"
        }
    };

    size_t passed = 0;
    size_t total_ast_bytes = 0;
    size_t total_ir_bytes = 0;

    for (size_t i = 0; i < test_cases.size(); ++i) {
        const auto& tc = test_cases[i];
        std::cout << "[" << std::setw(2) << (i + 1) << "/" << test_cases.size() << "] Testing: " << tc.name << "... ";

        // 1. Parse AST
        ArenaAllocator arena;
        Lexer lexer(tc.source);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog_ast = parser.parse_program();

        // Separate copy for IR pipeline to ensure zero cross-talk
        ArenaAllocator arena_ir;
        Lexer lexer_ir(tc.source);
        auto tokens_ir = lexer_ir.tokenize();
        Parser parser_ir(tokens_ir, arena_ir);
        Program prog_ir = parser_ir.parse_program();

        // 2. Oracle Pipeline: AST -> BytecodeEmitter
        BytecodeEmitter ast_emitter;
        Chunk chunk_ast = ast_emitter.compile(prog_ast);

        VM vm_ast;
        vm_ast.set_dispatch_mode(DispatchMode::FUNCTION_POINTER);
        vm_ast.run(chunk_ast);
        std::string out_ast = vm_ast.last_output();

        // 3. New Pipeline: AST -> TreeOpt -> Linear IR -> IROpt -> IRToBytecodeEmitter
        TreeCanonicalizer::canonicalize_program(prog_ir, arena_ir);
        TreeOptimizer tree_opt(arena_ir);
        tree_opt.optimize_program(prog_ir);

        IRBuilder ir_builder;
        IRModule ir_mod = ir_builder.build_module(prog_ir);

        IROptimizer ir_opt;
        ir_opt.optimize_module(ir_mod);

        IRToBytecodeEmitter ir_emitter;
        Chunk chunk_ir = ir_emitter.emit(ir_mod);

        VM vm_ir;
        vm_ir.set_dispatch_mode(DispatchMode::FUNCTION_POINTER);
        vm_ir.run(chunk_ir);
        std::string out_ir = vm_ir.last_output();

        total_ast_bytes += chunk_ast.code.size();
        total_ir_bytes += chunk_ir.code.size();

        // 4. Differential Verification
        if (out_ast != out_ir) {
            std::cout << "\n[FAILED] Output Mismatch!\n";
            std::cout << "  Oracle (AST) Output: [" << out_ast << "]\n";
            std::cout << "  IR Emitter   Output: [" << out_ir << "]\n";
            std::cout << "\n--- IR MODULE DUMP ---\n" << ir_mod.dump() << "\n";
            std::cout << "\n--- IR BYTECODE DISASM ---\n" << chunk_ir.disassemble("main") << "\n";
            std::cerr << "Verification failed on " << tc.name << "\n";
            return 1;
        }

        std::cout << "PASS (Oracle == IR: [" << out_ast.substr(0, out_ast.find('\n')) << "]) "
                  << "[Bytecode: AST=" << chunk_ast.code.size() << "B, IR=" << chunk_ir.code.size() << "B]\n";
        passed++;
    }

    double reduction = 0.0;
    if (total_ast_bytes > 0) {
        reduction = 100.0 * (1.0 - (double)total_ir_bytes / (double)total_ast_bytes);
    }

    std::cout << "\n===================================================================\n";
    std::cout << "  DIFFERENTIAL VERIFICATION SUMMARY:\n";
    std::cout << "  Passed: " << passed << " / " << test_cases.size() << " (100% PARITY)\n";
    std::cout << "  Bytecode Size Comparison: AST Total = " << total_ast_bytes 
              << " Bytes, IR Total = " << total_ir_bytes << " Bytes\n";
    std::cout << "  Parity Status: ZERO COMPILER REGRESSION!\n";
    std::cout << "===================================================================\n";

    return 0;
}
