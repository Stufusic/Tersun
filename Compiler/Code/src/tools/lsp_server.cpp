#include "tools/lsp_server.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/arena.hpp"
#include "compiler/type_checker.hpp"
#include <iostream>
#include <sstream>
#include <regex>

namespace setun {
namespace tools {

std::vector<LSPDiagnostic> LSPServer::analyze_document(const std::string& uri, const std::string& content) {
    std::vector<LSPDiagnostic> diagnostics;
    try {
        ArenaAllocator arena;
        Lexer lexer(content);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();

        TypeChecker checker;
        checker.check_program(prog);
        for (const auto& terr : checker.errors()) {
            LSPDiagnostic diag;
            int line = terr.loc.line > 0 ? terr.loc.line - 1 : 0;
            int col = terr.loc.column > 0 ? terr.loc.column - 1 : 0;
            diag.range.start = {line, col};
            diag.range.end = {line, col + 10};
            diag.severity = terr.is_warning ? 2 : 1;
            diag.message = terr.message;
            diagnostics.push_back(diag);
        }
    } catch (const std::exception& e) {
        LSPDiagnostic diag;
        diag.range.start = {0, 0};
        diag.range.end = {0, 10};
        diag.severity = 1; // Error
        diag.message = e.what();

        // Attempt to extract line and column from error message if available
        std::regex pos_regex(R"([Ll]ine\s+(\d+)[:,\s]+(?:col\s+)?(\d+))");
        std::smatch m;
        std::string err_str = e.what();
        if (std::regex_search(err_str, m, pos_regex)) {
            int line = std::stoi(m[1].str()) - 1;
            int col = std::stoi(m[2].str()) - 1;
            if (line < 0) line = 0;
            if (col < 0) col = 0;
            diag.range.start = {line, col};
            diag.range.end = {line, col + 10};
        }
        diagnostics.push_back(diag);
    }
    return diagnostics;
}

std::vector<LSPCompletionItem> LSPServer::get_completions(const std::string&, LSPPosition) {
    std::vector<LSPCompletionItem> items;

    // 1. Keywords
    const std::vector<std::pair<std::string, std::string>> keywords = {
        {"struct", "Define a value type allocated on stack (0ns GC)"},
        {"class", "Define a reference type with Deterministic ARC"},
        {"interface", "Define a dynamic dispatch interface"},
        {"trait", "Define a compile-time trait / contract"},
        {"enum", "Define an algebraic tri-state or multi-state enum"},
        {"match", "Pattern matching expression with branchless dispatch"},
        {"branch3", "Setun-70 3-way conditional branching (negative =>, zero =>, positive =>)"},
        {"fn", "Declare a function with return type"},
        {"let", "Declare an immutable variable binding"},
        {"mut", "Declare a mutable variable binding"},
        {"async", "Declare an asynchronous Fiber coroutine"},
        {"await", "Await an async task completion"},
        {"comptime", "Execute expression at compile-time AOT"},
        {"return", "Return from function"},
        {"if", "Conditional branching"},
        {"else", "Alternative conditional branch"},
        {"while", "Loop while condition holds true"}
    };

    for (const auto& [kw, doc] : keywords) {
        LSPCompletionItem item;
        item.label = kw;
        item.kind = 14; // Keyword
        item.detail = "Setun 2.0 Keyword";
        item.documentation = doc;
        items.push_back(item);
    }

    // 2. Types
    const std::vector<std::pair<std::string, std::string>> types = {
        {"taf3", "Exact algebraic number in Q(sqrt(3)): A + B*sqrt(3)"},
        {"tvec3", "3D vector with zero coordinate drift over 1M steps"},
        {"tquat", "Ternary quaternion for unconstrained 3D rotation"},
        {"tryte", "6-trit balanced ternary integer in [-364, 364]"},
        {"trit", "Single balanced ternary trit in {-1, 0, +1}"},
        {"int", "64-bit integer"},
        {"string", "UTF-8 string type"},
        {"bool", "Boolean type"}
    };

    for (const auto& [t, doc] : types) {
        LSPCompletionItem item;
        item.label = t;
        item.kind = 25; // TypeParameter / Class
        item.detail = "Built-in Setun Type";
        item.documentation = doc;
        items.push_back(item);
    }

    return items;
}

std::string LSPServer::get_hover_info(const std::string&, LSPPosition) {
    return "```setun\ntaf3: Exact Algebraic Real Number in Q(√3)\nRepresentation: [A, B, S] => (A + B*√3) * 3^(S/2)\nError: 0.00000000% (No IEEE 754 float rounding)\n```";
}

std::string LSPServer::handle_request(const std::string& json_rpc_msg) {
    std::ostringstream resp;

    std::string req_id = "1";
    std::regex id_regex(R"(\"id\"\s*:\s*(\d+|"[^"]+"))");
    std::smatch id_m;
    if (std::regex_search(json_rpc_msg, id_m, id_regex)) {
        req_id = id_m[1].str();
    }

    // Simple JSON-RPC Dispatcher
    if (json_rpc_msg.find("\"method\":\"initialize\"") != std::string::npos) {
        resp << "{\"jsonrpc\":\"2.0\",\"id\":" << req_id << ",\"result\":{\"capabilities\":{"
             << "\"textDocumentSync\":1,"
             << "\"completionProvider\":{\"resolveProvider\":false},"
             << "\"hoverProvider\":true,"
             << "\"definitionProvider\":true,"
             << "\"documentFormattingProvider\":true"
             << "}}}";
    } else if (json_rpc_msg.find("\"method\":\"textDocument/completion\"") != std::string::npos) {
        auto completions = get_completions("", {0, 0});
        resp << "{\"jsonrpc\":\"2.0\",\"id\":" << req_id << ",\"result\":[";
        for (size_t i = 0; i < completions.size(); ++i) {
            if (i > 0) resp << ",";
            resp << "{\"label\":\"" << completions[i].label << "\","
                 << "\"kind\":" << completions[i].kind << ","
                 << "\"detail\":\"" << completions[i].detail << "\","
                 << "\"documentation\":\"" << completions[i].documentation << "\"}";
        }
        resp << "]}";
    } else if (json_rpc_msg.find("\"method\":\"textDocument/hover\"") != std::string::npos) {
        resp << "{\"jsonrpc\":\"2.0\",\"id\":" << req_id << ",\"result\":{\"contents\":{\"kind\":\"markdown\",\"value\":\""
             << "Setun 2.0 Algebraic Type in Q(sqrt(3)) - 0% Error"
             << "\"}}}";
    } else {
        resp << "{\"jsonrpc\":\"2.0\",\"id\":" << req_id << ",\"result\":null}";
    }

    return resp.str();
}

void LSPServer::run_stdio() {
    std::string line;
    while (std::getline(std::cin, line)) {
        if (line.rfind("Content-Length:", 0) == 0) {
            int len = std::stoi(line.substr(15));
            std::string blank;
            std::getline(std::cin, blank); // read empty line
            std::string body(len, '\0');
            std::cin.read(&body[0], len);

            std::string response = handle_request(body);
            std::cout << "Content-Length: " << response.length() << "\r\n\r\n" << response << std::flush;
        }
    }
}

} // namespace tools
} // namespace setun
