#include <iostream>

namespace setun {

void test_tafpu_algebraic_multiplication();
void test_tafpu_addition_and_subtraction();
void test_tafpu_dynamic_encoding();
void test_tafpu_isotropic_exception();
void test_tafpu_10k_dataset_encoding();
void test_tafpu_3d_distance_combat();

void test_btvp_paper_table1();
void test_tryte_packing();

void test_compiler_lexer();
void test_compiler_pratt_precedence();
void test_arena_allocator();

void test_vm_3way_branching();
void test_vm_tafpu_script();

// Phase 2 Tests (Plan_part2.md Module 5)
void test_part2_variable_scoping();
void test_part2_nested_branch3();
void test_part2_recursive_tafpu_function();
void test_part2_end_to_end_binary();

// Phase 3 Tests (Plan_part3.md Module 6)
void test_part3_neural_net_gemm_1024();
void test_part3_physics_1m_steps_zero_drift();
void test_part3_batch_tafpu_benchmark();
void test_part3_cordic_and_quaternions();

// Phase 4 Tests (Plan_part4.md Module 6)
void test_part4_c_ffi_embedding();
void test_part4_tricolor_gc_stress();
void test_part4_verilog_rtl_emission();
void test_part4_stdtaf_and_tpm();

// Phase 5 Tests (Plan_part5.md Module 5)
void test_part5_lean4_verification();
void test_part5_100k_physics_zero_drift();
void test_part5_game_loop_benchmark();
void test_part5_bare_metal_microkernel();

// Next-Gen Phase 1 Syntax Verification
void run_phase1_syntax_tests();

// Next-Gen Phase 2 LLVM Native AOT Backend Verification
void run_phase2_llvm_tests();

// Next-Gen Phase 3 Hierarchical Compression & Tensor Engine Verification
void run_phase3_compression_tests();

// Next-Gen Phase 4 Async Scheduler, Lock-Free SPSC/MPMC, Actor Zero-Copy & Bindgen
void run_phase4_async_tests();

// Next-Gen Phase 5 Language Server Protocol, Formatter & Visual Debugger
void run_phase5_lsp_tests();

// Phase 1 Type Checker & Semantic Analyzer
void run_phase1_type_checker_tests();

} // namespace setun

int run_all_tests() {
    std::cout << "\n==========================================================\n";
    std::cout << "  Running Setun-70 & TAFPU Comprehensive Test Suite       \n";
    std::cout << "==========================================================\n\n";

    try {
        std::cout << "[1/8] Testing TAFPU Algebraic Arithmetic in Q(sqrt(3))...\n";
        setun::test_tafpu_algebraic_multiplication();
        setun::test_tafpu_addition_and_subtraction();
        setun::test_tafpu_dynamic_encoding();
        setun::test_tafpu_isotropic_exception();
        setun::test_tafpu_10k_dataset_encoding();
        setun::test_tafpu_3d_distance_combat();

        std::cout << "\n[2/8] Testing BTVP Balanced Ternary & Table 1 Trace...\n";
        setun::test_btvp_paper_table1();
        setun::test_tryte_packing();

        std::cout << "\n[3/8] Testing Compiler Frontend (Lexer, Pratt, Arena)...\n";
        setun::test_compiler_lexer();
        setun::test_compiler_pratt_precedence();
        setun::test_arena_allocator();

        std::cout << "\n[4/8] Testing Setun-70 VM & 3-Way Branching...\n";
        setun::test_vm_3way_branching();
        setun::test_vm_tafpu_script();

        std::cout << "\n[5/8] Testing Phase 2 Pipeline (Scoping, Nested Branch3, Recursion, .tbc Binary)...\n";
        setun::test_part2_variable_scoping();
        setun::test_part2_nested_branch3();
        setun::test_part2_recursive_tafpu_function();
        setun::test_part2_end_to_end_binary();

        std::cout << "\n[6/8] Testing Phase 3 Advanced Math, AI GEMM & Exact Physics Engine...\n";
        setun::test_part3_neural_net_gemm_1024();
        setun::test_part3_physics_1m_steps_zero_drift();
        setun::test_part3_batch_tafpu_benchmark();
        setun::test_part3_cordic_and_quaternions();

        std::cout << "\n[7/8] Testing Phase 4 FFI, Tri-Color GC, Verilog RTL, stdtaf & TPM...\n";
        setun::test_part4_c_ffi_embedding();
        setun::test_part4_tricolor_gc_stress();
        setun::test_part4_verilog_rtl_emission();
        setun::test_part4_stdtaf_and_tpm();

        std::cout << "\n[8/8] Testing Phase 5 Lean 4 Formal Proof, Game Engine 1,000 NPC & Microkernel...\n";
        setun::test_part5_lean4_verification();
        setun::test_part5_100k_physics_zero_drift();
        setun::test_part5_game_loop_benchmark();
        setun::test_part5_bare_metal_microkernel();

        std::cout << "\n[Next-Gen 1/5] Testing Setun 2.0 Syntax (Struct, Class, Interface, Enum, Match, F-String)...\n";
        setun::run_phase1_syntax_tests();

        std::cout << "\n[Next-Gen 2/5] Testing Phase 2 LLVM Multi-Arch Native AOT Backend & Transpiler...\n";
        setun::run_phase2_llvm_tests();

        std::cout << "\n[Next-Gen 3/5] Testing Phase 3 Hierarchical Compression, Periodic Normalization & Tensor...\n";
        setun::run_phase3_compression_tests();

        std::cout << "\n[Next-Gen 4/5] Testing Phase 4 Async Tri-Priority, Lock-Free Queues, Actor & Bindgen...\n";
        setun::run_phase4_async_tests();

        std::cout << "\n[Next-Gen 5/5] Testing Phase 5 Language Server Protocol (LSP), Formatter & Debugger...\n";
        setun::run_phase5_lsp_tests();

        std::cout << "\n[Next-Gen Phase 1 Evolution] Testing Static Type Checker, Generic Monomorphizer & ADT Pattern Matching...\n";
        setun::run_phase1_type_checker_tests();

        std::cout << "\n==========================================================\n";
        std::cout << "  ALL TESTS PASSED SUCCESSFULLY! (100% Verification)      \n";
        std::cout << "==========================================================\n\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "\n[TEST SUITE FAILURE]: " << e.what() << "\n";
        return 1;
    }
}
