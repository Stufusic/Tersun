#pragma once

#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include <string>
#include <string_view>
#include <variant>

namespace setun {

enum class TokenType {
    // End of file / Error
    END_OF_FILE,
    ILLEGAL,

    // Identifiers & Literals
    IDENTIFIER,
    INT_LITERAL,
    FLOAT_LITERAL,
    STRING_LITERAL,
    TERNARY_LITERAL,  // e.g. @10T1, @1TTT
    TAFPU_LITERAL,    // e.g. [14, 25, -2]

    // Keywords
    KW_LET,
    KW_FN,
    KW_RETURN,
    KW_IF,
    KW_ELSE,
    KW_WHILE,
    KW_BRANCH,        // Ternary 3-way branch: branch(expr) { case -1: ... case 0: ... case 1: ... }
    KW_CASE,
    KW_PRINT,
    KW_PRINTLN,
    KW_TRACE,
    KW_ASSERT_EQ,
    KW_TRUE,
    KW_FALSE,
    KW_ENCODE_TAFPU,
    KW_TO_DOUBLE,

    // Types
    TYPE_INT,
    TYPE_TRYTE,
    TYPE_TAF3,
    TYPE_BOOL,

    // Operators
    PLUS,             // +
    MINUS,            // -
    STAR,             // *
    SLASH,            // /
    EQUAL,            // =
    EQ_EQ,            // ==
    BANG_EQ,          // !=
    LESS,             // <
    GREATER,          // >
    LESS_EQ,          // <=
    GREATER_EQ,       // >=
    SPACESHIP,        // <=> (3-way comparison returning -1, 0, +1)
    TILDE,            // ~ (Ternary negation)
    KW_MIN,           // min / Kleene AND
    KW_MAX,           // max / Kleene OR
    KW_NOT,           // not

    // Delimiters
    LPAREN,           // (
    RPAREN,           // )
    LBRACE,           // {
    RBRACE,           // }
    LBRACKET,         // [
    RBRACKET,         // ]
    COMMA,            // ,
    SEMICOLON,        // ;
    COLON,            // :
    ARROW             // ->
};

struct SourceLocation {
    size_t line{1};
    size_t column{1};
};

struct Token {
    TokenType type{TokenType::ILLEGAL};
    std::string lexeme;
    SourceLocation location;

    // Optional parsed literal values
    int64_t int_val{0};
    double float_val{0.0};
    std::string string_val;
    TafpuNum tafpu_val{};
    int16_t tryte_val{0};

    std::string to_string() const;
};

std::string_view token_type_name(TokenType type);

} // namespace setun
