#pragma once

#include <string>
#include <vector>

namespace setun {
namespace tools {

struct CFunctionDecl {
    std::string return_type;
    std::string name;
    std::vector<std::pair<std::string, std::string>> params; // <type, name>
};

struct CStructDecl {
    std::string name;
    std::vector<std::pair<std::string, std::string>> fields; // <type, name>
};

struct CBindgenResult {
    std::vector<CStructDecl> structs;
    std::vector<CFunctionDecl> functions;
    std::string setun_source;
    std::string cpp_wrapper_source;
};

class CBindgen {
public:
    static CBindgenResult parse_header_and_generate(const std::string& header_content);
    static bool generate_file(const std::string& header_path, const std::string& output_path);
};

} // namespace tools
} // namespace setun
