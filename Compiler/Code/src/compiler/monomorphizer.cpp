#include "compiler/monomorphizer.hpp"
#include <sstream>

namespace setun {

Monomorphizer::Monomorphizer() = default;

std::string Monomorphizer::specialize_name(const std::string& base_name, const std::vector<TypePtr>& type_args) {
    std::ostringstream oss;
    oss << base_name;
    for (const auto& arg : type_args) {
        oss << "__" << (arg ? arg->to_string() : "any");
    }
    return oss.str();
}

void Monomorphizer::process_program(Program& program) {
    generic_functions_.clear();
    generic_structs_.clear();
    specialized_functions_.clear();

    // 1. Identify all generic declarations
    for (Stmt* stmt : program.statements) {
        if (!stmt) continue;
        if (std::holds_alternative<FnDeclStmt>(stmt->data)) {
            auto& fn = std::get<FnDeclStmt>(stmt->data);
            if (!fn.generic_params.empty()) {
                generic_functions_[fn.name] = &fn;
            }
        } else if (std::holds_alternative<StructDeclStmt>(stmt->data)) {
            auto& st = std::get<StructDeclStmt>(stmt->data);
            if (!st.generic_params.empty()) {
                generic_structs_[st.name] = &st;
            }
        }
    }

    if (generic_functions_.empty() && generic_structs_.empty()) {
        return; // Nothing to monomorphize
    }

    std::vector<Stmt*> new_specializations;

    // Helper lambda to scan and specialize calls in an AST expression
    auto visit_expr = [&](auto& self, Expr* expr) -> void {
        if (!expr) return;
        if (std::holds_alternative<CallExpr>(expr->data)) {
            auto& call = std::get<CallExpr>(expr->data);
            auto it = generic_functions_.find(call.callee);
            if (it != generic_functions_.end()) {
                FnDeclStmt* template_fn = it->second;
                std::vector<TypePtr> inferred_args;
                for (Expr* arg : call.args) {
                    if (arg && arg->inferred_type) {
                        inferred_args.push_back(arg->inferred_type);
                    } else {
                        inferred_args.push_back(Type::make_int());
                    }
                }

                std::string spec_name = specialize_name(call.callee, inferred_args);
                if (!specialized_functions_[spec_name]) {
                    specialized_functions_[spec_name] = true;

                    // Clone template function and specialize
                    auto* spec_fn = new Stmt(*template_fn, template_fn->loc);
                    auto& fn_data = std::get<FnDeclStmt>(spec_fn->data);
                    fn_data.name = spec_name;
                    fn_data.generic_params.clear(); // Concrete specialized function

                    // Substitute parameters
                    for (size_t i = 0; i < fn_data.params.size() && i < inferred_args.size(); ++i) {
                        fn_data.params[i].type = inferred_args[i]->to_data_type();
                        fn_data.params[i].resolved_type = inferred_args[i];
                    }
                    if (!inferred_args.empty()) {
                        fn_data.return_type = inferred_args[0]->to_data_type();
                        fn_data.resolved_ret_type = inferred_args[0];
                    }

                    new_specializations.push_back(spec_fn);
                }

                // Rewrite call to point to specialized instance
                call.callee = spec_name;
            }
        }
    };

    // Helper lambda to scan statements
    auto visit_stmt = [&](auto& self, Stmt* stmt) -> void {
        if (!stmt) return;
        if (std::holds_alternative<ExprStmt>(stmt->data)) {
            visit_expr(visit_expr, std::get<ExprStmt>(stmt->data).expr);
        } else if (std::holds_alternative<VarDeclStmt>(stmt->data)) {
            visit_expr(visit_expr, std::get<VarDeclStmt>(stmt->data).init);
        } else if (std::holds_alternative<AssignStmt>(stmt->data)) {
            visit_expr(visit_expr, std::get<AssignStmt>(stmt->data).value);
        } else if (std::holds_alternative<BlockStmt>(stmt->data)) {
            for (Stmt* c : std::get<BlockStmt>(stmt->data).statements) self(self, c);
        } else if (std::holds_alternative<IfStmt>(stmt->data)) {
            auto& ifs = std::get<IfStmt>(stmt->data);
            visit_expr(visit_expr, ifs.condition);
            self(self, ifs.then_branch);
            if (ifs.else_branch) self(self, ifs.else_branch);
        } else if (std::holds_alternative<WhileStmt>(stmt->data)) {
            auto& ws = std::get<WhileStmt>(stmt->data);
            visit_expr(visit_expr, ws.condition);
            self(self, ws.body);
        } else if (std::holds_alternative<FnDeclStmt>(stmt->data)) {
            auto& fn = std::get<FnDeclStmt>(stmt->data);
            if (fn.generic_params.empty()) {
                self(self, fn.body);
            }
        }
    };

    for (Stmt* s : program.statements) {
        visit_stmt(visit_stmt, s);
    }

    // Prepend newly specialized functions into program statements
    for (Stmt* spec : new_specializations) {
        program.statements.insert(program.statements.begin(), spec);
    }
}

} // namespace setun
