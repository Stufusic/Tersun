#pragma once

#include "compiler/token.hpp"
#include "compiler/lexer.hpp"
#include "compiler/ast.hpp"
#include "compiler/arena.hpp"
#include "tafpu/exception.hpp"
#include <vector>
#include <string>
#include <functional>

namespace setun {

enum Precedence {
    PREC_NONE = 0,
    PREC_ASSIGNMENT = 1,   // =
    PREC_TERNARY_CMP = 2,  // <=>
    PREC_COMPARISON = 3,   // ==, !=, <, <=, >, >=
    PREC_TERM = 4,         // +, -
    PREC_FACTOR = 5,       // *, /
    PREC_KLEENE = 6,       // min, max
    PREC_UNARY = 7,        // -, ~, not
    PREC_CALL = 8,         // ()
    PREC_PRIMARY = 9
};

class Parser {
public:
    Parser(const std::vector<Token>& tokens, ArenaAllocator& arena);

    // Parse the full program
    Program parse_program();

    // Expression parsing via Pratt Parser
    Expr* parse_expression(int precedence = PREC_NONE);

    // Statement parsing
    Stmt* parse_statement();
    Stmt* parse_declaration();
    Stmt* parse_var_decl();
    Stmt* parse_fn_decl();
    Stmt* parse_if_stmt();
    Stmt* parse_branch3_stmt(); // Setun-70 3-way branching
    Stmt* parse_while_stmt();
    Stmt* parse_return_stmt();
    Stmt* parse_block_stmt();
    Stmt* parse_expr_stmt();

private:
    const Token& peek() const;
    const Token& previous() const;
    Token advance();
    bool check(TokenType type) const;
    bool match(TokenType type);
    Token consume(TokenType type, const std::string& error_message);
    void synchronize();

    // Pratt parser helpers
    Expr* parse_prefix();
    Expr* parse_infix(Expr* left);
    int get_infix_precedence(TokenType type) const;
    DataType parse_type();

    const std::vector<Token>& tokens_;
    ArenaAllocator& arena_;
    size_t current_{0};
};

} // namespace setun
