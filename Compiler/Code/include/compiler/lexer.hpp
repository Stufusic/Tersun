#pragma once

#include "compiler/token.hpp"
#include <string>
#include <string_view>
#include <vector>

namespace setun {

class Lexer {
public:
    explicit Lexer(std::string_view source);

    // Tokenize full source code into a list of tokens in O(N)
    std::vector<Token> tokenize();

    // Get next token on demand
    Token next_token();

private:
    char peek() const;
    char peek_next() const;
    char advance();
    bool is_at_end() const;
    bool match(char expected);

    void skip_whitespace_and_comments();

    Token scan_identifier_or_keyword();
    Token scan_number_or_float();
    Token scan_string();
    Token scan_ternary_literal();

    std::string_view source_;
    size_t start_{0};
    size_t current_{0};
    size_t line_{1};
    size_t column_{1};
};

} // namespace setun
