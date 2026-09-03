#pragma once

#include "compiler/token.hpp"
#include "tafpu/tafpu.hpp"
#include <string>
#include <vector>
#include <variant>
#include <memory>
#include <string_view>

namespace setun {

struct Type;
using TypePtr = std::shared_ptr<Type>;

enum class DataType {
    VOID,
    INT,
    TRYTE,
    TAF3,
    BOOL,
    FLOAT,
    STRING,
    ARRAY,
    TVEC3,
    OBJECT,
    ANY
};

std::string_view data_type_name(DataType type);

// Forward declarations of AST nodes
struct Expr;
struct Stmt;

// -------------------------------------------------------------
// Expressions
// -------------------------------------------------------------

struct IntLiteralExpr {
    int64_t value;
    SourceLocation loc;
};

struct TryteLiteralExpr {
    int16_t value;
    SourceLocation loc;
};

struct TafpuLiteralExpr {
    TafpuNum value;
    SourceLocation loc;
};

struct FloatLiteralExpr {
    double value;
    SourceLocation loc;
};

struct StringLiteralExpr {
    std::string value;
    SourceLocation loc;
};

struct BoolLiteralExpr {
    bool value;
    SourceLocation loc;
};

struct IdentifierExpr {
    std::string name;
    SourceLocation loc;
};

enum class UnaryOp {
    NEG,          // -
    TILDE,        // ~ (ternary negation)
    NOT           // not
};

struct UnaryExpr {
    UnaryOp op;
    Expr* operand;
    SourceLocation loc;
};

enum class BinaryOp {
    ADD,          // +
    SUB,          // -
    MUL,          // *
    DIV,          // /
    MATMUL,       // @ (Multiplication-free GEMM)
    EQ,           // ==
    NEQ,          // !=
    LT,           // <
    LE,           // <=
    GT,           // >
    GE,           // >=
    SPACESHIP,    // <=> (3-way ternary comparison: -1, 0, 1)
    MIN,          // min (Kleene AND)
    MAX,          // max (Kleene OR)
    NULL_COALESCE // ??
};

struct BinaryExpr {
    BinaryOp op;
    Expr* left;
    Expr* right;
    SourceLocation loc;
};

struct CallExpr {
    std::string callee;
    std::vector<Expr*> args;
    SourceLocation loc;
};

struct TafpuConstructExpr {
    Expr* a;
    Expr* b;
    Expr* s;
    SourceLocation loc;
};

struct FStringExpr {
    std::string format_string;
    std::vector<Expr*> expressions;
    SourceLocation loc;
};

struct MemberAccessExpr {
    Expr* object{nullptr};
    std::string member;
    bool is_safe_nav{false}; // true for ?.
    SourceLocation loc;
};

struct MethodCallExpr {
    Expr* object{nullptr};
    std::string method;
    std::vector<Expr*> args;
    bool is_safe_nav{false}; // true for ?.
    SourceLocation loc;
};

struct IndexExpr {
    Expr* object{nullptr};
    Expr* index{nullptr};
    SourceLocation loc;
};

struct ComptimeExpr {
    Expr* expr{nullptr};
    SourceLocation loc;
};

struct ArrayLiteralExpr {
    std::vector<Expr*> elements;
    SourceLocation loc;
};

// Generic Expr using std::variant
using ExprData = std::variant<
    IntLiteralExpr,
    TryteLiteralExpr,
    TafpuLiteralExpr,
    FloatLiteralExpr,
    StringLiteralExpr,
    BoolLiteralExpr,
    IdentifierExpr,
    UnaryExpr,
    BinaryExpr,
    CallExpr,
    TafpuConstructExpr,
    FStringExpr,
    MemberAccessExpr,
    MethodCallExpr,
    IndexExpr,
    ComptimeExpr,
    ArrayLiteralExpr
>;

struct Expr {
    ExprData data;
    SourceLocation loc;
    TypePtr inferred_type{nullptr};

    template <typename T>
    explicit Expr(T&& d, SourceLocation l) : data(std::forward<T>(d)), loc(l), inferred_type(nullptr) {}
};

// -------------------------------------------------------------
// Statements
// -------------------------------------------------------------

struct VarDeclStmt {
    std::string name;
    DataType type{DataType::ANY};
    Expr* init{nullptr};
    bool is_const{false};
    SourceLocation loc;
    TypePtr resolved_type{nullptr};
    std::string custom_type_name{};
};

struct AssignStmt {
    std::string name;
    Expr* value{nullptr};
    SourceLocation loc;
};

struct MemberAssignStmt {
    Expr* object{nullptr};
    std::string member;
    Expr* value{nullptr};
    SourceLocation loc;
};

struct IndexAssignStmt {
    Expr* object{nullptr};
    Expr* index{nullptr};
    Expr* value{nullptr};
    SourceLocation loc;
};

struct ExprStmt {
    Expr* expr{nullptr};
    SourceLocation loc;
};

struct BlockStmt {
    std::vector<Stmt*> statements;
    SourceLocation loc;
};

struct IfStmt {
    Expr* condition{nullptr};
    Stmt* then_branch{nullptr};
    Stmt* else_branch{nullptr}; // Optional
    SourceLocation loc;
};

// Setun-70 3-way branching
struct Branch3Stmt {
    Expr* condition{nullptr};
    Stmt* neg_branch{nullptr};  // case -1 or case T
    Stmt* zero_branch{nullptr}; // case 0
    Stmt* pos_branch{nullptr};  // case +1 or case 1
    SourceLocation loc;
};

struct WhileStmt {
    Expr* condition{nullptr};
    Stmt* body{nullptr};
    SourceLocation loc;
};

struct ReturnStmt {
    Expr* value{nullptr}; // Optional
    SourceLocation loc;
};

struct Parameter {
    std::string name;
    DataType type{DataType::ANY};
    TypePtr resolved_type{nullptr};
};

struct FnDeclStmt {
    std::string name;
    std::vector<Parameter> params;
    DataType return_type{DataType::VOID};
    Stmt* body{nullptr};
    bool is_async{false};
    int priority{0}; // -1: Low, 0: Normal, +1: High
    SourceLocation loc;
    std::vector<std::string> generic_params{};
    TypePtr resolved_ret_type{nullptr};
};

struct FieldDecl {
    std::string name;
    DataType type{DataType::ANY};
    bool is_pub{true};
    Expr* default_val{nullptr};
    TypePtr resolved_type{nullptr};
};

struct MethodDecl {
    std::string name;
    std::vector<Parameter> params;
    DataType return_type{DataType::VOID};
    Stmt* body{nullptr};
    bool is_pub{true};
    bool is_static{false};
    std::vector<std::string> generic_params{};
    TypePtr resolved_ret_type{nullptr};
};

struct StructDeclStmt {
    std::string name;
    std::vector<std::string> interfaces;
    std::vector<FieldDecl> fields;
    std::vector<MethodDecl> methods;
    SourceLocation loc;
    std::vector<std::string> generic_params{};
};

struct ClassDeclStmt {
    std::string name;
    std::string super_class;
    std::vector<std::string> interfaces;
    std::vector<FieldDecl> fields;
    std::vector<MethodDecl> methods;
    SourceLocation loc;
    std::vector<std::string> generic_params{};
};

struct InterfaceDeclStmt {
    std::string name;
    std::vector<MethodDecl> methods;
    SourceLocation loc;
};

struct EnumVariant {
    std::string name;
    std::vector<DataType> payload_types;
};

struct EnumDeclStmt {
    std::string name;
    std::vector<EnumVariant> variants;
    SourceLocation loc;
};

struct MatchArm {
    Expr* pattern{nullptr};
    Expr* guard{nullptr};
    Stmt* body{nullptr};
};

struct MatchStmt {
    Expr* condition{nullptr};
    std::vector<MatchArm> arms;
    SourceLocation loc;
};

struct ImportStmt {
    std::string module_path;
    SourceLocation loc;
};

using StmtData = std::variant<
    VarDeclStmt,
    AssignStmt,
    MemberAssignStmt,
    IndexAssignStmt,
    ExprStmt,
    BlockStmt,
    IfStmt,
    Branch3Stmt,
    WhileStmt,
    ReturnStmt,
    FnDeclStmt,
    StructDeclStmt,
    ClassDeclStmt,
    InterfaceDeclStmt,
    EnumDeclStmt,
    MatchStmt,
    ImportStmt
>;

struct Stmt {
    StmtData data;
    SourceLocation loc;

    template <typename T>
    explicit Stmt(T&& d, SourceLocation l) : data(std::forward<T>(d)), loc(l) {}
};

struct Program {
    std::vector<Stmt*> statements;
};

inline std::string_view data_type_name(DataType type) {
    switch (type) {
        case DataType::VOID: return "void";
        case DataType::INT: return "int";
        case DataType::TRYTE: return "tryte";
        case DataType::TAF3: return "taf3";
        case DataType::BOOL: return "bool";
        case DataType::FLOAT: return "float";
        case DataType::STRING: return "string";
        case DataType::ARRAY: return "array";
        case DataType::TVEC3: return "tvec3";
        case DataType::OBJECT: return "object";
        case DataType::ANY: return "any";
    }
    return "unknown";
}

} // namespace setun
