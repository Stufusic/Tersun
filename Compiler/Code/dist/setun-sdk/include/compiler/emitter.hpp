#pragma once

#include "compiler/ast.hpp"
#include "compiler/symbol_table.hpp"
#include "vm/opcode.hpp"
#include <vector>
#include <string>
#include <cstdint>

namespace setun {

struct Chunk {
    std::vector<uint8_t> code;
    std::vector<size_t> lines;
    std::vector<std::string> string_table;

    void write_byte(uint8_t byte, size_t line);
    void write_opcode(OpCode op, size_t line);
    void write_int16(int16_t val, size_t line);
    void write_int32(int32_t val, size_t line);
    void write_int64(int64_t val, size_t line);
    void write_double(double val, size_t line);

    size_t emit_jump(OpCode jump_op, size_t line);
    void patch_jump(size_t offset);
    void patch_jump_to(size_t patch_location, size_t target_location);

    std::string disassemble(const std::string& name = "main") const;

    // Binary .tbc Serialization & Deserialization (Module 4)
    bool save_to_file(const std::string& filename) const;
    static bool load_from_file(const std::string& filename, Chunk& out_chunk);
};

class BytecodeEmitter {
public:
    BytecodeEmitter();

    Chunk compile(const Program& program);

private:
    void emit_stmt(Stmt* stmt);
    void emit_expr(Expr* expr);

    void emit_var_decl(const VarDeclStmt& stmt);
    void emit_assign(const AssignStmt& stmt);
    void emit_expr_stmt(const ExprStmt& stmt);
    void emit_block(const BlockStmt& stmt);
    void emit_if(const IfStmt& stmt);
    void emit_branch3(const Branch3Stmt& stmt);
    void emit_while(const WhileStmt& stmt);
    void emit_return(const ReturnStmt& stmt);
    void emit_fn_decl(const FnDeclStmt& stmt);

    void emit_int_lit(const IntLiteralExpr& expr);
    void emit_tryte_lit(const TryteLiteralExpr& expr);
    void emit_tafpu_lit(const TafpuLiteralExpr& expr);
    void emit_float_lit(const FloatLiteralExpr& expr);
    void emit_string_lit(const StringLiteralExpr& expr);
    void emit_bool_lit(const BoolLiteralExpr& expr);
    void emit_identifier(const IdentifierExpr& expr);
    void emit_unary(const UnaryExpr& expr);
    void emit_binary(const BinaryExpr& expr);
    void emit_call(const CallExpr& expr);
    void emit_tafpu_construct(const TafpuConstructExpr& expr);

    Chunk chunk_;
    SymbolTable symbol_table_;
    uint16_t next_local_slot_{0};
    uint16_t next_global_slot_{0};

    // Functions table for address resolution & recursion
    std::unordered_map<std::string, uint16_t> functions_;
    std::vector<std::pair<size_t, std::string>> unresolved_calls_;
};

} // namespace setun
