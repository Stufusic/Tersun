#pragma once

#include "compiler/ast.hpp"
#include <string>
#include <unordered_map>
#include <vector>
#include <optional>
#include <memory>

namespace setun {

struct Symbol {
    std::string name;
    DataType type{DataType::ANY};
    bool is_global{false};
    uint16_t slot_index{0}; // Stack slot index (local or global)
    int scope_depth{0};
};

class SymbolTable {
public:
    SymbolTable() {
        // Global scope at depth 0
        scopes_.push_back({});
    }

    void enter_scope() {
        current_depth_++;
        scopes_.push_back({});
    }

    void exit_scope() {
        if (current_depth_ > 0) {
            scopes_.pop_back();
            current_depth_--;
        }
    }

    bool define(const std::string& name, DataType type, bool is_global, uint16_t slot_index) {
        auto& current_scope = scopes_.back();
        if (current_scope.find(name) != current_scope.end()) {
            return false; // Already defined in this scope
        }
        current_scope[name] = Symbol{name, type, is_global, slot_index, current_depth_};
        return true;
    }

    std::optional<Symbol> resolve(const std::string& name) const {
        for (auto it = scopes_.rbegin(); it != scopes_.rend(); ++it) {
            auto sym_it = it->find(name);
            if (sym_it != it->end()) {
                return sym_it->second;
            }
        }
        return std::nullopt;
    }

    int current_depth() const {
        return current_depth_;
    }

    bool is_global_scope() const {
        return current_depth_ == 0;
    }

private:
    int current_depth_{0};
    std::vector<std::unordered_map<std::string, Symbol>> scopes_;
};

} // namespace setun
