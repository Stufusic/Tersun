#include "compiler/parser.hpp"
#include <sstream>

namespace setun {

Parser::Parser(const std::vector<Token>& tokens, ArenaAllocator& arena)
    : tokens_(tokens), arena_(arena), current_(0) {}

const Token& Parser::peek() const {
    if (current_ >= tokens_.size()) {
        return tokens_.back(); // EOF token
    }
    return tokens_[current_];
}

const Token& Parser::previous() const {
    if (current_ == 0) return tokens_[0];
    return tokens_[current_ - 1];
}

Token Parser::advance() {
    if (!check(TokenType::END_OF_FILE)) {
        current_++;
    }
    return previous();
}

bool Parser::check(TokenType type) const {
    return peek().type == type;
}

bool Parser::match(TokenType type) {
    if (check(type)) {
        advance();
        return true;
    }
    return false;
}

Token Parser::consume(TokenType type, const std::string& error_message) {
    if (check(type)) {
        return advance();
    }
    if (type == TokenType::IDENTIFIER && check(TokenType::TERNARY_LITERAL) && peek().lexeme == "T") {
        Token tok = advance();
        tok.type = TokenType::IDENTIFIER;
        return tok;
    }
    std::ostringstream oss;
    oss << "[Parser Error] Line " << peek().location.line << ":" << peek().location.column
        << " - " << error_message << " (Got '" << peek().lexeme << "' [" << token_type_name(peek().type) << "])";
    throw CompilerException(oss.str());
}

void Parser::synchronize() {
    advance();
    while (!check(TokenType::END_OF_FILE)) {
        if (previous().type == TokenType::SEMICOLON) return;
        switch (peek().type) {
            case TokenType::KW_FN:
            case TokenType::KW_LET:
            case TokenType::KW_IF:
            case TokenType::KW_WHILE:
            case TokenType::KW_BRANCH:
            case TokenType::KW_RETURN:
            case TokenType::KW_PRINT:
            case TokenType::KW_PRINTLN:
                return;
            default:
                break;
        }
        advance();
    }
}

Program Parser::parse_program() {
    Program prog;
    while (!check(TokenType::END_OF_FILE)) {
        prog.statements.push_back(parse_declaration());
    }
    return prog;
}

Stmt* Parser::parse_declaration() {
    try {
        if (match(TokenType::KW_PUB) || match(TokenType::KW_PRIV)) {
            // Visibility modifiers
        }
        if (match(TokenType::KW_LET)) {
            return parse_var_decl(false);
        }
        if (match(TokenType::KW_CONST)) {
            return parse_var_decl(true);
        }
        if (match(TokenType::KW_FN) || match(TokenType::KW_DEF)) {
            return parse_fn_decl(false, 0);
        }
        if (match(TokenType::KW_ASYNC)) {
            int priority = 0;
            if (match(TokenType::LPAREN)) {
                if (check(TokenType::IDENTIFIER) && peek().lexeme == "priority") {
                    advance();
                    consume(TokenType::COLON, "Expected ':' after priority");
                    if (match(TokenType::PLUS)) {
                        consume(TokenType::INT_LITERAL, "Expected integer priority");
                        priority = 1;
                    } else if (match(TokenType::MINUS)) {
                        consume(TokenType::INT_LITERAL, "Expected integer priority");
                        priority = -1;
                    } else if (check(TokenType::INT_LITERAL)) {
                        priority = static_cast<int>(advance().int_val);
                    }
                }
                consume(TokenType::RPAREN, "Expected ')' after async options");
            }
            if (match(TokenType::KW_FN) || match(TokenType::KW_DEF)) {
                return parse_fn_decl(true, priority);
            }
        }
        if (match(TokenType::KW_STRUCT)) {
            return parse_struct_decl();
        }
        if (match(TokenType::KW_CLASS)) {
            return parse_class_decl();
        }
        if (match(TokenType::KW_INTERFACE) || match(TokenType::KW_TRAIT)) {
            return parse_interface_decl();
        }
        if (match(TokenType::KW_ENUM)) {
            return parse_enum_decl();
        }
        if (match(TokenType::KW_IMPORT)) {
            return parse_import_stmt();
        }
        if (match(TokenType::KW_EXTERN)) {
            return parse_extern_decl();
        }
        return parse_statement();
    } catch (const CompilerException& e) {
        synchronize();
        throw;
    }
}

DataType Parser::parse_type() {
    if (match(TokenType::LBRACKET)) {
        parse_type(); // parse element type if any
        consume(TokenType::RBRACKET, "Expected ']' after array type.");
        return DataType::ARRAY;
    }
    if (match(TokenType::TYPE_INT)) return DataType::INT;
    if (match(TokenType::TYPE_TRYTE)) return DataType::TRYTE;
    if (match(TokenType::TYPE_TAF3)) return DataType::TAF3;
    if (match(TokenType::TYPE_BOOL)) return DataType::BOOL;
    if (check(TokenType::IDENTIFIER) || (check(TokenType::TERNARY_LITERAL) && peek().lexeme == "T")) {
        std::string tname = peek().lexeme;
        last_type_name_ = tname;
        if (tname == "string" || tname == "String") { advance(); return DataType::STRING; }
        if (tname == "float" || tname == "Float") { advance(); return DataType::FLOAT; }
        if (tname == "void" || tname == "Void") { advance(); return DataType::VOID; }
        if (tname == "int" || tname == "Int") { advance(); return DataType::INT; }
        if (tname == "bool" || tname == "Bool") { advance(); return DataType::BOOL; }
        if (tname == "taf3" || tname == "TAF3") { advance(); return DataType::TAF3; }
        if (tname == "tvec3" || tname == "Tvec3") { advance(); return DataType::TVEC3; }
        if (tname == "array" || tname == "Array") {
            if (match(TokenType::LESS)) {
                parse_type();
                consume(TokenType::GREATER, "Expected '>' after Array element type.");
            }
            return DataType::ARRAY;
        }
        if (tname == "object" || tname == "Object") { advance(); return DataType::OBJECT; }
        if (tname == "tryte" || tname == "Tryte") { advance(); return DataType::TRYTE; }
        if (tname == "trit" || tname == "Trit") { advance(); return DataType::TRYTE; }
        advance(); // User-defined type or generic
        if (match(TokenType::LESS)) {
            do {
                parse_type();
            } while (match(TokenType::COMMA));
            consume(TokenType::GREATER, "Expected '>' after generic type arguments.");
        }
        return DataType::OBJECT;
    }
    return DataType::ANY;
}

Stmt* Parser::parse_var_decl(bool is_const) {
    SourceLocation loc = previous().location;
    match(TokenType::KW_MUT); // Support optional 'mut' keyword (e.g. let mut x = ...)
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected variable name.");
    std::string name = name_tok.lexeme;

    DataType type = DataType::ANY;
    std::string custom_type_name = "";
    if (match(TokenType::COLON)) {
        type = parse_type();
        custom_type_name = last_type_name_;
    }

    Expr* init = nullptr;
    if (match(TokenType::EQUAL)) {
        init = parse_expression();
    }
    consume(TokenType::SEMICOLON, "Expected ';' after variable declaration.");

    return arena_.make<Stmt>(VarDeclStmt{name, type, init, is_const, loc, nullptr, custom_type_name}, loc);
}

Stmt* Parser::parse_fn_decl(bool is_async, int priority) {
    SourceLocation loc = previous().location;
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected function name after 'fn' or 'def'.");
    std::string name = name_tok.lexeme;

    // Support generic parameters: fn name<T, U>(...)
    std::vector<std::string> generic_params;
    if (match(TokenType::LESS)) {
        do {
            Token gtok = consume(TokenType::IDENTIFIER, "Expected generic type parameter name.");
            generic_params.push_back(gtok.lexeme);
        } while (match(TokenType::COMMA));
        consume(TokenType::GREATER, "Expected '>' after generic type parameters.");
    }

    consume(TokenType::LPAREN, "Expected '(' after function name.");
    std::vector<Parameter> params;
    if (!check(TokenType::RPAREN)) {
        do {
            Token p_tok = consume(TokenType::IDENTIFIER, "Expected parameter name.");
            DataType p_type = DataType::ANY;
            if (match(TokenType::COLON)) {
                p_type = parse_type();
            }
            params.push_back(Parameter{p_tok.lexeme, p_type});
        } while (match(TokenType::COMMA));
    }
    consume(TokenType::RPAREN, "Expected ')' after parameters.");

    DataType return_type = DataType::VOID;
    if (match(TokenType::ARROW)) {
        return_type = parse_type();
    }

    match(TokenType::COLON); // Optional ':' after function signature (Python style)
    consume(TokenType::LBRACE, "Expected '{' before function body.");
    current_--; // back to LBRACE so parse_block_stmt can consume it
    Stmt* body = parse_block_stmt();

    return arena_.make<Stmt>(FnDeclStmt{name, std::move(params), return_type, body, is_async, priority, loc, std::move(generic_params), nullptr}, loc);
}

Stmt* Parser::parse_struct_decl() {
    SourceLocation loc = previous().location;
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected struct name.");
    std::string name = name_tok.lexeme;

    std::vector<std::string> generic_params;
    if (match(TokenType::LESS)) {
        do {
            Token gtok = consume(TokenType::IDENTIFIER, "Expected generic type parameter name.");
            generic_params.push_back(gtok.lexeme);
        } while (match(TokenType::COMMA));
        consume(TokenType::GREATER, "Expected '>' after generic type parameters.");
    }

    std::vector<std::string> interfaces;
    if (match(TokenType::COLON)) {
        do {
            Token iface = consume(TokenType::IDENTIFIER, "Expected interface name.");
            interfaces.push_back(iface.lexeme);
        } while (match(TokenType::COMMA));
    }

    consume(TokenType::LBRACE, "Expected '{' before struct body.");
    std::vector<FieldDecl> fields;
    std::vector<MethodDecl> methods;

    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        bool is_pub = true;
        if (match(TokenType::KW_PUB)) is_pub = true;
        else if (match(TokenType::KW_PRIV)) is_pub = false;

        bool is_field = false;
        if (match(TokenType::KW_LET)) {
            is_field = true;
        } else if (check(TokenType::IDENTIFIER) && peek().lexeme != "fn" && peek().lexeme != "def") {
            is_field = true;
        }

        if (is_field) {
            Token fname = consume(TokenType::IDENTIFIER, "Expected field name.");
            DataType ftype = DataType::ANY;
            if (match(TokenType::COLON)) {
                ftype = parse_type();
            }
            Expr* def_val = nullptr;
            if (match(TokenType::EQUAL)) {
                def_val = parse_expression();
            }
            consume(TokenType::SEMICOLON, "Expected ';' after struct field.");
            fields.push_back(FieldDecl{fname.lexeme, ftype, is_pub, def_val});
        } else if (match(TokenType::KW_FN) || match(TokenType::KW_DEF)) {
            Token mname = consume(TokenType::IDENTIFIER, "Expected method name.");
            consume(TokenType::LPAREN, "Expected '(' after method name.");
            std::vector<Parameter> mparams;
            if (!check(TokenType::RPAREN)) {
                do {
                    if (match(TokenType::TILDE) || (check(TokenType::IDENTIFIER) && (peek().lexeme == "this" || peek().lexeme == "self"))) {
                        advance(); // consume 'this' or 'self' parameter
                        mparams.push_back(Parameter{"self", DataType::ANY});
                        continue;
                    }
                    Token p_tok = consume(TokenType::IDENTIFIER, "Expected parameter name.");
                    DataType p_type = DataType::ANY;
                    if (match(TokenType::COLON)) p_type = parse_type();
                    mparams.push_back(Parameter{p_tok.lexeme, p_type});
                } while (match(TokenType::COMMA));
            }
            consume(TokenType::RPAREN, "Expected ')' after parameters.");
            DataType ret_type = DataType::VOID;
            if (match(TokenType::ARROW)) {
                ret_type = parse_type();
            }
            consume(TokenType::LBRACE, "Expected '{' before method body.");
            current_--;
            Stmt* mbody = parse_block_stmt();
            methods.push_back(MethodDecl{mname.lexeme, std::move(mparams), ret_type, mbody, is_pub, false});
        } else {
            advance();
        }
    }
    consume(TokenType::RBRACE, "Expected '}' after struct body.");

    return arena_.make<Stmt>(StructDeclStmt{name, std::move(interfaces), std::move(fields), std::move(methods), loc, std::move(generic_params)}, loc);
}

Stmt* Parser::parse_class_decl() {
    SourceLocation loc = previous().location;
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected class name.");
    std::string name = name_tok.lexeme;

    std::vector<std::string> generic_params;
    if (match(TokenType::LESS)) {
        do {
            Token gtok = consume(TokenType::IDENTIFIER, "Expected generic type parameter name.");
            generic_params.push_back(gtok.lexeme);
        } while (match(TokenType::COMMA));
        consume(TokenType::GREATER, "Expected '>' after generic type parameters.");
    }

    std::string super_class = "";
    std::vector<std::string> interfaces;

    if (match(TokenType::COLON)) {
        Token super_tok = consume(TokenType::IDENTIFIER, "Expected super class or interface name.");
        super_class = super_tok.lexeme;
        while (match(TokenType::COMMA)) {
            interfaces.push_back(consume(TokenType::IDENTIFIER, "Expected interface name.").lexeme);
        }
    }

    consume(TokenType::LBRACE, "Expected '{' before class body.");
    std::vector<FieldDecl> fields;
    std::vector<MethodDecl> methods;

    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        bool is_pub = true;
        if (match(TokenType::KW_PUB)) is_pub = true;
        else if (match(TokenType::KW_PRIV)) is_pub = false;

        bool is_field = false;
        if (match(TokenType::KW_LET)) {
            is_field = true;
        } else if (check(TokenType::IDENTIFIER) && peek().lexeme != "fn" && peek().lexeme != "def") {
            is_field = true;
        }

        if (is_field) {
            Token fname = consume(TokenType::IDENTIFIER, "Expected field name.");
            DataType ftype = DataType::ANY;
            if (match(TokenType::COLON)) {
                ftype = parse_type();
            }
            Expr* def_val = nullptr;
            if (match(TokenType::EQUAL)) {
                def_val = parse_expression();
            }
            consume(TokenType::SEMICOLON, "Expected ';' after class field.");
            fields.push_back(FieldDecl{fname.lexeme, ftype, is_pub, def_val});
        } else if (match(TokenType::KW_FN) || match(TokenType::KW_DEF)) {
            Token mname = consume(TokenType::IDENTIFIER, "Expected method name.");
            consume(TokenType::LPAREN, "Expected '(' after method name.");
            std::vector<Parameter> mparams;
            if (!check(TokenType::RPAREN)) {
                do {
                    if (match(TokenType::TILDE) || (check(TokenType::IDENTIFIER) && (peek().lexeme == "this" || peek().lexeme == "self"))) {
                        advance();
                        mparams.push_back(Parameter{"self", DataType::ANY});
                        continue;
                    }
                    Token p_tok = consume(TokenType::IDENTIFIER, "Expected parameter name.");
                    DataType p_type = DataType::ANY;
                    if (match(TokenType::COLON)) p_type = parse_type();
                    mparams.push_back(Parameter{p_tok.lexeme, p_type});
                } while (match(TokenType::COMMA));
            }
            consume(TokenType::RPAREN, "Expected ')' after parameters.");
            DataType ret_type = DataType::VOID;
            if (match(TokenType::ARROW)) {
                ret_type = parse_type();
            }
            consume(TokenType::LBRACE, "Expected '{' before method body.");
            current_--;
            Stmt* mbody = parse_block_stmt();
            methods.push_back(MethodDecl{mname.lexeme, std::move(mparams), ret_type, mbody, is_pub, false});
        } else {
            advance();
        }
    }
    consume(TokenType::RBRACE, "Expected '}' after class body.");

    return arena_.make<Stmt>(ClassDeclStmt{name, super_class, std::move(interfaces), std::move(fields), std::move(methods), loc, std::move(generic_params)}, loc);
}

Stmt* Parser::parse_interface_decl() {
    SourceLocation loc = previous().location;
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected interface name.");
    std::string name = name_tok.lexeme;

    consume(TokenType::LBRACE, "Expected '{' before interface body.");
    std::vector<MethodDecl> methods;

    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        if (match(TokenType::KW_FN) || match(TokenType::KW_DEF)) {
            Token mname = consume(TokenType::IDENTIFIER, "Expected method name.");
            consume(TokenType::LPAREN, "Expected '(' after method name.");
            std::vector<Parameter> mparams;
            if (!check(TokenType::RPAREN)) {
                do {
                    Token p_tok = consume(TokenType::IDENTIFIER, "Expected parameter name.");
                    DataType p_type = DataType::ANY;
                    if (match(TokenType::COLON)) p_type = parse_type();
                    mparams.push_back(Parameter{p_tok.lexeme, p_type});
                } while (match(TokenType::COMMA));
            }
            consume(TokenType::RPAREN, "Expected ')' after parameters.");
            DataType ret_type = DataType::VOID;
            if (match(TokenType::ARROW)) {
                ret_type = parse_type();
            }

            Stmt* mbody = nullptr;
            if (match(TokenType::LBRACE)) {
                current_--;
                mbody = parse_block_stmt(); // Default method implementation
            } else {
                consume(TokenType::SEMICOLON, "Expected ';' or '{' after interface method signature.");
            }
            methods.push_back(MethodDecl{mname.lexeme, std::move(mparams), ret_type, mbody, true, false});
        } else {
            advance();
        }
    }
    consume(TokenType::RBRACE, "Expected '}' after interface body.");

    return arena_.make<Stmt>(InterfaceDeclStmt{name, std::move(methods), loc}, loc);
}

Stmt* Parser::parse_enum_decl() {
    SourceLocation loc = previous().location;
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected enum name.");
    std::string name = name_tok.lexeme;

    consume(TokenType::LBRACE, "Expected '{' before enum body.");
    std::vector<EnumVariant> variants;

    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        Token vname = consume(TokenType::IDENTIFIER, "Expected enum variant name.");
        std::vector<DataType> payloads;
        if (match(TokenType::LPAREN)) {
            if (!check(TokenType::RPAREN)) {
                do {
                    payloads.push_back(parse_type());
                } while (match(TokenType::COMMA));
            }
            consume(TokenType::RPAREN, "Expected ')' after enum variant payloads.");
        }
        match(TokenType::COMMA);
        variants.push_back(EnumVariant{vname.lexeme, std::move(payloads)});
    }
    consume(TokenType::RBRACE, "Expected '}' after enum body.");

    return arena_.make<Stmt>(EnumDeclStmt{name, std::move(variants), loc}, loc);
}

Stmt* Parser::parse_match_stmt() {
    SourceLocation loc = previous().location;
    consume(TokenType::LPAREN, "Expected '(' after 'match'.");
    Expr* cond = parse_expression();
    consume(TokenType::RPAREN, "Expected ')' after match condition.");

    consume(TokenType::LBRACE, "Expected '{' before match arms.");
    std::vector<MatchArm> arms;

    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        consume(TokenType::KW_CASE, "Expected 'case' in match arm.");
        Expr* pat = parse_expression();
        Expr* guard = nullptr;
        if (match(TokenType::KW_IF)) {
            guard = parse_expression();
        }
        if (!match(TokenType::FAT_ARROW) && !match(TokenType::COLON)) {
            throw CompilerException("Expected '=>' or ':' after match case pattern.");
        }
        Stmt* body = parse_statement();
        arms.push_back(MatchArm{pat, guard, body});
    }
    consume(TokenType::RBRACE, "Expected '}' after match arms.");

    return arena_.make<Stmt>(MatchStmt{cond, std::move(arms), loc}, loc);
}

Stmt* Parser::parse_import_stmt() {
    SourceLocation loc = previous().location;
    std::string mod_path;
    do {
        Token seg = consume(TokenType::IDENTIFIER, "Expected module path segment in import statement.");
        mod_path += seg.lexeme;
        if (match(TokenType::DOT)) {
            mod_path += ".";
        } else {
            break;
        }
    } while (true);

    if (match(TokenType::COLON) && match(TokenType::COLON) && match(TokenType::STAR)) {
        mod_path += "::*";
    }
    consume(TokenType::SEMICOLON, "Expected ';' after import statement.");

    return arena_.make<Stmt>(ImportStmt{mod_path, loc}, loc);
}

Stmt* Parser::parse_extern_decl() {
    SourceLocation loc = previous().location;
    // Optional ABI string: e.g. "C"
    if (check(TokenType::STRING_LITERAL)) {
        advance();
    }
    if (!match(TokenType::KW_FN) && !match(TokenType::KW_DEF)) {
        throw CompilerException("Expected 'fn' or 'def' after 'extern'.");
    }
    Token name_tok = consume(TokenType::IDENTIFIER, "Expected function name after 'fn'.");
    std::string name = name_tok.lexeme;

    consume(TokenType::LPAREN, "Expected '(' after function name.");
    std::vector<Parameter> params;
    if (!check(TokenType::RPAREN)) {
        do {
            Token p_tok = consume(TokenType::IDENTIFIER, "Expected parameter name.");
            DataType p_type = DataType::ANY;
            if (match(TokenType::COLON)) {
                p_type = parse_type();
            }
            params.push_back(Parameter{p_tok.lexeme, p_type});
        } while (match(TokenType::COMMA));
    }
    consume(TokenType::RPAREN, "Expected ')' after parameters.");

    DataType return_type = DataType::VOID;
    if (match(TokenType::ARROW)) {
        return_type = parse_type();
    }

    consume(TokenType::SEMICOLON, "Expected ';' after extern function declaration.");
    return arena_.make<Stmt>(FnDeclStmt{name, std::move(params), return_type, nullptr, false, 0, loc}, loc);
}

Stmt* Parser::parse_statement() {
    if (match(TokenType::KW_IF)) return parse_if_stmt();
    if (match(TokenType::KW_BRANCH)) return parse_branch3_stmt();
    if (match(TokenType::KW_MATCH)) return parse_match_stmt();
    if (match(TokenType::KW_WHILE)) return parse_while_stmt();
    if (match(TokenType::KW_RETURN)) return parse_return_stmt();
    if (match(TokenType::LBRACE)) {
        current_--;
        return parse_block_stmt();
    }
    return parse_expr_stmt();
}

Stmt* Parser::parse_if_stmt() {
    SourceLocation loc = previous().location;
    consume(TokenType::LPAREN, "Expected '(' after 'if'.");
    Expr* cond = parse_expression();
    consume(TokenType::RPAREN, "Expected ')' after if condition.");

    Stmt* then_branch = parse_statement();
    Stmt* else_branch = nullptr;
    if (match(TokenType::KW_ELSE)) {
        else_branch = parse_statement();
    }
    return arena_.make<Stmt>(IfStmt{cond, then_branch, else_branch, loc}, loc);
}

// Setun-70 3-way branching
Stmt* Parser::parse_branch3_stmt() {
    SourceLocation loc = previous().location;
    consume(TokenType::LPAREN, "Expected '(' after branch/branch3.");
    Expr* cond = parse_expression();
    consume(TokenType::RPAREN, "Expected ')' after branch condition.");

    consume(TokenType::LBRACE, "Expected '{' before 3-way branch cases.");

    Stmt* neg_branch = nullptr;
    Stmt* zero_branch = nullptr;
    Stmt* pos_branch = nullptr;

    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        match(TokenType::KW_CASE); // 'case' is optional
        int branch_tag = 0; // -1, 0, 1

        if (match(TokenType::MINUS)) {
            consume(TokenType::INT_LITERAL, "Expected '1' after '-'.");
            branch_tag = -1;
        } else if (match(TokenType::PLUS)) {
            consume(TokenType::INT_LITERAL, "Expected '1' after '+'.");
            branch_tag = 1;
        } else if (check(TokenType::INT_LITERAL)) {
            Token num = advance();
            if (num.int_val == -1) branch_tag = -1;
            else if (num.int_val == 0) branch_tag = 0;
            else if (num.int_val == 1) branch_tag = 1;
            else {
                throw CompilerException("Invalid branch case value (must be -1, 0, or 1).");
            }
        } else if (check(TokenType::TERNARY_LITERAL)) {
            Token num = advance();
            if (num.int_val == -1) branch_tag = -1;
            else if (num.int_val == 0) branch_tag = 0;
            else if (num.int_val == 1) branch_tag = 1;
            else {
                throw CompilerException("Invalid ternary branch case value (must be T, 0, or 1).");
            }
        } else if (check(TokenType::IDENTIFIER) && (peek().lexeme == "T" || peek().lexeme == "neg" || peek().lexeme == "negative")) {
            advance();
            branch_tag = -1;
        } else if (check(TokenType::IDENTIFIER) && peek().lexeme == "zero") {
            advance();
            branch_tag = 0;
        } else if (check(TokenType::IDENTIFIER) && (peek().lexeme == "pos" || peek().lexeme == "positive")) {
            advance();
            branch_tag = 1;
        } else {
            throw CompilerException("Expected -1, 0, or 1 (or negative, zero, positive) in branch block.");
        }

        // Support both ':', '->' and '=>'
        if (!match(TokenType::COLON) && !match(TokenType::ARROW) && !match(TokenType::FAT_ARROW)) {
            throw CompilerException("Expected ':', '->' or '=>' after branch case value.");
        }
        Stmt* body = parse_statement();

        if (branch_tag == -1) neg_branch = body;
        else if (branch_tag == 0) zero_branch = body;
        else if (branch_tag == 1) pos_branch = body;
    }

    consume(TokenType::RBRACE, "Expected '}' after branch block.");
    return arena_.make<Stmt>(Branch3Stmt{cond, neg_branch, zero_branch, pos_branch, loc}, loc);
}

Stmt* Parser::parse_while_stmt() {
    SourceLocation loc = previous().location;
    consume(TokenType::LPAREN, "Expected '(' after 'while'.");
    Expr* cond = parse_expression();
    consume(TokenType::RPAREN, "Expected ')' after while condition.");
    Stmt* body = parse_statement();
    return arena_.make<Stmt>(WhileStmt{cond, body, loc}, loc);
}

Stmt* Parser::parse_return_stmt() {
    SourceLocation loc = previous().location;
    Expr* val = nullptr;
    if (!check(TokenType::SEMICOLON)) {
        val = parse_expression();
    }
    consume(TokenType::SEMICOLON, "Expected ';' after return value.");
    return arena_.make<Stmt>(ReturnStmt{val, loc}, loc);
}

Stmt* Parser::parse_block_stmt() {
    SourceLocation loc = peek().location;
    consume(TokenType::LBRACE, "Expected '{' to start block.");
    std::vector<Stmt*> stmts;
    while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
        stmts.push_back(parse_declaration());
    }
    consume(TokenType::RBRACE, "Expected '}' to end block.");
    return arena_.make<Stmt>(BlockStmt{std::move(stmts), loc}, loc);
}

Stmt* Parser::parse_expr_stmt() {
    SourceLocation loc = peek().location;
    
    // Check if it's an assignment: ident = expr;
    if (check(TokenType::IDENTIFIER)) {
        size_t next_idx = current_ + 1;
        if (next_idx < tokens_.size() && tokens_[next_idx].type == TokenType::EQUAL) {
            Token name_tok = advance(); // consume identifier
            advance(); // consume '='
            Expr* val = parse_expression();
            consume(TokenType::SEMICOLON, "Expected ';' after assignment.");
            return arena_.make<Stmt>(AssignStmt{name_tok.lexeme, val, loc}, loc);
        }
    }

    Expr* expr = parse_expression();
    if (match(TokenType::EQUAL)) {
        Expr* val = parse_expression();
        consume(TokenType::SEMICOLON, "Expected ';' after assignment.");
        if (std::holds_alternative<IdentifierExpr>(expr->data)) {
            return arena_.make<Stmt>(AssignStmt{std::get<IdentifierExpr>(expr->data).name, val, loc}, loc);
        }
        if (std::holds_alternative<MemberAccessExpr>(expr->data)) {
            auto& ma = std::get<MemberAccessExpr>(expr->data);
            return arena_.make<Stmt>(MemberAssignStmt{ma.object, ma.member, val, loc}, loc);
        }
        if (std::holds_alternative<IndexExpr>(expr->data)) {
            auto& ie = std::get<IndexExpr>(expr->data);
            return arena_.make<Stmt>(IndexAssignStmt{ie.object, ie.index, val, loc}, loc);
        }
        return arena_.make<Stmt>(AssignStmt{"_tmp", val, loc}, loc);
    }

    consume(TokenType::SEMICOLON, "Expected ';' after expression statement.");
    return arena_.make<Stmt>(ExprStmt{expr, loc}, loc);
}

int Parser::get_infix_precedence(TokenType type) const {
    switch (type) {
        case TokenType::QUESTION_QUESTION: return PREC_NULL_COALESCE;
        case TokenType::SPACESHIP: return PREC_TERNARY_CMP;
        case TokenType::EQ_EQ:
        case TokenType::BANG_EQ:
        case TokenType::LESS:
        case TokenType::GREATER:
        case TokenType::LESS_EQ:
        case TokenType::GREATER_EQ: return PREC_COMPARISON;
        case TokenType::PLUS:
        case TokenType::MINUS: return PREC_TERM;
        case TokenType::STAR:
        case TokenType::SLASH:
        case TokenType::AT: return PREC_FACTOR;
        case TokenType::KW_MIN:
        case TokenType::KW_MAX: return PREC_KLEENE;
        case TokenType::DOT:
        case TokenType::QUESTION_DOT:
        case TokenType::LPAREN:
        case TokenType::LBRACKET: return PREC_POSTFIX;
        default: return PREC_NONE;
    }
}

Expr* Parser::parse_expression(int precedence) {
    Expr* left = parse_prefix();

    while (precedence < get_infix_precedence(peek().type)) {
        left = parse_infix(left);
    }

    return left;
}

Expr* Parser::parse_prefix() {
    Token tok = advance();
    SourceLocation loc = tok.location;

    switch (tok.type) {
        case TokenType::INT_LITERAL:
            return arena_.make<Expr>(IntLiteralExpr{tok.int_val, loc}, loc);
        case TokenType::FLOAT_LITERAL:
            return arena_.make<Expr>(FloatLiteralExpr{tok.float_val, loc}, loc);
        case TokenType::STRING_LITERAL:
            return arena_.make<Expr>(StringLiteralExpr{tok.string_val, loc}, loc);
        case TokenType::FSTRING_LITERAL:
            return arena_.make<Expr>(FStringExpr{tok.string_val, {}, loc}, loc);
        case TokenType::TERNARY_LITERAL:
            return arena_.make<Expr>(TryteLiteralExpr{tok.tryte_val, loc}, loc);
        case TokenType::KW_TRUE:
            return arena_.make<Expr>(BoolLiteralExpr{true, loc}, loc);
        case TokenType::KW_FALSE:
            return arena_.make<Expr>(BoolLiteralExpr{false, loc}, loc);
        case TokenType::IDENTIFIER:
            return arena_.make<Expr>(IdentifierExpr{tok.lexeme, loc}, loc);

        case TokenType::KW_COMPTIME: {
            Expr* sub = parse_expression(PREC_UNARY);
            return arena_.make<Expr>(ComptimeExpr{sub, loc}, loc);
        }

        // Built-ins callable as expressions
        case TokenType::KW_PRINT:
        case TokenType::KW_PRINTLN:
        case TokenType::KW_TRACE:
        case TokenType::KW_ASSERT_EQ:
        case TokenType::KW_ENCODE_TAFPU:
        case TokenType::KW_TO_DOUBLE: {
            std::string callee_name = tok.lexeme;
            consume(TokenType::LPAREN, "Expected '(' after builtin function call.");
            std::vector<Expr*> args;
            if (!check(TokenType::RPAREN)) {
                do {
                    args.push_back(parse_expression());
                } while (match(TokenType::COMMA));
            }
            consume(TokenType::RPAREN, "Expected ')' after call arguments.");
            return arena_.make<Expr>(CallExpr{callee_name, std::move(args), loc}, loc);
        }

        // Parentheses: ( expr )
        case TokenType::LPAREN: {
            Expr* expr = parse_expression();
            consume(TokenType::RPAREN, "Expected ')' after expression.");
            return expr;
        }

        // Array literal [elem1, elem2, ...] or TAFPU algebraic literal construction [A, B, S]
        case TokenType::LBRACKET: {
            if (check(TokenType::RBRACKET)) {
                advance(); // consume ']'
                return arena_.make<Expr>(ArrayLiteralExpr{{}, loc}, loc);
            }
            std::vector<Expr*> elements;
            do {
                elements.push_back(parse_expression());
            } while (match(TokenType::COMMA));
            consume(TokenType::RBRACKET, "Expected ']' after bracket expression.");

            if (elements.size() == 3) {
                bool has_complex = false;
                for (Expr* el : elements) {
                    if (std::holds_alternative<StringLiteralExpr>(el->data) ||
                        std::holds_alternative<BoolLiteralExpr>(el->data) ||
                        std::holds_alternative<ArrayLiteralExpr>(el->data)) {
                        has_complex = true;
                        break;
                    }
                }
                if (!has_complex) {
                    return arena_.make<Expr>(TafpuConstructExpr{elements[0], elements[1], elements[2], loc}, loc);
                }
            } else if (elements.size() == 2) {
                if (std::holds_alternative<IntLiteralExpr>(elements[0]->data) &&
                    std::holds_alternative<IntLiteralExpr>(elements[1]->data)) {
                    Expr* s = arena_.make<Expr>(IntLiteralExpr{0, loc}, loc);
                    return arena_.make<Expr>(TafpuConstructExpr{elements[0], elements[1], s, loc}, loc);
                }
            }

            return arena_.make<Expr>(ArrayLiteralExpr{std::move(elements), loc}, loc);
        }

        // Unary minus: -expr
        case TokenType::MINUS: {
            Expr* operand = parse_expression(PREC_UNARY);
            return arena_.make<Expr>(UnaryExpr{UnaryOp::NEG, operand, loc}, loc);
        }

        // Ternary negation: ~expr
        case TokenType::TILDE: {
            Expr* operand = parse_expression(PREC_UNARY);
            return arena_.make<Expr>(UnaryExpr{UnaryOp::TILDE, operand, loc}, loc);
        }

        // Logical not: not expr
        case TokenType::KW_NOT: {
            Expr* operand = parse_expression(PREC_UNARY);
            return arena_.make<Expr>(UnaryExpr{UnaryOp::NOT, operand, loc}, loc);
        }

        default: {
            std::ostringstream oss;
            oss << "[Parser Error] Line " << loc.line << ":" << loc.column
                << " - Unexpected token in prefix position: '" << tok.lexeme << "' [" << token_type_name(tok.type) << "]";
            throw CompilerException(oss.str());
        }
    }
}

Expr* Parser::parse_infix(Expr* left) {
    Token op_tok = advance();
    SourceLocation loc = op_tok.location;

    // Member access or method call: left.member or left.method(...) or left?.member
    if (op_tok.type == TokenType::DOT || op_tok.type == TokenType::QUESTION_DOT) {
        bool is_safe = (op_tok.type == TokenType::QUESTION_DOT);
        Token member_tok = consume(TokenType::IDENTIFIER, "Expected member name after '.' or '?.'");
        if (check(TokenType::LPAREN)) {
            consume(TokenType::LPAREN, "Expected '(' in method call.");
            std::vector<Expr*> args;
            if (!check(TokenType::RPAREN)) {
                do {
                    args.push_back(parse_expression());
                } while (match(TokenType::COMMA));
            }
            consume(TokenType::RPAREN, "Expected ')' after method call arguments.");
            return arena_.make<Expr>(MethodCallExpr{left, member_tok.lexeme, std::move(args), is_safe, loc}, loc);
        }
        return arena_.make<Expr>(MemberAccessExpr{left, member_tok.lexeme, is_safe, loc}, loc);
    }

    // Index access: left[index]
    if (op_tok.type == TokenType::LBRACKET) {
        Expr* index_expr = parse_expression();
        consume(TokenType::RBRACKET, "Expected ']' after index expression.");
        return arena_.make<Expr>(IndexExpr{left, index_expr, loc}, loc);
    }

    // Function call: ident(arg1, arg2, ...)
    if (op_tok.type == TokenType::LPAREN) {
        if (!std::holds_alternative<IdentifierExpr>(left->data)) {
            throw CompilerException("Expected identifier before '(' in function call.");
        }
        std::string callee = std::get<IdentifierExpr>(left->data).name;
        std::vector<Expr*> args;
        if (!check(TokenType::RPAREN)) {
            do {
                args.push_back(parse_expression());
            } while (match(TokenType::COMMA));
        }
        consume(TokenType::RPAREN, "Expected ')' after call arguments.");
        return arena_.make<Expr>(CallExpr{callee, std::move(args), loc}, loc);
    }

    int prec = get_infix_precedence(op_tok.type);
    Expr* right = parse_expression(prec);

    BinaryOp b_op;
    switch (op_tok.type) {
        case TokenType::PLUS: b_op = BinaryOp::ADD; break;
        case TokenType::MINUS: b_op = BinaryOp::SUB; break;
        case TokenType::STAR: b_op = BinaryOp::MUL; break;
        case TokenType::SLASH: b_op = BinaryOp::DIV; break;
        case TokenType::AT: b_op = BinaryOp::MATMUL; break;
        case TokenType::QUESTION_QUESTION: b_op = BinaryOp::NULL_COALESCE; break;
        case TokenType::EQ_EQ: b_op = BinaryOp::EQ; break;
        case TokenType::BANG_EQ: b_op = BinaryOp::NEQ; break;
        case TokenType::LESS: b_op = BinaryOp::LT; break;
        case TokenType::LESS_EQ: b_op = BinaryOp::LE; break;
        case TokenType::GREATER: b_op = BinaryOp::GT; break;
        case TokenType::GREATER_EQ: b_op = BinaryOp::GE; break;
        case TokenType::SPACESHIP: b_op = BinaryOp::SPACESHIP; break;
        case TokenType::KW_MIN: b_op = BinaryOp::MIN; break;
        case TokenType::KW_MAX: b_op = BinaryOp::MAX; break;
        default:
            throw CompilerException("Invalid binary operator in infix parsing.");
    }

    return arena_.make<Expr>(BinaryExpr{b_op, left, right, loc}, loc);
}

} // namespace setun
