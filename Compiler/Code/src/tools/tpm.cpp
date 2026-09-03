#include "tools/tpm.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/arena.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"

#include <iostream>
#include <fstream>
#include <sstream>
#include <filesystem>

namespace setun {

PackageManifest PackageManifest::parse_toml(const std::string& content) {
    PackageManifest manifest;
    std::istringstream stream(content);
    std::string line;

    while (std::getline(stream, line)) {
        // Simple key = "value" parser
        auto eq_pos = line.find('=');
        if (eq_pos == std::string::npos) continue;

        std::string key = line.substr(0, eq_pos);
        std::string val = line.substr(eq_pos + 1);

        // Trim whitespace and quotes
        auto trim = [](std::string& s) {
            auto is_removable = [](char c) {
                return c == ' ' || c == '\t' || c == '\r' || c == '\n' || c == '"' || c == '\'';
            };
            while (!s.empty() && is_removable(s.front())) s.erase(s.begin());
            while (!s.empty() && is_removable(s.back())) s.pop_back();
        };
        trim(key);
        trim(val);

        if (key == "name") manifest.name = val;
        else if (key == "version") manifest.version = val;
        else if (key == "author") manifest.author = val;
        else if (key == "main") manifest.main_file = val;
        else if (key == "output") manifest.output_binary = val;
    }
    return manifest;
}

std::string PackageManifest::generate_toml() const {
    std::ostringstream oss;
    oss << "[package]\n";
    oss << "name = \"" << name << "\"\n";
    oss << "version = \"" << version << "\"\n";
    oss << "author = \"" << author << "\"\n";
    oss << "main = \"" << main_file << "\"\n";
    oss << "output = \"" << output_binary << "\"\n\n";
    oss << "[dependencies]\n";
    oss << "# stdtaf = \"1.0.0\"\n";
    return oss.str();
}

int TernaryPackageManager::cmd_init(const std::string& proj_name) {
    PackageManifest manifest;
    manifest.name = proj_name.empty() ? "my_ternary_app" : proj_name;
    manifest.main_file = "src/main.taf";
    manifest.output_binary = "bin/" + manifest.name + ".tbc";

    std::error_code ec;
    std::filesystem::create_directories("src", ec);
    std::filesystem::create_directories("bin", ec);

    // Create a template src/main.taf if it doesn't exist
    if (!std::filesystem::exists("src/main.taf")) {
        std::ofstream main_f("src/main.taf");
        if (main_f.is_open()) {
            main_f << "// " << manifest.name << " - Entry Point\n"
                   << "fn main() -> int {\n"
                   << "    println(\"Hello from Setun 2.0!\");\n"
                   << "    return 0;\n"
                   << "}\n";
        }
    }

    std::ofstream toml_file("setun.toml");
    if (!toml_file.is_open()) {
        std::cerr << "[TPM Error]: Failed to create setun.toml\n";
        return 1;
    }
    toml_file << manifest.generate_toml();
    std::cout << "[TPM] Created setun.toml and src/main.taf for package '" << manifest.name << "'\n";
    return 0;
}

int TernaryPackageManager::cmd_build(const std::string& manifest_path) {
    std::ifstream file(manifest_path);
    if (!file.is_open()) {
        std::cerr << "[TPM Error]: Cannot find manifest " << manifest_path << "\n";
        return 1;
    }
    std::stringstream buf;
    buf << file.rdbuf();
    PackageManifest manifest = PackageManifest::parse_toml(buf.str());

    std::cout << "[TPM] Target main file: '" << manifest.main_file << "'\n";

    std::ifstream src_file(manifest.main_file);
    if (!src_file.is_open()) {
        std::cerr << "[TPM Error]: Cannot find main source file: " << manifest.main_file << "\n";
        return 1;
    }
    std::stringstream src_buf;
    src_buf << src_file.rdbuf();

    try {
        std::string src_content = src_buf.str();
        ArenaAllocator arena;
        Lexer lexer(src_content);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program prog = parser.parse_program();
        BytecodeEmitter emitter;
        Chunk chunk = emitter.compile(prog);

        // Ensure output parent directory exists
        auto out_dir = std::filesystem::path(manifest.output_binary).parent_path();
        if (!out_dir.empty()) {
            std::error_code ec;
            std::filesystem::create_directories(out_dir, ec);
        }

        if (!chunk.save_to_file(manifest.output_binary)) {
            std::cerr << "[TPM Error]: Failed to save binary to " << manifest.output_binary << "\n";
            return 1;
        }

        std::cout << "[TPM] Built package '" << manifest.name << "' v" << manifest.version
                  << " -> " << manifest.output_binary << " (" << chunk.code.size() << " bytes)\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[TPM Build Failed]: " << e.what() << "\n";
        return 1;
    }
}

int TernaryPackageManager::cmd_test(const std::string& manifest_path) {
    std::cout << "[TPM] Building package for testing: " << manifest_path << "...\n";
    int res = cmd_build(manifest_path);
    if (res != 0) return res;

    std::ifstream file(manifest_path);
    if (!file.is_open()) return 1;
    std::stringstream buf;
    buf << file.rdbuf();
    PackageManifest manifest = PackageManifest::parse_toml(buf.str());

    std::cout << "[TPM] Executing " << manifest.output_binary << " in Setun VM...\n";
    Chunk chunk;
    if (Chunk::load_from_file(manifest.output_binary, chunk)) {
        VM vm;
        vm.run(chunk);
        std::cout << "[TPM] Test execution finished successfully.\n";
        return 0;
    }
    return 1;
}

} // namespace setun
