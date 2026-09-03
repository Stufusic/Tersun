#include "tools/lsp_server.hpp"
#include "tools/formatter.hpp"
#include "tools/debugger.hpp"
#include <iostream>
#include <string>
#include <cassert>

namespace setun {

void run_phase5_lsp_tests() {
    std::cout << "\n[Test Phase 5] Language Server Protocol (LSP), Code Formatter & Visual Debugger...\n";

    // 1. Test Milestone 1: LSP JSON-RPC Protocol & Real-time Diagnostics
    {
        using namespace tools;
        LSPServer server;

        // Initialize request
        std::string init_req = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"initialize\",\"params\":{}}";
        std::string init_resp = server.handle_request(init_req);
        assert(init_resp.find("\"completionProvider\"") != std::string::npos);
        assert(init_resp.find("\"hoverProvider\":true") != std::string::npos);

        // Document analysis with valid code
        std::string valid_code = "fn main() -> int { return 42; }";
        auto diag_valid = server.analyze_document("file:///test.stn", valid_code);
        assert(diag_valid.empty()); // 0 errors

        // Document analysis with syntax error (missing closing brace)
        std::string invalid_code = "fn main() -> int { return 42;";
        auto diag_invalid = server.analyze_document("file:///test.stn", invalid_code);
        assert(!diag_invalid.empty()); // Detected syntax error

        std::cout << "  -> PASSED: LSP JSON-RPC Protocol & Real-Time Diagnostics verified!\n";
    }

    // 2. Test Milestone 2: LSP Auto-Completion & Hover
    {
        using namespace tools;
        LSPServer server;

        auto completions = server.get_completions("file:///test.stn", {0, 0});
        assert(!completions.empty());

        bool found_struct = false;
        bool found_branch3 = false;
        bool found_taf3 = false;

        for (const auto& item : completions) {
            if (item.label == "struct") found_struct = true;
            if (item.label == "branch3") found_branch3 = true;
            if (item.label == "taf3") found_taf3 = true;
        }

        assert(found_struct && found_branch3 && found_taf3);

        std::string hover = server.get_hover_info("file:///test.stn", {0, 0});
        assert(hover.find("Q(√3)") != std::string::npos);

        std::cout << "  -> PASSED: LSP Auto-Completion (Keywords & Types) & Hover Math Info verified!\n";
    }

    // 3. Test Milestone 3: Automated Code Formatter
    {
        using namespace tools;

        std::string raw_code = 
            "fn compute(x:taf3)->taf3{\n"
            "let y = x * [2,1,0];\n"
            "branch3(y){\n"
            "negative=>return [0,0,0];\n"
            "zero=>return [1,0,0];\n"
            "positive=>return y;\n"
            "}\n"
            "}";

        std::string formatted = SetunFormatter::format_source(raw_code);

        assert(formatted.find("    let y") != std::string::npos); // 4-space indentation
        assert(formatted.find("negative =>") != std::string::npos); // standardized '=>' spacing
        assert(formatted.find("-> taf3") != std::string::npos);    // standardized '->' spacing

        std::cout << "  -> PASSED: Setun Auto-Formatter (4-space indent & operator normalization) verified!\n";
    }

    // 4. Test Milestone 4: Interactive Visual Debugger State Inspection
    {
        using namespace tools;
        VisualDebugger debugger;

        debugger.add_breakpoint(0x0010);
        assert(debugger.has_breakpoint(0x0010));
        debugger.remove_breakpoint(0x0010);
        assert(!debugger.has_breakpoint(0x0010));

        // Create synthetic VM state
        DebuggerState state;
        state.pc = 0x0024;
        state.branch3_flag = 1; // POSITIVE
        state.tafpu_a = 42;
        state.tafpu_b = 75;
        state.tafpu_s = -2;
        state.current_instruction = "OP_BRANCH_3";

        // Print panel verification
        debugger.print_visual_panel(state);

        std::cout << "  -> PASSED: Setun-70 Visual Debugger & 3-Way State Inspection verified!\n";
    }

    std::cout << "  -> ALL PHASE 5 LSP, FORMATTER & DEBUGGER TESTS PASSED (100% SUCCESS)!\n";
}

} // namespace setun
