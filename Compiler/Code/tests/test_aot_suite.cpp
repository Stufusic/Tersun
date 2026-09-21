#include "compiler/canonical_ternary_ir.hpp"
#include "compiler/llvm_emitter.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/arena.hpp"

#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cassert>
#include <cstdlib>

namespace setun::test {

// Helper: Inspect binary file for forbidden imported symbols
static bool audit_binary_dependencies(const std::string& binary_path, std::string& error_msg) {
    std::ifstream file(binary_path, std::ios::binary);
    if (!file.is_open()) {
        error_msg = "Could not open binary: " + binary_path;
        return false;
    }

    // Read file contents
    std::vector<char> buffer((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    std::string content(buffer.begin(), buffer.end());

    // Forbidden dependency signatures (VM, JIT, Compiler)
    const std::vector<std::string> forbidden = {
        "setun_vm",
        "setunc.exe",
        "setun_compiler",
        "SetunJITEngine",
        "BytecodeEmitter"
    };

    for (const auto& token : forbidden) {
        if (content.find(token) != std::string::npos) {
            error_msg = "Forbidden dependency found in standalone binary: " + token;
            return false;
        }
    }

    return true;
}

void test_aot_suite() {
    using namespace setun::compiler;

    std::cout << "--- Starting Gate 7.3.3 LLVM Native AOT Test Suite ---\n";

    // -------------------------------------------------------------
    // Test 1: TargetIndependentVectorIR Lowering & Structural Parity
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-AOT-1] TargetIndependentVectorIR Lowering... ";
    {
        TernaryContractionNode node;
        node.func_name = "test_gemm_kernel";
        node.M = 4ULL;
        node.N = 16ULL;
        node.K = 32ULL;
        node.layout = WeightLayout::DENSE_TRIT8;

        EpilogueStage stage1;
        stage1.op = EpilogueOp::RELU;
        stage1.typed_payload = ActivationPayload{false};
        node.epilogue_chain.push_back(stage1);

        EpilogueStage stage2;
        stage2.op = EpilogueOp::CLAMP;
        stage2.payload.clamp_min = 0;
        stage2.payload.clamp_max = 100;
        node.epilogue_chain.push_back(stage2);

        ContractionSchedule sched;
        sched.vector_width = 8;
        sched.unroll_m = 4;
        sched.unroll_n = 8;

        auto vir = TargetIndependentVectorIR::lower_from_node(node, sched);

        assert(vir.kernel_name == "test_gemm_kernel");
        assert(vir.vector_width == 8);
        assert(vir.unroll_m == 4);
        assert(vir.unroll_n == 8);
        assert(vir.static_m == 4);
        assert(vir.static_n == 16);
        assert(vir.static_k == 32);
        assert(vir.layout == WeightLayout::DENSE_TRIT8);
        assert(vir.epilogue_chain.size() == 2);
        std::cout << "PASSED\n";
    }

    // -------------------------------------------------------------
    // Test 2: LLVM Vector IR Emission & Structural Verification
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-AOT-2] LLVM Vector IR Generation (<8 x i32> SIMD)... ";
    {
        TernaryContractionNode node;
        node.func_name = "avx2_contraction_kernel";
        node.M = 4ULL;
        node.N = 16ULL;
        node.K = 32ULL;

        EpilogueStage relu_stage;
        relu_stage.op = EpilogueOp::RELU;
        node.epilogue_chain.push_back(relu_stage);

        ContractionSchedule sched;
        sched.vector_width = 8;

        LLVMEmitter emitter;
        std::string llvm_ir = emitter.emit_contraction_llvm_ir(node, sched);

        // Verification checklist
        assert(!llvm_ir.empty());
        assert(llvm_ir.find("define dso_local void @avx2_contraction_kernel") != std::string::npos);
        assert(llvm_ir.find("<8 x i32>") != std::string::npos);
        assert(llvm_ir.find("apply_epilogue_vec") != std::string::npos);
        assert(llvm_ir.find("shufflevector") != std::string::npos);
        assert(llvm_ir.find("%m_cmp = icmp sgt i64 %M, 0") != std::string::npos);
        std::cout << "PASSED\n";
    }

    // -------------------------------------------------------------
    // Test 3: Standalone Contraction Kernel Compilation
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-AOT-3] Standalone Contraction Compilation (.ll & binary)... ";
    {
        TernaryContractionNode node;
        node.func_name = "gate733_aot_kernel";
        node.M = 4ULL;
        node.N = 16ULL;
        node.K = 32ULL;

        ContractionSchedule sched;
        sched.vector_width = 8;

        LLVMEmitter emitter;
        std::string out_base = "test_aot_kernel";
        bool compiled = emitter.compile_contraction_standalone(node, sched, out_base, 3);
        assert(compiled);

        // Verify .ll file exists
        std::ifstream ll_file(out_base + ".ll");
        assert(ll_file.is_open());
        ll_file.close();

        // Verify either .obj or .exe was generated
        std::ifstream exe_file(out_base + ".exe", std::ios::binary);
        std::ifstream obj_file(out_base + ".obj", std::ios::binary);
        assert(exe_file.is_open() || obj_file.is_open());
        std::cout << "PASSED\n";
    }

    // -------------------------------------------------------------
    // Test 4: Binary Dependency Audit (DoD 6 Verification)
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-AOT-4] Binary Dependency Audit (Zero VM/JIT symbols)... ";
    {
        std::string err;
        // Audit test_aot_kernel.exe if generated
        std::ifstream exe_check("test_aot_kernel.exe");
        if (exe_check.is_open()) {
            exe_check.close();
            bool clean = audit_binary_dependencies("test_aot_kernel.exe", err);
            assert(clean && err.empty());
        }

        // Also audit build/libtersun_rt.a
        std::ifstream rt_check("build/libtersun_rt.a");
        if (rt_check.is_open()) {
            rt_check.close();
            bool clean = audit_binary_dependencies("build/libtersun_rt.a", err);
            assert(clean && err.empty());
        }
        std::cout << "PASSED (Clean PE / Library Isolation)\n";
    }

    // -------------------------------------------------------------
    // Test 5: End-to-End AOT Native Execution
    // -------------------------------------------------------------
    std::cout << "  [G7.3.3-AOT-5] End-to-End AOT Native Compilation & Run... ";
    {
        std::string source = "fn main() -> int { return 42; }\n";
        ArenaAllocator arena;
        Lexer lexer(source, "test_prog.stn");
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        TypeChecker checker;
        bool checked = checker.check_program(program);
        assert(checked);

        LLVMEmitter emitter;
        std::string exe_path = "test_e2e_aot.exe";
        bool built = emitter.compile_llvm_native(program, exe_path, 2);
        assert(built);

        // Run the standalone executable
        int exit_code = std::system(exe_path.c_str());
        assert(exit_code == 42);

        // Audit the generated end-to-end executable
        std::string err;
        bool clean = audit_binary_dependencies(exe_path, err);
        assert(clean && err.empty());

        // Cleanup
        std::remove(exe_path.c_str());
        std::remove((exe_path + ".ll").c_str());
        std::remove((exe_path + ".tmp.cpp").c_str());

        std::cout << "PASSED (Exit code = 42, Zero VM/JIT imports)\n";
    }

    std::cout << "--- Gate 7.3.3 LLVM Native AOT Test Suite COMPLETE ---\n";
}

} // namespace setun::test
