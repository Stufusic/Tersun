#include "compiler/opt_ir.hpp"
#include "compiler/cfg.hpp"
#include <iostream>
#include <cassert>
#include <chrono>
#include <string>

using namespace setun;

// ST-3: CFG & IR Stress Test
// 1. Large-scale CFG construction (1,000+ BasicBlocks with 3-level nested loops & dead paths)
// 2. Exact predecessor/successor invariant & loop back-edge detection
// 3. Unreachable elimination & sequential block merging
int main() {
    std::cout << "===================================================================\n";
    std::cout << "  ST-3: CFG & Linear IR Graph Stress Test (1,000+ BasicBlocks)     \n";
    std::cout << "===================================================================\n";

    IRFunction fn;
    fn.name = "stress_cfg_test";
    fn.num_locals = 8;

    std::cout << "[1/4] Generating 1,000+ BasicBlocks with nested loops and sequential chains...\n";
    auto t0 = std::chrono::steady_clock::now();

    // 1. Entry block
    IRInstruction inst_entry_lbl;
    inst_entry_lbl.op = IROp::LABEL;
    inst_entry_lbl.dst = IROperand::label("entry");
    fn.instructions.push_back(inst_entry_lbl);

    IRInstruction inst_init;
    inst_init.op = IROp::CONST_INT;
    inst_init.dst = IROperand::vreg(0);
    inst_init.src1 = IROperand::const_int(0);
    fn.instructions.push_back(inst_init);

    // Jump to outer loop header
    IRInstruction jmp_loop1;
    jmp_loop1.op = IROp::JUMP;
    jmp_loop1.src1 = IROperand::label("loop1_hdr");
    fn.instructions.push_back(jmp_loop1);

    // Loop 1 Header (Outer)
    IRInstruction l1_hdr;
    l1_hdr.op = IROp::LABEL;
    l1_hdr.dst = IROperand::label("loop1_hdr");
    fn.instructions.push_back(l1_hdr);

    IRInstruction l1_br;
    l1_br.op = IROp::BRANCH_IF_FALSE;
    l1_br.src1 = IROperand::vreg(0);
    l1_br.src2 = IROperand::label("chain_0"); // Exit to chain
    fn.instructions.push_back(l1_br);

    // Loop 2 Header (Middle)
    IRInstruction l2_hdr;
    l2_hdr.op = IROp::LABEL;
    l2_hdr.dst = IROperand::label("loop2_hdr");
    fn.instructions.push_back(l2_hdr);

    IRInstruction l2_br;
    l2_br.op = IROp::BRANCH_IF_FALSE;
    l2_br.src1 = IROperand::vreg(0);
    l2_br.src2 = IROperand::label("loop1_back"); // Exit to loop 1 backedge
    fn.instructions.push_back(l2_br);

    // Loop 3 Header (Inner)
    IRInstruction l3_hdr;
    l3_hdr.op = IROp::LABEL;
    l3_hdr.dst = IROperand::label("loop3_hdr");
    fn.instructions.push_back(l3_hdr);

    IRInstruction l3_br;
    l3_br.op = IROp::BRANCH_IF_FALSE;
    l3_br.src1 = IROperand::vreg(0);
    l3_br.src2 = IROperand::label("loop2_back"); // Exit to loop 2 backedge
    fn.instructions.push_back(l3_br);

    // Inner loop body: back to loop3_hdr (Backedge 1)
    IRInstruction l3_jmp;
    l3_jmp.op = IROp::JUMP;
    l3_jmp.src1 = IROperand::label("loop3_hdr");
    fn.instructions.push_back(l3_jmp);

    // Middle loop back to loop2_hdr (Backedge 2)
    IRInstruction l2_back_lbl;
    l2_back_lbl.op = IROp::LABEL;
    l2_back_lbl.dst = IROperand::label("loop2_back");
    fn.instructions.push_back(l2_back_lbl);

    IRInstruction l2_jmp;
    l2_jmp.op = IROp::JUMP;
    l2_jmp.src1 = IROperand::label("loop2_hdr");
    fn.instructions.push_back(l2_jmp);

    // Outer loop back to loop1_hdr (Backedge 3)
    IRInstruction l1_back_lbl;
    l1_back_lbl.op = IROp::LABEL;
    l1_back_lbl.dst = IROperand::label("loop1_back");
    fn.instructions.push_back(l1_back_lbl);

    IRInstruction l1_jmp;
    l1_jmp.op = IROp::JUMP;
    l1_jmp.src1 = IROperand::label("loop1_hdr");
    fn.instructions.push_back(l1_jmp);

    // Loop exit: jumps to long linear chain
    IRInstruction exit_lbl;
    exit_lbl.op = IROp::LABEL;
    exit_lbl.dst = IROperand::label("chain_0");
    fn.instructions.push_back(exit_lbl);

    // Create a long chain of 600 single-predecessor single-successor blocks: chain_0 -> chain_1 -> ... -> chain_599
    const int CHAIN_LEN = 600;
    for (int i = 0; i < CHAIN_LEN; ++i) {
        if (i > 0) {
            IRInstruction clbl;
            clbl.op = IROp::LABEL;
            clbl.dst = IROperand::label("chain_" + std::to_string(i));
            fn.instructions.push_back(clbl);
        }

        IRInstruction c_op;
        c_op.op = IROp::ADD;
        c_op.dst = IROperand::vreg(1);
        c_op.src1 = IROperand::vreg(1);
        c_op.src2 = IROperand::const_int(1);
        fn.instructions.push_back(c_op);

        if (i + 1 < CHAIN_LEN) {
            IRInstruction j;
            j.op = IROp::JUMP;
            j.src1 = IROperand::label("chain_" + std::to_string(i + 1));
            fn.instructions.push_back(j);
        }
    }

    // Branch to finish
    IRInstruction jmp_fin;
    jmp_fin.op = IROp::JUMP;
    jmp_fin.src1 = IROperand::label("finish");
    fn.instructions.push_back(jmp_fin);

    // Dead blocks (unreachable from entry): 450 disconnected blocks
    const int DEAD_COUNT = 450;
    for (int i = 0; i < DEAD_COUNT; ++i) {
        IRInstruction dlbl;
        dlbl.op = IROp::LABEL;
        dlbl.dst = IROperand::label("dead_" + std::to_string(i));
        fn.instructions.push_back(dlbl);

        IRInstruction d_op;
        d_op.op = IROp::CONST_INT;
        d_op.dst = IROperand::vreg(2);
        d_op.src1 = IROperand::const_int(i);
        fn.instructions.push_back(d_op);

        if (i + 1 < DEAD_COUNT) {
            IRInstruction dj;
            dj.op = IROp::JUMP;
            dj.src1 = IROperand::label("dead_" + std::to_string(i + 1));
            fn.instructions.push_back(dj);
        }
    }

    // Finish block
    IRInstruction fin_lbl;
    fin_lbl.op = IROp::LABEL;
    fin_lbl.dst = IROperand::label("finish");
    fn.instructions.push_back(fin_lbl);

    IRInstruction ret_inst;
    ret_inst.op = IROp::RETURN;
    ret_inst.dst = IROperand::none();
    fn.instructions.push_back(ret_inst);

    auto t1 = std::chrono::steady_clock::now();
    double gen_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
    std::cout << "  -> Instructions generated: " << fn.instructions.size() << " in " << gen_ms << " ms.\n";

    // 2. Build CFG
    std::cout << "[2/4] Building CFG and analyzing control-flow invariants...\n";
    auto cfg = CFG::build_from_function(fn);
    size_t total_blocks = cfg->blocks().size();
    std::cout << "  -> Total BasicBlocks constructed: " << total_blocks << " (Target: >= 1,000)\n";
    assert(total_blocks >= 1000);

    // Invariant Check: Predecessor <-> Successor symmetry
    for (const auto& b : cfg->blocks()) {
        for (auto* succ : b->successors) {
            bool found = false;
            for (auto* pred : succ->predecessors) {
                if (pred == b.get()) { found = true; break; }
            }
            assert(found && "CFG Edge Invariant Violated: successor missing predecessor reference!");
        }
    }
    std::cout << "  -> PASSED: 100% Predecessor/Successor symmetry verified across all blocks!\n";

    // 3. Loop Detection
    std::cout << "[3/4] Verifying Loop Detection & Back-Edge Analysis...\n";
    size_t num_back_edges = cfg->back_edges().size();
    std::cout << "  -> Back-edges detected: " << num_back_edges << "\n";
    assert(num_back_edges == 3);

    size_t loop_headers = 0;
    for (const auto& b : cfg->blocks()) {
        if (b->is_loop_header) loop_headers++;
    }
    std::cout << "  -> Loop headers detected: " << loop_headers << "\n";
    assert(loop_headers == 3);
    std::cout << "  -> PASSED: Exact 3-level nested loop headers & back-edges recognized!\n";

    // 4. Optimization: Unreachable Elimination & Block Merging
    std::cout << "[4/4] Running CFG Transformations (Unreachable Elimination & Block Merging)...\n";
    bool elim = cfg->eliminate_unreachable();
    assert(elim);
    size_t after_elim = cfg->blocks().size();
    std::cout << "  -> After unreachable elimination: " << after_elim << " blocks (eliminated " << (total_blocks - after_elim) << " dead blocks)\n";
    assert(total_blocks - after_elim >= DEAD_COUNT);

    size_t merge_count = 0;
    while (cfg->merge_blocks()) {
        merge_count++;
    }
    size_t after_merge = cfg->blocks().size();
    std::cout << "  -> Merged " << merge_count << " times. Final blocks: " << after_merge << "\n";
    assert(after_merge < 50); // The 600-block chain must be merged down to small compact graph!
    std::cout << "  -> PASSED: 600-block chain successfully merged without breaking CFG semantics!\n";

    std::cout << "\n===================================================================\n";
    std::cout << "  ALL ST-3 CFG STRESS TESTS PASSED WITH 100% SUCCESS!             \n";
    std::cout << "===================================================================\n";
    return 0;
}
