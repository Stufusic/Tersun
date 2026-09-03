#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include "compiler/llvm_emitter.hpp"
#include "vm/vm.hpp"
#include "hardware/verilog_emitter.hpp"
#include "tools/tpm.hpp"
#include "tools/bindgen.hpp"
#include "tools/lsp_server.hpp"
#include "tools/formatter.hpp"
#include "tools/debugger.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/monomorphizer.hpp"
#include "graphics/setun2d_bridge.hpp"
#include "vm/jit_engine.hpp"

#include <iostream>
#include <fstream>
#include <sstream>
#include <chrono>
#include <iomanip>
#include <cstring>

using namespace setun;

void print_banner() {
    std::cout << "===================================================================\n";
    std::cout << "  Setun 2.0 Balanced Ternary LLVM Compiler & AOT Toolchain (v2.0) \n";
    std::cout << "  Native Speed C++ • Multi-Arch ARM/x86/RISC-V/Wasm • TAFPU Q(√3) \n";
    std::cout << "===================================================================\n\n";
}

void print_help(const char* prog_name) {
    print_banner();
    std::cout << "Usage: " << prog_name << " <command> [options]\n\n";
    std::cout << "Commands:\n";
    std::cout << "  run <file.setun|.tbc>   Execute a Setun source or bytecode file\n";
    std::cout << "  compile <file> -o <out> Compile source to bytecode binary (.tbc)\n";
    std::cout << "  compile <file> --native Compile source to AOT Native Executable (.exe)\n";
    std::cout << "  --emit-c <file>         Transpile Setun source to High-Speed C20 SIMD code\n";
    std::cout << "  --emit-llvm <file>      Generate Multi-Arch LLVM IR text (.ll)\n";
    std::cout << "  --emit-verilog          Generate synthesizable Verilog-2001 RTL for TAFPU\n";
    std::cout << "  disasm / --dump-asm     Compile and disassemble bytecode to stdout\n";
    std::cout << "  tpm <init|build|test>   Ternary Package Manager project commands\n";
    std::cout << "  repl                    Start interactive balanced ternary REPL\n";
    std::cout << "  benchmark               Run 100,000 cycles TAFPU vs IEEE 754 benchmark\n";
    std::cout << "  test                    Run self-tests (TAFPU, Branch3, Syntax, LLVM Native)\n";
    std::cout << "  trace-btvp <a> <b>      Trace trit-by-trit addition (reproduces Table 1)\n";
    std::cout << "\n";
}

std::string read_file(const std::string& path) {
    std::ifstream file(path);
    if (!file.is_open()) {
        throw SetunException("Failed to open file: " + path);
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

int cmd_run(const std::string& path) {
    try {
        Chunk chunk;
        // Check if path is a binary .tbc file
        if (path.size() >= 4 && path.substr(path.size() - 4) == ".tbc") {
            if (!Chunk::load_from_file(path, chunk)) {
                std::cerr << "[Error]: Failed to load binary bytecode file: " << path << "\n";
                return 1;
            }
        } else {
            // Text source (.taf / .setun)
            std::string source = read_file(path);
            ArenaAllocator arena;
            Lexer lexer(source);
            auto tokens = lexer.tokenize();

            Parser parser(tokens, arena);
            Program program = parser.parse_program();

            TypeChecker checker;
            if (!checker.check_program(program)) {
                std::cerr << checker.format_diagnostics(source);
                return 1;
            }

            Monomorphizer monomorphizer;
            monomorphizer.process_program(program);

            BytecodeEmitter emitter;
            chunk = emitter.compile(program);
        }

        VM vm;
        vm.run(chunk);
        return 0;
    } catch (const SetunException& e) {
        std::cerr << "[Setun Runtime/Compiler Error]: " << e.what() << "\n";
        return 1;
    } catch (const std::exception& e) {
        std::cerr << "[Fatal Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_compile(const std::string& source_path, const std::string& out_path) {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        TypeChecker checker;
        if (!checker.check_program(program)) {
            std::cerr << checker.format_diagnostics(source);
            return 1;
        }

        Monomorphizer monomorphizer;
        monomorphizer.process_program(program);

        BytecodeEmitter emitter;
        Chunk chunk = emitter.compile(program);

        if (!chunk.save_to_file(out_path)) {
            std::cerr << "[Error]: Failed to write binary bytecode to " << out_path << "\n";
            return 1;
        }

        std::cout << "[OK] Successfully compiled " << source_path << " -> " << out_path
                  << " (" << chunk.code.size() << " bytes bytecode, "
                  << chunk.string_table.size() << " strings)\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[Compilation Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_emit_c(const std::string& source_path) {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        LLVMEmitter emitter;
        std::cout << emitter.emit_native_c(program);
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[Transpilation Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_emit_llvm(const std::string& source_path, const std::string& out_path = "", const std::string& triple = "x86_64-pc-windows-msvc") {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        TargetConfig cfg;
        cfg.triple = triple;
        cfg.opt_level = 3;

        LLVMEmitter emitter(cfg);
        std::string ir = emitter.emit_llvm_ir(program);
        if (!out_path.empty()) {
            std::ofstream ofs(out_path);
            if (!ofs.is_open()) {
                std::cerr << "[Error]: Failed to write to " << out_path << "\n";
                return 1;
            }
            ofs << ir;
            std::cout << "[OK] Generated LLVM IR: " << out_path << " (" << ir.size() << " bytes)\n";
        } else {
            std::cout << ir;
        }
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[LLVM IR Generation Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_compile_llvm(const std::string& source_path, const std::string& out_path, int opt_level = 3) {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        LLVMEmitter emitter;
        std::cout << "[LLVM AOT] Compiling " << source_path << " to Native Binary (" << out_path << ") with LLVM Backend (-O" << opt_level << ")...\n";
        if (!emitter.compile_llvm_native(program, out_path, opt_level)) {
            std::cerr << "[Error]: LLVM compilation failed.\n";
            return 1;
        }

        std::cout << "[OK] Successfully built native executable: " << out_path << " (LLVM Native Pipeline)\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[LLVM Native Compilation Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_compile_native(const std::string& source_path, const std::string& out_path, int opt_level = 3) {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        TypeChecker checker;
        if (!checker.check_program(program)) {
            std::cerr << checker.format_diagnostics(source);
            return 1;
        }

        Monomorphizer monomorphizer;
        monomorphizer.process_program(program);

        LLVMEmitter emitter;
        std::cout << "[AOT] Compiling " << source_path << " to Native Binary (" << out_path << ") with -O" << opt_level << "...\n";
        if (!emitter.compile_native(program, out_path, opt_level)) {
            std::cerr << "[Error]: Native compilation failed.\n";
            return 1;
        }

        std::cout << "[OK] Successfully built native executable: " << out_path << " (Tốc độ Native C++)\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[Native Compilation Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_disasm(const std::string& path) {
    try {
        Chunk chunk;
        if (path.size() >= 4 && path.substr(path.size() - 4) == ".tbc") {
            if (!Chunk::load_from_file(path, chunk)) {
                std::cerr << "[Error]: Failed to load binary bytecode: " << path << "\n";
                return 1;
            }
        } else {
            std::string source = read_file(path);
            ArenaAllocator arena;
            Lexer lexer(source);
            auto tokens = lexer.tokenize();

            Parser parser(tokens, arena);
            Program program = parser.parse_program();

            BytecodeEmitter emitter;
            chunk = emitter.compile(program);
        }

        std::cout << chunk.disassemble(path) << "\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[Disassembly Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_trace_btvp(int64_t a, int64_t b) {
    std::cout << "=== BTVP Multi-Trit Full Addition Trace ===\n";
    std::cout << "Operand A: " << a << " (" << to_ternary_string(a) << ")\n";
    std::cout << "Operand B: " << b << " (" << to_ternary_string(b) << ")\n\n";

    auto [res, trace] = btvp_add_with_trace(a, b);

    std::cout << std::left
              << std::setw(10) << "Vị trí"
              << std::setw(10) << "Trit A"
              << std::setw(10) << "Trit B"
              << std::setw(12) << "Carry in"
              << std::setw(15) << "Tổng giá trị"
              << std::setw(14) << "Trit Result"
              << std::setw(10) << "Carry out"
              << "\n";
    std::cout << "-------------------------------------------------------------------------------\n";

    for (const auto& step : trace) {
        std::ostringstream pos_str;
        pos_str << "3^" << step.power_idx << " (" << step.weight << ")";

        std::cout << std::left
                  << std::setw(10) << pos_str.str()
                  << std::setw(10) << trit_to_char(step.trit_a)
                  << std::setw(10) << trit_to_char(step.trit_b)
                  << std::setw(12) << trit_to_char(step.carry_in)
                  << std::setw(15) << (step.total_sum >= 0 ? "+" + std::to_string(step.total_sum) : std::to_string(step.total_sum))
                  << std::setw(14) << trit_to_char(step.trit_result)
                  << std::setw(10) << trit_to_char(step.carry_out)
                  << "\n";
    }

    std::cout << "-------------------------------------------------------------------------------\n";
    std::cout << "Kết quả: Chuỗi Trit " << to_ternary_string(res) << " = " << res << " (Chính xác 100%).\n";
    return 0;
}

int cmd_benchmark() {
    constexpr int ITERATIONS = 100000;
    std::cout << "=== TAFPU vs IEEE 754 Microsecond Benchmark (" << ITERATIONS << " chu kỳ lặp) ===\n\n";

    // Setup operands
    TafpuNum t1(14, 25, 0);
    TafpuNum t2(10, 5, 0);
    double d1 = t1.to_double();
    double d2 = t2.to_double();

    // 1. Addition Benchmark
    auto start = std::chrono::high_resolution_clock::now();
    volatile double d_res_add = 0.0;
    for (int i = 0; i < ITERATIONS; ++i) {
        d_res_add = d1 + d2;
    }
    auto end = std::chrono::high_resolution_clock::now();
    double ieee_add_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    start = std::chrono::high_resolution_clock::now();
    TafpuNum t_res_add;
    for (int i = 0; i < ITERATIONS; ++i) {
        t_res_add = tafpu_add(t1, t2);
    }
    end = std::chrono::high_resolution_clock::now();
    double tafpu_add_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    // 2. Subtraction Benchmark
    start = std::chrono::high_resolution_clock::now();
    volatile double d_res_sub = 0.0;
    for (int i = 0; i < ITERATIONS; ++i) {
        d_res_sub = d1 - d2;
    }
    end = std::chrono::high_resolution_clock::now();
    double ieee_sub_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    start = std::chrono::high_resolution_clock::now();
    TafpuNum t_res_sub;
    for (int i = 0; i < ITERATIONS; ++i) {
        t_res_sub = tafpu_sub(t1, t2);
    }
    end = std::chrono::high_resolution_clock::now();
    double tafpu_sub_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    // 3. Multiplication Benchmark
    start = std::chrono::high_resolution_clock::now();
    volatile double d_res_mul = 0.0;
    for (int i = 0; i < ITERATIONS; ++i) {
        d_res_mul = d1 * d2;
    }
    end = std::chrono::high_resolution_clock::now();
    double ieee_mul_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    start = std::chrono::high_resolution_clock::now();
    TafpuNum t_res_mul;
    for (int i = 0; i < ITERATIONS; ++i) {
        t_res_mul = tafpu_mul(t1, t2);
    }
    end = std::chrono::high_resolution_clock::now();
    double tafpu_mul_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    // 4. Division Benchmark
    start = std::chrono::high_resolution_clock::now();
    volatile double d_res_div = 0.0;
    for (int i = 0; i < ITERATIONS; ++i) {
        d_res_div = d1 / d2;
    }
    end = std::chrono::high_resolution_clock::now();
    double ieee_div_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    start = std::chrono::high_resolution_clock::now();
    TafpuNum t_res_div;
    for (int i = 0; i < ITERATIONS; ++i) {
        t_res_div = tafpu_div(t1, t2);
    }
    end = std::chrono::high_resolution_clock::now();
    double tafpu_div_us = std::chrono::duration<double, std::micro>(end - start).count() / ITERATIONS;

    // Output Table 2 Reproduction
    std::cout << std::left
              << std::setw(20) << "Phép toán"
              << std::setw(26) << "TAFPU Simulator (C++)"
              << std::setw(24) << "Chuẩn IEEE 754 Single"
              << "Độ chính xác đại số\n";
    std::cout << "----------------------------------------------------------------------------------------\n";
    std::cout << std::fixed << std::setprecision(4);
    std::cout << std::left << std::setw(20) << "Phép cộng (add)"
              << std::setw(26) << (std::to_string(tafpu_add_us) + " µs")
              << std::setw(24) << (std::to_string(ieee_add_us) + " µs")
              << "0% sai số (tuyệt đối)\n";
    std::cout << std::left << std::setw(20) << "Phép trừ (sub)"
              << std::setw(26) << (std::to_string(tafpu_sub_us) + " µs")
              << std::setw(24) << (std::to_string(ieee_sub_us) + " µs")
              << "0% sai số (tuyệt đối)\n";
    std::cout << std::left << std::setw(20) << "Phép nhân (mul)"
              << std::setw(26) << (std::to_string(tafpu_mul_us) + " µs")
              << std::setw(24) << (std::to_string(ieee_mul_us) + " µs")
              << "0% sai số (tuyệt đối)\n";
    std::cout << std::left << std::setw(20) << "Phép chia (div)"
              << std::setw(26) << (std::to_string(tafpu_div_us) + " µs")
              << std::setw(24) << (std::to_string(ieee_div_us) + " µs")
              << "Trục căn thức Q(√3)\n";
    std::cout << "----------------------------------------------------------------------------------------\n\n";

    (void)d_res_add; (void)d_res_sub; (void)d_res_mul; (void)d_res_div;
    (void)t_res_add; (void)t_res_sub; (void)t_res_mul; (void)t_res_div;
    return 0;
}

int cmd_repl() {
    print_banner();
    std::cout << "Entering Setun-70 REPL. Type 'exit' to quit, 'trace' to dump registers.\n";
    std::cout << "Examples: let x: taf3 = [14, 25, 0]; let y = encode_tafpu(3.14159); println(x * y);\n\n";

    VM vm;
    ArenaAllocator arena;
    std::string line;

    while (true) {
        std::cout << "setun> ";
        if (!std::getline(std::cin, line)) break;
        if (line == "exit" || line == "quit") break;
        if (line.empty()) continue;

        try {
            Lexer lexer(line);
            auto tokens = lexer.tokenize();

            Parser parser(tokens, arena);
            Program program = parser.parse_program();

            BytecodeEmitter emitter;
            Chunk chunk = emitter.compile(program);

            vm.run(chunk);
        } catch (const std::exception& e) {
            std::cerr << "Error: " << e.what() << "\n";
        }
    }
    return 0;
}

// Forward declaration of internal test runner
int run_all_tests();

int main(int argc, char* argv[]) {
    if (argc < 2) {
        print_help(argv[0]);
        return 0;
    }

    std::string cmd = argv[1];

    // 1. Emit C20 Native Transpile: setunc --emit-c <file>
    if (cmd == "--emit-c" && argc >= 3) {
        return cmd_emit_c(argv[2]);
    }

    // 2. Emit Multi-Arch LLVM IR: setunc emit-llvm <file> [-o <out.ll>] [triple]
    if ((cmd == "emit-llvm" || cmd == "--emit-llvm") && argc >= 3) {
        std::string source_file = argv[2];
        std::string out_file = "";
        std::string triple = "x86_64-pc-windows-msvc";

        for (int i = 3; i < argc; ++i) {
            std::string arg = argv[i];
            if (arg == "-o" && i + 1 < argc) {
                out_file = argv[++i];
            } else if (!arg.empty() && arg[0] != '-') {
                triple = arg;
            }
        }
        return cmd_emit_llvm(source_file, out_file, triple);
    }

    // 3. Compile: setunc compile <source> [-o <out>] [--native|--llvm] [-O0|-O1|-O2|-O3]
    if (cmd == "compile" && argc >= 3) {
        std::string source_file = argv[2];
        bool is_native = false;
        bool is_llvm = false;
        std::string out_file = "";
        int opt_level = 3;

        for (int i = 3; i < argc; ++i) {
            std::string arg = argv[i];
            if (arg == "--native") {
                is_native = true;
            } else if (arg == "--llvm") {
                is_llvm = true;
            } else if (arg == "-o" && i + 1 < argc) {
                out_file = argv[++i];
            } else if (arg == "-O0") {
                opt_level = 0;
            } else if (arg == "-O1") {
                opt_level = 1;
            } else if (arg == "-O2") {
                opt_level = 2;
            } else if (arg == "-O3") {
                opt_level = 3;
            }
        }

        if (is_llvm) {
            if (out_file.empty()) out_file = "app.exe";
            return cmd_compile_llvm(source_file, out_file, opt_level);
        } else if (is_native) {
            if (out_file.empty()) out_file = "app.exe";
            return cmd_compile_native(source_file, out_file, opt_level);
        } else {
            if (out_file.empty()) out_file = "out.tbc";
            return cmd_compile(source_file, out_file);
        }
    }

    if (argc >= 4 && std::string(argv[2]) == "-o") {
        return cmd_compile(argv[1], argv[3]);
    }

    // 4. Disassembly / Dump Assembly: setunc disasm <file> or setunc --dump-asm <file>
    if ((cmd == "disasm" || cmd == "--dump-asm") && argc >= 3) {
        return cmd_disasm(argv[2]);
    }

    // 5. Run source or binary: setunc run [--jit] [--jit-ram] [--headless] <file>
    if (cmd == "run" && argc >= 3) {
        bool is_jit = false;
        bool is_jit_ram = false;
        bool is_headless = false;
        std::string target_file = "";

        for (int i = 2; i < argc; ++i) {
            std::string arg = argv[i];
            if (arg == "--jit") is_jit = true;
            else if (arg == "--jit-ram") is_jit_ram = true;
            else if (arg == "--headless") is_headless = true;
            else if (target_file.empty()) target_file = arg;
        }

        if (is_headless) {
            setun::graphics::Setun2DBridge::instance().set_headless(true);
        }

        if (is_jit_ram && !target_file.empty()) {
            std::string source = read_file(target_file);
            ArenaAllocator arena;
            Lexer lexer(source);
            auto tokens = lexer.tokenize();
            Parser parser(tokens, arena);
            Program program = parser.parse_program();
            BytecodeEmitter emitter;
            Chunk chunk = emitter.compile(program);

            SetunJITEngine jit;
            if (jit.compile(chunk)) {
                std::cout << "[JIT Engine] Compiled " << chunk.code.size() << " bytes of bytecode -> "
                          << jit.code_size() << " bytes native x86-64 machine code in RAM!\n";
                int64_t ret = jit.run();
                std::cout << "[JIT Output / Exit Code]: " << ret << "\n";
                return 0;
            } else {
                std::cerr << "[JIT Engine]: Falling back to VM...\n";
                return cmd_run(target_file);
            }
        }

        if (is_jit && !target_file.empty()) {
            std::string jit_bin = "setun_jit_exec.exe";
            int comp_ret = cmd_compile_llvm(target_file, jit_bin, 3);
            if (comp_ret != 0) return comp_ret;
            int run_ret = std::system(jit_bin.c_str());
            std::remove(jit_bin.c_str());
            std::string ll_tmp = jit_bin + ".ll";
            std::remove(ll_tmp.c_str());
            return run_ret;
        }

        if (!target_file.empty()) {
            return cmd_run(target_file);
        }
    }

    // 4. Verilog RTL Synthesis Emitter (Module 4)
    if (cmd == "--emit-verilog") {
        std::cout << VerilogEmitter::emit_tafpu_alu_core() << "\n\n";
        std::cout << VerilogEmitter::emit_btvp_adder_module() << "\n";
        return 0;
    }

    // 4.1 Automated C/C++ Header Bindgen (Phase 4)
    if (cmd == "bindgen") {
        if (argc < 3) {
            std::cout << "Usage: setunc bindgen <header.h> [-o <out.stn>]\n";
            return 1;
        }
        std::string header_file = argv[2];
        std::string out_file = (argc >= 5 && std::string(argv[3]) == "-o") ? argv[4] : "setun_bindings.stn";
        return tools::CBindgen::generate_file(header_file, out_file) ? 0 : 1;
    }

    // 4.2 Language Server Protocol Server (Phase 5)
    if (cmd == "lsp") {
        tools::LSPServer server;
        server.run_stdio();
        return 0;
    }

    // 4.3 Code Auto-Formatter (Phase 5)
    if (cmd == "fmt") {
        if (argc < 3) {
            std::cout << "Usage: setunc fmt <file.stn> [-w]\n";
            return 1;
        }
        std::string file_path = argv[2];
        bool in_place = (argc >= 4 && std::string(argv[3]) == "-w");
        return tools::SetunFormatter::format_file(file_path, in_place) ? 0 : 1;
    }

    // 4.4 Interactive Visual Debugger (Phase 5)
    if (cmd == "debug") {
        if (argc < 3) {
            std::cout << "Usage: setunc debug <file.tbc>\n";
            return 1;
        }
        tools::VisualDebugger debugger;
        return debugger.start_session(argv[2]) ? 0 : 1;
    }

    // 5. TPM Package Manager (Module 5)
    if (cmd == "tpm") {
        if (argc < 3) {
            std::cout << "Usage: setunc tpm <init [name] | build | test>\n";
            return 1;
        }
        std::string sub = argv[2];
        if (sub == "init") {
            std::string name = (argc >= 4) ? argv[3] : "my_ternary_app";
            return TernaryPackageManager::cmd_init(name);
        } else if (sub == "build") {
            return TernaryPackageManager::cmd_build("setun.toml");
        } else if (sub == "test") {
            return TernaryPackageManager::cmd_test("setun.toml");
        }
    }

    // 6. Other subcommands
    if (cmd == "trace-btvp") {
        int64_t a = (argc >= 3) ? std::stoll(argv[2]) : 14;
        int64_t b = (argc >= 4) ? std::stoll(argv[3]) : 25;
        return cmd_trace_btvp(a, b);
    } else if (cmd == "benchmark") {
        return cmd_benchmark();
    } else if (cmd == "repl") {
        return cmd_repl();
    } else if (cmd == "test") {
        return run_all_tests();
    } else {
        print_help(argv[0]);
        return 1;
    }
}
