#pragma once

#include "compiler/ast.hpp"
#include "compiler/arena.hpp"
#include <vector>
#include <unordered_map>
#include <string>

namespace setun {

struct TreeContext {
    size_t round{0};
    bool changed{false};
    ArenaAllocator& arena;

    // Symbol tables for local constant propagation
    std::unordered_map<std::string, int64_t> const_ints;
    std::unordered_map<std::string, double> const_floats;
    std::unordered_map<std::string, bool> const_bools;

    // Marked candidates for IR-level CSE (Pass 8)
    std::vector<Expr*> cse_candidates;

    explicit TreeContext(ArenaAllocator& a) : arena(a) {}
};

using TreeExprPass = bool (*)(TreeContext& ctx, Expr*& expr);
using TreeStmtPass = bool (*)(TreeContext& ctx, Stmt*& stmt);

} // namespace setun
