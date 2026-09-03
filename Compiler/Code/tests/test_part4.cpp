#include "ffi/libsetun_ffi.h"
#include "stdtaf/tst.hpp"
#include "stdtaf/gauss_jordan.hpp"
#include "vm/gc.hpp"
#include "hardware/verilog_emitter.hpp"
#include "tools/tpm.hpp"

#include <cassert>
#include <iostream>
#include <cmath>

namespace setun {

// Module 6 - Test Case 1: C/C++ FFI Embedding
void test_part4_c_ffi_embedding() {
    std::cout << "  [Test] Module 6 - Test Case 1: C/C++ FFI Embedding & Data Marshalling...\n";

    SetunVM_Handle vm = setun_create_vm();
    assert(vm != nullptr);

    // Test 3D Combat Distance Calculation via C ABI: p1(10, 20, 30), p2(13, 24, 30) -> d^2 = 9 + 16 = 25
    TAF_Register_C p1_x{10, 0, 0, 0}, p1_y{20, 0, 0, 0}, p1_z{30, 0, 0, 0};
    TAF_Register_C p2_x{13, 0, 0, 0}, p2_y{24, 0, 0, 0}, p2_z{30, 0, 0, 0};

    TAF_Register_C d2 = setun_calc_dist3d_sq(p1_x, p1_y, p1_z, p2_x, p2_y, p2_z);
    assert(d2.a == 25);
    assert(d2.b == 0);
    assert(d2.s == 0);

    // Test algebraic multiplication via C ABI: (1 + sqrt(3)) * (1 - sqrt(3)) = -2
    TAF_Register_C x1{1, 1, 0, 0};
    TAF_Register_C x2{1, -1, 0, 0};
    TAF_Register_C prod = setun_tafpu_mul(x1, x2);
    assert(prod.a == -2 && prod.b == 0 && prod.s == 0);

    // Test dynamic double encoding & decoding via C ABI
    double val = 57.30127;
    TAF_Register_C enc = setun_encode_double(val);
    double dec = setun_decode_double(enc);
    assert(std::abs(dec - val) < 0.05);

    setun_destroy_vm(vm);
    std::cout << "    -> PASSED: C/C++ FFI native API and bidirectional data marshalling verified!\n";
}

// Module 6 - Test Case 2: Tri-Color Garbage Collector Stress Test
void test_part4_tricolor_gc_stress() {
    std::cout << "  [Test] Module 6 - Test Case 2: Tri-Color Garbage Collector (Trit -1, 0, +1)...\n";

    TriColorGC gc;
    struct Node : public GcObject {
        int id;
        explicit Node(int i) : id(i) {}
    };

    // Allocate root node and reachable graph
    Node* root = gc.allocate<Node>(1);
    Node* child1 = gc.allocate<Node>(2);
    Node* child2 = gc.allocate<Node>(3);
    root->references.push_back(child1);
    child1->references.push_back(child2);

    gc.add_root(root);

    // Allocate unreachable garbage nodes
    for (int i = 100; i < 1100; ++i) {
        gc.allocate<Node>(i);
    }

    assert(gc.live_objects_count() == 1003);

    // Collect garbage (only root, child1, child2 survive)
    size_t swept_bytes = gc.collect_garbage();
    assert(swept_bytes == 1000 * sizeof(Node));
    assert(gc.live_objects_count() == 3);

    std::cout << "    -> Reclaimed " << swept_bytes << " bytes of unreachable memory; 3 reachable nodes preserved.\n";
    std::cout << "    -> PASSED: Tri-Color Balanced Ternary GC marked & swept with 0 memory leaks!\n";
}

// Module 6 - Test Case 3: Verilog RTL Hardware Synthesis Emitter
void test_part4_verilog_rtl_emission() {
    std::cout << "  [Test] Module 6 - Test Case 3: Verilog RTL FPGA IP-Core Emitter...\n";

    std::string alu_verilog = VerilogEmitter::emit_tafpu_alu_core();
    assert(alu_verilog.find("module tafpu_alu_core") != std::string::npos);
    assert(alu_verilog.find("mul_res_a = mul_a1_a2[63:0] + (3 * mul_b1_b2[63:0]);") != std::string::npos);

    std::string adder_verilog = VerilogEmitter::emit_btvp_adder_module();
    assert(adder_verilog.find("module btvp_trit_adder") != std::string::npos);
    assert(adder_verilog.find("carry_out =  1;") != std::string::npos);

    std::cout << "    -> Generated " << alu_verilog.size() << " bytes of synthesizable Verilog-2001 RTL.\n";
    std::cout << "    -> PASSED: Hardware synthesis RTL emitted with exact parallel algebraic equations!\n";
}

// Module 6 - Test Case 4: Gauss-Jordan Solver, TST & TPM Manifest
void test_part4_stdtaf_and_tpm() {
    std::cout << "  [Test] Module 6 - Test Case 4: Gauss-Jordan Linear Solver & Ternary Search Tree...\n";

    // 1. Gauss-Jordan 2x2 System:
    //  2*x + 1*y = 5
    //  1*x + 3*y = 5
    // Solution: x = 2, y = 1
    tmat<2, 2> A;
    A(0, 0) = TAF_Register(2, 0, 0);
    A(0, 1) = TAF_Register(1, 0, 0);
    A(1, 0) = TAF_Register(1, 0, 0);
    A(1, 1) = TAF_Register(3, 0, 0);

    std::array<TAF_Register, 2> b = { TAF_Register(5, 0, 0), TAF_Register(5, 0, 0) };
    auto sol = solve_gauss_jordan(A, b);
    assert(sol.has_value());
    assert((*sol)[0].a == 2 && (*sol)[0].b == 0);
    assert((*sol)[1].a == 1 && (*sol)[1].b == 0);
    std::cout << "    -> Gauss-Jordan Exact Solution: x = " << (*sol)[0].to_string(false) << ", y = " << (*sol)[1].to_string(false) << "\n";

    // 2. Ternary Search Tree (TST)
    TernarySearchTree<int> tst;
    tst.insert("setun", 1958);
    tst.insert("tafpu", 2026);
    tst.insert("ternary", 3);

    assert(tst.contains("setun"));
    assert(tst.search("tafpu").value() == 2026);
    assert(!tst.contains("binary"));

    // 3. TPM Package Manifest TOML
    PackageManifest manifest;
    manifest.name = "quantum_sim";
    manifest.version = "2.0.0";
    std::string toml_str = manifest.generate_toml();
    PackageManifest parsed = PackageManifest::parse_toml(toml_str);
    assert(parsed.name == "quantum_sim");
    assert(parsed.version == "2.0.0");

    std::cout << "    -> PASSED: Gauss-Jordan solver, TST symbol table, and TPM Package Manager verified!\n";
}

} // namespace setun
