#pragma once

#include "compiler/ast.hpp"
#include "compiler/arena.hpp"
#include <string>
#include <vector>
#include <unordered_set>

namespace setun {

class ModuleResolver {
public:
    explicit ModuleResolver(ArenaAllocator& arena);

    void add_include_path(const std::string& path);

    // Resolves all ImportStmt nodes in the program recursively
    bool resolve_program(Program& program, const std::string& current_file_path);

    const std::vector<std::string>& get_diagnostics() const { return diagnostics_; }

private:
    std::string resolve_path(const std::string& module_spec, const std::string& current_dir);

    ArenaAllocator& arena_;
    std::vector<std::string> include_paths_;
    std::unordered_set<std::string> loaded_modules_;
    std::vector<std::string> diagnostics_;
};

} // namespace setun
