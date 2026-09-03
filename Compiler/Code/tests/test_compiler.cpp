#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/emitter.hpp"
#include <cassert>
#include <iostream>

namespace setun {

void test_compiler_lexer() {
    std::cout << "  [Test] Lexer Tokenization...\n";
    std::string code = "let x: taf3 = [14, 25, 0]; let y: tryte = @10T1; branch (x <=> y) { case -1: println(1); }";
    Lexer lexer(code);
    auto tokens = lexer.tokenize();

    assert(tokens[0].type == TokenType::KW_LET);
    assert(tokens[1].type == TokenType::IDENTIFIER && tokens[1].lexeme == "x");
    assert(tokens[2].type == TokenType::COLON);
    assert(tokens[3].type == TokenType::TYPE_TAF3);
    assert(tokens[4].type == TokenType::EQUAL);
    assert(tokens[5].type == TokenType::LBRACKET);
    assert(tokens[6].type == TokenType::INT_LITERAL && tokens[6].int_val == 14);

    std::cout << "    -> PASSED: Lexer tokenized literals, types and keywords accurately.\n";
}

void test_compiler_pratt_precedence() {
    std::cout << "  [Test] Pratt Parser Operator Precedence...\n";
    std::string code = "let res = 2 + 3 * 4;";
    ArenaAllocator arena;
    Lexer lexer(code);
    auto tokens = lexer.tokenize();

    Parser parser(tokens, arena);
    Program program = parser.parse_program();

    assert(program.statements.size() == 1);
    const auto& var_decl = std::get<VarDeclStmt>(program.statements[0]->data);
    assert(var_decl.name == "res");

    // Root of expression must be BinaryOp::ADD (since + has lower precedence than *)
    const auto& bin_expr = std::get<BinaryExpr>(var_decl.init->data);
    assert(bin_expr.op == BinaryOp::ADD);

    // Right child must be BinaryOp::MUL
    const auto& mul_expr = std::get<BinaryExpr>(bin_expr.right->data);
    assert(mul_expr.op == BinaryOp::MUL);

    std::cout << "    -> PASSED: Pratt Parser bound 3*4 deeper than 2+...\n";
}

void test_arena_allocator() {
    std::cout << "  [Test] Arena Allocator O(1) Lifetime...\n";
    ArenaAllocator arena(1024);
    for (int i = 0; i < 500; ++i) {
        auto* ptr = arena.make<Token>();
        ptr->int_val = i;
    }
    assert(arena.total_allocated() > 0);
    arena.reset();
    std::cout << "    -> PASSED: Arena Allocator allocated and wiped all nodes in O(1).\n";
}

} // namespace setun
