#pragma once

#include <string>
#include <vector>
#include <unordered_map>
#include <sstream>

namespace setun {
namespace tools {

struct LSPPosition {
    int line{0};
    int character{0};
};

struct LSPRange {
    LSPPosition start;
    LSPPosition end;
};

struct LSPDiagnostic {
    LSPRange range;
    int severity{1}; // 1 = Error, 2 = Warning, 3 = Info
    std::string message;
};

struct LSPCompletionItem {
    std::string label;
    int kind{1}; // 1 = Text, 3 = Function, 7 = Class, 14 = Keyword, 25 = TypeParameter
    std::string detail;
    std::string documentation;
};

class LSPServer {
public:
    LSPServer() = default;

    // Handle incoming JSON-RPC raw request string and return JSON-RPC response
    std::string handle_request(const std::string& json_rpc_msg);

    // Diagnostics generator for a Setun document
    std::vector<LSPDiagnostic> analyze_document(const std::string& uri, const std::string& content);

    // Auto-completion generator at position
    std::vector<LSPCompletionItem> get_completions(const std::string& uri, LSPPosition pos);

    // Hover information generator
    std::string get_hover_info(const std::string& uri, LSPPosition pos);

    // Run LSP Server on standard input/output
    void run_stdio();

private:
    std::unordered_map<std::string, std::string> open_documents_;
};

} // namespace tools
} // namespace setun
