#include "compiler/lexer.hpp"
#include <cctype>
#include <unordered_map>
#include <sstream>

namespace setun {

std::string_view token_type_name(TokenType type) {
    switch (type) {
        case TokenType::END_OF_FILE: return "EOF";
        case TokenType::ILLEGAL: return "ILLEGAL";
        case TokenType::IDENTIFIER: return "IDENTIFIER";
        case TokenType::INT_LITERAL: return "INT_LITERAL";
        case TokenType::FLOAT_LITERAL: return "FLOAT_LITERAL";
        case TokenType::STRING_LITERAL: return "STRING_LITERAL";
        case TokenType::TERNARY_LITERAL: return "TERNARY_LITERAL";
        case TokenType::TAFPU_LITERAL: return "TAFPU_LITERAL";
        case TokenType::KW_LET: return "let";
        case TokenType::KW_CONST: return "const";
        case TokenType::KW_MUT: return "mut";
        case TokenType::KW_FN: return "fn";
        case TokenType::KW_DEF: return "def";
        case TokenType::KW_STRUCT: return "struct";
        case TokenType::KW_CLASS: return "class";
        case TokenType::KW_INTERFACE: return "interface";
        case TokenType::KW_TRAIT: return "trait";
        case TokenType::KW_ENUM: return "enum";
        case TokenType::KW_MATCH: return "match";
        case TokenType::KW_CASE: return "case";
        case TokenType::KW_COMPTIME: return "comptime";
        case TokenType::KW_ASYNC: return "async";
        case TokenType::KW_AWAIT: return "await";
        case TokenType::KW_PUB: return "pub";
        case TokenType::KW_PRIV: return "priv";
        case TokenType::KW_IMPORT: return "import";
        case TokenType::KW_EXTERN: return "extern";
        case TokenType::KW_RETURN: return "return";
        case TokenType::KW_IF: return "if";
        case TokenType::KW_ELSE: return "else";
        case TokenType::KW_WHILE: return "while";
        case TokenType::KW_BRANCH: return "branch";
        case TokenType::KW_PRINT: return "print";
        case TokenType::KW_PRINTLN: return "println";
        case TokenType::KW_TRACE: return "trace";
        case TokenType::KW_ASSERT_EQ: return "assert_eq";
        case TokenType::KW_TRUE: return "true";
        case TokenType::KW_FALSE: return "false";
        case TokenType::KW_ENCODE_TAFPU: return "encode_tafpu";
        case TokenType::KW_TO_DOUBLE: return "to_double";
        case TokenType::TYPE_INT: return "int";
        case TokenType::TYPE_TRYTE: return "tryte";
        case TokenType::TYPE_TAF3: return "taf3";
        case TokenType::TYPE_BOOL: return "bool";
        case TokenType::PLUS: return "+";
        case TokenType::MINUS: return "-";
        case TokenType::STAR: return "*";
        case TokenType::SLASH: return "/";
        case TokenType::AT: return "@";
        case TokenType::EQUAL: return "=";
        case TokenType::EQ_EQ: return "==";
        case TokenType::BANG_EQ: return "!=";
        case TokenType::LESS: return "<";
        case TokenType::GREATER: return ">";
        case TokenType::LESS_EQ: return "<=";
        case TokenType::GREATER_EQ: return ">=";
        case TokenType::SPACESHIP: return "<=>";
        case TokenType::TILDE: return "~";
        case TokenType::PIPE: return "|";
        case TokenType::KW_MIN: return "min";
        case TokenType::KW_MAX: return "max";
        case TokenType::KW_NOT: return "not";
        case TokenType::LPAREN: return "(";
        case TokenType::RPAREN: return ")";
        case TokenType::LBRACE: return "{";
        case TokenType::RBRACE: return "}";
        case TokenType::LBRACKET: return "[";
        case TokenType::RBRACKET: return "]";
        case TokenType::COMMA: return ",";
        case TokenType::SEMICOLON: return ";";
        case TokenType::COLON: return ":";
        case TokenType::DOT: return ".";
        case TokenType::DOT_DOT: return "..";
        case TokenType::QUESTION: return "?";
        case TokenType::QUESTION_DOT: return "?.";
        case TokenType::QUESTION_QUESTION: return "??";
        case TokenType::ARROW: return "->";
        case TokenType::FAT_ARROW: return "=>";
        case TokenType::FSTRING_LITERAL: return "FSTRING_LITERAL";
    }
    return "UNKNOWN";
}

std::string Token::to_string() const {
    std::ostringstream oss;
    oss << "[" << token_type_name(type) << " '" << lexeme << "' at " << location.line << ":" << location.column << "]";
    return oss.str();
}

static const std::unordered_map<std::string_view, TokenType> KEYWORDS = {
    {"let", TokenType::KW_LET},
    {"const", TokenType::KW_CONST},
    {"mut", TokenType::KW_MUT},
    {"fn", TokenType::KW_FN},
    {"def", TokenType::KW_DEF},
    {"struct", TokenType::KW_STRUCT},
    {"class", TokenType::KW_CLASS},
    {"interface", TokenType::KW_INTERFACE},
    {"trait", TokenType::KW_TRAIT},
    {"enum", TokenType::KW_ENUM},
    {"match", TokenType::KW_MATCH},
    {"case", TokenType::KW_CASE},
    {"comptime", TokenType::KW_COMPTIME},
    {"async", TokenType::KW_ASYNC},
    {"await", TokenType::KW_AWAIT},
    {"pub", TokenType::KW_PUB},
    {"public", TokenType::KW_PUB},
    {"priv", TokenType::KW_PRIV},
    {"private", TokenType::KW_PRIV},
    {"import", TokenType::KW_IMPORT},
    {"extern", TokenType::KW_EXTERN},
    {"return", TokenType::KW_RETURN},
    {"if", TokenType::KW_IF},
    {"else", TokenType::KW_ELSE},
    {"while", TokenType::KW_WHILE},
    {"branch", TokenType::KW_BRANCH},
    {"branch3", TokenType::KW_BRANCH},
    {"print", TokenType::KW_PRINT},
    {"println", TokenType::KW_PRINTLN},
    {"trace", TokenType::KW_TRACE},
    {"assert_eq", TokenType::KW_ASSERT_EQ},
    {"true", TokenType::KW_TRUE},
    {"false", TokenType::KW_FALSE},
    {"encode_tafpu", TokenType::KW_ENCODE_TAFPU},
    {"to_double", TokenType::KW_TO_DOUBLE},
    {"int", TokenType::TYPE_INT},
    {"tryte", TokenType::TYPE_TRYTE},
    {"taf3", TokenType::TYPE_TAF3},
    {"bool", TokenType::TYPE_BOOL},
    {"min", TokenType::KW_MIN},
    {"max", TokenType::KW_MAX},
    {"not", TokenType::KW_NOT}
};

Lexer::Lexer(std::string_view source)
    : source_(source), start_(0), current_(0), line_(1), column_(1) {
    if (source_.size() >= 3 &&
        static_cast<unsigned char>(source_[0]) == 0xEF &&
        static_cast<unsigned char>(source_[1]) == 0xBB &&
        static_cast<unsigned char>(source_[2]) == 0xBF) {
        source_.remove_prefix(3);
    }
}

char Lexer::peek() const {
    if (is_at_end()) return '\0';
    return source_[current_];
}

char Lexer::peek_next() const {
    if (current_ + 1 >= source_.size()) return '\0';
    return source_[current_ + 1];
}

char Lexer::advance() {
    char c = source_[current_++];
    column_++;
    return c;
}

bool Lexer::is_at_end() const {
    return current_ >= source_.size();
}

bool Lexer::match(char expected) {
    if (is_at_end()) return false;
    if (source_[current_] != expected) return false;
    current_++;
    column_++;
    return true;
}

void Lexer::skip_whitespace_and_comments() {
    while (!is_at_end()) {
        char c = peek();
        switch (c) {
            case ' ':
            case '\r':
            case '\t':
                advance();
                break;
            case '\n':
                line_++;
                column_ = 0;
                advance();
                break;
            case '/':
                if (peek_next() == '/') {
                    // Line comment
                    while (peek() != '\n' && !is_at_end()) advance();
                } else if (peek_next() == '*') {
                    // Block comment
                    advance(); // skip /
                    advance(); // skip *
                    while (!is_at_end()) {
                        if (peek() == '*' && peek_next() == '/') {
                            advance();
                            advance();
                            break;
                        }
                        if (peek() == '\n') {
                            line_++;
                            column_ = 0;
                        }
                        advance();
                    }
                } else {
                    return;
                }
                break;
            default:
                return;
        }
    }
}

std::vector<Token> Lexer::tokenize() {
    std::vector<Token> tokens;
    while (true) {
        Token tok = next_token();
        tokens.push_back(tok);
        if (tok.type == TokenType::END_OF_FILE) {
            break;
        }
    }
    return tokens;
}

Token Lexer::scan_identifier_or_keyword() {
    while (std::isalnum(peek()) || peek() == '_') {
        advance();
    }

    std::string_view text = source_.substr(start_, current_ - start_);
    Token tok;
    tok.lexeme = std::string(text);
    tok.location = {line_, column_ - (current_ - start_)};

    auto it = KEYWORDS.find(text);
    if (it != KEYWORDS.end()) {
        tok.type = it->second;
    } else {
        // Special check: Single 'T' can represent -1 in balanced ternary case matching
        if (text == "T") {
            tok.type = TokenType::TERNARY_LITERAL;
            tok.tryte_val = -1;
            tok.int_val = -1;
        } else {
            tok.type = TokenType::IDENTIFIER;
        }
    }
    return tok;
}

Token Lexer::scan_number_or_float() {
    // Check for hexadecimal literal (0x... or 0X...)
    if (source_[start_] == '0' && (peek() == 'x' || peek() == 'X')) {
        advance(); // consume 'x' or 'X'
        while (std::isxdigit(peek())) {
            advance();
        }
        std::string_view text = source_.substr(start_, current_ - start_);
        Token tok;
        tok.lexeme = std::string(text);
        tok.location = {line_, column_ - (current_ - start_)};
        tok.type = TokenType::INT_LITERAL;
        try {
            tok.int_val = std::stoll(std::string(text), nullptr, 16);
        } catch (...) {
            tok.int_val = 0;
        }
        return tok;
    }

    bool is_float = false;
    while (std::isdigit(peek())) {
        advance();
    }

    // Check for fractional part
    if (peek() == '.' && std::isdigit(peek_next())) {
        is_float = true;
        advance(); // consume '.'
        while (std::isdigit(peek())) {
            advance();
        }
    }

    std::string_view text = source_.substr(start_, current_ - start_);
    Token tok;
    tok.lexeme = std::string(text);
    tok.location = {line_, column_ - (current_ - start_)};

    if (is_float) {
        tok.type = TokenType::FLOAT_LITERAL;
        tok.float_val = std::stod(tok.lexeme);
    } else {
        tok.type = TokenType::INT_LITERAL;
        tok.int_val = std::stoll(tok.lexeme);
    }
    return tok;
}

Token Lexer::scan_string() {
    advance(); // Consume opening quote '"'
    size_t str_start = current_;
    std::string val;

    while (peek() != '"' && !is_at_end()) {
        if (peek() == '\\') {
            advance();
            if (is_at_end()) break;
            char esc = advance();
            switch (esc) {
                case 'n': val.push_back('\n'); break;
                case 't': val.push_back('\t'); break;
                case 'r': val.push_back('\r'); break;
                case '\\': val.push_back('\\'); break;
                case '"': val.push_back('"'); break;
                default: val.push_back(esc); break;
            }
        } else {
            if (peek() == '\n') {
                line_++;
                column_ = 0;
            }
            val.push_back(advance());
        }
    }

    if (!is_at_end()) {
        advance(); // Consume closing quote '"'
    }

    Token tok;
    tok.type = TokenType::STRING_LITERAL;
    tok.lexeme = std::string(source_.substr(start_, current_ - start_));
    tok.string_val = val;
    tok.location = {line_, column_ - (current_ - start_)};
    return tok;
}

Token Lexer::scan_ternary_literal() {
    // Starts with '@' e.g. @10T1, @1TTT
    advance(); // Consume '@'
    size_t lit_start = current_;
    while (peek() == '1' || peek() == '0' || peek() == 'T' || peek() == 't' || peek() == '-') {
        advance();
    }

    std::string_view trit_str = source_.substr(lit_start, current_ - lit_start);
    Token tok;
    tok.lexeme = std::string(source_.substr(start_, current_ - start_));
    tok.location = {line_, column_ - (current_ - start_)};
    tok.type = TokenType::TERNARY_LITERAL;
    tok.int_val = from_ternary_string(trit_str);
    tok.tryte_val = static_cast<int16_t>(tok.int_val);
    return tok;
}

Token Lexer::next_token() {
    skip_whitespace_and_comments();

    start_ = current_;
    if (is_at_end()) {
        return Token{TokenType::END_OF_FILE, "", {line_, column_}};
    }

    char c = advance();
    SourceLocation loc = {line_, column_ - 1};

    if (c == 'f' && peek() == '"') {
        advance(); // consume '"'
        std::string val;
        while (peek() != '"' && !is_at_end()) {
            if (peek() == '\\') {
                advance();
                if (is_at_end()) break;
                char esc = advance();
                switch (esc) {
                    case 'n': val.push_back('\n'); break;
                    case 't': val.push_back('\t'); break;
                    case 'r': val.push_back('\r'); break;
                    case '\\': val.push_back('\\'); break;
                    case '"': val.push_back('"'); break;
                    default: val.push_back(esc); break;
                }
            } else {
                if (peek() == '\n') {
                    line_++;
                    column_ = 0;
                }
                val.push_back(advance());
            }
        }
        if (!is_at_end()) {
            advance(); // consume closing '"'
        }
        Token tok;
        tok.type = TokenType::FSTRING_LITERAL;
        tok.lexeme = std::string(source_.substr(start_, current_ - start_));
        tok.string_val = val;
        tok.location = loc;
        return tok;
    }

    if (c == '"') {
        current_--;
        column_--;
        return scan_string();
    }

    if (std::isalpha(c) || c == '_') {
        current_--;
        column_--;
        return scan_identifier_or_keyword();
    }

    if (std::isdigit(c)) {
        current_--;
        column_--;
        return scan_number_or_float();
    }

    if (c == '@') {
        if (peek() == '1' || peek() == '0' || peek() == 'T' || peek() == 't' || peek() == '-') {
            current_--;
            column_--;
            return scan_ternary_literal();
        }
        return Token{TokenType::AT, "@", loc};
    }

    switch (c) {
        case '(': return Token{TokenType::LPAREN, "(", loc};
        case ')': return Token{TokenType::RPAREN, ")", loc};
        case '{': return Token{TokenType::LBRACE, "{", loc};
        case '}': return Token{TokenType::RBRACE, "}", loc};
        case '[': return Token{TokenType::LBRACKET, "[", loc};
        case ']': return Token{TokenType::RBRACKET, "]", loc};
        case ',': return Token{TokenType::COMMA, ",", loc};
        case ';': return Token{TokenType::SEMICOLON, ";", loc};
        case ':': return Token{TokenType::COLON, ":", loc};
        case '+': return Token{TokenType::PLUS, "+", loc};
        case '~': return Token{TokenType::TILDE, "~", loc};
        case '*': return Token{TokenType::STAR, "*", loc};
        case '/': return Token{TokenType::SLASH, "/", loc};
        case '|': return Token{TokenType::PIPE, "|", loc};
        case '.':
            if (match('.')) {
                return Token{TokenType::DOT_DOT, "..", loc};
            }
            return Token{TokenType::DOT, ".", loc};
        case '?':
            if (match('.')) {
                return Token{TokenType::QUESTION_DOT, "?.", loc};
            }
            if (match('?')) {
                return Token{TokenType::QUESTION_QUESTION, "??", loc};
            }
            return Token{TokenType::QUESTION, "?", loc};
        case '-':
            if (match('>')) {
                return Token{TokenType::ARROW, "->", loc};
            }
            return Token{TokenType::MINUS, "-", loc};
        case '=':
            if (match('>')) {
                return Token{TokenType::FAT_ARROW, "=>", loc};
            }
            if (match('=')) {
                return Token{TokenType::EQ_EQ, "==", loc};
            }
            return Token{TokenType::EQUAL, "=", loc};
        case '!':
            if (match('=')) {
                return Token{TokenType::BANG_EQ, "!=", loc};
            }
            break;
        case '<':
            if (match('=')) {
                if (match('>')) {
                    return Token{TokenType::SPACESHIP, "<=>", loc};
                }
                return Token{TokenType::LESS_EQ, "<=", loc};
            }
            return Token{TokenType::LESS, "<", loc};
        case '>':
            if (match('=')) {
                return Token{TokenType::GREATER_EQ, ">=", loc};
            }
            return Token{TokenType::GREATER, ">", loc};
        default:
            break;
    }

    return Token{TokenType::ILLEGAL, std::string(1, c), loc};
}

} // namespace setun
