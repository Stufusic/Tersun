#pragma once

#include "compiler/ast.hpp"
#include "compiler/types.hpp"
#include <string>
#include <vector>
#include <unordered_map>
#include <unordered_set>
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

    // Builds a method signature, resolving user-defined parameter types
    // (e.g. 'tracker: MouseTracker') against type_defs_.
    MethodTypeInfo make_method_info(const MethodDecl& m);

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
    void check_for(ForStmt& stmt);
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

    // Ambiguous [a, b, c] triple resolution (type-directed disambiguation).
    // Runs at the top of check_stmt for every statement so scopes/signatures
    // are progressively available; mutates triple nodes in place into
    // TafpuConstructExpr (TAFPU context) or ArrayLiteralExpr (array context).
    void resolve_triples_stmt(Stmt* stmt);
    void resolve_triples_expr(Expr* expr, bool expect_taf3);
    bool is_tafpuish(Expr* expr);
    bool member_is_taf3(Expr* object_expr, const std::string& member);
    static void rewrite_triple(Expr* expr, bool as_tafpu);

    std::vector<TypeError> errors_;
    std::vector<std::unordered_map<std::string, ScopedSymbol>> scopes_;
    std::unordered_map<std::string, TypePtr> type_defs_;
    std::unordered_map<std::string, TypePtr> functions_;

    // Aliased imports: `import "x.stn" as gui;` makes gui.fn(...) a function call
    std::unordered_set<std::string> import_aliases_;

    // First-declaration sites of user functions / types, for duplicate
    // detection when imported modules are merged into one program.
    std::unordered_map<std::string, SourceLocation> declared_fn_locs_;
    std::unordered_map<std::string, SourceLocation> declared_type_locs_;

    // Current function return type for verifying 'return' statements
    TypePtr current_fn_return_type_{nullptr};
};

} // namespace setun
