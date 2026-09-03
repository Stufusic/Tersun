#include "tools/formatter.hpp"
#include <sstream>
#include <fstream>
#include <iostream>
#include <vector>
#include <regex>

namespace setun {
namespace tools {

std::string SetunFormatter::format_source(const std::string& source_code) {
    std::istringstream in(source_code);
    std::ostringstream out;
    std::string line;
    int indent_level = 0;

    while (std::getline(in, line)) {
        // Trim leading and trailing whitespace
        size_t first = line.find_first_not_of(" \t\r\n");
        if (first == std::string::npos) {
            out << "\n";
            continue;
        }
        size_t last = line.find_last_not_of(" \t\r\n");
        std::string trimmed = line.substr(first, (last - first + 1));

        // Adjust indent for closing brace on current line
        int print_indent = indent_level;
        if (!trimmed.empty() && (trimmed[0] == '}' || trimmed[0] == ')')) {
            print_indent = std::max(0, indent_level - 1);
        }

        // Output indentation (4 spaces per level)
        for (int i = 0; i < print_indent; ++i) {
            out << "    ";
        }

        // Standardize spacing around binary operators
        std::string formatted_line = trimmed;
        // Ensure space around '=>'
        formatted_line = std::regex_replace(formatted_line, std::regex(R"(\s*=>\s*)"), " => ");
        // Ensure space around '->'
        formatted_line = std::regex_replace(formatted_line, std::regex(R"(\s*->\s*)"), " -> ");

        out << formatted_line << "\n";

        // Count open and close braces outside of string literals and comments
        int open_count = 0;
        int close_count = 0;
        bool in_str = false;
        for (size_t idx = 0; idx < trimmed.size(); ++idx) {
            char c = trimmed[idx];
            if (c == '"' && (idx == 0 || trimmed[idx - 1] != '\\')) {
                in_str = !in_str;
            }
            if (in_str) continue;
            if (c == '/' && idx + 1 < trimmed.size() && trimmed[idx + 1] == '/') {
                break; // Line comment: skip rest of line
            }
            if (c == '{' || c == '(') open_count++;
            else if (c == '}' || c == ')') close_count++;
        }
        indent_level += (open_count - close_count);
        if (indent_level < 0) indent_level = 0;
    }

    return out.str();
}

bool SetunFormatter::format_file(const std::string& file_path, bool in_place) {
    std::ifstream in(file_path);
    if (!in.is_open()) {
        std::cerr << "Error: Unable to open file to format: " << file_path << "\n";
        return false;
    }
    std::string content((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());
    in.close();

    std::string formatted = format_source(content);

    if (in_place) {
        std::ofstream out(file_path);
        if (!out.is_open()) {
            std::cerr << "Error: Unable to overwrite formatted file: " << file_path << "\n";
            return false;
        }
        out << formatted;
        out.close();
        std::cout << "[Formatter] Successfully formatted " << file_path << " in-place.\n";
    } else {
        std::cout << formatted;
    }
    return true;
}

} // namespace tools
} // namespace setun
