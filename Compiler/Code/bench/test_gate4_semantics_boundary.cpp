#include <iostream>
#include <vector>
#include <string>
#include <cassert>
#include <iomanip>
#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include "vm/opt_bytecode.hpp"
#include "vm/vm.hpp"

using namespace setun;

void test_range_step_zero() {
    std::cout << "[Test 1/6] Testing OP_LOOP_RANGE_FAST zero-step exception guard...\n";
    // Construct a synthetic chunk with OP_LOOP_RANGE_FAST and step=0
    OptimizedChunk opt;
    opt.code.push_back(static_cast<uint8_t>(OpCode::OP_LOOP_RANGE_FAST));
    opt.write_int16(0, 1); // var_slot = 0
    opt.write_int16(1, 1); // stop_slot = 1
    opt.write_int16(2, 1); // step_slot = 2
    opt.write_int16(1, 1); // exit_dist = 1
    opt.code.push_back(static_cast<uint8_t>(OpCode::OP_HALT));

    VM vm;
    vm.locals()[0] = VMValue(static_cast<int64_t>(0));
    vm.locals()[1] = VMValue(static_cast<int64_t>(10));
    vm.locals()[2] = VMValue(static_cast<int64_t>(0)); // step == 0

    bool caught = false;
    try {
        vm.run_optimized(opt);
    } catch (const VMException& e) {
        caught = true;
        assert(std::string(e.what()).find("step cannot be zero") != std::string::npos);
    }
    assert(caught && "Must throw VMException on step == 0");
    std::cout << "  -> PASSED: step=0 correctly throws 'range() step cannot be zero'.\n";
}

void test_loop_range_fast_direction() {
    std::cout << "[Test 2/6] Testing OP_LOOP_RANGE_FAST ascending and descending loops...\n";
    // Ascending: var=0, stop=5, step=1
    {
        OptimizedChunk opt;
        // Loop:
        // [0] OP_LOOP_RANGE_FAST var=0, stop=1, step=2, exit_dist=4 (relative to end of inst @ 9 -> jumps to 13)
        // [9] OP_INCR_LOCAL_IMM slot=0, imm=1
        // [14] OP_JUMP offset=-17 (jumps back to 0)
        // [17] OP_HALT
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_LOOP_RANGE_FAST));
        opt.write_int16(0, 1);
        opt.write_int16(1, 1);
        opt.write_int16(2, 1);
        opt.write_int16(8, 1); // exit jump to HALT
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_INCR_LOCAL_IMM));
        opt.write_int16(0, 1);
        opt.write_int16(1, 1);
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_JUMP));
        opt.write_int16(-17, 1);
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_HALT));

        VM vm;
        vm.locals()[0] = VMValue(static_cast<int64_t>(0));
        vm.locals()[1] = VMValue(static_cast<int64_t>(5));
        vm.locals()[2] = VMValue(static_cast<int64_t>(1));

        vm.run_optimized(opt);
        assert(vm.locals()[0].as_int() == 5);
        assert(vm.telemetry().loop_fast_iterations == 5);
        std::cout << "  -> PASSED: Ascending loop executed 5 fast iterations.\n";
    }

    // Descending: var=5, stop=0, step=-1
    {
        OptimizedChunk opt;
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_LOOP_RANGE_FAST));
        opt.write_int16(0, 1);
        opt.write_int16(1, 1);
        opt.write_int16(2, 1);
        opt.write_int16(8, 1);
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_INCR_LOCAL_IMM));
        opt.write_int16(0, 1);
        opt.write_int16(-1, 1);
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_JUMP));
        opt.write_int16(-17, 1);
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_HALT));

        VM vm;
        vm.locals()[0] = VMValue(static_cast<int64_t>(5));
        vm.locals()[1] = VMValue(static_cast<int64_t>(0));
        vm.locals()[2] = VMValue(static_cast<int64_t>(-1));

        vm.run_optimized(opt);
        assert(vm.locals()[0].as_int() == 0);
        assert(vm.telemetry().loop_fast_iterations == 5);
        std::cout << "  -> PASSED: Descending loop executed 5 fast iterations.\n";
    }
}

void test_int48_overflow_promotion() {
    std::cout << "[Test 3/6] Testing 48-bit immediate integer boundary and heap fallback...\n";
    int64_t max_int48 = VMValue::MAX_INT48; // 2^47 - 1 = 140,737,488,355,327
    int64_t min_int48 = VMValue::MIN_INT48; // -2^47 = -140,737,488,355,328

    VMValue v_max(max_int48);
    assert(v_max.is_immediate_int());
    assert(v_max.as_immediate_int_fast() == max_int48);

    VMValue v_min(min_int48);
    assert(v_min.is_immediate_int());
    assert(v_min.as_immediate_int_fast() == min_int48);

    // Overflowing by 1 must promote to boxed int
    VMValue v_over(max_int48 + 100);
    assert(!v_over.is_immediate_int());
    assert(v_over.is_boxed_int());
    assert(v_over.as_int() == max_int48 + 100);

    // Arithmetic on immediate values overflowing 48-bit range
    VMValue sum = v_max.add(VMValue(static_cast<int64_t>(1)));
    assert(sum.is_boxed_int());
    assert(sum.as_int() == max_int48 + 1);

    std::cout << "  -> PASSED: 48-bit immediate boundary and heap promotion verified.\n";
}

void test_adaptive_quickening_and_deopt() {
    std::cout << "[Test 4/6] Testing adaptive quickening warmup, hits, and deopt recovery...\n";
    std::string loop_code = 
        "fn main() {\n"
        "    let mut s = 0;\n"
        "    for i in range(20) {\n"
        "        s = s + 1;\n"
        "    }\n"
        "}\n";
    ArenaAllocator arena;
    Lexer lexer(loop_code);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();
    BytecodeEmitter emitter;
    Chunk chunk = emitter.compile(prog);

    OptFlags flags;
    flags.enable_quickening = true;
    OptimizedChunk opt = OptBytecodeOptimizer::optimize(chunk, flags);

    VM vm;
    vm.set_opt_flags(flags);
    vm.run_optimized(opt);
    assert(vm.telemetry().quick_hits >= 5); // Quicken kicks in at hit 8
    std::cout << "  -> PASSED: Quickening warmup triggered with " << vm.telemetry().quick_hits << " quick hits.\n";

    // Now test deoptimization: feed a quickened OP_QUICK_ADD_INT a float operand
    OptimizedChunk opt_deopt;
    opt_deopt.code.push_back(static_cast<uint8_t>(OpCode::OP_PUSH_FLOAT));
    double pi = 3.14159;
    uint64_t pi_bits;
    std::memcpy(&pi_bits, &pi, 8);
    opt_deopt.write_int64(static_cast<int64_t>(pi_bits), 1);
    opt_deopt.code.push_back(static_cast<uint8_t>(OpCode::OP_PUSH_INT));
    opt_deopt.write_int64(10, 1);
    size_t quick_add_offset = opt_deopt.code.size();
    opt_deopt.code.push_back(static_cast<uint8_t>(OpCode::OP_QUICK_ADD_INT)); // Trigger deopt
    opt_deopt.code.push_back(static_cast<uint8_t>(OpCode::OP_HALT));

    VM vm2;
    vm2.set_opt_flags(flags);
    vm2.run_optimized(opt_deopt);
    assert(vm2.telemetry().deopt_count == 1);
    assert(opt_deopt.code[quick_add_offset] == static_cast<uint8_t>(OpCode::OP_ADD)); // Deopt patched back to OP_ADD!
    assert(std::abs(vm2.stack().peek().as_float() - 13.14159) < 1e-5);
    std::cout << "  -> PASSED: Quickening deoptimization restored OP_ADD and recovered value 13.14159.\n";
}

void test_shape_ic_hits_and_transitions() {
    std::cout << "[Test 5/6] Testing Shape Inline Caching (Monomorphic hits & Poly fallback)...\n";
    auto obj = std::make_shared<VMObject>();
    obj->type_name = "Point";
    obj->is_class = true;
    obj->set_field("x", VMValue(static_cast<int64_t>(42)));
    obj->set_field("y", VMValue(static_cast<int64_t>(84)));

    assert(obj->shape != nullptr);
    assert(obj->shape->shape_id > 0);
    assert(obj->fields_array.size() == 2);
    assert(obj->fields_array[0].as_int() == 42);
    assert(obj->fields_array[1].as_int() == 84);

    // Build synthetic chunk accessing obj.x 5 times
    OptimizedChunk opt;
    opt.string_table.push_back("x");
    opt.ic_sites.push_back(ICSite{0, 0, 0}); // IC site 0 for "x"

    for (int k = 0; k < 5; ++k) {
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL_0));
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_GET_FIELD_IC));
        opt.write_int16(0, 1); // ic_idx = 0
        opt.code.push_back(static_cast<uint8_t>(OpCode::OP_POP));
    }
    opt.code.push_back(static_cast<uint8_t>(OpCode::OP_HALT));

    VM vm;
    vm.locals()[0] = VMValue(obj);
    vm.run_optimized(opt);

    assert(vm.telemetry().ic_misses == 1); // First access misses and warms shape
    assert(vm.telemetry().ic_hits == 4);   // Next 4 accesses hit cached slot!
    assert(opt.ic_sites[0].expected_shape == obj->shape->shape_id);
    assert(opt.ic_sites[0].cached_slot == 0);
    std::cout << "  -> PASSED: Monomorphic Shape IC: 1 warm miss + 4 direct slot hits.\n";
}

void test_fast_frames_zero_allocation() {
    std::cout << "[Test 6/6] Testing Zero-Allocation Call Frames (Pre-allocated 65,536 window)...\n";
    VM vm;
    size_t init_cap = vm.locals().capacity();
    assert(init_cap >= 65536);

    // Run recursive fibonacci function to depth 25
    std::string fib_code = 
        "fn fib(n: int) -> int {\n"
        "    if (n <= 1) { return n; }\n"
        "    return fib(n - 1) + fib(n - 2);\n"
        "}\n"
        "fn main() {\n"
        "    let res = fib(10);\n"
        "    assert_eq(res, 55);\n"
        "}\n";

    ArenaAllocator arena;
    Lexer lexer(fib_code);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program prog = parser.parse_program();
    BytecodeEmitter emitter;
    Chunk chunk = emitter.compile(prog);

    vm.run_cached(chunk);
    assert(vm.locals().capacity() == init_cap);
    std::cout << "  -> PASSED: Recursive calls executed with zero dynamic vector reallocation.\n";
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 4: Semantics Boundary & Adaptive Execution Verification    \n";
    std::cout << "===================================================================\n";

    test_range_step_zero();
    test_loop_range_fast_direction();
    test_int48_overflow_promotion();
    test_adaptive_quickening_and_deopt();
    test_shape_ic_hits_and_transitions();
    test_fast_frames_zero_allocation();

    std::cout << "===================================================================\n";
    std::cout << "  ALL GATE 4 SEMANTIC BOUNDARY TESTS PASSED (100% SUCCESS)!        \n";
    std::cout << "===================================================================\n";
    return 0;
}
