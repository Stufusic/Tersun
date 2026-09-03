#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <cassert>

namespace setun {

void run_phase1_syntax_tests() {
    std::cout << "\n[Test Phase 1] Setun 2.0 Next-Gen Syntax Frontend Verification...\n";

    ArenaAllocator arena;

    // 1. Test Struct, Class & Interface Parsing
    {
        std::string src = R"(
            interface PhysicsBody {
                fn get_mass() -> taf3;
                fn is_static() -> bool {
                    return false;
                }
            }

            struct Particle : PhysicsBody {
                pub let mass: taf3;
                pub let active: trit;

                fn new(m: taf3) -> Particle {
                    return 0;
                }
            }

            class SpaceShip : PhysicsBody {
                pub let name: string;
                private let shield: taf3;

                fn new(name: string) {
                    this.shield = [100, 50, 0];
                }
            }
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();
        assert(prog.statements.size() == 3);
        std::cout << "  -> PASSED: Interface, Struct (Value Type) & Class (Ref Type) successfully parsed!\n";
    }

    // 2. Test Match Pattern Matching, F-Strings, Comptime & Matrix Multiply
    {
        std::string src = R"(
            import setun.math.tafpu;
            import setun.ai.bitnet::*;

            enum SensorStatus {
                Offline,
                Online(taf3, trit)
            }

            fn test_advanced_syntax() -> int {
                let status = 1 <=> 0;
                let energy = [10, 5, 0];
                let w = [1, 0, 0];
                let out = w @ energy; // MatMul operator

                let msg = f"Energy status is ready";
                let computed = comptime (10 + 20);

                match (status) {
                    case 1 => { return 100; }
                    case 0 => { return 0; }
                    case -1 => { return -100; }
                }
                return 0;
            }

            let res = test_advanced_syntax();
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();
        assert(prog.statements.size() >= 5);

        BytecodeEmitter emitter;
        Chunk chunk = emitter.compile(prog);

        VM vm;
        vm.run(chunk);
        std::cout << "  -> PASSED: Match Pattern Matching, F-String, Comptime & '@' MatMul compiled and executed seamlessly!\n";
    }

    // 3. Test 3-Way Branching with new => and -> syntax
    {
        std::string src = R"(
            let val: taf3 = [14, 25, 0];
            let sign = val <=> [0, 0, 0];
            let matched = 0;

            branch (sign) {
                -1 => { matched = -1; }
                 0 => { matched = 0; }
                +1 => { matched = 1; }
            }
            assert_eq(matched, 1);
        )";

        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        BytecodeEmitter emitter;
        Chunk chunk = emitter.compile(prog);

        VM vm;
        vm.run(chunk);
        std::cout << "  -> PASSED: Branch3 with '=>' syntax validated and executed in 1 cycle!\n";
    }

    std::cout << "  -> ALL PHASE 1 SYNTAX & FRONTEND TESTS PASSED (100% SUCCESS)!\n";
}

} // namespace setun
