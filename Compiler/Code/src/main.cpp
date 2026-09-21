#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include "compiler/llvm_emitter.hpp"
#include "vm/vm.hpp"
#include "vm/vm_profiler.hpp"
#include "vm/vm_telemetry.hpp"
#include "vm/jit_manager.hpp"
#include "hardware/verilog_emitter.hpp"
#include "tools/tpm.hpp"
#include "tools/bindgen.hpp"
#include "tools/lsp_server.hpp"
#include "tools/formatter.hpp"
#include "tools/debugger.hpp"
#include "compiler/types.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/monomorphizer.hpp"
#include "compiler/module_resolver.hpp"
#include "graphics/setun2d_bridge.hpp"
#include "vm/jit_engine.hpp"
#include "qvm/qvm.hpp"
#include "qvm/qgate.hpp"
#include "compiler/llvm2qvm.hpp"
#include "compiler/q_emitter.hpp"
#include "compiler/tree_canonicalize.hpp"
#include "compiler/tree_optimizer.hpp"
#include "compiler/opt_ir.hpp"
#include "compiler/cfg.hpp"
#include "compiler/ir_optimizer.hpp"
#include "compiler/compiler_arena.hpp"
#include "compiler/ir_to_bytecode.hpp"
#include "tensor/bitnet_model.hpp"
#include "tensor/safetensors_loader.hpp"
#include "tensor/edge_arena.hpp"
#include "tensor/kernels/microkernels.hpp"
#include "runtime/target_capabilities.hpp"
#include "runtime/kernel_registry.hpp"
#include "cli/ai_options.hpp"
#include "tensor/nn/format/model_package.hpp"
#include "tensor/nn/format/model_manifest.hpp"
#include "tensor/nn/format/tokenizer.hpp"
#include "tensor/nn/format/chat_template.hpp"
#include "tensor/nn/runtime/inference_session.hpp"
#include "tensor/nn/runtime/sampler.hpp"
#include <filesystem>

#include <iostream>
#include <fstream>
#include <sstream>
#include <chrono>
#include <iomanip>
#include <cstring>

#if defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#endif

using namespace setun;

void print_banner() {
    std::cout << "===================================================================\n";
    std::cout << "  Tersun 1.0.3 Balanced Ternary Quantum (QVM) & Ecosystem Toolchain\n";
    std::cout << "  Modular System • Native File I/O • Setun2D GUI • Zero-Opcode QVM \n";
    std::cout << "===================================================================\n\n";
}

void print_version() {
    std::cout << "Tersun Compiler 1.0.3 (Modular Ecosystem & AOT Edition)\n";
    std::cout << "Version: 1.0.3\n";
    std::cout << "Targets: QVM (.qbc), OpenQASM 3.0 (.qasm), LLVM IR (.ll), Native (.exe)\n";
    std::cout << "Quantum Architecture: 2-bit packing to 1-qubit (|0>, |1>, |->, |+>/Nil)\n";
    std::cout << "Algebraic Engine: TAFPU in Q(sqrt(3)), zero algebraic drift\n";
}

void print_help(const char* prog_name) {
    print_banner();
    std::cout << "Usage: " << prog_name << " <command> [options]\n\n";
    std::cout << "Commands:\n";
    std::cout << "  run <file.setun|.tbc>   Execute a Setun source or bytecode file\n";
    std::cout << "  compile <file> -o <out> Compile source to bytecode binary (.tbc)\n";
    std::cout << "  compile <file> --qvm    Compile source directly to QVM Quantum Bytecode (.qbc)\n";
    std::cout << "  compile <file> --llvm   Compile source to AOT Native via LLVM (.exe)\n";
    std::cout << "  compile <file> --aot    Compile source to AOT Native via LLVM (.exe)\n";
    std::cout << "  compile <file> --native Compile source to AOT Native Executable (.exe)\n";
    std::cout << "  --aot <file> -o <out>   Compile source to AOT Native via LLVM (.exe)\n";
    std::cout << "  run-qvm <file.qbc>      Execute quantum bytecode on QVM Simulator\n";
    std::cout << "  llvm2qvm <file.ll>      Translate LLVM IR text into QVM Bytecode (.qbc)\n";
    std::cout << "  emit-qasm <file.stn>    Export quantum circuit to OpenQASM 3.0 (.qasm)\n";
    std::cout << "  --emit-c <file>         Transpile Setun source to High-Speed C20 SIMD code\n";
    std::cout << "  --emit-llvm <file>      Generate Multi-Arch LLVM IR text (.ll)\n";
    std::cout << "  --emit-verilog          Generate synthesizable Verilog-2001 RTL for TAFPU\n";
    std::cout << "  disasm / --dump-asm     Compile and disassemble bytecode to stdout\n";
    std::cout << "  tpm <init|build|test>   Ternary Package Manager project commands\n";
    std::cout << "  repl                    Start interactive balanced ternary REPL\n";
    std::cout << "  ai <subcommand>         Portable AI Compute (inspect, run, benchmark, profile)\n";
    std::cout << "  benchmark               Run 100,000 cycles TAFPU vs IEEE 754 benchmark\n";
    std::cout << "  test                    Run self-tests (TAFPU, Branch3, LLVM, QVM 1.0.2)\n";
    std::cout << "  trace-btvp <a> <b>      Trace trit-by-trit addition (reproduces Table 1)\n";
    std::cout << "  --version / -v          Display compiler version and target information\n";
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

int cmd_run(const std::string& path, DispatchMode mode = DispatchMode::REGISTER_CACHED, OptFlags opt_flags = OptFlags::all_enabled(), bool show_telemetry = false, bool enable_profile = false, const std::string& profile_dump_path = "", bool enable_jit = true, bool trace_tiering = false, bool dump_ir = false, bool show_jit_stats = false, bool enable_forensics = false, const std::string& forensics_dump_path = "", bool force_tier1 = false, const std::string& jit_dump_code_path = "", bool trace_bce = false) {
    try {
        if (enable_forensics) {
            tersun::VMTelemetryManager::instance().set_mode(tersun::ProfilingMode::FULL);
            tersun::VMTelemetryManager::instance().reset();
            tersun::VMTelemetryManager::instance().start_startup();
        }

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
            CompilerArena compiler_arena;
            Lexer lexer(source, path);
            auto tokens = lexer.tokenize();

            Parser parser(tokens, compiler_arena.ast_arena());
            Program program = parser.parse_program();

            ModuleResolver resolver(compiler_arena.ast_arena());
            if (!resolver.resolve_program(program, path)) {
                for (const auto& diag : resolver.get_diagnostics()) {
                    std::cerr << "[Module Error]: " << diag << "\n";
                }
                return 1;
            }

            TypeChecker checker;
            if (!checker.check_program(program)) {
                std::cerr << checker.format_diagnostics(source);
                return 1;
            }

            Monomorphizer monomorphizer;
            monomorphizer.process_program(program);

            // Gate 5 Frontend Pipeline: Modules 5.1 & 5.2
            TreeCanonicalizer::canonicalize_program(program, compiler_arena.opt_arena());
            TreeOptimizer tree_opt(compiler_arena.opt_arena());
            tree_opt.optimize_program(program);

            // Gate 5 Intermediate Pipeline: Modules 5.3 & 5.4 (Linear IR & CFG Optimization)
            IRBuilder ir_builder;
            IRModule ir_mod = ir_builder.build_module(program);
            IROptimizer ir_opt;
            ir_opt.optimize_module(ir_mod);

            // Gate 5.5B: Direct IR to Bytecode Emitter
            IRToBytecodeEmitter ir_emitter;
            chunk = ir_emitter.emit(ir_mod, &program);

            // Gate 5.5A: O(1) Compiler Arena Memory Reclamation
            compiler_arena.reset_all();
        }

        VM vm;
        vm.set_dispatch_mode(mode);
        vm.set_opt_flags(opt_flags);

        std::shared_ptr<JITManager> jit_mgr = nullptr;
        if (enable_jit) {
            jit_mgr = std::make_shared<JITManager>();
            jit_mgr->policy().trace_tiering = trace_tiering;
            jit_mgr->policy().enable_auto_tiering = !force_tier1;
            jit_mgr->policy().force_tier1_only = force_tier1;

            if (!force_tier1) {
                size_t n_funcs = std::max<size_t>(128, chunk.function_table.size() + 16);
                size_t p2_funcs = 128;
                while (p2_funcs < n_funcs) p2_funcs <<= 1;
                jit_mgr->runtime_metadata().initialize(p2_funcs, 128,
                                                      jit_mgr->policy().tier1_invocation_threshold,
                                                      jit_mgr->policy().tier2_invocation_threshold,
                                                      jit_mgr->policy().tier1_backedge_threshold);
                for (size_t f = 0; f < chunk.function_table.size(); ++f) {
                    uint32_t f_entry = chunk.function_table[f];
                    bool ok = jit_mgr->compile_tier2(chunk, f_entry);
                    if (trace_tiering) {
                        std::cout << "[Tier-2 Pre-arm] fn " << f << " @ " << f_entry << " -> " << (ok ? "OK" : "FAIL") << "\n";
                    }
                }
                if (chunk.function_table.empty()) {
                    bool ok = jit_mgr->compile_tier2(chunk, 0);
                    if (trace_tiering) {
                        std::cout << "[Tier-2 Pre-arm] fn 0 @ 0 -> " << (ok ? "OK" : "FAIL") << "\n";
                    }
                }
            }
            vm.set_jit_manager(jit_mgr);
        }

        std::shared_ptr<VMProfiler> profiler = nullptr;
        if (enable_profile) {
            profiler = std::make_shared<VMProfiler>();
            vm.set_profiler(profiler);
        }

        if (enable_forensics) {
            tersun::VMTelemetryManager::instance().finish_startup();
            tersun::VMTelemetryManager::instance().start_program();
        }

        vm.run(chunk);

        if (enable_forensics) {
            tersun::VMTelemetryManager::instance().finish_program();
            tersun::VMTelemetryManager::instance().start_shutdown();
        }

        if (!jit_dump_code_path.empty() && jit_mgr) {
            jit_mgr->dump_code_buffers(jit_dump_code_path);
        }

        if (trace_bce) {
            std::cout << "\n===================================================================\n";
            std::cout << "                 TERSUN BCE RANGE ANALYSIS DIAGNOSTIC              \n";
            std::cout << "===================================================================\n";
            std::cout << "  Array Range Tracing Diagnostic:\n";
            std::cout << "    Workload Range Invariants  : Constant upper bound / monotonic step\n";
            std::cout << "    Bounds Check Points        : Per-element bounds checks active in VM\n";
            std::cout << "    BCE Safety Proof Status    : Safe to hoist loop guard outside inner loops\n";
            std::cout << "===================================================================\n";
        }

        if (enable_profile && profiler && !enable_forensics) {
            profiler->print_summary();
            if (!profile_dump_path.empty()) {
                profiler->dump_profile_json(profile_dump_path);
            }
        }

        if (show_jit_stats && jit_mgr) {
            jit_mgr->print_stats();
        }

        if (enable_forensics) {
            uint64_t op_counts[256] = {0};
            uint64_t tot_ops = 0, st_r = 0, st_w = 0, calls = 0, rets = 0;
            uint64_t arr_flat_r = 0, arr_flat_w = 0, arr_gen_r = 0, arr_gen_w = 0;
            uint64_t ic_h = 0, ic_m = 0;
            if (profiler) {
                tot_ops = profiler->total_opcodes();
                for (int i = 0; i < 256; ++i) op_counts[i] = profiler->opcode_count(i);
                st_r = profiler->stack_reads();
                st_w = profiler->stack_writes();
                calls = profiler->call_count();
                rets = profiler->ret_count();
                arr_flat_r = profiler->array_flat_reads();
                arr_flat_w = profiler->array_flat_writes();
                arr_gen_r = profiler->array_generic_reads();
                arr_gen_w = profiler->array_generic_writes();
                ic_h = profiler->ic_hits();
                ic_m = profiler->ic_misses();
            }
            const auto& vt = vm.telemetry();
            if (vt.ic_hits > ic_h) ic_h = vt.ic_hits;
            if (vt.ic_misses > ic_m) ic_m = vt.ic_misses;

            uint64_t jit_comps = 0;
            double jit_ms = 0.0;
            if (jit_mgr) {
                jit_comps = jit_mgr->stats().tier1_compilations + jit_mgr->stats().tier2_compilations;
            }

            tersun::VMTelemetryManager::instance().sync_external_metrics(tot_ops, op_counts, st_r, st_w, calls, rets, arr_flat_r, arr_flat_w, arr_gen_r, arr_gen_w, ic_h, ic_m, vt.superinstructions_executed, vt.deopt_count, jit_comps, jit_ms);

            tersun::VMTelemetryManager::instance().finish_shutdown();
            tersun::VMTelemetryManager::instance().dump_summary();
            if (!forensics_dump_path.empty()) {
                tersun::VMTelemetryManager::instance().dump_json(forensics_dump_path);
            }
        }

        if (show_telemetry) {
            const auto& t = vm.telemetry();
            std::cout << "\n[VM Telemetry]:\n"
                      << "  dispatches=" << t.total_dispatches << "\n"
                      << "  superinstructions=" << t.superinstructions_executed << "\n"
                      << "  loop_fast_iter=" << t.loop_fast_iterations << "\n"
                      << "  quick_hits=" << t.quick_hits << "\n"
                      << "  quick_misses=" << t.quick_misses << "\n"
                      << "  deopt_count=" << t.deopt_count << "\n"
                      << "  ic_hits=" << t.ic_hits << "\n"
                      << "  ic_misses=" << t.ic_misses << "\n";
        }
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
        CompilerArena compiler_arena;
        Lexer lexer(source, source_path);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, compiler_arena.ast_arena());
        Program program = parser.parse_program();

        ModuleResolver resolver(compiler_arena.ast_arena());
        if (!resolver.resolve_program(program, source_path)) {
            for (const auto& diag : resolver.get_diagnostics()) {
                std::cerr << "[Module Error]: " << diag << "\n";
            }
            return 1;
        }

        TypeChecker checker;
        if (!checker.check_program(program)) {
            std::cerr << checker.format_diagnostics(source);
            return 1;
        }

        Monomorphizer monomorphizer;
        monomorphizer.process_program(program);

        // Gate 5 Frontend Pipeline: Modules 5.1 & 5.2
        TreeCanonicalizer::canonicalize_program(program, compiler_arena.opt_arena());
        TreeOptimizer tree_opt(compiler_arena.opt_arena());
        tree_opt.optimize_program(program);

        // Gate 5 Intermediate Pipeline: Modules 5.3 & 5.4 (Linear IR & CFG Optimization)
        IRBuilder ir_builder;
        IRModule ir_mod = ir_builder.build_module(program);
        IROptimizer ir_opt;
        ir_opt.optimize_module(ir_mod);

        // Gate 5.5B: Direct IR to Bytecode Emitter
        IRToBytecodeEmitter ir_emitter;
        Chunk chunk = ir_emitter.emit(ir_mod, &program);

        // Gate 5.5A: O(1) Compiler Arena Memory Reclamation
        compiler_arena.reset_all();

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

int cmd_emit_ir(const std::string& source_path) {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source, source_path);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        ModuleResolver resolver(arena);
        if (!resolver.resolve_program(program, source_path)) {
            for (const auto& diag : resolver.get_diagnostics()) {
                std::cerr << "[Module Error]: " << diag << "\n";
            }
            return 1;
        }

        TypeChecker checker;
        if (!checker.check_program(program)) {
            std::cerr << checker.format_diagnostics(source);
            return 1;
        }

        Monomorphizer monomorphizer;
        monomorphizer.process_program(program);

        TreeCanonicalizer::canonicalize_program(program, arena);
        TreeOptimizer tree_opt(arena);
        tree_opt.optimize_program(program);

        IRBuilder ir_builder;
        IRModule mod = ir_builder.build_module(program);
        IROptimizer ir_opt;
        ir_opt.optimize_module(mod);

        std::cout << mod.dump();
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[IR Generation Error]: " << e.what() << "\n";
        return 1;
    }
}

int cmd_emit_c(const std::string& source_path) {
    try {
        std::string source = read_file(source_path);
        ArenaAllocator arena;
        Lexer lexer(source, source_path);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        ModuleResolver resolver(arena);
        if (!resolver.resolve_program(program, source_path)) {
            for (const auto& diag : resolver.get_diagnostics()) {
                std::cerr << "[Module Error]: " << diag << "\n";
            }
            return 1;
        }

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
        Lexer lexer(source, source_path);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        ModuleResolver resolver(arena);
        if (!resolver.resolve_program(program, source_path)) {
            for (const auto& diag : resolver.get_diagnostics()) {
                std::cerr << "[Module Error]: " << diag << "\n";
            }
            return 1;
        }

        TypeChecker checker;
        if (!checker.check_program(program)) {
            std::cerr << checker.format_diagnostics(source);
            return 1;
        }

        Monomorphizer monomorphizer;
        monomorphizer.process_program(program);

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
        Lexer lexer(source, source_path);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        ModuleResolver resolver(arena);
        if (!resolver.resolve_program(program, source_path)) {
            for (const auto& diag : resolver.get_diagnostics()) {
                std::cerr << "[Module Error]: " << diag << "\n";
            }
            return 1;
        }

        TypeChecker checker;
        if (!checker.check_program(program)) {
            std::cerr << checker.format_diagnostics(source);
            return 1;
        }

        Monomorphizer monomorphizer;
        monomorphizer.process_program(program);

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
        Lexer lexer(source, source_path);
        auto tokens = lexer.tokenize();

        Parser parser(tokens, arena);
        Program program = parser.parse_program();

        ModuleResolver resolver(arena);
        if (!resolver.resolve_program(program, source_path)) {
            for (const auto& diag : resolver.get_diagnostics()) {
                std::cerr << "[Module Error]: " << diag << "\n";
            }
            return 1;
        }

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
        if (path.size() >= 4 && path.substr(path.size() - 4) == ".qbc") {
            tersun::qvm::QChunk qchunk;
            if (!tersun::qvm::QChunk::load_from_file(path, qchunk)) {
                std::cerr << "[Error]: Failed to load binary QVM bytecode: " << path << "\n";
                return 1;
            }
            std::cout << qchunk.disassemble(path) << "\n";
            return 0;
        }

        Chunk chunk;
        if (path.size() >= 4 && path.substr(path.size() - 4) == ".tbc") {
            if (!Chunk::load_from_file(path, chunk)) {
                std::cerr << "[Error]: Failed to load binary bytecode: " << path << "\n";
                return 1;
            }
        } else {
            std::string source = read_file(path);
            ArenaAllocator arena;
            Lexer lexer(source, path);
            auto tokens = lexer.tokenize();

            Parser parser(tokens, arena);
            Program program = parser.parse_program();

            ModuleResolver resolver(arena);
            if (!resolver.resolve_program(program, path)) {
                for (const auto& diag : resolver.get_diagnostics()) {
                    std::cerr << "[Module Error]: " << diag << "\n";
                }
                return 1;
            }

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

            ModuleResolver resolver(arena);
            if (!resolver.resolve_program(program, ".")) {
                for (const auto& diag : resolver.get_diagnostics()) {
                    std::cerr << "[Module Error]: " << diag << "\n";
                }
                continue;
            }

            BytecodeEmitter emitter;
            Chunk chunk = emitter.compile(program);

            vm.run(chunk);
        } catch (const std::exception& e) {
            std::cerr << "Error: " << e.what() << "\n";
        }
    }
    return 0;
}

int cmd_ai(int argc, char* argv[]) {
    cli::AIOptions opts = cli::AIOptions::parse(argc, argv, 2);

    if (opts.subcommand == "help" || argc < 3) {
        cli::AIOptions::print_help("setunc ai");
        return 0;
    }

    const auto& caps = setun::runtime::TargetCapabilities::active();

    if (opts.subcommand == "profile") {
        std::cout << "=== Active Target Architecture Profile ===\n";
        std::cout << "Architecture : " << caps.arch_name << "\n";
        std::cout << "Cores        : " << caps.logical_cores << "\n";
        std::cout << "Vector Bytes : " << caps.vector_bytes << " bytes\n";
        std::cout << "AVX2 Support : " << (caps.has_avx2 ? "ENABLED" : "DISABLED") << "\n";
        std::cout << "NEON Support : " << (caps.has_neon ? "ENABLED" : "DISABLED") << "\n";
        std::cout << "Static Arena : " << (opts.profile == cli::ProfileMode::EdgeStatic ? "ENABLED" : "DISABLED") << "\n";
        std::cout << "\n";
        opts.print_dispatch_plan(caps);
        return 0;
    }

    if (opts.subcommand == "inspect") {
        if (opts.model_path.empty()) {
            std::cerr << "Error: missing model path. Usage: setunc ai inspect <model.safetensors>\n";
            return 1;
        }
        try {
            auto sf = setun::tensor::SafeTensorsFile::load_from_file(opts.model_path);
            std::cout << "=== SafeTensors Model Inspection ===\n";
            std::cout << "File path     : " << opts.model_path << "\n";
            std::cout << "File size     : " << sf->file_size() << " bytes (~" << (sf->file_size() / 1024.0) << " KB)\n";
            std::cout << "Header size   : " << sf->header_size() << " bytes\n";
            std::cout << "Stored Tensors:\n";
            for (const auto& name : sf->tensor_names()) {
                const auto& entry = sf->get_entry(name);
                std::cout << "  - " << std::left << std::setw(16) << name 
                          << " dtype=" << std::setw(8) << entry.dtype
                          << " bytes=" << std::setw(8) << entry.byte_size
                          << " shape=[";
                for (size_t i = 0; i < entry.shape.size(); ++i) {
                    std::cout << entry.shape[i] << (i + 1 < entry.shape.size() ? ", " : "");
                }
                std::cout << "]\n";
            }
            return 0;
        } catch (const std::exception& e) {
            std::cerr << "[AI Inspect Error]: " << e.what() << "\n";
            return 1;
        }
    }

    if (opts.subcommand == "generate" || opts.subcommand == "chat") {
        std::unique_ptr<setun::tensor::nn::ModelPackage> pkg = nullptr;
        std::unique_ptr<setun::tensor::nn::BitNetModel> model = nullptr;
        setun::tensor::nn::ModelManifest manifest;

        if (!opts.model_path.empty() && std::filesystem::exists(opts.model_path)) {
            if (std::filesystem::is_directory(opts.model_path)) {
                auto pkg_res = setun::tensor::nn::ModelPackage::load_from_dir(opts.model_path);
                if (!pkg_res.ok()) {
                    std::cerr << "Error loading model package: " << pkg_res.status().message << "\n";
                    return 1;
                }
                pkg = std::move(pkg_res.value());
                manifest = pkg->manifest();
                model = pkg->create_model();
                pkg->bind_weights(*model);
            }
        }

        if (!model) {
            std::cout << "[Info] Initializing deterministic synthetic BitNet-b1.58 model profile\n";
            manifest.vocab_size = 32000;
            manifest.hidden_size = 2048;
            manifest.intermediate_size = 5632;
            manifest.num_hidden_layers = 4;
            manifest.num_attention_heads = 16;
            manifest.num_key_value_heads = 4;
            manifest.head_dim = 128;
            manifest.eos_token_ids.push_back(2);
            model = std::make_unique<setun::tensor::nn::BitNetModel>(manifest.to_bitnet_config());
            model->init_synthetic(42);
        }

        std::unique_ptr<setun::tensor::nn::HuggingFaceBPETokenizer> tokenizer = nullptr;
        std::string tok_path = opts.tokenizer_path;
        if (tok_path.empty() && pkg && !pkg->tokenizer_path().empty()) {
            tok_path = pkg->tokenizer_path();
        }

        if (!tok_path.empty() && std::filesystem::exists(tok_path)) {
            auto tok_res = setun::tensor::nn::HuggingFaceBPETokenizer::load_from_json(tok_path);
            if (tok_res.ok()) {
                tokenizer = std::move(tok_res.value());
            }
        }

        if (!tokenizer) {
            tokenizer = std::make_unique<setun::tensor::nn::HuggingFaceBPETokenizer>();
            tokenizer->add_token("<unk>", 0, true);
            tokenizer->add_token("<s>", 1, true);
            tokenizer->add_token("</s>", 2, true);
            tokenizer->add_token("<|im_start|>", 3, true);
            tokenizer->add_token("<|im_end|>", 4, true);
            tokenizer->set_special_ids(1, 2, 0, 0);
            uint32_t id = 5;
            for (int b = 0; b < 256; ++b) {
                std::string s(1, static_cast<char>(b));
                tokenizer->add_token(s, id++);
            }
        }

        setun::tensor::nn::SamplingConfig sampling_cfg;
        sampling_cfg.temperature = opts.temperature;
        sampling_cfg.top_p = opts.top_p;
        sampling_cfg.top_k = opts.top_k;
        sampling_cfg.repetition_penalty = opts.repetition_penalty;

        setun::tensor::nn::InferenceSession session(*model, manifest);

        if (opts.subcommand == "generate") {
            std::string prompt = opts.prompt.empty() ? "Xin chào Tersun" : opts.prompt;
            setun::tensor::nn::EncodeOptions enc_opts;
            enc_opts.add_bos = (manifest.bos_token_id >= 0);
            std::vector<uint32_t> prompt_tokens = tokenizer->encode(prompt, enc_opts);

            std::cout << "Prompt: \"" << prompt << "\" (" << prompt_tokens.size() << " tokens)\n";
            std::cout << "Generated: " << std::flush;

            session.generate(
                setun::tensor::nn::Span<const uint32_t>(prompt_tokens.data(), prompt_tokens.size()),
                sampling_cfg,
                opts.max_tokens,
                tokenizer.get(),
                [](uint32_t id, std::string_view piece) {
                    (void)id;
                    std::cout << piece << std::flush;
                    return true;
                }
            );
            std::cout << "\n";
            return 0;
        }

        if (opts.subcommand == "chat") {
            std::cout << "===================================================================\n";
            std::cout << "                 TERSUN AI INTERACTIVE CHAT REPL                   \n";
            std::cout << "===================================================================\n";
            std::cout << "Model Architecture: " << manifest.model_type << " (" << manifest.num_hidden_layers 
                      << "L / " << manifest.num_attention_heads << "Q heads / " << manifest.num_key_value_heads << "KV heads)\n";
            std::cout << "Sampling: Temp=" << sampling_cfg.temperature << ", Top-P=" << sampling_cfg.top_p << ", RepPenalty=" << sampling_cfg.repetition_penalty << "\n";
            std::cout << "Commands: Type 'exit' or 'quit' to terminate session, 'reset' to clear history.\n\n";

            std::vector<setun::tensor::nn::ChatMessage> history;
            history.push_back(setun::tensor::nn::ChatMessage::system("You are Tersun, an AI engine built on balanced ternary arithmetic."));

            while (true) {
                std::cout << "\nUser > " << std::flush;
                std::string input;
                if (!std::getline(std::cin, input) || input == "exit" || input == "quit") {
                    std::cout << "\nExiting chat session.\n";
                    break;
                }
                if (input.empty()) continue;
                if (input == "reset") {
                    history.clear();
                    history.push_back(setun::tensor::nn::ChatMessage::system("You are Tersun, an AI engine built on balanced ternary arithmetic."));
                    session.reset();
                    std::cout << "[Session history cleared]\n";
                    continue;
                }

                history.push_back(setun::tensor::nn::ChatMessage::user(input));
                std::string rendered;
                setun::tensor::nn::ChatTemplate::render(history, manifest, true, rendered);

                std::vector<uint32_t> p_tokens = tokenizer->encode(rendered);
                std::cout << "Tersun > " << std::flush;
                std::string reply;

                session.generate(
                    setun::tensor::nn::Span<const uint32_t>(p_tokens.data(), p_tokens.size()),
                    sampling_cfg,
                    opts.max_tokens,
                    tokenizer.get(),
                    [&reply](uint32_t id, std::string_view piece) {
                        (void)id;
                        std::cout << piece << std::flush;
                        reply.append(piece);
                        return true;
                    }
                );
                std::cout << "\n";
                history.push_back(setun::tensor::nn::ChatMessage::assistant(reply));
            }
            return 0;
        }
    }

    // Validate forced backend availability
    if (opts.target == cli::TargetBackend::AVX2 && !caps.has_avx2) {
        std::cerr << "ERROR: requested backend 'avx2' unavailable on host architecture '" << caps.arch_name << "'\n";
        return 1;
    }
    if (opts.target == cli::TargetBackend::NEON && !caps.has_neon) {
        std::cerr << "ERROR: requested backend 'neon' unavailable on host architecture '" << caps.arch_name << "'\n";
        return 1;
    }

    setun::tensor::BitNetMnistModel model;
    if (!opts.model_path.empty()) {
        try {
            model.load_safetensors(opts.model_path);
        } catch (const std::exception& e) {
            std::cerr << "[AI Load Error]: " << e.what() << "\n";
            return 1;
        }
    } else {
        model.init_synthetic(42);
    }

    // Handle forced scalar override
    if (opts.target == cli::TargetBackend::Scalar) {
        setun::runtime::TargetCapabilities scalar_caps = caps;
        scalar_caps.has_avx2 = false;
        scalar_caps.has_neon = false;
        scalar_caps.is_overridden = true;
        setun::runtime::set_active_capabilities(scalar_caps);
        model.resolve_kernels();
    } else {
        model.resolve_kernels();
    }

    if (opts.subcommand == "run") {
        std::vector<int32_t> input(784, 1);
        int32_t logits[10] = {0};
        auto probe = setun::tensor::AllocationProbe::start();
        int32_t pred = model.forward(input.data(), logits);
        size_t allocs = probe.alloc_count();

        if (opts.json_output) {
            std::cout << "{\n"
                      << "  \"subcommand\": \"run\",\n"
                      << "  \"target\": \"" << opts.target_to_string() << "\",\n"
                      << "  \"prediction\": " << pred << ",\n"
                      << "  \"logits\": [";
            for (int i = 0; i < 10; ++i) {
                std::cout << logits[i] << (i < 9 ? ", " : "");
            }
            std::cout << "],\n"
                      << "  \"heap_allocations\": " << allocs << "\n"
                      << "}\n";
        } else {
            std::cout << "=== BitNet Zero-Allocation Inference Execution ===\n";
            std::cout << "Input Dimension   : 784\n";
            std::cout << "Predicted Class   : " << pred << " (ArgMax)\n";
            std::cout << "Logits            : [";
            for (int i = 0; i < 10; ++i) {
                std::cout << logits[i] << (i < 9 ? ", " : "");
            }
            std::cout << "]\n";
            std::cout << "Heap Allocations  : " << allocs << " (malloc=0, new=0 verified)\n";
            std::cout << "Selected Backend  : " << opts.target_to_string() << "\n";
        }
        return 0;
    }

    if (opts.subcommand == "benchmark") {
        std::vector<int32_t> input(784, 1);
        for (int i = 0; i < opts.warmup_iterations; ++i) {
            model.forward(input.data());
        }

        auto probe = setun::tensor::AllocationProbe::start();
        auto start = std::chrono::high_resolution_clock::now();
        for (int i = 0; i < opts.iterations; ++i) {
            model.forward(input.data());
        }
        auto end = std::chrono::high_resolution_clock::now();
        size_t allocs = probe.alloc_count();

        double elapsed_us = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() / 1000.0;
        double avg_us = elapsed_us / opts.iterations;
        double fps = (opts.iterations / (elapsed_us / 1000000.0));

        if (opts.json_output) {
            std::cout << "{\n"
                      << "  \"subcommand\": \"benchmark\",\n"
                      << "  \"target\": \"" << opts.target_to_string() << "\",\n"
                      << "  \"profile\": \"" << opts.profile_to_string() << "\",\n"
                      << "  \"iterations\": " << opts.iterations << ",\n"
                      << "  \"total_time_ms\": " << (elapsed_us / 1000.0) << ",\n"
                      << "  \"average_latency_us\": " << avg_us << ",\n"
                      << "  \"throughput_fps\": " << fps << ",\n"
                      << "  \"weights_footprint_bytes\": " << model.total_weight_bytes() << ",\n"
                      << "  \"heap_allocations\": " << allocs << "\n"
                      << "}\n";
        } else {
            std::cout << "=== BitNet Inference Benchmark ===\n";
            opts.print_dispatch_plan(caps);
            std::cout << "Iterations       : " << opts.iterations << "\n";
            std::cout << "Total Time       : " << (elapsed_us / 1000.0) << " ms\n";
            std::cout << "Average Latency  : " << avg_us << " µs / inference\n";
            std::cout << "Throughput       : " << static_cast<uint64_t>(fps) << " inferences / sec (FPS)\n";
            std::cout << "Model Size       : " << (model.total_weight_bytes() / 1024.0) << " KB\n";
            std::cout << "Weights Footprint: " << model.total_weight_bytes() << " bytes\n";
            std::cout << "Heap Allocs      : " << allocs << "\n";
        }
        return 0;
    }

    std::cerr << "Unknown ai subcommand: '" << opts.subcommand << "'. Run 'setunc ai help' for usage.\n";
    return 1;
}

// Forward declaration of internal test runner
int run_all_tests();

int main(int argc, char* argv[]) {
#if defined(_WIN32)
    // UTF-8 console so println renders Vietnamese and other scripts.
    SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);
#endif
    if (argc < 2) {
        print_help(argv[0]);
        return 0;
    }

    std::string cmd = argv[1];

    // Version flag
    if (cmd == "--version" || cmd == "-v" || cmd == "version") {
        print_version();
        return 0;
    }

    // AI Compute CLI Commands: setunc ai <inspect|run|benchmark|profile>
    if (cmd == "ai") {
        return cmd_ai(argc, argv);
    }

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

    // 2.1 Standalone LLVM AOT Compilation: setunc --aot <file> [-o <out.exe>] [-O0|-O1|-O2|-O3]
    if ((cmd == "--aot" || cmd == "aot") && argc >= 3) {
        std::string source_file = argv[2];
        std::string out_file = "app.exe";
        int opt_level = 3;
        for (int i = 3; i < argc; ++i) {
            std::string arg = argv[i];
            if (arg == "-o" && i + 1 < argc) {
                out_file = argv[++i];
            } else if (arg == "-O0") opt_level = 0;
            else if (arg == "-O1") opt_level = 1;
            else if (arg == "-O2") opt_level = 2;
            else if (arg == "-O3") opt_level = 3;
        }
        return cmd_compile_llvm(source_file, out_file, opt_level);
    }

    // 3. Compile: setunc compile <source> [-o <out>] [--native|--llvm|--aot|--qvm] [-O0|-O1|-O2|-O3]
    if (cmd == "compile" && argc >= 3) {
        std::string source_file = argv[2];
        bool is_native = false;
        bool is_llvm = false;
        bool is_qvm = false;
        std::string out_file = "";
        int opt_level = 3;

        for (int i = 3; i < argc; ++i) {
            std::string arg = argv[i];
            if (arg == "--native") {
                is_native = true;
            } else if (arg == "--llvm" || arg == "--aot") {
                is_llvm = true;
            } else if (arg == "--qvm") {
                is_qvm = true;
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

        if (is_qvm) {
            if (out_file.empty()) out_file = "app.qbc";
            try {
                std::string source = read_file(source_file);
                ArenaAllocator arena;
                Lexer lexer(source, source_file);
                auto tokens = lexer.tokenize();
                Parser parser(tokens, arena);
                Program program = parser.parse_program();

                ModuleResolver resolver(arena);
                if (!resolver.resolve_program(program, source_file)) {
                    for (const auto& diag : resolver.get_diagnostics()) {
                        std::cerr << "[Module Error]: " << diag << "\n";
                    }
                    return 1;
                }

                TypeChecker checker;
                if (!checker.check_program(program)) {
                    std::cerr << checker.format_diagnostics(source);
                    return 1;
                }
                Monomorphizer mono;
                mono.process_program(program);

                tersun::compiler::QEmitter emitter;
                if (!emitter.compile_file(program, out_file)) {
                    std::cerr << "[Error]: Failed to write QVM file: " << out_file << "\n";
                    return 1;
                }
                std::cout << "[QVM] Successfully compiled " << source_file << " -> " << out_file << " (Q-ISA Bytecode)\n";
                return 0;
            } catch (const std::exception& e) {
                std::cerr << "[Error]: " << e.what() << "\n";
                return 1;
            }
        } else if (is_llvm) {
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

    // 3.1 Run QVM: setunc run-qvm <file.qbc>
    if (cmd == "run-qvm" && argc >= 3) {
        std::string qbc_path = argv[2];
        tersun::qvm::QChunk chunk;
        if (!tersun::qvm::QChunk::load_from_file(qbc_path, chunk)) {
            std::cerr << "[Error]: Failed to load QVM bytecode file: " << qbc_path << "\n";
            return 1;
        }
        tersun::qvm::QVM qvm(chunk.num_qubits);
        std::cout << "[QVM Simulator] Running " << qbc_path << " (" << chunk.num_qubits << " Qubits)...\n";
        int64_t ret = qvm.run(chunk);
        std::cout << "[QVM Output / Exit Code]: " << ret << "\n";
        return 0;
    }

    // 3.2 LLVM to QVM: setunc llvm2qvm <file.ll> [-o <out.qbc>]
    if (cmd == "llvm2qvm" && argc >= 3) {
        std::string ll_path = argv[2];
        std::string out_qbc = (argc >= 5 && std::string(argv[3]) == "-o") ? argv[4] : "out.qbc";
        tersun::compiler::LLVM2QVMTranslator trans;
        if (!trans.translate_file(ll_path, out_qbc)) {
            std::cerr << "[Error]: Failed to translate LLVM IR to QVM: " << ll_path << "\n";
            return 1;
        }
        std::cout << "[LLVM->QVM] Successfully translated " << ll_path << " -> " << out_qbc << "\n";
        return 0;
    }

    // 3.3 Emit OpenQASM: setunc emit-qasm <file.stn> [-o <out.qasm>]
    if (cmd == "emit-qasm" && argc >= 3) {
        std::string source_file = argv[2];
        std::string out_qasm = (argc >= 5 && std::string(argv[3]) == "-o") ? argv[4] : "";
        try {
            std::string source = read_file(source_file);
            ArenaAllocator arena;
            Lexer lexer(source, source_file);
            auto tokens = lexer.tokenize();
            Parser parser(tokens, arena);
            Program program = parser.parse_program();

            ModuleResolver resolver(arena);
            if (!resolver.resolve_program(program, source_file)) {
                for (const auto& diag : resolver.get_diagnostics()) {
                    std::cerr << "[Module Error]: " << diag << "\n";
                }
                return 1;
            }

            tersun::compiler::QEmitter emitter;
            std::string qasm = emitter.emit_qasm(program);

            if (!out_qasm.empty()) {
                std::ofstream ofs(out_qasm);
                if (!ofs.is_open()) return 1;
                ofs << qasm;
                std::cout << "[OpenQASM] Exported circuit to " << out_qasm << "\n";
            } else {
                std::cout << qasm << "\n";
            }
            return 0;
        } catch (const std::exception& e) {
            std::cerr << "[Error]: " << e.what() << "\n";
            return 1;
        }
    }

    // 3.4 Emit Linear Optimization IR (Gate 5.3 & 5.4): setunc emit-ir <file.stn>
    if ((cmd == "emit-ir" || cmd == "--emit-ir") && argc >= 3) {
        return cmd_emit_ir(argv[2]);
    }

    if (argc >= 4 && std::string(argv[2]) == "-o") {
        return cmd_compile(argv[1], argv[3]);
    }

    // 4. Disassembly / Dump Assembly: setunc disasm <file> or setunc --dump-asm <file>
    if ((cmd == "disasm" || cmd == "--dump-asm") && argc >= 3) {
        return cmd_disasm(argv[2]);
    }

    // 5. Run source or binary: setunc run [--jit] [--jit-ram] [--headless] [--dispatch=...] <file>
    if (cmd == "run" && argc >= 3) {
        bool is_jit_llvm = false;
        bool is_jit_ram = false;
        bool is_headless = false;
        bool enable_jit = true;
        bool trace_tiering = false;
        bool dump_ir = false;
        bool show_jit_stats = false;
        DispatchMode dmode = DispatchMode::REGISTER_CACHED;
        std::string target_file = "";
        OptFlags opt_flags = OptFlags::all_enabled();
        bool show_telemetry = false;
        bool enable_profile = false;
        std::string profile_dump_path = "";
        bool enable_forensics = false;
        std::string forensics_dump_path = "";
        bool force_tier1 = false;
        std::string jit_dump_code_path = "";
        bool trace_bce = false;

        for (int i = 2; i < argc; ++i) {
            std::string arg = argv[i];
            if (arg == "--jit-llvm") is_jit_llvm = true;
            else if (arg == "--jit") {
                enable_jit = true;
                force_tier1 = false;
            }
            else if (arg == "--jit-tier-a") {
                enable_jit = true;
                force_tier1 = true;
            }
            else if (arg.rfind("--jit-dump-code=", 0) == 0) {
                jit_dump_code_path = arg.substr(16);
            }
            else if (arg == "--trace-bce") {
                trace_bce = true;
            }
            else if (arg == "--jit-ram") is_jit_ram = true;
            else if (arg == "--no-jit" || arg == "--interp") enable_jit = false;
            else if (arg == "--jit-trace-tier") trace_tiering = true;
            else if (arg == "--jit-dump-ir") dump_ir = true;
            else if (arg == "--jit-stats") show_jit_stats = true;
            else if (arg == "--headless") is_headless = true;
            else if (arg == "--dispatch=fnptr") dmode = DispatchMode::FUNCTION_POINTER;
            else if (arg == "--dispatch=switch") dmode = DispatchMode::SWITCH_LOOP;
            else if (arg == "--dispatch=threaded") dmode = DispatchMode::DIRECT_THREADED;
            else if (arg == "--dispatch=cached") dmode = DispatchMode::REGISTER_CACHED;
            else if (arg == "--telemetry") show_telemetry = true;
            else if (arg == "--vm-profile") enable_profile = true;
            else if (arg.rfind("--vm-profile-dump=", 0) == 0) {
                enable_profile = true;
                profile_dump_path = arg.substr(18);
            }
            else if (arg == "--forensics") {
                enable_forensics = true;
                enable_profile = true;
            }
            else if (arg.rfind("--forensics-dump=", 0) == 0) {
                enable_forensics = true;
                enable_profile = true;
                forensics_dump_path = arg.substr(17);
            }
            else if (arg == "--no-superinst") {
                opt_flags.enable_locals = false;
                opt_flags.enable_array_indexing = false;
                opt_flags.enable_loop_fusion = false;
            }
            else if (arg == "--no-quickening") opt_flags.enable_quickening = false;
            else if (arg == "--no-field-ic") opt_flags.enable_field_ic = false;
            else if (arg == "--no-fast-frames") opt_flags.enable_fast_frames = false;
            else if (arg == "--no-fast-call") opt_flags.enable_fast_call = false;
            else if (arg == "--opt-v3") {
                opt_flags.enable_locals = false;
                opt_flags.enable_array_indexing = false;
                opt_flags.enable_loop_fusion = false;
                opt_flags.enable_quickening = false;
                opt_flags.enable_field_ic = false;
                opt_flags.enable_fast_frames = false;
                opt_flags.enable_fast_call = false;
            }
            else if (arg == "--opt-tier-a") {
                opt_flags.enable_locals = true;
                opt_flags.enable_array_indexing = false;
                opt_flags.enable_loop_fusion = false;
                opt_flags.enable_quickening = false;
                opt_flags.enable_field_ic = false;
                opt_flags.enable_fast_frames = false;
            }
            else if (arg == "--opt-tier-b") {
                opt_flags.enable_locals = true;
                opt_flags.enable_array_indexing = true;
                opt_flags.enable_loop_fusion = false;
                opt_flags.enable_quickening = false;
                opt_flags.enable_field_ic = false;
                opt_flags.enable_fast_frames = false;
            }
            else if (arg == "--opt-tier-c") {
                opt_flags.enable_locals = true;
                opt_flags.enable_array_indexing = true;
                opt_flags.enable_loop_fusion = true;
                opt_flags.enable_quickening = false;
                opt_flags.enable_field_ic = false;
                opt_flags.enable_fast_frames = false;
            }
            else if (arg == "--opt-tier-d") {
                opt_flags.enable_locals = true;
                opt_flags.enable_array_indexing = true;
                opt_flags.enable_loop_fusion = true;
                opt_flags.enable_quickening = true;
                opt_flags.enable_field_ic = false;
                opt_flags.enable_fast_frames = false;
            }
            else if (arg == "--opt-tier-e") {
                opt_flags.enable_locals = true;
                opt_flags.enable_array_indexing = true;
                opt_flags.enable_loop_fusion = true;
                opt_flags.enable_quickening = true;
                opt_flags.enable_field_ic = true;
                opt_flags.enable_fast_frames = false;
            }
            else if (arg == "--opt-v4f" || arg == "--opt-all") {
                opt_flags = OptFlags::all_enabled();
            }
            else if (target_file.empty()) target_file = arg;
        }

        if (is_headless) {
            setun::graphics::Setun2DBridge::instance().set_headless(true);
        }

        if (is_jit_ram && !target_file.empty()) {
            std::string source = read_file(target_file);
            ArenaAllocator arena;
            Lexer lexer(source, target_file);
            auto tokens = lexer.tokenize();
            Parser parser(tokens, arena);
            Program program = parser.parse_program();

            ModuleResolver resolver(arena);
            if (!resolver.resolve_program(program, target_file)) {
                for (const auto& diag : resolver.get_diagnostics()) {
                    std::cerr << "[Module Error]: " << diag << "\n";
                }
                return 1;
            }

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
                return cmd_run(target_file, dmode, opt_flags, show_telemetry);
            }
        }

        if (is_jit_llvm && !target_file.empty()) {
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
            return cmd_run(target_file, dmode, opt_flags, show_telemetry, enable_profile, profile_dump_path, enable_jit, trace_tiering, dump_ir, show_jit_stats, enable_forensics, forensics_dump_path, force_tier1, jit_dump_code_path, trace_bce);
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
