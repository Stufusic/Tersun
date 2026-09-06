#include "compiler/monomorphizer.hpp"
#include <sstream>
#include <unordered_set>

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

// Map a concrete type-name string (from turbofish or inference) to its DataType.
static DataType concrete_data_type(const std::string& name) {
    if (name == "int") return DataType::INT;
    if (name == "string") return DataType::STRING;
    if (name == "float") return DataType::FLOAT;
    if (name == "bool") return DataType::BOOL;
    if (name == "taf3") return DataType::TAF3;
    if (name == "tryte" || name == "trit") return DataType::TRYTE;
    return DataType::OBJECT; // user-defined: kept via custom_type_name
}

static bool is_primitive_name(const std::string& name) {
    return name == "int" || name == "string" || name == "float" || name == "bool"
        || name == "taf3" || name == "tryte" || name == "trit";
}

// Substitute generic parameter names (per tmap) in the type annotations of a
// cloned declaration body: let x: T, field types were handled by the caller.
static void substitute_annotations(Stmt* stmt,
                                   const std::unordered_map<std::string, std::string>& tmap) {
    if (!stmt) return;
    std::visit([&](auto& s) {
        using T = std::decay_t<decltype(s)>;
        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            if (tmap.count(s.custom_type_name)) {
                s.custom_type_name = tmap.at(s.custom_type_name);
                s.type = concrete_data_type(s.custom_type_name);
            }
        } else if constexpr (std::is_same_v<T, BlockStmt>) {
            for (Stmt* c : s.statements) substitute_annotations(c, tmap);
        } else if constexpr (std::is_same_v<T, IfStmt>) {
            substitute_annotations(s.then_branch, tmap);
            substitute_annotations(s.else_branch, tmap);
        } else if constexpr (std::is_same_v<T, WhileStmt>) {
            substitute_annotations(s.body, tmap);
        } else if constexpr (std::is_same_v<T, ForStmt>) {
            substitute_annotations(s.body, tmap);
        } else if constexpr (std::is_same_v<T, ReturnStmt>) {
            // nothing
        }
    }, stmt->data);
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

            // --- Generic struct instantiation: Pair(1, "a") ---
            auto sit = generic_structs_.find(call.callee);
            if (sit != generic_structs_.end()) {
                StructDeclStmt* tmpl = sit->second;
                std::unordered_set<std::string> gpset(tmpl->generic_params.begin(), tmpl->generic_params.end());
                std::unordered_map<std::string, std::string> tmap;
                for (size_t i = 0; i < tmpl->fields.size() && i < call.args.size(); ++i) {
                    const auto& ftype = tmpl->fields[i].custom_type_name;
                    if (!gpset.count(ftype)) continue;
                    if (call.args[i] && call.args[i]->inferred_type)
                        tmap[ftype] = call.args[i]->inferred_type->to_string();
                }
                if (tmap.size() == gpset.size()) {
                    std::string spec_name = call.callee;
                    for (const auto& gp : tmpl->generic_params) spec_name += "__" + tmap[gp];
                    if (!specialized_functions_[spec_name]) {
                        specialized_functions_[spec_name] = true;
                        auto* spec = new Stmt(*tmpl, tmpl->loc);
                        auto& st = std::get<StructDeclStmt>(spec->data);
                        st.name = spec_name;
                        st.generic_params.clear();
                        for (auto& f : st.fields) {
                            if (tmap.count(f.custom_type_name)) {
                                f.custom_type_name = tmap.at(f.custom_type_name);
                                f.type = concrete_data_type(f.custom_type_name);
                            }
                        }
                        for (auto& m : st.methods) substitute_annotations(m.body, tmap);
                        new_specializations.push_back(spec);
                    }
                    call.callee = spec_name;
                }
            } else {
            // --- Generic function specialization ---
            auto it = generic_functions_.find(call.callee);
            if (it != generic_functions_.end()) {
                FnDeclStmt* template_fn = it->second;
                std::unordered_set<std::string> gpset(template_fn->generic_params.begin(), template_fn->generic_params.end());
                std::unordered_map<std::string, std::string> tmap;
                bool ok = true;
                if (!call.type_args.empty()) {
                    if (call.type_args.size() != template_fn->generic_params.size()) ok = false;
                    else for (size_t i = 0; i < call.type_args.size(); ++i)
                        tmap[template_fn->generic_params[i]] = call.type_args[i];
                }
                for (size_t i = 0; i < template_fn->params.size() && i < call.args.size(); ++i) {
                    const auto& pname = template_fn->params[i].custom_type_name;
                    if (!gpset.count(pname)) continue;
                    if (call.args[i] && call.args[i]->inferred_type)
                        tmap[pname] = call.args[i]->inferred_type->to_string();
                }
                if (tmap.size() == gpset.size() && ok) {
                    std::string spec_name = call.callee;
                    for (const auto& gp : template_fn->generic_params) spec_name += "__" + tmap[gp];
                    if (!specialized_functions_[spec_name]) {
                        specialized_functions_[spec_name] = true;
                        auto* spec_fn = new Stmt(*template_fn, template_fn->loc);
                        auto& fn_data = std::get<FnDeclStmt>(spec_fn->data);
                        fn_data.name = spec_name;
                        fn_data.generic_params.clear();
                        for (auto& p : fn_data.params) {
                            if (tmap.count(p.custom_type_name)) {
                                p.custom_type_name = tmap.at(p.custom_type_name);
                                p.type = concrete_data_type(p.custom_type_name);
                            }
                            p.resolved_type = nullptr;
                        }
                        if (tmap.count(fn_data.return_custom_name)) {
                            fn_data.return_type = concrete_data_type(fn_data.return_custom_name);
                        }
                        substitute_annotations(fn_data.body, tmap);
                        new_specializations.push_back(spec_fn);
                    }
                    call.callee = spec_name;
                }
            }
            } // end struct-vs-fn else
        } else if (std::holds_alternative<MethodCallExpr>(expr->data)) {
            auto& mc = std::get<MethodCallExpr>(expr->data);
            self(self, mc.object);
            for (Expr* a : mc.args) self(self, a);
        } else if (std::holds_alternative<BinaryExpr>(expr->data)) {
            auto& be = std::get<BinaryExpr>(expr->data);
            self(self, be.left);
            self(self, be.right);
        } else if (std::holds_alternative<UnaryExpr>(expr->data)) {
            self(self, std::get<UnaryExpr>(expr->data).operand);
        } else if (std::holds_alternative<MemberAccessExpr>(expr->data)) {
            self(self, std::get<MemberAccessExpr>(expr->data).object);
        } else if (std::holds_alternative<IndexExpr>(expr->data)) {
            auto& ie = std::get<IndexExpr>(expr->data);
            self(self, ie.object);
            self(self, ie.index);
        } else if (std::holds_alternative<ArrayLiteralExpr>(expr->data)) {
            for (Expr* el : std::get<ArrayLiteralExpr>(expr->data).elements) self(self, el);
        } else if (std::holds_alternative<AmbiguousTripleExpr>(expr->data)) {
            for (Expr* el : std::get<AmbiguousTripleExpr>(expr->data).elements) self(self, el);
        } else if (std::holds_alternative<TafpuConstructExpr>(expr->data)) {
            auto& tc = std::get<TafpuConstructExpr>(expr->data);
            self(self, tc.a);
            self(self, tc.b);
            self(self, tc.s);
        } else if (std::holds_alternative<FStringExpr>(expr->data)) {
            for (Expr* child : std::get<FStringExpr>(expr->data).expressions) self(self, child);
        } else if (std::holds_alternative<ComptimeExpr>(expr->data)) {
            self(self, std::get<ComptimeExpr>(expr->data).expr);
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
        } else if (std::holds_alternative<ForStmt>(stmt->data)) {
            auto& fs = std::get<ForStmt>(stmt->data);
            if (fs.init) self(self, fs.init);
            visit_expr(visit_expr, fs.cond);
            if (fs.update) self(self, fs.update);
            visit_expr(visit_expr, fs.iterable);
            self(self, fs.body);
        } else if (std::holds_alternative<MatchStmt>(stmt->data)) {
            auto& ms = std::get<MatchStmt>(stmt->data);
            visit_expr(visit_expr, ms.condition);
            for (auto& arm : ms.arms) {
                visit_expr(visit_expr, arm.pattern);
                if (arm.guard) visit_expr(visit_expr, arm.guard);
                self(self, arm.body);
            }
        } else if (std::holds_alternative<Branch3Stmt>(stmt->data)) {
            auto& bs = std::get<Branch3Stmt>(stmt->data);
            visit_expr(visit_expr, bs.condition);
            self(self, bs.neg_branch);
            self(self, bs.zero_branch);
            self(self, bs.pos_branch);
        } else if (std::holds_alternative<MemberAssignStmt>(stmt->data)) {
            auto& ma = std::get<MemberAssignStmt>(stmt->data);
            visit_expr(visit_expr, ma.object);
            visit_expr(visit_expr, ma.value);
        } else if (std::holds_alternative<IndexAssignStmt>(stmt->data)) {
            auto& ia = std::get<IndexAssignStmt>(stmt->data);
            visit_expr(visit_expr, ia.object);
            visit_expr(visit_expr, ia.index);
            visit_expr(visit_expr, ia.value);
        } else if (std::holds_alternative<ReturnStmt>(stmt->data)) {
            visit_expr(visit_expr, std::get<ReturnStmt>(stmt->data).value);
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
