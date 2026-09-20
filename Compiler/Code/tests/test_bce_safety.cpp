#include "vm/induction_variable.hpp"
#include "vm/mir_optimizer.hpp"
#include "vm/machine_ir.hpp"
#include "vm/array_storage.hpp"
#include "vm/jit_runtime_helpers.hpp"
#include <iostream>
#include <cassert>
#include <vector>
#include <memory>

namespace setun {

void run_bce_safety_tests() {
    std::cout << "\n===================================================================\n";
    std::cout << "  G6R.2.4 BCE & Range Propagation Negative/Positive Safety Tests   \n";
    std::cout << "===================================================================\n";

    // Test 1: Induction Variable Analyzer Basic Detection
    {
        std::cout << "  [Test 1] IVA Loop & Induction Variable Detection... ";
        MIRFunction func;
        func.next_vreg = 10;

        // Block 0: Preheader (entry)
        auto b0 = std::make_unique<MIRBlock>(0);
        MIRInstruction inst_arr;
        inst_arr.opcode = MIROpcode::CONST_INT;
        inst_arr.dest = 1; // arr_vreg
        inst_arr.imm64 = 0;
        b0->instructions.push_back(inst_arr);

        MIRInstruction jmp_b1;
        jmp_b1.opcode = MIROpcode::JMP;
        jmp_b1.target_block = 1;
        b0->instructions.push_back(jmp_b1);
        b0->successors.push_back(1);

        // Block 1: Header
        auto b1 = std::make_unique<MIRBlock>(1);
        b1->is_loop_header = true;
        b1->predecessors.push_back(0);
        b1->predecessors.push_back(2);

        MIRInstruction cmp_inst;
        cmp_inst.opcode = MIROpcode::INT_SUB;
        cmp_inst.src1 = 2; // iv (mult)
        cmp_inst.src2 = 3; // limit (1000)
        cmp_inst.cond = MIRCondition::LE;
        b1->instructions.push_back(cmp_inst);

        MIRInstruction jcc_inst;
        jcc_inst.opcode = MIROpcode::JCC;
        jcc_inst.src1 = 2;
        jcc_inst.cond = MIRCondition::LE;
        jcc_inst.target_block = 2;
        b1->instructions.push_back(jcc_inst);
        b1->successors.push_back(2);
        b1->successors.push_back(3);

        // Block 2: Body + Backedge
        auto b2 = std::make_unique<MIRBlock>(2);
        b2->predecessors.push_back(1);

        MIRInstruction store_inst;
        store_inst.opcode = MIROpcode::STORE_ELEMENT;
        store_inst.src1 = 1; // arr
        store_inst.src2 = 2; // iv
        store_inst.src3 = 4; // val
        b2->instructions.push_back(store_inst);

        MIRInstruction add_inst;
        add_inst.opcode = MIROpcode::INT_ADD;
        add_inst.dest = 2;
        add_inst.src1 = 2;
        add_inst.imm64 = 5; // constant step +5
        b2->instructions.push_back(add_inst);

        MIRInstruction back_jmp;
        back_jmp.opcode = MIROpcode::JMP;
        back_jmp.target_block = 1;
        b2->instructions.push_back(back_jmp);
        b2->successors.push_back(1);

        // Block 3: Exit
        auto b3 = std::make_unique<MIRBlock>(3);
        b3->predecessors.push_back(1);
        MIRInstruction ret_inst;
        ret_inst.opcode = MIROpcode::RET;
        b3->instructions.push_back(ret_inst);

        func.blocks.push_back(std::move(b0));
        func.blocks.push_back(std::move(b1));
        func.blocks.push_back(std::move(b2));
        func.blocks.push_back(std::move(b3));

        auto loops = InductionVariableAnalyzer::analyze_loops(func);
        assert(loops.size() == 1);
        assert(loops[0].has_preheader);
        assert(loops[0].preheader_block_id == 0);
        assert(loops[0].invariants.count(1)); // arr is invariant
        assert(loops[0].induction_vars.count(2)); // vreg 2 is IV
        const auto& iv = loops[0].induction_vars.at(2);
        assert(iv.is_non_negative);
        assert(iv.step == 5);
        std::cout << "PASSED (Found natural loop, IV step=5, preheader=0)\n";
    }

    // Test 2: Positive BCE Transformation
    {
        std::cout << "  [Test 2] Positive BCE Transformation (STORE_ELEMENT -> STORE_ELEMENT_RAW)... ";
        MIRFunction func;
        func.next_vreg = 10;

        auto b0 = std::make_unique<MIRBlock>(0);
        MIRInstruction jmp_b1;
        jmp_b1.opcode = MIROpcode::JMP;
        jmp_b1.target_block = 1;
        b0->instructions.push_back(jmp_b1);
        b0->successors.push_back(1);

        auto b1 = std::make_unique<MIRBlock>(1);
        b1->is_loop_header = true;
        b1->predecessors.push_back(0);
        b1->predecessors.push_back(2);

        MIRInstruction cmp_inst;
        cmp_inst.opcode = MIROpcode::INT_SUB;
        cmp_inst.src1 = 2; // iv (mult)
        cmp_inst.src2 = 3; // limit (1000)
        cmp_inst.cond = MIRCondition::LE;
        b1->instructions.push_back(cmp_inst);

        MIRInstruction jcc_inst;
        jcc_inst.opcode = MIROpcode::JCC;
        jcc_inst.src1 = 2; // iv
        jcc_inst.cond = MIRCondition::LE;
        jcc_inst.target_block = 2;
        b1->instructions.push_back(jcc_inst);
        b1->successors.push_back(2);
        b1->successors.push_back(3);

        auto b2 = std::make_unique<MIRBlock>(2);
        b2->predecessors.push_back(1);

        MIRInstruction store_inst;
        store_inst.opcode = MIROpcode::STORE_ELEMENT;
        store_inst.src1 = 1; // arr
        store_inst.src2 = 2; // iv
        store_inst.src3 = 4; // val
        b2->instructions.push_back(store_inst);

        MIRInstruction add_inst;
        add_inst.opcode = MIROpcode::INT_ADD;
        add_inst.dest = 2;
        add_inst.src1 = 2;
        add_inst.imm64 = 2; // step +2
        b2->instructions.push_back(add_inst);

        MIRInstruction back_jmp;
        back_jmp.opcode = MIROpcode::JMP;
        back_jmp.target_block = 1;
        b2->instructions.push_back(back_jmp);
        b2->successors.push_back(1);

        auto b3 = std::make_unique<MIRBlock>(3);
        b3->predecessors.push_back(1);
        MIRInstruction ret_inst;
        ret_inst.opcode = MIROpcode::RET;
        b3->instructions.push_back(ret_inst);

        func.blocks.push_back(std::move(b0));
        func.blocks.push_back(std::move(b1));
        func.blocks.push_back(std::move(b2));
        func.blocks.push_back(std::move(b3));

        OptimizationFlags flags;
        flags.enable_bce = true;
        MIROptimizer opt(flags);
        uint32_t elim = opt.run_bounds_check_elimination(func);
        assert(elim == 1);
        assert(func.blocks[2]->instructions[0].opcode == MIROpcode::STORE_ELEMENT_RAW);
        // Preheader should contain hoisted CALL_RUNTIME for raw data pointer
        assert(func.blocks[0]->instructions.size() == 2);
        assert(func.blocks[0]->instructions[0].opcode == MIROpcode::CALL_RUNTIME);
        assert(func.blocks[0]->instructions[0].imm64 == 0xAA01);
        assert(func.blocks[0]->instructions[1].opcode == MIROpcode::JMP); // Terminator preserved at end
        std::cout << "PASSED (Eliminated bounds check, hoisted pointer before terminator)\n";
    }

    // Test 3: Negative OOB Test - Dynamic Nonlinear / Non-Invariant Array
    {
        std::cout << "  [Test 3] Negative Safety Test (Dynamic Array Modified in Loop)... ";
        MIRFunction func;
        func.next_vreg = 10;

        auto b0 = std::make_unique<MIRBlock>(0);
        MIRInstruction jmp_b1;
        jmp_b1.opcode = MIROpcode::JMP;
        jmp_b1.target_block = 1;
        b0->instructions.push_back(jmp_b1);
        b0->successors.push_back(1);

        auto b1 = std::make_unique<MIRBlock>(1);
        b1->is_loop_header = true;
        b1->predecessors.push_back(0);
        b1->predecessors.push_back(2);

        auto b2 = std::make_unique<MIRBlock>(2);
        b2->predecessors.push_back(1);

        // In this loop, arr vreg 1 is re-assigned inside the loop body!
        MIRInstruction reassign_arr;
        reassign_arr.opcode = MIROpcode::CONST_INT;
        reassign_arr.dest = 1;
        reassign_arr.imm64 = 42;
        b2->instructions.push_back(reassign_arr);

        MIRInstruction store_inst;
        store_inst.opcode = MIROpcode::STORE_ELEMENT;
        store_inst.src1 = 1; // arr (NOT loop-invariant!)
        store_inst.src2 = 2; // idx
        store_inst.src3 = 4; // val
        b2->instructions.push_back(store_inst);

        MIRInstruction back_jmp;
        back_jmp.opcode = MIROpcode::JMP;
        back_jmp.target_block = 1;
        b2->instructions.push_back(back_jmp);
        b2->successors.push_back(1);

        func.blocks.push_back(std::move(b0));
        func.blocks.push_back(std::move(b1));
        func.blocks.push_back(std::move(b2));

        OptimizationFlags flags;
        flags.enable_bce = true;
        MIROptimizer opt(flags);
        uint32_t elim = opt.run_bounds_check_elimination(func);
        // Array was modified in loop -> NOT invariant -> BCE MUST REFUSE TO ELIMINATE
        assert(elim == 0);
        assert(func.blocks[2]->instructions[1].opcode == MIROpcode::STORE_ELEMENT);
        std::cout << "PASSED (BCE safely refused to eliminate check for variant array)\n";
    }

    // Test 4: Negative OOB Test - Unbounded Index Variable
    {
        std::cout << "  [Test 4] Negative Safety Test (Unbounded Index Variable)... ";
        MIRFunction func;
        func.next_vreg = 10;

        auto b0 = std::make_unique<MIRBlock>(0);
        MIRInstruction jmp_b1;
        jmp_b1.opcode = MIROpcode::JMP;
        jmp_b1.target_block = 1;
        b0->instructions.push_back(jmp_b1);
        b0->successors.push_back(1);

        auto b1 = std::make_unique<MIRBlock>(1);
        b1->is_loop_header = true;
        b1->predecessors.push_back(0);
        b1->predecessors.push_back(2);

        auto b2 = std::make_unique<MIRBlock>(2);
        b2->predecessors.push_back(1);

        // Index 9 is modified arbitrarily (neither IV nor invariant nor constant)
        MIRInstruction rand_inst;
        rand_inst.opcode = MIROpcode::INT_MUL;
        rand_inst.dest = 9;
        rand_inst.src1 = 9;
        rand_inst.src2 = 9;
        b2->instructions.push_back(rand_inst);

        MIRInstruction store_inst;
        store_inst.opcode = MIROpcode::STORE_ELEMENT;
        store_inst.src1 = 1; // arr
        store_inst.src2 = 9; // unprovable index
        store_inst.src3 = 4; // val
        b2->instructions.push_back(store_inst);

        MIRInstruction back_jmp;
        back_jmp.opcode = MIROpcode::JMP;
        back_jmp.target_block = 1;
        b2->instructions.push_back(back_jmp);
        b2->successors.push_back(1);

        func.blocks.push_back(std::move(b0));
        func.blocks.push_back(std::move(b1));
        func.blocks.push_back(std::move(b2));

        OptimizationFlags flags;
        flags.enable_bce = true;
        MIROptimizer opt(flags);
        uint32_t elim = opt.run_bounds_check_elimination(func);
        assert(elim == 0);
        assert(func.blocks[2]->instructions[1].opcode == MIROpcode::STORE_ELEMENT);
        std::cout << "PASSED (BCE safely retained checked store for unprovable index)\n";
    }

    // Test 5: Negative OOB Runtime Helper Safety - Negative Index
    {
        std::cout << "  [Test 5] Negative Safety Test (Runtime Helper Negative Index Handling)... ";
        auto arr = std::make_shared<ArrayObject>(ArrayRep::I64);
        arr->i64_data = {10, 20, 30};
        VMValue arr_val(arr);

        // Calling get_element with index -1 should return 0 safely without memory fault
        int64_t v = setun_jit_helper_get_element_i64(arr_val.raw_, -1);
        assert(v == 0);

        // Calling set_element with index -1 should not corrupt buffer
        setun_jit_helper_set_element_i64(arr_val.raw_, -1, 999);
        assert(arr->i64_data[0] == 10);
        assert(arr->i64_data[1] == 20);
        assert(arr->i64_data[2] == 30);
        std::cout << "PASSED (Safe fallback, zero memory corruption)\n";
    }

    // Test 6: Negative OOB Runtime Helper Safety - Out-of-Bounds Upper Index
    {
        std::cout << "  [Test 6] Negative Safety Test (Runtime Helper Upper OOB Index >= Size)... ";
        auto arr = std::make_shared<ArrayObject>(ArrayRep::I64);
        arr->i64_data = {10, 20, 30};
        VMValue arr_val(arr);

        // Index 3 == size -> OOB
        int64_t v3 = setun_jit_helper_get_element_i64(arr_val.raw_, 3);
        assert(v3 == 0);

        // Index 100 -> OOB
        int64_t v100 = setun_jit_helper_get_element_i64(arr_val.raw_, 100);
        assert(v100 == 0);

        // Set at index 100 on fixed array -> safe handling
        setun_jit_helper_set_element_i64(arr_val.raw_, 100, 777);
        assert(arr->i64_data[0] == 10);
        assert(arr->i64_data[1] == 20);
        assert(arr->i64_data[2] == 30);
        std::cout << "PASSED (Safe fallback for upper OOB indices)\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  All 6 BCE Safety Tests (Positive & Negative) PASSED 100%         \n";
    std::cout << "===================================================================\n\n";
}

} // namespace setun
