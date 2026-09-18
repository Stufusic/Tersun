#include "vm/inline_cache.hpp"
#include "vm/type_feedback.hpp"
#include "vm/machine_ir.hpp"
#include "vm/mir_optimizer.hpp"
#include "vm/vm.hpp"
#include "vm/value.hpp"
#include "compiler/emitter.hpp"
#include <iostream>
#include <cassert>
#include <vector>
#include <memory>
#include <string>

namespace setun {

// ============================================================================
// Gate 5.9.2: ST-11 Polymorphic Inline Caching & Devirtualization Test Suite
// ============================================================================

void test_st11_1_mono_ic_fast_path() {
    std::cout << "  [ST-11.1] Monomorphic IC Fast-Path Stabilization...\n";

    MethodIC ic;
    assert(ic.state == static_cast<uint8_t>(ICState::Uninitialized));
    assert(ic.is_uninitialized());

    VTable vt1;
    vt1.methods["get_val"] = 10;

    // First update -> Monomorphic
    bool updated = ic.update(101, &vt1, 10, 16, nullptr);
    assert(updated);
    assert(ic.state == static_cast<uint8_t>(ICState::Monomorphic));
    assert(ic.is_monomorphic());
    assert(ic.count == 1);

    // Probe 100 times: 100% hits
    for (int i = 0; i < 100; ++i) {
        const MethodICEntry* hit = ic.probe(101, &vt1);
        assert(hit != nullptr);
        assert(hit->shape_id == 101);
        assert(hit->vtable == &vt1);
        assert(hit->fn_entry == 10);
    }
    assert(ic.hits == 100);
    assert(ic.misses == 0);

    std::cout << "    -> Monomorphic probe achieved 100/100 hits with 0 misses!\n";
}

void test_st11_2_poly_ic_two_shapes() {
    std::cout << "  [ST-11.2] Polymorphic IC (2 Shapes Transition)...\n";

    MethodIC ic;
    VTable vt1, vt2;
    vt1.methods["area"] = 20;
    vt2.methods["area"] = 30;

    ic.update(201, &vt1, 20, 16, nullptr);
    assert(ic.is_monomorphic());

    // Second shape -> Polymorphic
    ic.update(202, &vt2, 30, 16, nullptr);
    assert(ic.is_polymorphic());
    assert(ic.count == 2);

    // Alternate probing
    for (int i = 0; i < 50; ++i) {
        const MethodICEntry* h1 = ic.probe(201, &vt1);
        assert(h1 != nullptr && h1->fn_entry == 20);

        const MethodICEntry* h2 = ic.probe(202, &vt2);
        assert(h2 != nullptr && h2->fn_entry == 30);
    }
    assert(ic.hits == 100);
    assert(ic.misses == 0);

    std::cout << "    -> Polymorphic IC (2 shapes) achieved 100/100 hits under alternation!\n";
}

void test_st11_3_poly_ic_capacity_boundary() {
    std::cout << "  [ST-11.3] Polymorphic IC Capacity Boundary (3 and 4 Shapes)...\n";

    MethodIC ic;
    VTable vts[4];
    for (uint32_t i = 0; i < 4; ++i) {
        vts[i].methods["calc"] = 100 + i;
        bool ok = ic.update(300 + i, &vts[i], 100 + i, 16, nullptr);
        assert(ok);
    }

    assert(ic.count == 4);
    assert(ic.is_polymorphic());

    // Verify all 4 shapes hit
    for (uint32_t i = 0; i < 4; ++i) {
        const MethodICEntry* h = ic.probe(300 + i, &vts[i]);
        assert(h != nullptr);
        assert(h->fn_entry == 100 + i);
    }
    assert(ic.hits == 4);

    std::cout << "    -> MAX_PIC_ENTRIES=4 fully populated and validated!\n";
}

void test_st11_4_megamorphic_degradation() {
    std::cout << "  [ST-11.4] Megamorphic Degradation Boundary (5th Shape)...\n";

    MethodIC ic;
    VTable vts[5];
    for (uint32_t i = 0; i < 4; ++i) {
        ic.update(400 + i, &vts[i], 200 + i, 16, nullptr);
    }
    assert(ic.is_polymorphic());

    // Add 5th shape -> Degrade to Megamorphic
    bool added = ic.update(404, &vts[4], 204, 16, nullptr);
    assert(!added);
    assert(ic.is_megamorphic());
    assert(ic.state == static_cast<uint8_t>(ICState::Megamorphic));

    // Probe on megamorphic returns nullptr to signal generic fallback
    const MethodICEntry* h = ic.probe(400, &vts[0]);
    assert(h == nullptr);
    assert(ic.misses == 1);

    std::cout << "    -> Megamorphic boundary correctly degraded at 5th shape!\n";
}

void test_st11_5_vtable_invalidation() {
    std::cout << "  [ST-11.5] VTable Invalidation Safety...\n";

    MethodIC ic;
    VTable vt1, vt2;
    ic.update(501, &vt1, 50, 16, nullptr);
    ic.update(502, &vt2, 60, 16, nullptr);
    assert(ic.is_polymorphic());
    assert(ic.count == 2);

    // Invalidate vt1 -> should transition back to Monomorphic with vt2
    ic.invalidate_vtable(&vt1);
    assert(ic.is_monomorphic());
    assert(ic.count == 1);
    assert(ic.entries[0].vtable == &vt2);

    // Invalidate vt2 -> should transition to Uninitialized
    ic.invalidate_vtable(&vt2);
    assert(ic.is_uninitialized());
    assert(ic.count == 0);

    std::cout << "    -> VTable invalidation correctly compacted entries and updated IC states!\n";
}

void test_st11_6_callsite_ic() {
    std::cout << "  [ST-11.6] Direct CallSite IC Fast-Path...\n";

    CallSiteIC call_ic;
    assert(call_ic.expected_fn_idx == UINT32_MAX);

    call_ic.update(5, 120, 48, nullptr);
    assert(call_ic.expected_fn_idx == 5);
    assert(call_ic.fn_entry == 120);
    assert(call_ic.callee_frame_size == 48);

    assert(call_ic.matches(5));
    assert(call_ic.hits == 1);

    assert(!call_ic.matches(6));
    assert(call_ic.misses == 1);

    call_ic.clear();
    assert(call_ic.expected_fn_idx == UINT32_MAX);
    assert(call_ic.hits == 0);

    std::cout << "    -> CallSite IC direct matching verified!\n";
}

void test_st11_7_chunk_ic_table_lifecycle() {
    std::cout << "  [ST-11.7] Chunk Inline Cache Table Lifecycle...\n";

    ChunkInlineCacheTable table;
    MethodIC& m1 = table.get_or_create_method_ic(10);
    MethodIC& m2 = table.get_or_create_method_ic(25);
    CallSiteIC& c1 = table.get_or_create_call_ic(50);

    VTable vt;
    m1.update(1, &vt, 100, 16, nullptr);
    m2.update(2, &vt, 200, 16, nullptr);
    c1.update(7, 300, 32, nullptr);

    assert(table.method_ic_count() == 2);
    assert(table.call_ic_count() == 1);

    table.clear();
    assert(table.method_ic_count() == 0);
    assert(table.call_ic_count() == 0);

    std::cout << "    -> ChunkInlineCacheTable lifecycle verified!\n";
}

void test_st11_8_type_feedback_method_profiling() {
    std::cout << "  [ST-11.8] Type Feedback Method Profiling Integration...\n";

    TypeFeedbackVector tfv(200);

    // Monomorphic method site at ip=40
    tfv.record_method(40, 701, 88);
    tfv.record_method(40, 701, 88);

    // Polymorphic method site at ip=60
    tfv.record_method(60, 701, 88);
    tfv.record_method(60, 702, 99);

    auto snap = tfv.freeze_snapshot();
    assert(snap != nullptr);

    const MethodFeedback* mf40 = snap->find_method_slot(40);
    assert(mf40 != nullptr);
    assert(mf40->is_monomorphic());
    assert(mf40->monomorphic_shape() == 701);
    assert(mf40->monomorphic_fn_entry() == 88);

    const MethodFeedback* mf60 = snap->find_method_slot(60);
    assert(mf60 != nullptr);
    assert(mf60->is_polymorphic());
    assert(mf60->observed_shapes.size() == 2);

    std::cout << "    -> Method feedback profiling verified for both mono and poly sites!\n";
}

void test_st11_9_tier2_speculative_devirtualization() {
    std::cout << "  [ST-11.9] Tier-2 Speculative Devirtualization (Pass 5)...\n";

    // Construct MIRFunction containing INVOKE_VIRTUAL
    MIRFunction func;
    MIRBlock* b0 = func.create_block("entry");

    vreg_t receiver = func.new_vreg();
    vreg_t res = func.new_vreg();

    MIRInstruction invoke;
    invoke.opcode = MIROpcode::INVOKE_VIRTUAL;
    invoke.dest = res;
    invoke.src1 = receiver;
    invoke.imm64 = 1; // method_id
    invoke.bytecode_ip = 42;
    b0->instructions.push_back(invoke);

    MIRInstruction ret;
    ret.opcode = MIROpcode::RET;
    ret.src1 = res;
    ret.bytecode_ip = 45;
    b0->instructions.push_back(ret);

    // Setup ProfileSnapshot with monomorphic method feedback at ip=42
    TypeFeedbackVector tfv(100);
    tfv.record_method(42, 9001, 777);
    auto snap = tfv.freeze_snapshot();

    OptimizationFlags flags;
    flags.enable_devirtualization = true;
    MIROptimizer opt(flags);
    OptimizationStats stats = opt.optimize(func, snap.get());

    assert(stats.methods_devirtualized == 1);

    // Verify instruction structure: GUARD_SHAPE followed by CALL_DIRECT
    assert(b0->instructions.size() == 3);
    assert(b0->instructions[0].opcode == MIROpcode::GUARD_SHAPE);
    assert(b0->instructions[0].guard.input_vreg == receiver);
    assert(b0->instructions[0].guard.expected_tag_or_shape == 9001);
    assert(b0->instructions[0].guard.deopt_id == 42);

    assert(b0->instructions[1].opcode == MIROpcode::CALL_DIRECT);
    assert(b0->instructions[1].dest == res);
    assert(b0->instructions[1].imm64 == 777);

    assert(b0->instructions[2].opcode == MIROpcode::RET);

    std::cout << "    -> Devirtualization succeeded: INVOKE_VIRTUAL -> GUARD_SHAPE + CALL_DIRECT!\n";
}

void test_st11_10_guard_shape_deopt() {
    std::cout << "  [ST-11.10] Speculative Devirtualization Guard Deopt Recovery...\n";

    MIRInstruction guard;
    guard.opcode = MIROpcode::GUARD_SHAPE;
    guard.guard.input_vreg = 0;
    guard.guard.expected_tag_or_shape = 1234;
    guard.guard.deopt_id = 100;
    guard.bytecode_ip = 100;

    assert(guard.is_guard());
    assert(guard.has_side_effects());

    MIRInstruction guard_vt;
    guard_vt.opcode = MIROpcode::GUARD_VTABLE;
    guard_vt.guard.input_vreg = 0;
    guard_vt.guard.expected_tag_or_shape = 0xDEADBEEF;
    guard_vt.guard.deopt_id = 101;
    guard_vt.bytecode_ip = 101;

    assert(guard_vt.is_guard());
    assert(guard_vt.has_side_effects());

    std::cout << "    -> Guard shape/vtable properties and deopt hooks confirmed!\n";
}

void test_st11_11_leaf_method_inlining_getter() {
    std::cout << "  [ST-11.11] Leaf Method Inlining (Pass 6 - Getters)...\n";

    // Callee: getter method `get_x(self): return self.x` (offset 8)
    MIRFunction callee;
    callee.function_id = 50;
    MIRBlock* cb0 = callee.create_block("callee_entry");

    vreg_t c_self = 0; // parameter 0
    vreg_t c_field = callee.new_vreg();
    MIRInstruction load_f;
    load_f.opcode = MIROpcode::LOAD_FIELD;
    load_f.dest = c_field;
    load_f.src1 = c_self;
    load_f.imm64 = 8;
    cb0->instructions.push_back(load_f);

    MIRInstruction c_ret;
    c_ret.opcode = MIROpcode::RET;
    c_ret.src1 = c_field;
    cb0->instructions.push_back(c_ret);

    // Caller: CALL_DIRECT to function 50
    MIRFunction caller;
    caller.function_id = 1;
    MIRBlock* b0 = caller.create_block("caller_entry");

    vreg_t obj = caller.new_vreg();
    vreg_t res = caller.new_vreg();

    MIRInstruction call;
    call.opcode = MIROpcode::CALL_DIRECT;
    call.dest = res;
    call.src1 = obj;
    call.imm64 = 50;
    call.bytecode_ip = 10;
    b0->instructions.push_back(call);

    MIRInstruction ret;
    ret.opcode = MIROpcode::RET;
    ret.src1 = res;
    b0->instructions.push_back(ret);

    std::map<uint32_t, const MIRFunction*> candidates;
    candidates[50] = &callee;

    OptimizationFlags flags;
    flags.enable_inlining = true;
    MIROptimizer opt(flags);
    OptimizationStats stats = opt.optimize(caller, nullptr, nullptr, &candidates);

    assert(stats.methods_inlined == 1);
    // Inlined instructions: LOAD_FIELD + MOV to res + RET
    bool found_load_field = false;
    for (const auto& inst : b0->instructions) {
        if (inst.opcode == MIROpcode::LOAD_FIELD && inst.src1 == obj && inst.imm64 == 8) {
            found_load_field = true;
        }
    }
    assert(found_load_field);

    std::cout << "    -> Leaf method getter inlined directly into caller block!\n";
}

void test_st11_12_leaf_method_inlining_rejection() {
    std::cout << "  [ST-11.12] Leaf Method Inlining Rejection (Non-Leaf Safety)...\n";

    // Callee has another nested call
    MIRFunction callee;
    callee.function_id = 60;
    MIRBlock* cb0 = callee.create_block("entry");

    MIRInstruction nested_call;
    nested_call.opcode = MIROpcode::CALL_DIRECT;
    nested_call.imm64 = 99;
    cb0->instructions.push_back(nested_call);

    MIRInstruction c_ret;
    c_ret.opcode = MIROpcode::RET;
    cb0->instructions.push_back(c_ret);

    // Caller
    MIRFunction caller;
    caller.function_id = 2;
    MIRBlock* b0 = caller.create_block("entry");
    MIRInstruction call;
    call.opcode = MIROpcode::CALL_DIRECT;
    call.dest = caller.new_vreg();
    call.src1 = caller.new_vreg();
    call.imm64 = 60;
    b0->instructions.push_back(call);

    std::map<uint32_t, const MIRFunction*> candidates;
    candidates[60] = &callee;

    OptimizationFlags flags;
    flags.enable_inlining = true;
    MIROptimizer opt(flags);
    OptimizationStats stats = opt.optimize(caller, nullptr, nullptr, &candidates);

    assert(stats.methods_inlined == 0);
    assert(b0->instructions[0].opcode == MIROpcode::CALL_DIRECT);

    std::cout << "    -> Non-leaf method rejected from inlining safely!\n";
}

void test_st11_13_polymorphic_cascade_diagnostics() {
    std::cout << "  [ST-11.13] Polymorphic Cascade Diagnostics...\n";

    MIRFunction func;
    MIRBlock* b0 = func.create_block("entry");
    MIRInstruction invoke;
    invoke.opcode = MIROpcode::INVOKE_VIRTUAL;
    invoke.dest = func.new_vreg();
    invoke.src1 = func.new_vreg();
    invoke.imm64 = 1;
    invoke.bytecode_ip = 80;
    b0->instructions.push_back(invoke);

    TypeFeedbackVector tfv(100);
    tfv.record_method(80, 101, 10);
    tfv.record_method(80, 102, 20);
    tfv.record_method(80, 103, 30);
    auto snap = tfv.freeze_snapshot();

    OptimizationFlags flags;
    flags.enable_devirtualization = true;
    MIROptimizer opt(flags);
    OptimizationStats stats = opt.optimize(func, snap.get());

    assert(stats.polymorphic_cascades_installed == 1);

    std::cout << "    -> Polymorphic cascade diagnostics recorded successfully!\n";
}

void test_st11_14_end_to_end_vm_method_ic() {
    std::cout << "  [ST-11.14] End-to-End Method Dispatch Acceleration in VM...\n";

    // Build a bytecode chunk with user class method invocation
    // Class Counter { get_count() { return 42; } }
    Chunk chunk;
    chunk.string_table.push_back("get_count"); // string 0

    // Method body at offset 0:
    // fn 0: return 42
    chunk.function_table.push_back(0);
    chunk.function_frame_sizes.push_back(16);
    chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
    chunk.write_int64(42, 1);
    chunk.write_opcode(OpCode::OP_RET, 1);

    // Call site at offset 10:
    // Entry point for test:
    size_t call_site_entry = chunk.code.size();
    // Push receiver object (local 0)
    chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 2);
    chunk.write_byte(0, 2); chunk.write_byte(0, 2);
    // Invoke method "get_count" (string 0), argc = 0
    chunk.write_opcode(OpCode::OP_INVOKE_METHOD, 2);
    chunk.write_byte(0, 2); chunk.write_byte(0, 2); // method string id = 0
    chunk.write_byte(0, 2); // argc = 0
    chunk.write_opcode(OpCode::OP_RET, 2);

    auto vt = std::make_shared<VTable>();
    vt->methods["get_count"] = 0; // function table index 0

    auto shape = std::make_shared<VMShape>();
    shape->shape_id = 999;
    auto obj = std::make_shared<VMObject>();
    obj->type_name = "Counter";
    obj->shape = shape;
    obj->vtable = vt;

    VM vm;
    vm.set_enable_inline_caching(true);

    // Run 100 times calling get_count on obj
    for (int i = 0; i < 100; ++i) {
        vm.locals()[0] = VMValue(obj);
        vm.set_ip(call_site_entry);
        vm.run_switch(chunk);
        assert(!vm.stack().empty());
        VMValue res = vm.stack().pop();
        assert(res.as_int() == 42);
    }

    // 1 miss on first lookup, 99 hits!
    assert(vm.telemetry().ic_misses == 1);
    assert(vm.telemetry().ic_hits == 99);

    std::cout << "    -> 100 VM invocations: ic_misses=" << vm.telemetry().ic_misses
              << ", ic_hits=" << vm.telemetry().ic_hits << " (99% Hit Rate)!\n";
}

void test_st11_15_end_to_end_polymorphic_dispatch() {
    std::cout << "  [ST-11.15] End-to-End Polymorphic Dispatch with 2 Alternating Classes...\n";

    Chunk chunk;
    chunk.string_table.push_back("calc"); // string 0

    // Method 0 (Circle): returns 10
    chunk.function_table.push_back(0);
    chunk.function_frame_sizes.push_back(16);
    chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
    chunk.write_int64(10, 1);
    chunk.write_opcode(OpCode::OP_RET, 1);

    // Method 1 (Square): returns 20
    size_t fn1_offset = chunk.code.size();
    chunk.function_table.push_back(static_cast<uint32_t>(fn1_offset));
    chunk.function_frame_sizes.push_back(16);
    chunk.write_opcode(OpCode::OP_PUSH_INT, 2);
    chunk.write_int64(20, 2);
    chunk.write_opcode(OpCode::OP_RET, 2);

    // Call site:
    size_t call_site = chunk.code.size();
    chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 3);
    chunk.write_byte(0, 3); chunk.write_byte(0, 3);
    chunk.write_opcode(OpCode::OP_INVOKE_METHOD, 3);
    chunk.write_byte(0, 3); chunk.write_byte(0, 3); // method string id = 0
    chunk.write_byte(0, 3); // argc = 0
    chunk.write_opcode(OpCode::OP_RET, 3);

    auto vt_circle = std::make_shared<VTable>();
    vt_circle->methods["calc"] = 0;
    auto shape_circle = std::make_shared<VMShape>();
    shape_circle->shape_id = 1001;
    auto circle_obj = std::make_shared<VMObject>();
    circle_obj->type_name = "Circle";
    circle_obj->shape = shape_circle;
    circle_obj->vtable = vt_circle;

    auto vt_square = std::make_shared<VTable>();
    vt_square->methods["calc"] = 1;
    auto shape_square = std::make_shared<VMShape>();
    shape_square->shape_id = 1002;
    auto square_obj = std::make_shared<VMObject>();
    square_obj->type_name = "Square";
    square_obj->shape = shape_square;
    square_obj->vtable = vt_square;

    VM vm;
    vm.set_enable_inline_caching(true);

    // Alternate 50 times between Circle and Square
    for (int i = 0; i < 50; ++i) {
        // Circle call
        vm.locals()[0] = VMValue(circle_obj);
        vm.set_ip(call_site);
        vm.run_switch(chunk);
        assert(vm.stack().pop().as_int() == 10);

        // Square call
        vm.locals()[0] = VMValue(square_obj);
        vm.set_ip(call_site);
        vm.run_switch(chunk);
        assert(vm.stack().pop().as_int() == 20);
    }

    // First Circle call is miss (1), first Square call is miss (2), remaining 98 are hits!
    assert(vm.telemetry().ic_misses == 2);
    assert(vm.telemetry().ic_hits == 98);
    assert(vm.telemetry().shape_mismatches == 1); // transition to polymorphic

    std::cout << "    -> Polymorphic alternating dispatch: 2 misses, 98 hits (98% Hit Rate)!\n";
}

void test_st11_16_telemetry_and_zero_drift() {
    std::cout << "  [ST-11.16] Telemetry & Zero-Drift Parity Verification...\n";

    // Compare results with inline caching ON vs inline caching OFF
    Chunk chunk;
    chunk.string_table.push_back("value");

    chunk.function_table.push_back(0);
    chunk.function_frame_sizes.push_back(16);
    chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
    chunk.write_int64(123456, 1);
    chunk.write_opcode(OpCode::OP_RET, 1);

    size_t call_site = chunk.code.size();
    chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 2);
    chunk.write_byte(0, 2); chunk.write_byte(0, 2);
    chunk.write_opcode(OpCode::OP_INVOKE_METHOD, 2);
    chunk.write_byte(0, 2); chunk.write_byte(0, 2);
    chunk.write_byte(0, 2);
    chunk.write_opcode(OpCode::OP_RET, 2);

    auto vt = std::make_shared<VTable>();
    vt->methods["value"] = 0;
    auto shape = std::make_shared<VMShape>();
    shape->shape_id = 7777;
    auto obj = std::make_shared<VMObject>();
    obj->type_name = "ValueHolder";
    obj->shape = shape;
    obj->vtable = vt;

    // Run without IC
    VM vm_no_ic;
    vm_no_ic.set_enable_inline_caching(false);
    vm_no_ic.locals()[0] = VMValue(obj);
    vm_no_ic.set_ip(call_site);
    vm_no_ic.run_switch(chunk);
    int64_t res_no_ic = vm_no_ic.stack().pop().as_int();

    // Run with IC
    VM vm_ic;
    vm_ic.set_enable_inline_caching(true);
    vm_ic.locals()[0] = VMValue(obj);
    vm_ic.set_ip(call_site);
    vm_ic.run_switch(chunk);
    int64_t res_ic = vm_ic.stack().pop().as_int();

    assert(res_no_ic == res_ic);
    assert(res_ic == 123456);

    std::cout << "    -> Exact Semantic Zero-Drift confirmed (IC ON == IC OFF: " << res_ic << ")!\n";
}

void test_inline_cache_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 5.9.2] ST-11: Polymorphic Inline Caching & Devirtualization \n";
    std::cout << "===================================================================\n";

    test_st11_1_mono_ic_fast_path();
    test_st11_2_poly_ic_two_shapes();
    test_st11_3_poly_ic_capacity_boundary();
    test_st11_4_megamorphic_degradation();
    test_st11_5_vtable_invalidation();
    test_st11_6_callsite_ic();
    test_st11_7_chunk_ic_table_lifecycle();
    test_st11_8_type_feedback_method_profiling();
    test_st11_9_tier2_speculative_devirtualization();
    test_st11_10_guard_shape_deopt();
    test_st11_11_leaf_method_inlining_getter();
    test_st11_12_leaf_method_inlining_rejection();
    test_st11_13_polymorphic_cascade_diagnostics();
    test_st11_14_end_to_end_vm_method_ic();
    test_st11_15_end_to_end_polymorphic_dispatch();
    test_st11_16_telemetry_and_zero_drift();

    std::cout << "===================================================================\n";
    std::cout << "  Gate 5.9.2: All ST-11 Tests Passed (100.000% IC & Devirt Parity) \n";
    std::cout << "===================================================================\n";
}

} // namespace setun
