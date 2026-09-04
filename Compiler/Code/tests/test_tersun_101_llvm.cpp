#include "compiler/llvm_emitter.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/monomorphizer.hpp"
#include <iostream>
#include <cassert>

namespace setun {

void run_tersun_101_llvm_tests() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Tersun 1.0.1] Full LLVM AOT Native Backend Verification Suite   \n";
    std::cout << "===================================================================\n\n";

    ArenaAllocator arena;

    // Test 1: Full Primitive Types & Formatting in LLVM IR
    {
        std::cout << "  [Test 1/8] LLVM Primitive Types (i64, double, i1, i16, i8*)...\n";
        std::string src = R"(
            let num: int = 42;
            let pi: float = 3.14159;
            let flag: bool = true;
            let msg: string = "Hello Tersun 1.0.1 LLVM!";
            println(msg);
            println(num);
            println(pi);
            println(flag);
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker checker;
        bool tc_ok = checker.check_program(prog);
        if (!tc_ok) {
            std::cout << "\nDiagnostics:\n" << checker.format_diagnostics(src) << "\n";
        }
        assert(tc_ok);

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("store i64 42") != std::string::npos);
        assert(llvm_ir.find("store double 3.14159") != std::string::npos);
        assert(llvm_ir.find("store i1 1") != std::string::npos);
        assert(llvm_ir.find("Hello Tersun 1.0.1 LLVM!") != std::string::npos);
        assert(llvm_ir.find("call void @tersun_print_str") != std::string::npos);
        assert(llvm_ir.find("call void @tersun_print_i64") != std::string::npos);
        assert(llvm_ir.find("call void @tersun_print_double") != std::string::npos);
        assert(llvm_ir.find("call void @tersun_print_bool") != std::string::npos);
        std::cout << "    -> PASSED: All primitive types and print dispatchers lowered to LLVM SSA!\n";
    }

    // Test 2: TAFPU Exact Arithmetic & Inlined Native Operators in Q(sqrt(3))
    {
        std::cout << "  [Test 2/8] TAFPU Exact Arithmetic in Q(sqrt(3)) (Add, Sub, Mul, Div, Tilde)...\n";
        std::string src = R"(
            let x: taf3 = [14, 25, 0];
            let y: taf3 = [10, 6, 0];
            let sum = x + y;
            let prod = x * y;
            let neg_x = ~x;
            let quotient = x / y;
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker checker;
        assert(checker.check_program(prog));

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("call void @tafpu_add_native") != std::string::npos);
        assert(llvm_ir.find("call void @tafpu_mul_native") != std::string::npos);
        assert(llvm_ir.find("call void @tafpu_tilde_native") != std::string::npos);
        assert(llvm_ir.find("call void @tafpu_div_native") != std::string::npos);
        std::cout << "    -> PASSED: TAFPU Q(sqrt(3)) zero-drift algebra successfully lowered!\n";
    }

    // Test 3: Setun-70 3-Way Branching via LLVM Switch Table
    {
        std::cout << "  [Test 3/8] Setun 3-Way Branching via LLVM switch (trit -1, 0, +1)...\n";
        std::string src = R"(
            let val = 10;
            let res = 0;
            branch (val <=> 0) {
                -1 => { res = -100; }
                 0 => { res = 0; }
                +1 => { res = 100; }
            }
            assert_eq(res, 100);
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("switch i32") != std::string::npos);
        assert(llvm_ir.find("i32 -1") != std::string::npos);
        assert(llvm_ir.find("i32 1") != std::string::npos);
        assert(llvm_ir.find("assert_eq") == std::string::npos);
        assert(llvm_ir.find("call void @abort()") != std::string::npos);
        std::cout << "    -> PASSED: 3-way branch3 lowering with switch table and assert_eq verified!\n";
    }

    // Test 4: While Loop with LLVM Basic Blocks
    {
        std::cout << "  [Test 4/8] While Loop Control Flow (cond, body, exit)...\n";
        std::string src = R"(
            let count = 0;
            let total = 0;
            while (count < 10) {
                total = total + count;
                count = count + 1;
            }
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("while_cond_") != std::string::npos);
        assert(llvm_ir.find("while_body_") != std::string::npos);
        assert(llvm_ir.find("while_exit_") != std::string::npos);
        assert(llvm_ir.find("icmp slt") != std::string::npos);
        std::cout << "    -> PASSED: While loops lowered with clean LLVM block CFG!\n";
    }

    // Test 5: Struct Declaration & Member Access / Mutation
    {
        std::cout << "  [Test 5/8] Struct Type Aggregation & GEP Member Access...\n";
        std::string src = R"(
            struct Player {
                pub let hp: int;
                pub let speed: float;
            }
            let p: Player;
            p.hp = 100;
            let cur_hp = p.hp;
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("%struct.Player = type { i64, double }") != std::string::npos);
        assert(llvm_ir.find("getelementptr inbounds %struct.Player") != std::string::npos);
        assert(llvm_ir.find("store i64 100") != std::string::npos);
        std::cout << "    -> PASSED: Struct layout calculation and GEP access lowered!\n";
    }

    // Test 6: Dynamic Arrays Runtime & Indexing
    {
        std::cout << "  [Test 6/8] Dynamic Arrays (create, push, get, set)...\n";
        std::string src = R"(
            let list = [10, 20, 30, 40];
            let item = list[2];
            list[1] = 99;
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("@tersun_array_create") != std::string::npos);
        assert(llvm_ir.find("@tersun_array_push_i64") != std::string::npos);
        assert(llvm_ir.find("@tersun_array_get_i64") != std::string::npos);
        assert(llvm_ir.find("@tersun_array_set_i64") != std::string::npos);
        std::cout << "    -> PASSED: Dynamic Array operations successfully lowered!\n";
    }

    // Test 7: Function Declarations with Multi-Type Parameters & Returns
    {
        std::cout << "  [Test 7/8] Function Declarations & Signatures...\n";
        std::string src = R"(
            fn compute_score(base: int, bonus: int) -> int {
                return base * 2 + bonus;
            }
            let final_score = compute_score(50, 25);
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_llvm_ir(prog);

        assert(llvm_ir.find("define i64 @compute_score(i64 %param_base, i64 %param_bonus)") != std::string::npos);
        assert(llvm_ir.find("call i64 @compute_score") != std::string::npos);
        std::cout << "    -> PASSED: Typed functions and return statements lowered!\n";
    }

    // Test 8: End-to-End Multi-Arch Target Triples
    {
        std::cout << "  [Test 8/8] Target Triples (x86_64, AArch64, RISCV64, Wasm32)...\n";
        std::string src = R"(
            let x = 123;
            println(x);
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        std::vector<std::string> triples = {
            "x86_64-pc-windows-msvc",
            "aarch64-apple-darwin",
            "riscv64-unknown-linux-gnu",
            "wasm32-unknown-wasi"
        };

        for (const auto& t : triples) {
            TargetConfig cfg;
            cfg.triple = t;
            LLVMEmitter emitter(cfg);
            std::string ir = emitter.emit_llvm_ir(prog);
            assert(ir.find("target triple = \"" + t + "\"") != std::string::npos);
        }
        std::cout << "    -> PASSED: Target triples emitted cleanly for all 4 tier-1 platforms!\n";
    }

    std::cout << "\n===================================================================\n";
    std::cout << "  ALL TERSUN 1.0.1 LLVM AOT TESTS PASSED (8/8 SUCCESS)!            \n";
    std::cout << "===================================================================\n\n";
}

} // namespace setun
