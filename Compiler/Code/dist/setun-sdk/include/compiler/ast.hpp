#pragma once

#include "compiler/token.hpp"
#include "tafpu/tafpu.hpp"
#include <string>
#include <vector>
#include <variant>
#include <memory>
#include <string_view>

namespace setun {

enum class DataType {
    VOID,
    INT,
    TRYTE,
    TAF3,
    BOOL,
    FLOAT,
    STRING,
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
    EQ,           // ==
    NEQ,          // !=
    LT,           // <
    LE,           // <=
    GT,           // >
    GE,           // >=
    SPACESHIP,    // <=> (3-way ternary comparison: -1, 0, 1)
    MIN,          // min (Kleene AND)
    MAX           // max (Kleene OR)
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
    TafpuConstructExpr
>;

struct Expr {
    ExprData data;
    SourceLocation loc;

    template <typename T>
    explicit Expr(T&& d, SourceLocation l) : data(std::forward<T>(d)), loc(l) {}
};

// -------------------------------------------------------------
// Statements
// -------------------------------------------------------------

struct VarDeclStmt {
    std::string name;
    DataType type{DataType::ANY};
    Expr* init{nullptr};
    SourceLocation loc;
};

struct AssignStmt {
    std::string name;
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
// branch (expr) { case -1: { ... } case 0: { ... } case 1: { ... } }
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
};

struct FnDeclStmt {
    std::string name;
    std::vector<Parameter> params;
    DataType return_type{DataType::VOID};
    Stmt* body{nullptr};
    SourceLocation loc;
};

using StmtData = std::variant<
    VarDeclStmt,
    AssignStmt,
    ExprStmt,
    BlockStmt,
    IfStmt,
    Branch3Stmt,
    WhileStmt,
    ReturnStmt,
    FnDeclStmt
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
        case DataType::ANY: return "any";
    }
    return "unknown";
}

} // namespace setun
