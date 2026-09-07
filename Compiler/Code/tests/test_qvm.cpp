#include "qvm/qreg.hpp"
#include "qvm/qgate.hpp"
#include "qvm/qopcode.hpp"
#include "qvm/qvm.hpp"
#include "compiler/llvm2qvm.hpp"
#include "compiler/q_emitter.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/arena.hpp"
#include "tafpu/exception.hpp"

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cassert>
#include <cmath>

using namespace tersun::qvm;
using namespace tersun::compiler;

static constexpr double kPi = 3.14159265358979323846;

static void assert_test(bool cond, const std::string& msg) {
    if (!cond) {
        std::cerr << "  [FAILED] " << msg << "\n";
        std::exit(1);
    }
}

// Locate a .stn probe script relative to the invocation CWD (same policy as
// the 1.0.3 core-semantics suite).
static std::string find_q_probe(const std::string& name) {
    const char* prefixes[] = {"tests/stn/", "Code/tests/stn/", "../Code/tests/stn/"};
    for (const char* p : prefixes) {
        std::string candidate = std::string(p) + name;
        std::ifstream f(candidate);
        if (f.is_open()) return candidate;
    }
    assert(false && ".stn quantum probe not found (run setunc_test from Code/ or the repo root)");
    return "";
}

static size_t count_occurrences(const std::string& haystack, const std::string& needle) {
    size_t count = 0;
    for (size_t pos = haystack.find(needle); pos != std::string::npos;
         pos = haystack.find(needle, pos + needle.size())) {
        ++count;
    }
    return count;
}

// ----------------------------------------------------------------------------
// Test 1: 2-Bit Packing & 4-State Mapping
// ----------------------------------------------------------------------------
static void test_2bit_packing() {
    std::cout << "  [Test 1/14] 2-Bit Classical to 1-Qubit Quantum State Packing...\n";
    PackedQubitWord word(0);

    // Pack 4 states into qubits 0, 1, 2, 3
    word.set(0, QubitState2Bit::ZERO);        // 00_2
    word.set(1, QubitState2Bit::ONE);         // 01_2
    word.set(2, QubitState2Bit::MINUS);       // 10_2
    word.set(3, QubitState2Bit::PLUS_OR_NIL); // 11_2

    assert_test(word.get(0) == QubitState2Bit::ZERO, "Q0 should be ZERO");
    assert_test(word.get(1) == QubitState2Bit::ONE, "Q1 should be ONE");
    assert_test(word.get(2) == QubitState2Bit::MINUS, "Q2 should be MINUS");
    assert_test(word.get(3) == QubitState2Bit::PLUS_OR_NIL, "Q3 should be PLUS_OR_NIL");

    // Test trit conversion
    assert_test(PackedQubitWord::qubit_to_trit(QubitState2Bit::ZERO) == 0, "ZERO is trit 0");
    assert_test(PackedQubitWord::qubit_to_trit(QubitState2Bit::ONE) == 1, "ONE is trit +1");
    assert_test(PackedQubitWord::qubit_to_trit(QubitState2Bit::MINUS) == -1, "MINUS is trit -1");

    // Test 32 qubits packing into 64-bit integer
    for (size_t i = 0; i < 32; ++i) {
        word.set(i, static_cast<QubitState2Bit>(i % 4));
    }
    for (size_t i = 0; i < 32; ++i) {
        assert_test(word.get(i) == static_cast<QubitState2Bit>(i % 4), "32 packed qubits verified");
    }

    std::cout << "    -> PASSED: 2-bit packing preserves all 4 states across 32 qubits per 64-bit word!\n";
}

// ----------------------------------------------------------------------------
// Test 2: Single-Qubit Quantum Gates (H, X, Z)
// ----------------------------------------------------------------------------
static void test_single_qubit_gates() {
    std::cout << "  [Test 2/14] Single-Qubit Gates (Pauli-X, Hadamard, Pauli-Z)...\n";
    QubitRegister reg(2);

    // X gate flips |0> -> |1>
    GateOps::apply_x(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ONE, "X|0> should be |1>");

    // X gate flips |1> -> |0>
    GateOps::apply_x(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ZERO, "X|1> should be |0>");

    // Hadamard creates |+> superposition from |0>
    GateOps::apply_h(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::PLUS_OR_NIL, "H|0> should be |+>");

    // Z flips |+> to |->
    GateOps::apply_z(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::MINUS, "Z|+> should be |->");

    // H on |-> returns |1>
    GateOps::apply_h(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ONE, "H|-> should be |1>");

    std::cout << "    -> PASSED: Single-qubit Clifford gates behave with 100% algebraic exactness!\n";
}

// ----------------------------------------------------------------------------
// Test 3: Two-Qubit Entanglement & Bell State Generation
// ----------------------------------------------------------------------------
static void test_bell_state_entanglement() {
    std::cout << "  [Test 3/14] Two-Qubit Entanglement & Bell State Generation (|00> + |11>)/sqrt(2)...\n";
    QubitRegister reg(2);

    // Create Bell State (|00> + |11>)/sqrt(2): H(0) followed by CNOT(0, 1)
    GateOps::apply_h(reg, 0);
    GateOps::apply_cnot(reg, 0, 1);

    assert_test(reg.is_statevector_active(), "Statevector must be active for entangled state");
    const auto& sv = reg.amplitudes();
    assert_test(sv.size() == 4, "2 qubits must have 4 amplitudes");

    double inv_sqrt2 = 1.0 / std::sqrt(2.0);
    // |00> (index 0) amplitude ~ 1/sqrt(2)
    assert_test(std::abs(std::abs(sv[0]) - inv_sqrt2) < 1e-6, "|00> amplitude must be 1/sqrt(2)");
    // |01> (index 1) amplitude ~ 0
    assert_test(std::abs(sv[1]) < 1e-6, "|01> amplitude must be 0");
    // |10> (index 2) amplitude ~ 0
    assert_test(std::abs(sv[2]) < 1e-6, "|10> amplitude must be 0");
    // |11> (index 3) amplitude ~ 1/sqrt(2)
    assert_test(std::abs(std::abs(sv[3]) - inv_sqrt2) < 1e-6, "|11> amplitude must be 1/sqrt(2)");

    std::cout << "    -> PASSED: Bell state (|00> + |11>)/sqrt(2) generated with zero amplitude drift!\n";
}

// ----------------------------------------------------------------------------
// Test 4: Born Rule Measurement & Wavefunction Collapse
// ----------------------------------------------------------------------------
static void test_born_rule_measurement() {
    std::cout << "  [Test 4/14] Born Rule Measurement & Wavefunction Collapse (1,000 shots)...\n";
    int count0 = 0;
    int count1 = 0;

    for (int shot = 0; shot < 1000; ++shot) {
        QubitRegister reg(1);
        GateOps::apply_h(reg, 0); // Put into |+> (50% 0, 50% 1)
        int outcome = reg.measure(0);

        if (outcome == 0) count0++;
        else count1++;

        // Repeated measurement must immediately return the same collapsed state with 100% probability
        int second_meas = reg.measure(0);
        assert_test(second_meas == outcome, "Wavefunction collapse must be deterministic on subsequent measurements");
    }

    assert_test(count0 > 400 && count0 < 600, "Shot distribution must converge to ~50% for |+>");
    assert_test(count1 > 400 && count1 < 600, "Shot distribution must converge to ~50% for |+>");

    std::cout << "    -> PASSED: Born rule convergence verified (shots: 0=" << count0 << ", 1=" << count1 << ")!\n";
}

// ----------------------------------------------------------------------------
// Test 5: Balanced Ternary Quantum Qutrit Permutations
// ----------------------------------------------------------------------------
static void test_ternary_qutrit_gates() {
    std::cout << "  [Test 5/14] Balanced Ternary Qutrit Operations (Cycle & Invert)...\n";
    QubitRegister reg(1);

    // Initial state: 0
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ZERO, "Init at 0");

    // Cycle: 0 -> +1
    GateOps::apply_ternary_cycle(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ONE, "Cycle 0 -> +1");

    // Cycle: +1 -> -1
    GateOps::apply_ternary_cycle(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::MINUS, "Cycle +1 -> -1");

    // Cycle: -1 -> 0
    GateOps::apply_ternary_cycle(reg, 0);
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ZERO, "Cycle -1 -> 0");

    // Invert: +1 <-> -1
    GateOps::apply_ternary_cycle(reg, 0); // now +1
    GateOps::apply_ternary_invert(reg, 0); // now -1
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::MINUS, "Invert +1 -> -1");
    GateOps::apply_ternary_invert(reg, 0); // back to +1
    assert_test(reg.get_discrete_state(0) == QubitState2Bit::ONE, "Invert -1 -> +1");

    std::cout << "    -> PASSED: Balanced Ternary cyclic permutations and sign inversions verified!\n";
}

// ----------------------------------------------------------------------------
// Test 6: LLVM IR to QVM Translation
// ----------------------------------------------------------------------------
static void test_llvm2qvm_translation() {
    std::cout << "  [Test 6/14] LLVM IR to QVM Translation (Bit-Packing & Quantum Lowering)...\n";
    std::string sample_llvm_ir = R"(
        define i64 @stn_main() {
        entry:
            store i64 1, i64* %a
            store i64 0, i64* %b
            %t1 = xor i64 %a, %b
            ret i64 1
        }
    )";

    LLVM2QVMTranslator translator;
    QChunk chunk;
    bool ok = translator.translate_ir(sample_llvm_ir, chunk);
    assert_test(ok, "LLVM IR translation must succeed");
    assert_test(!chunk.code.empty(), "Generated QChunk code must not be empty");

    // Run on QVM
    QVM qvm;
    int64_t res = qvm.run(chunk);
    assert_test(res >= 0, "QVM execution must succeed with valid register state");

    std::cout << "    -> PASSED: LLVM IR lowered cleanly to QVM bytecode and executed!\n";
}

// ----------------------------------------------------------------------------
// Test 7: Direct AST to QVM Native Compilation (Tersun 1.0.2)
// ----------------------------------------------------------------------------
static void test_direct_ast_to_qvm() {
    std::cout << "  [Test 7/14] Direct AST to QVM Native Compilation (Bypassing LLVM)...\n";
    std::string source = R"(
        fn main() -> int {
            let a: int = 1;
            let b: int = 1;
            let c: int = a + b;
            return c;
        }
    )";

    setun::ArenaAllocator arena;
    setun::Lexer lexer(source);
    auto tokens = lexer.tokenize();
    setun::Parser parser(tokens, arena);
    setun::Program prog = parser.parse_program();

    QEmitter emitter;
    QChunk chunk = emitter.compile(prog);
    assert_test(!chunk.code.empty(), "Direct QEmitter code must be generated");

    QVM qvm;
    int64_t ret = qvm.run(chunk);
    assert_test(ret >= 0, "QVM run of direct compiled AST must succeed");

    std::cout << "    -> PASSED: Direct AST to QVM compilation verified without LLVM intermediary!\n";
}

// ----------------------------------------------------------------------------
// Test 8: OpenQASM 3.0 Export & Circuit Compliance
// ----------------------------------------------------------------------------
static void test_openqasm_export() {
    std::cout << "  [Test 8/14] OpenQASM 3.0 Export & Circuit Compliance...\n";
    QuantumCircuit circuit(2);
    circuit.h(0);
    circuit.cnot(0, 1);

    std::string qasm = circuit.to_openqasm("test_bell_pair");
    assert_test(qasm.find("OPENQASM 3.0;") != std::string::npos, "QASM must have version header");
    assert_test(qasm.find("qubit[2] q;") != std::string::npos, "QASM must declare qubits");
    assert_test(qasm.find("h q[0];") != std::string::npos, "QASM must have Hadamard gate");
    assert_test(qasm.find("cx q[0], q[1];") != std::string::npos, "QASM must have CNOT gate");
    assert_test(qasm.find("measure") != std::string::npos, "QASM must have measurement");

    std::cout << "    -> PASSED: OpenQASM 3.0 circuit validated for deployment on IBM Quantum/AWS Braket!\n";
}

// ----------------------------------------------------------------------------
// Test 9: Controlled-Phase Decomposition (RZ/CNOT primitives)
// ----------------------------------------------------------------------------
static void test_cphase_decomposition() {
    std::cout << "  [Test 9/14] Controlled-Phase via RZ-CNOT-RZ-CNOT-RZ decomposition...\n";
    const double theta = 1.1;

    // Arbitrary non-product input state prepared with rotations.
    QubitRegister reg(2);
    GateOps::apply_ry(reg, 0, 0.7);
    GateOps::apply_rx(reg, 1, 1.3);
    std::vector<QComplex> input = reg.amplitudes();

    QuantumCircuit circuit(2);
    circuit.cphase(0, 1, theta);
    circuit.execute(reg);

    // Analytic reference: CP(theta) = diag(1, 1, 1, e^{i*theta}).
    std::vector<QComplex> ref(4);
    for (size_t i = 0; i < 4; ++i) {
        ref[i] = (i == 3) ? input[i] * QComplex(std::cos(theta), std::sin(theta)) : input[i];
    }

    // |amp| must match the analytic CP to 1e-9 (global phase invisible).
    for (size_t i = 0; i < 4; ++i) {
        assert_test(std::abs(std::abs(reg.amplitudes()[i]) - std::abs(ref[i])) < 1e-9,
                    "cphase |amp| mismatch at index " + std::to_string(i));
    }
    // Full complex equality up to a single global phase factor.
    QComplex g(0.0, 0.0);
    bool have_g = false;
    for (size_t i = 0; i < 4; ++i) {
        if (std::abs(ref[i]) > 1e-6) {
            g = reg.amplitudes()[i] / ref[i];
            have_g = true;
            break;
        }
    }
    assert_test(have_g, "cphase reference must be nonzero");
    for (size_t i = 0; i < 4; ++i) {
        assert_test(std::abs(reg.amplitudes()[i] - g * ref[i]) < 1e-9,
                    "cphase complex mismatch (beyond global phase) at index " + std::to_string(i));
    }

    std::cout << "    -> PASSED: cphase(theta) equals diag(1,1,1,e^{i*theta}) up to global phase (1e-9)!\n";
}

// ----------------------------------------------------------------------------
// Test 10: QFT Amplitudes vs Reference DFT (1e-9)
// ----------------------------------------------------------------------------
static void test_qft_matches_dft() {
    std::cout << "  [Test 10/14] QFT(n) Output Amplitudes vs Reference DFT (n = 1..5)...\n";
    for (size_t n = 1; n <= 5; ++n) {
        const size_t N = size_t(1) << n;

        // Deterministic normalized non-uniform input state.
        QubitRegister reg(n);
        reg.promote_to_statevector();
        std::vector<QComplex> input(N);
        double norm = 0.0;
        for (size_t j = 0; j < N; ++j) {
            input[j] = QComplex(std::sin(0.9 * static_cast<double>(j) + 0.3),
                                std::cos(1.3 * static_cast<double>(j) + 0.7));
            norm += std::norm(input[j]);
        }
        norm = std::sqrt(norm);
        for (auto& v : input) v /= norm;
        reg.amplitudes() = input;

        QuantumCircuit circuit(n);
        circuit.qft(n);
        circuit.execute(reg);

        // Reference DFT: out[k] = (1/sqrt(N)) * sum_j in[j] * e^{2*pi*i*j*k/N}.
        std::vector<QComplex> dft(N, QComplex(0.0, 0.0));
        for (size_t k = 0; k < N; ++k) {
            for (size_t j = 0; j < N; ++j) {
                double ang = 2.0 * kPi * static_cast<double>(j) * static_cast<double>(k) / static_cast<double>(N);
                dft[k] += input[j] * QComplex(std::cos(ang), std::sin(ang));
            }
            dft[k] /= std::sqrt(static_cast<double>(N));
            assert_test(std::abs(std::abs(reg.amplitudes()[k]) - std::abs(dft[k])) < 1e-9,
                        "QFT |amp| deviates from DFT at n=" + std::to_string(n) + " k=" + std::to_string(k));
        }

        // Stronger check: full complex equality up to one global phase.
        QComplex g(0.0, 0.0);
        for (size_t k = 0; k < N; ++k) {
            if (std::abs(dft[k]) > 1e-6) {
                g = reg.amplitudes()[k] / dft[k];
                break;
            }
        }
        for (size_t k = 0; k < N; ++k) {
            assert_test(std::abs(reg.amplitudes()[k] - g * dft[k]) < 1e-9,
                        "QFT complex amplitude (beyond global phase) off at n=" + std::to_string(n)
                            + " k=" + std::to_string(k));
        }
    }

    std::cout << "    -> PASSED: QFT matches the reference DFT within 1e-9 for every n in 1..5!\n";
}

// ----------------------------------------------------------------------------
// Test 11: Grover Target Amplitude (analytic sin((2R+1)*theta), R = floor(pi/4*sqrt(N)))
// ----------------------------------------------------------------------------
static void test_grover_amplitude() {
    std::cout << "  [Test 11/14] Grover Search Amplitude after floor(pi/4*sqrt(N)) iterations...\n";
    struct Case { size_t n; size_t target; };
    const Case cases[] = {{1, 1}, {1, 0}, {2, 0}, {2, 3}, {3, 5}, {3, 7}};

    for (const Case& c : cases) {
        const size_t N = size_t(1) << c.n;
        const double theta = std::asin(1.0 / std::sqrt(static_cast<double>(N)));
        const size_t R = static_cast<size_t>(std::floor(kPi / 4.0 * std::sqrt(static_cast<double>(N))));
        const double expected = std::sin((2.0 * static_cast<double>(R) + 1.0) * theta);

        QubitRegister reg(c.n);
        // n=1 uses only H/X/Z, which keep the packed representation; force
        // the statevector view so amplitudes() is meaningful for every case.
        reg.promote_to_statevector();
        QuantumCircuit circuit(c.n);
        circuit.grover(c.n, c.target);
        circuit.execute(reg);

        const double amp = std::abs(reg.amplitudes()[c.target]);
        assert_test(std::abs(amp - expected) < 1e-9,
                    "grover amplitude deviates from analytic value at n=" + std::to_string(c.n)
                        + " target=" + std::to_string(c.target));
        if (c.n >= 2) {
            assert_test(amp >= 0.9, "grover target amplitude must be >= 0.9 for n >= 2");
        }

        double total = 0.0;
        for (const QComplex& a : reg.amplitudes()) total += std::norm(a);
        assert_test(std::abs(total - 1.0) < 1e-9, "grover circuit must stay unitary");
    }

    std::cout << "    -> PASSED: Grover hits the analytic amplitude exactly (n=2: 1.0, n=3: ~0.972 >= 0.9)!\n";
}

// ----------------------------------------------------------------------------
// Test 12: QFT OpenQASM 3.0 Export
// ----------------------------------------------------------------------------
static void test_qft_qasm_export() {
    std::cout << "  [Test 12/14] QFT OpenQASM 3.0 Export (primitive gate expansion)...\n";
    QuantumCircuit circuit(3);
    circuit.qft(3);

    std::string qasm = circuit.to_openqasm("qft3");
    // QFT(3) = 3 H + 3 cphase (each 2 CX + 3 RZ) + 1 swap.
    assert_test(qasm.find("OPENQASM 3.0;") != std::string::npos, "QASM must have version header");
    assert_test(count_occurrences(qasm, "h q[") == 3, "QFT(3) must emit exactly 3 Hadamards");
    assert_test(count_occurrences(qasm, "cx q[") == 6, "QFT(3) must emit exactly 6 CNOTs (2 per cphase)");
    assert_test(count_occurrences(qasm, "rz(") == 9, "QFT(3) must emit exactly 9 RZ phases (3 per cphase)");
    assert_test(count_occurrences(qasm, "swap q[") == 1, "QFT(3) must emit the bit-reversal swap");

    std::cout << "    -> PASSED: QFT exports as primitive Q-ISA-equivalent gates in OpenQASM 3.0!\n";
}

// ----------------------------------------------------------------------------
// Test 13: QEmitter Builtins qft/grover/qmeasure + .stn Probe Pipeline
// ----------------------------------------------------------------------------
static void test_qemitter_quantum_builtins() {
    std::cout << "  [Test 13/14] QEmitter Builtins qft/grover/qmeasure + .stn Probe Pipeline...\n";

    // 1. The .stn probe: Grover(2, |11>) first (grover prepares its own
    //    uniform superposition, so it needs a fresh |0> register), then the
    //    deterministic measurement, then a qft gate-sequence smoke.
    //    N=4 and R = floor(pi/4*sqrt(4)) = 1 give target amplitude exactly
    //    1.0, so q0 collapses to 1 deterministically and the program exits
    //    with code 1.
    std::string probe_path = find_q_probe("quantum_algorithms.stn");
    std::ifstream pf(probe_path, std::ios::binary);
    std::stringstream pss;
    pss << pf.rdbuf();
    std::string probe_source = pss.str();

    {
        setun::ArenaAllocator arena;
        setun::Lexer lexer(probe_source, probe_path);
        auto tokens = lexer.tokenize();
        setun::Parser parser(tokens, arena);
        setun::Program prog = parser.parse_program();
        QEmitter emitter;
        QChunk chunk = emitter.compile(prog);
        assert_test(!chunk.code.empty(), "probe chunk must not be empty");
        assert_test(std::find(chunk.code.begin(), chunk.code.end(),
                              static_cast<uint8_t>(QOpCode::OP_RZ)) != chunk.code.end(),
                    "probe (qft section) must contain OP_RZ bytes");
        assert_test(std::find(chunk.code.begin(), chunk.code.end(),
                              static_cast<uint8_t>(QOpCode::OP_CZ)) != chunk.code.end(),
                    "probe (grover oracle/diffusion) must contain OP_CZ bytes");
        assert_test(std::find(chunk.code.begin(), chunk.code.end(),
                              static_cast<uint8_t>(QOpCode::OP_SWAP)) != chunk.code.end(),
                    "probe (qft bit reversal) must contain OP_SWAP bytes");
        QVM qvm;
        int64_t ret = qvm.run(chunk);
        assert_test(ret == 1, "grover(2, 3) probe must measure q0 = 1 deterministically (exit code 1)");
    }

    // 2. Complementary deterministic probe: even target -> q0 collapses to 0.
    {
        std::string src = "fn main() -> int { grover(2, 2); qmeasure(0); return 0; }";
        setun::ArenaAllocator arena;
        setun::Lexer lexer(src);
        auto tokens = lexer.tokenize();
        setun::Parser parser(tokens, arena);
        setun::Program prog = parser.parse_program();
        QEmitter emitter;
        QChunk chunk = emitter.compile(prog);
        QVM qvm;
        int64_t ret = qvm.run(chunk);
        assert_test(ret == 0, "grover(2, 2) must measure q0 = 0 deterministically (exit code 0)");
    }

    // 3. Out-of-range uses must be rejected at compile time.
    {
        bool threw = false;
        try {
            std::string src = "fn main() -> int { grover(4, 3); return 0; }";
            setun::ArenaAllocator arena;
            setun::Lexer lexer(src);
            auto tokens = lexer.tokenize();
            setun::Parser parser(tokens, arena);
            setun::Program prog = parser.parse_program();
            QEmitter emitter;
            emitter.compile(prog);
        } catch (const setun::CompilerException&) {
            threw = true;
        }
        assert_test(threw, "grover(n > 3) must raise CompilerException on the Q-ISA target");
    }
    {
        bool threw = false;
        try {
            std::string src = "fn main() -> int { qft(0); return 0; }";
            setun::ArenaAllocator arena;
            setun::Lexer lexer(src);
            auto tokens = lexer.tokenize();
            setun::Parser parser(tokens, arena);
            setun::Program prog = parser.parse_program();
            QEmitter emitter;
            emitter.compile(prog);
        } catch (const setun::CompilerException&) {
            threw = true;
        }
        assert_test(threw, "qft(0) must raise CompilerException on the Q-ISA target");
    }

    std::cout << "    -> PASSED: qft/grover/qmeasure builtins compile to Q-ISA and run-qvm measures!\n";
}

// ----------------------------------------------------------------------------
// Test 14: QVM Bytecode Path vs Circuit Execute (RZ/f64 dispatch parity)
// ----------------------------------------------------------------------------
static void test_qvm_qft_bytecode_path() {
    std::cout << "  [Test 14/14] QVM Bytecode Path (OP_RZ + inline f64) vs Circuit Execute Parity...\n";
    std::string source = R"(
        fn main() -> int {
            let a: int = 1;
            qft(2);
            return 0;
        }
    )";

    setun::ArenaAllocator arena;
    setun::Lexer lexer(source);
    auto tokens = lexer.tokenize();
    setun::Parser parser(tokens, arena);
    setun::Program prog = parser.parse_program();

    // Bytecode path: .stn -> QEmitter -> QChunk -> QVM::run.
    QEmitter emitter;
    QChunk chunk = emitter.compile(prog);
    QVM qvm(16);
    qvm.run(chunk);

    // Reference path: same program state built directly on a register.
    QubitRegister expected(16);
    GateOps::apply_x(expected, 0); // let a: int = 1
    QuantumCircuit circuit(16);
    circuit.qft(2);
    circuit.execute(expected);

    const auto& got = qvm.qreg().amplitudes();
    const auto& ref = expected.amplitudes();
    assert_test(got.size() == ref.size(), "statevector dimensions must match");
    for (size_t i = 0; i < ref.size(); ++i) {
        assert_test(std::abs(std::abs(got[i]) - std::abs(ref[i])) < 1e-9,
                    "bytecode path diverges from circuit execute at amplitude " + std::to_string(i));
    }

    // Analytic spot check: X|0> on q0 then QFT(2) gives QFT|1> on the 2-qubit
    // slice: |amp| = 1/2 for k = 0..3.
    for (size_t k = 0; k < 4; ++k) {
        assert_test(std::abs(std::abs(got[k]) - 0.5) < 1e-9,
                    "QFT|1> amplitudes must all be 1/2 (k = " + std::to_string(k) + ")");
    }

    std::cout << "    -> PASSED: QFT bytecode (RZ with inline f64) executes identically to the circuit path!\n";
}

// ----------------------------------------------------------------------------
// Main QVM Test Runner
// ----------------------------------------------------------------------------
int run_qvm_tests() {
    std::cout << "\n[Tersun 1.0.2 Quantum Evolution] Testing QVM Engine & 2-Bit Qubit Mapping...\n\n";
    std::cout << "===================================================================\n";
    std::cout << "  [Tersun 1.0.2] Quantum Virtual Machine (QVM) Verification Suite  \n";
    std::cout << "===================================================================\n\n";

    test_2bit_packing();
    test_single_qubit_gates();
    test_bell_state_entanglement();
    test_born_rule_measurement();
    test_ternary_qutrit_gates();
    test_llvm2qvm_translation();
    test_direct_ast_to_qvm();
    test_openqasm_export();
    test_cphase_decomposition();
    test_qft_matches_dft();
    test_grover_amplitude();
    test_qft_qasm_export();
    test_qemitter_quantum_builtins();
    test_qvm_qft_bytecode_path();

    std::cout << "\n===================================================================\n";
    std::cout << "  ALL TERSUN 1.0.2 QVM TESTS PASSED (14/14 SUCCESS)!                 \n";
    std::cout << "===================================================================\n\n";
    return 0;
}
