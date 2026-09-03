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
    KW_CONST,
    KW_MUT,
    KW_FN,
    KW_DEF,
    KW_STRUCT,
    KW_CLASS,
    KW_INTERFACE,
    KW_TRAIT,
    KW_ENUM,
    KW_MATCH,
    KW_CASE,
    KW_COMPTIME,
    KW_ASYNC,
    KW_AWAIT,
    KW_PUB,
    KW_PRIV,
    KW_IMPORT,
    KW_EXTERN,
    KW_RETURN,
    KW_IF,
    KW_ELSE,
    KW_WHILE,
    KW_BRANCH,        // Ternary 3-way branch: branch(expr) { case -1: ... case 0: ... case 1: ... }
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
    AT,               // @ (Matrix multiplication / Multiplication-free GEMM)
    EQUAL,            // =
    EQ_EQ,            // ==
    BANG_EQ,          // !=
    LESS,             // <
    GREATER,          // >
    LESS_EQ,          // <=
    GREATER_EQ,       // >=
    SPACESHIP,        // <=> (3-way comparison returning -1, 0, +1)
    TILDE,            // ~ (Ternary negation)
    PIPE,             // | (Closure parameter / Bitwise OR)
    KW_MIN,           // min / Kleene AND
    KW_MAX,           // max / Kleene OR
    KW_NOT,           // not

    // Delimiters & Navigation
    LPAREN,           // (
    RPAREN,           // )
    LBRACE,           // {
    RBRACE,           // }
    LBRACKET,         // [
    RBRACKET,         // ]
    COMMA,            // ,
    SEMICOLON,        // ;
    COLON,            // :
    DOT,              // .
    DOT_DOT,          // ..
    QUESTION,         // ?
    QUESTION_DOT,     // ?. (Safe navigation)
    QUESTION_QUESTION,// ?? (Null coalescing)
    ARROW,            // ->
    FAT_ARROW,        // =>
    FSTRING_LITERAL   // f"..."
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
