#pragma once

#include "compiler/ast.hpp"
#include "compiler/types.hpp"
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

struct LLVMValue {
    std::string val;      // SSA register (e.g. "%t1") or literal/constant ("42", "@str")
    std::string type;     // LLVM Type (e.g. "i64", "double", "i1", "i16", "%struct.TafpuNum*", "%struct.TersunArray*")
    bool is_ptr{false};   // true if 'val' is an alloca pointer that must be loaded for value use
};

struct StructFieldMeta {
    std::string name;
    std::string llvm_type;
    int index{0};
};

struct StructMeta {
    std::string name;
    std::vector<StructFieldMeta> fields;
    std::unordered_map<std::string, int> field_indices;
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

    // Type Conversion Helpers
    std::string to_llvm_type(DataType dt, const std::string& custom_name = "");
    std::string to_llvm_type(const TypePtr& type);

private:
    // C-Transpiler helper emitters
    void transpile_stmt(Stmt* stmt, std::ostringstream& oss, int indent = 1);
    void transpile_expr(Expr* expr, std::ostringstream& oss);

    // LLVM IR helper emitters
    void emit_llvm_global_decls(std::ostringstream& oss);
    void emit_llvm_function(Stmt* stmt, std::ostringstream& oss);
    void emit_llvm_stmt(Stmt* stmt, std::ostringstream& oss);
    std::string emit_llvm_expr(Expr* expr, std::ostringstream& oss);
    LLVMValue emit_typed_expr(Expr* expr, std::ostringstream& oss);

    // Struct & Class Meta Helpers
    void register_struct(const StructDeclStmt& s);
    void register_class(const ClassDeclStmt& c);
    std::string get_string_literal_ref(const std::string& str);

    std::string next_label(const std::string& prefix = "bb");
    std::string next_temp();

    TargetConfig config_;
    size_t label_counter_{0};
    size_t temp_id_{0};
    size_t str_id_{0};

    // Symbol and type tables
    std::unordered_map<std::string, std::string> llvm_vars_;
    std::unordered_map<std::string, std::string> llvm_var_types_;
    std::vector<std::pair<std::string, std::string>> llvm_strings_;
    std::unordered_map<std::string, StructMeta> struct_registry_;
    std::string current_res_ptr_{""};
    std::string current_fn_ret_type_{"void"};
};

} // namespace setun

