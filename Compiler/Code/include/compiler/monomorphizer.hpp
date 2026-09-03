#pragma once

#include "compiler/ast.hpp"
#include "compiler/types.hpp"
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>

namespace setun {

class Monomorphizer {
public:
    Monomorphizer();

    // Scans program for generic definitions and calls, producing specialized AST nodes
    void process_program(Program& program);

    // Returns specialized name: e.g. "identity__int" or "Box__taf3"
    static std::string specialize_name(const std::string& base_name, const std::vector<TypePtr>& type_args);

private:
    std::unordered_map<std::string, FnDeclStmt*> generic_functions_;
    std::unordered_map<std::string, StructDeclStmt*> generic_structs_;
    std::unordered_map<std::string, bool> specialized_functions_;
};

} // namespace setun
