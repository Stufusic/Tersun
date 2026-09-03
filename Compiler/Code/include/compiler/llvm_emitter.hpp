#pragma once

#include "compiler/ast.hpp"
#include "compiler/native_runtime.hpp"
#include <string>
#include <vector>
#include <unordered_map>
#include <sstream>

namespace setun {

enum class TargetArch {
    X86_64,
    AARCH64,
    RISCV64,
    WASM32,
    NATIVE_HOST
};

struct TargetConfig {
    TargetArch arch{TargetArch::NATIVE_HOST};
    std::string triple{"x86_64-pc-windows-msvc"};
    std::string cpu{"generic"};
    std::string features{""};
    int opt_level{3}; // -O0, -O1, -O2, -O3
};

class LLVMEmitter {
public:
    explicit LLVMEmitter(TargetConfig config = TargetConfig{});

    // 1. C20 SIMD Native Transpiler (Milestone 1 Baseline Ground-Truth)
    std::string emit_native_c(const Program& program);

    // 2. Multi-Arch LLVM IR Text Generator (.ll)
    std::string emit_llvm_ir(const Program& program);

    // 3. Direct Native Executable Compilation (.exe / binary)
    bool compile_native(const Program& program, const std::string& output_path, int opt_level = 3);

    // 4. Pure LLVM AOT Compilation Pipeline (.ll -> .exe via LLVM/Clang)
    bool compile_llvm_native(const Program& program, const std::string& output_path, int opt_level = 3);

    // Accessors
    const TargetConfig& config() const { return config_; }
    void set_config(const TargetConfig& config) { config_ = config; }

private:
    // C-Transpiler helper emitters
    void transpile_stmt(Stmt* stmt, std::ostringstream& oss, int indent = 1);
    void transpile_expr(Expr* expr, std::ostringstream& oss);

    // LLVM IR helper emitters
    void emit_llvm_global_decls(std::ostringstream& oss);
    void emit_llvm_function(Stmt* stmt, std::ostringstream& oss);
    void emit_llvm_stmt(Stmt* stmt, std::ostringstream& oss);
    std::string emit_llvm_expr(Expr* expr, std::ostringstream& oss);

    std::string next_label(const std::string& prefix = "bb");
    std::string next_temp();

    TargetConfig config_;
    size_t label_counter_{0};
    size_t temp_id_{0};
    size_t str_id_{0};

    std::unordered_map<std::string, std::string> llvm_vars_;
    std::vector<std::pair<std::string, std::string>> llvm_strings_;
    std::string current_res_ptr_{""};
};

} // namespace setun
