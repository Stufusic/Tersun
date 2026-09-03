#pragma once

#include "compiler/ast.hpp"
#include "compiler/types.hpp"
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
#include <optional>

namespace setun {

struct TypeError {
    std::string message;
    SourceLocation loc;
    bool is_warning{false};
};

struct ScopedSymbol {
    std::string name;
    TypePtr type;
    bool is_mut{true};
    bool is_const{false};
    SourceLocation loc;
};

class TypeChecker {
public:
    TypeChecker();

    // Main entry point: validates an entire program AST
    bool check_program(Program& program);

    const std::vector<TypeError>& errors() const { return errors_; }
    bool has_errors() const { return !errors_.empty(); }

    std::string format_diagnostics(const std::string& source_code = "") const;

    TypePtr resolve_type_from_data_type(DataType dt, const std::string& type_name = "");
    TypePtr get_type_definition(const std::string& name) const;

private:
    void init_builtins();

    void enter_scope();
    void exit_scope();
    bool define_symbol(const std::string& name, TypePtr type, bool is_mut, bool is_const, SourceLocation loc);
    std::optional<ScopedSymbol> resolve_symbol(const std::string& name);

    void report_error(const std::string& message, SourceLocation loc);
    void report_warning(const std::string& message, SourceLocation loc);

    // AST visitors
    void check_stmt(Stmt* stmt);
    void check_var_decl(VarDeclStmt& stmt);
    void check_assign(AssignStmt& stmt);
    void check_member_assign(MemberAssignStmt& stmt);
    void check_index_assign(IndexAssignStmt& stmt);
    void check_block(BlockStmt& stmt);
    void check_if(IfStmt& stmt);
    void check_branch3(Branch3Stmt& stmt);
    void check_while(WhileStmt& stmt);
    void check_return(ReturnStmt& stmt);
    void check_fn_decl(FnDeclStmt& stmt);
    void check_struct_decl(StructDeclStmt& stmt);
    void check_class_decl(ClassDeclStmt& stmt);
    void check_interface_decl(InterfaceDeclStmt& stmt);
    void check_enum_decl(EnumDeclStmt& stmt);
    void check_match(MatchStmt& stmt);

    TypePtr check_expr(Expr* expr);
    TypePtr check_unary(UnaryExpr& expr);
    TypePtr check_binary(BinaryExpr& expr);
    TypePtr check_call(CallExpr& expr);
    TypePtr check_member_access(MemberAccessExpr& expr);
    TypePtr check_method_call(MethodCallExpr& expr);
    TypePtr check_index(IndexExpr& expr);
    TypePtr check_array_lit(ArrayLiteralExpr& expr);

    void check_match_exhaustiveness(const MatchStmt& stmt, TypePtr cond_type);

    std::vector<TypeError> errors_;
    std::vector<std::unordered_map<std::string, ScopedSymbol>> scopes_;
    std::unordered_map<std::string, TypePtr> type_defs_;
    std::unordered_map<std::string, TypePtr> functions_;

    // Current function return type for verifying 'return' statements
    TypePtr current_fn_return_type_{nullptr};
};

} // namespace setun
