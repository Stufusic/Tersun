#include "tools/bindgen.hpp"
#include <sstream>
#include <fstream>
#include <iostream>
#include <regex>

namespace setun {
namespace tools {

static std::string map_c_type_to_setun(const std::string& c_type) {
    std::string t = c_type;
    // Trim whitespace
    t.erase(0, t.find_first_not_of(" \t\n\r"));
    t.erase(t.find_last_not_of(" \t\n\r") + 1);

    if (t == "void") return "void";
    if (t == "int" || t == "int32_t" || t == "long") return "int";
    if (t == "int64_t" || t == "long long") return "int";
    if (t == "float" || t == "double") return "taf3";
    if (t == "bool" || t == "_Bool") return "bool";
    if (t == "const char*" || t == "char*") return "string";
    return t; // Custom struct type or opaque pointer
}

CBindgenResult CBindgen::parse_header_and_generate(const std::string& header_content) {
    CBindgenResult res;
    std::istringstream stream(header_content);
    std::string line;

    std::ostringstream setun_out;
    setun_out << "// Auto-generated Setun 2.0 FFI Wrapper via 'setunc bindgen'\n";
    setun_out << "// DO NOT EDIT MANUALLY\n\n";

    // Match structs: typedef struct { ... } Name; or struct Name { ... };
    std::regex struct_regex(R"(struct\s+(\w+)\s*\{([^}]+)\};)");
    std::smatch match;
    std::string content_copy = header_content;

    auto struct_begin = std::sregex_iterator(content_copy.begin(), content_copy.end(), struct_regex);
    auto struct_end = std::sregex_iterator();

    for (auto it = struct_begin; it != struct_end; ++it) {
        std::smatch m = *it;
        CStructDecl s_decl;
        s_decl.name = m[1].str();
        std::string body = m[2].str();

        setun_out << "struct " << s_decl.name << " {\n";

        std::istringstream body_stream(body);
        std::string field_line;
        while (std::getline(body_stream, field_line, ';')) {
            std::smatch f_match;
            std::regex field_regex(R"((\w+[\s*]+)(\w+))");
            if (std::regex_search(field_line, f_match, field_regex)) {
                std::string f_type = map_c_type_to_setun(f_match[1].str());
                std::string f_name = f_match[2].str();
                s_decl.fields.push_back({f_type, f_name});
                setun_out << "    " << f_name << ": " << f_type << ",\n";
            }
        }
        setun_out << "}\n\n";
        res.structs.push_back(s_decl);
    }

    // Match function declarations: ReturnType func_name(param1, param2);
    std::regex fn_regex(R"((\w+[\s*]+)(\w+)\s*\(([^)]*)\)\s*;)");
    auto fn_begin = std::sregex_iterator(content_copy.begin(), content_copy.end(), fn_regex);
    auto fn_end = std::sregex_iterator();

    for (auto it = fn_begin; it != fn_end; ++it) {
        std::smatch m = *it;
        std::string ret_type = map_c_type_to_setun(m[1].str());
        std::string fn_name = m[2].str();
        std::string params_str = m[3].str();

        CFunctionDecl fn_decl;
        fn_decl.return_type = ret_type;
        fn_decl.name = fn_name;

        setun_out << "extern \"C\" fn " << fn_name << "(";

        std::istringstream param_stream(params_str);
        std::string param_part;
        bool first = true;
        while (std::getline(param_stream, param_part, ',')) {
            std::string s = param_part;
            s.erase(0, s.find_first_not_of(" \t\n\r"));
            s.erase(s.find_last_not_of(" \t\n\r") + 1);
            if (s.empty() || s == "void") continue;

            size_t last_space = s.find_last_of(" \t*");
            if (last_space != std::string::npos) {
                std::string p_type, p_name;
                if (s[last_space] == '*') {
                    p_type = s.substr(0, last_space + 1);
                    p_name = s.substr(last_space + 1);
                } else {
                    p_type = s.substr(0, last_space);
                    p_name = s.substr(last_space + 1);
                }
                p_type = map_c_type_to_setun(p_type);
                p_name.erase(0, p_name.find_first_not_of(" \t\n\r"));
                p_name.erase(p_name.find_last_not_of(" \t\n\r") + 1);

                if (!p_name.empty() && !p_type.empty()) {
                    fn_decl.params.push_back({p_type, p_name});
                    if (!first) setun_out << ", ";
                    setun_out << p_name << ": " << p_type;
                    first = false;
                }
            }
        }
        setun_out << ") -> " << ret_type << ";\n";
        res.functions.push_back(fn_decl);
    }

    res.setun_source = setun_out.str();
    return res;
}

bool CBindgen::generate_file(const std::string& header_path, const std::string& output_path) {
    std::ifstream in(header_path);
    if (!in.is_open()) {
        std::cerr << "Error: Unable to open C header: " << header_path << "\n";
        return false;
    }
    std::string content((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());
    in.close();

    CBindgenResult res = parse_header_and_generate(content);

    std::ofstream out(output_path);
    if (!out.is_open()) {
        std::cerr << "Error: Unable to write output: " << output_path << "\n";
        return false;
    }
    out << res.setun_source;
    out.close();

    std::cout << "[Bindgen] Successfully generated " << res.functions.size() 
              << " functions and " << res.structs.size() << " structs to " << output_path << "\n";
    return true;
}

} // namespace tools
} // namespace setun
