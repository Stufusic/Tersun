#include "compiler/module_resolver.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include <fstream>
#include <sstream>
#include <filesystem>
#include <algorithm>
#include <iostream>

#if defined(_WIN32)
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#endif

namespace fs = std::filesystem;

namespace setun {

// Directory containing the running executable; include paths are anchored
// here so module resolution does not depend on the current working directory.
static std::string get_exe_dir() {
#if defined(_WIN32)
    char buf[MAX_PATH] = {0};
    DWORD n = GetModuleFileNameA(nullptr, buf, MAX_PATH);
    if (n > 0 && n < MAX_PATH) {
        std::string exe_path(buf);
        size_t slash = exe_path.find_last_of("/\\");
        if (slash != std::string::npos) {
            return exe_path.substr(0, slash);
        }
    }
#endif
    return "";
}

ModuleResolver::ModuleResolver(ArenaAllocator& arena)
    : arena_(arena) {
    // Anchor the standard library to the executable location first, then
    // fall back to CWD-relative locations for in-tree development builds.
    std::string exe_dir = get_exe_dir();
    if (!exe_dir.empty()) {
        add_include_path(exe_dir + "/include/stdtaf");
        add_include_path(exe_dir + "/Code/include/stdtaf");
    }
    add_include_path("include/stdtaf");
    add_include_path("Code/include/stdtaf");
    add_include_path(".");
}

void ModuleResolver::add_include_path(const std::string& path) {
    if (!path.empty()) {
        include_paths_.push_back(path);
    }
}

std::string ModuleResolver::resolve_path(const std::string& module_spec, const std::string& current_dir) {
    std::string clean_spec = module_spec;
    // Remove optional trailing ::*
    if (clean_spec.size() >= 3 && clean_spec.substr(clean_spec.size() - 3) == "::*") {
        clean_spec = clean_spec.substr(0, clean_spec.size() - 3);
    }

    std::vector<std::string> candidates;

    // 1. Direct path check (e.g. "path/to/file.stn" or "file.stn")
    candidates.push_back(clean_spec);
    if (!clean_spec.ends_with(".stn") && !clean_spec.ends_with(".setun")) {
        candidates.push_back(clean_spec + ".stn");
    }

    // 2. Dotted module conversion: "std.mouse" -> "std/mouse.stn" or "mouse.stn"
    std::string slashed = clean_spec;
    std::replace(slashed.begin(), slashed.end(), '.', '/');
    candidates.push_back(slashed + ".stn");
    candidates.push_back(slashed);

    // If starts with "std/", also check base name in include/stdtaf/
    if (slashed.rfind("std/", 0) == 0) {
        std::string sub = slashed.substr(4);
        candidates.push_back(sub + ".stn");
        candidates.push_back("include/stdtaf/" + sub + ".stn");
        candidates.push_back("Code/include/stdtaf/" + sub + ".stn");
        candidates.push_back("Projects/std/" + sub + ".stn");
    }

    // Search relative to current_dir first
    for (const auto& cand : candidates) {
        fs::path p = current_dir.empty() ? fs::path(cand) : (fs::path(current_dir) / cand);
        if (fs::exists(p) && !fs::is_directory(p)) {
            return fs::absolute(p).lexically_normal().string();
        }
    }

    // Search in include paths
    for (const auto& inc : include_paths_) {
        for (const auto& cand : candidates) {
            fs::path p = fs::path(inc) / cand;
            if (fs::exists(p) && !fs::is_directory(p)) {
                return fs::absolute(p).lexically_normal().string();
            }
        }
    }

    return "";
}

bool ModuleResolver::resolve_program(Program& program, const std::string& current_file_path) {
    fs::path cur_p(current_file_path);
    std::string current_dir = cur_p.has_parent_path() ? cur_p.parent_path().string() : ".";

    if (!current_file_path.empty()) {
        try {
            std::string canon = fs::absolute(cur_p).lexically_normal().string();
            loaded_modules_.insert(canon);
        } catch (...) {
            loaded_modules_.insert(current_file_path);
        }
    }

    std::vector<Stmt*> resolved_statements;

    for (Stmt* stmt : program.statements) {
        if (!stmt) continue;

        if (std::holds_alternative<ImportStmt>(stmt->data)) {
            const auto& imp = std::get<ImportStmt>(stmt->data);
            std::string resolved_file = resolve_path(imp.module_path, current_dir);

            if (resolved_file.empty()) {
                diagnostics_.push_back("Could not resolve imported module: '" + imp.module_path + "'");
                return false;
            }

            if (loaded_modules_.count(resolved_file)) {
                // Already imported, prevent circular loop & duplicates
                continue;
            }
            loaded_modules_.insert(resolved_file);

            // Read module file
            std::ifstream file(resolved_file);
            if (!file.is_open()) {
                diagnostics_.push_back("Failed to open imported module file: '" + resolved_file + "'");
                return false;
            }
            std::stringstream buffer;
            buffer << file.rdbuf();
            std::string source = buffer.str();

            // Tokenize & Parse (surface errors with the module file context)
            Program imported_prog;
            try {
                Lexer lexer(source);
                auto tokens = lexer.tokenize();
                Parser parser(tokens, arena_);
                imported_prog = parser.parse_program();
            } catch (const std::exception& e) {
                diagnostics_.push_back("in module '" + resolved_file + "': " + e.what());
                return false;
            }

            // Recursively resolve imports of the imported module
            if (!resolve_program(imported_prog, resolved_file)) {
                return false;
            }

            // A library module's own main() is meaningless in the importing
            // context and would collide with the importing program's entry
            // point, so rename it to '<module>_main'. When the file is run
            // directly it stays the main file and keeps its entry point.
            std::string module_stem = fs::path(resolved_file).stem().string();
            std::string renamed_main;
            for (char& ch : module_stem) {
                if (!std::isalnum(static_cast<unsigned char>(ch))) ch = '_';
            }
            renamed_main = module_stem + "_main";

            // Append all statements of the imported module
            for (Stmt* imp_stmt : imported_prog.statements) {
                if (imp_stmt && std::holds_alternative<FnDeclStmt>(imp_stmt->data)) {
                    auto& fn = std::get<FnDeclStmt>(imp_stmt->data);
                    if (fn.name == "main") {
                        fn.name = renamed_main;
                    }
                }
                resolved_statements.push_back(imp_stmt);
            }
        } else {
            resolved_statements.push_back(stmt);
        }
    }

    program.statements = std::move(resolved_statements);
    return true;
}

} // namespace setun
