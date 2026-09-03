#include "compiler/type_checker.hpp"
#include <sstream>
#include <iostream>

namespace setun {

TypeChecker::TypeChecker() {
    init_builtins();
}

void TypeChecker::init_builtins() {
    // 1. Primitive and Vector Types
    type_defs_["void"] = Type::make_void();
    type_defs_["int"] = Type::make_int();
    type_defs_["tryte"] = Type::make_tryte();
    type_defs_["trit"] = Type::make_trit();
    type_defs_["taf3"] = Type::make_taf3();
    type_defs_["float"] = Type::make_float();
    type_defs_["bool"] = Type::make_bool();
    type_defs_["string"] = Type::make_string();
    type_defs_["tvec3"] = Type::make_tvec3();
    type_defs_["tquat"] = Type::make_tquat();
    type_defs_["any"] = Type::make_any();

    // 2. Builtin global functions
    functions_["print"] = Type::make_function({Type::make_any()}, Type::make_void());
    functions_["println"] = Type::make_function({Type::make_any()}, Type::make_void());
    functions_["len"] = Type::make_function({Type::make_any()}, Type::make_int());
    functions_["append"] = Type::make_function({Type::make_any(), Type::make_any()}, Type::make_void());
    functions_["push"] = Type::make_function({Type::make_any(), Type::make_any()}, Type::make_void());
    functions_["encode_tafpu"] = Type::make_function({Type::make_any()}, Type::make_taf3());
    functions_["to_double"] = Type::make_function({Type::make_taf3()}, Type::make_float());
    functions_["time_now_us"] = Type::make_function({}, Type::make_int());
    functions_["assert_eq"] = Type::make_function({Type::make_any(), Type::make_any()}, Type::make_void());

    // Setun2D Graphics
    functions_["setun2d_init"] = Type::make_function({Type::make_int(), Type::make_int(), Type::make_string()}, Type::make_void());
    functions_["setun2d_is_running"] = Type::make_function({}, Type::make_bool());
    functions_["setun2d_clear"] = Type::make_function({Type::make_int()}, Type::make_void());
    functions_["setun2d_draw_rect"] = Type::make_function({Type::make_int(), Type::make_int(), Type::make_int(), Type::make_int(), Type::make_int()}, Type::make_void());
    functions_["setun2d_draw_circle"] = Type::make_function({Type::make_int(), Type::make_int(), Type::make_int(), Type::make_int()}, Type::make_void());
    functions_["setun2d_draw_text"] = Type::make_function({Type::make_int(), Type::make_int(), Type::make_string(), Type::make_int()}, Type::make_void());
    functions_["setun2d_flip"] = Type::make_function({}, Type::make_void());
    functions_["setun2d_get_key"] = Type::make_function({}, Type::make_int());
    functions_["setun2d_close"] = Type::make_function({}, Type::make_void());

    // tvec3 constructor function: tvec3(x, y, z)
    functions_["tvec3"] = Type::make_function({Type::make_any(), Type::make_any(), Type::make_any()}, Type::make_tvec3());

    // Global scope
    scopes_.clear();
    enter_scope();
}

void TypeChecker::enter_scope() {
    scopes_.push_back({});
}

void TypeChecker::exit_scope() {
    if (!scopes_.empty()) {
        scopes_.pop_back();
    }
}

bool TypeChecker::define_symbol(const std::string& name, TypePtr type, bool is_mut, bool is_const, SourceLocation loc) {
    if (scopes_.empty()) return false;
    auto& cur = scopes_.back();
    if (cur.find(name) != cur.end()) {
        report_error("Redefinition of variable '" + name + "' in the same scope.", loc);
        return false;
    }
    cur[name] = ScopedSymbol{name, type, is_mut, is_const, loc};
    return true;
}

std::optional<ScopedSymbol> TypeChecker::resolve_symbol(const std::string& name) {
    for (auto it = scopes_.rbegin(); it != scopes_.rend(); ++it) {
        auto found = it->find(name);
        if (found != it->end()) {
            return found->second;
        }
    }
    return std::nullopt;
}

TypePtr TypeChecker::get_type_definition(const std::string& name) const {
    auto it = type_defs_.find(name);
    if (it != type_defs_.end()) return it->second;
    return nullptr;
}

TypePtr TypeChecker::resolve_type_from_data_type(DataType dt, const std::string& type_name) {
    if (!type_name.empty()) {
        auto custom = get_type_definition(type_name);
        if (custom) return custom;
    }
    return Type::from_data_type(dt);
}

void TypeChecker::report_error(const std::string& message, SourceLocation loc) {
    errors_.push_back(TypeError{message, loc, false});
}

void TypeChecker::report_warning(const std::string& message, SourceLocation loc) {
    errors_.push_back(TypeError{message, loc, true});
}

std::string TypeChecker::format_diagnostics(const std::string& /*source_code*/) const {
    std::ostringstream oss;
    for (const auto& err : errors_) {
        oss << (err.is_warning ? "[Warning]" : "[Type Error]")
            << " Line " << err.loc.line << ":" << err.loc.column << " - "
            << err.message << "\n";
    }
    return oss.str();
}

bool TypeChecker::check_program(Program& program) {
    errors_.clear();
    init_builtins();

    // Pass 1: Register all Struct, Class, Interface, Enum and Function forward signatures
    for (Stmt* stmt : program.statements) {
        if (!stmt) continue;
        if (std::holds_alternative<StructDeclStmt>(stmt->data)) {
            auto& s = std::get<StructDeclStmt>(stmt->data);
            auto st_type = Type::make_struct(s.name);
            type_defs_[s.name] = st_type;
        } else if (std::holds_alternative<ClassDeclStmt>(stmt->data)) {
            auto& c = std::get<ClassDeclStmt>(stmt->data);
            auto cl_type = Type::make_class(c.name, c.super_class);
            type_defs_[c.name] = cl_type;
        } else if (std::holds_alternative<InterfaceDeclStmt>(stmt->data)) {
            auto& i = std::get<InterfaceDeclStmt>(stmt->data);
            type_defs_[i.name] = Type::make_interface(i.name);
        } else if (std::holds_alternative<EnumDeclStmt>(stmt->data)) {
            auto& e = std::get<EnumDeclStmt>(stmt->data);
            auto en_type = Type::make_enum(e.name);
            for (const auto& v : e.variants) {
                EnumVariantType ev;
                ev.name = v.name;
                for (DataType dt : v.payload_types) {
                    ev.payload_types.push_back(Type::from_data_type(dt));
                }
                en_type->variants[v.name] = ev;
            }
            type_defs_[e.name] = en_type;
        } else if (std::holds_alternative<FnDeclStmt>(stmt->data)) {
            auto& f = std::get<FnDeclStmt>(stmt->data);
            std::vector<TypePtr> param_types;
            for (const auto& p : f.params) {
                param_types.push_back(Type::from_data_type(p.type));
            }
            TypePtr ret_type = Type::from_data_type(f.return_type);
            functions_[f.name] = Type::make_function(param_types, ret_type);
        }
    }

    // Pass 2: Check all statements and method bodies
    for (Stmt* stmt : program.statements) {
        check_stmt(stmt);
    }

    return !has_errors();
}

void TypeChecker::check_stmt(Stmt* stmt) {
    if (!stmt) return;

    std::visit([&](auto& s) {
        using T = std::decay_t<decltype(s)>;

        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            check_var_decl(s);
        } else if constexpr (std::is_same_v<T, AssignStmt>) {
            check_assign(s);
        } else if constexpr (std::is_same_v<T, MemberAssignStmt>) {
            check_member_assign(s);
        } else if constexpr (std::is_same_v<T, IndexAssignStmt>) {
            check_index_assign(s);
        } else if constexpr (std::is_same_v<T, ExprStmt>) {
            if (s.expr) check_expr(s.expr);
        } else if constexpr (std::is_same_v<T, BlockStmt>) {
            check_block(s);
        } else if constexpr (std::is_same_v<T, IfStmt>) {
            check_if(s);
        } else if constexpr (std::is_same_v<T, Branch3Stmt>) {
            check_branch3(s);
        } else if constexpr (std::is_same_v<T, WhileStmt>) {
            check_while(s);
        } else if constexpr (std::is_same_v<T, ReturnStmt>) {
            check_return(s);
        } else if constexpr (std::is_same_v<T, FnDeclStmt>) {
            check_fn_decl(s);
        } else if constexpr (std::is_same_v<T, StructDeclStmt>) {
            check_struct_decl(s);
        } else if constexpr (std::is_same_v<T, ClassDeclStmt>) {
            check_class_decl(s);
        } else if constexpr (std::is_same_v<T, InterfaceDeclStmt>) {
            check_interface_decl(s);
        } else if constexpr (std::is_same_v<T, EnumDeclStmt>) {
            check_enum_decl(s);
        } else if constexpr (std::is_same_v<T, MatchStmt>) {
            check_match(s);
        } else if constexpr (std::is_same_v<T, ImportStmt>) {
            // Import logic (resolved externally)
        }
    }, stmt->data);
}

void TypeChecker::check_var_decl(VarDeclStmt& stmt) {
    TypePtr declared_type = (stmt.type == DataType::ANY) ? nullptr : resolve_type_from_data_type(stmt.type, stmt.custom_type_name);
    TypePtr init_type = nullptr;

    if (stmt.init) {
        init_type = check_expr(stmt.init);
    }

    TypePtr final_type = declared_type;

    if (declared_type && init_type) {
        // Explicit type specified: verify assignment compatibility
        if (!declared_type->is_assignable_from(init_type)) {
            report_error("Type mismatch in variable '" + stmt.name + "': Cannot assign expression of type '"
                         + init_type->to_string() + "' to '" + declared_type->to_string() + "'.", stmt.loc);
        }
    } else if (!declared_type && init_type) {
        // Local Type Inference: infer type from initializer
        final_type = init_type;
    } else if (!declared_type && !init_type) {
        final_type = Type::make_any();
    }

    stmt.resolved_type = final_type;
    define_symbol(stmt.name, final_type, true, stmt.is_const, stmt.loc);
}

void TypeChecker::check_assign(AssignStmt& stmt) {
    auto sym = resolve_symbol(stmt.name);
    if (!sym.has_value()) {
        report_error("Cannot assign to undeclared variable '" + stmt.name + "'.", stmt.loc);
        return;
    }

    if (sym->is_const) {
        report_error("Cannot reassign to constant / immutable variable '" + stmt.name + "'.", stmt.loc);
    }

    TypePtr val_type = check_expr(stmt.value);
    if (val_type && sym->type && !sym->type->is_assignable_from(val_type)) {
        report_error("Type mismatch in assignment to '" + stmt.name + "': Cannot assign '"
                     + val_type->to_string() + "' to variable of type '" + sym->type->to_string() + "'.", stmt.loc);
    }
}

void TypeChecker::check_member_assign(MemberAssignStmt& stmt) {
    TypePtr obj_type = check_expr(stmt.object);
    TypePtr val_type = check_expr(stmt.value);
    if (!obj_type || !val_type) return;

    if (obj_type->kind == TypeKind::TVEC3) {
        if (stmt.member != "x" && stmt.member != "y" && stmt.member != "z") {
            report_error("Unknown field '" + stmt.member + "' on tvec3. Valid fields are x, y, z.", stmt.loc);
        }
        return;
    }

    if (obj_type->kind == TypeKind::STRUCT || obj_type->kind == TypeKind::CLASS) {
        auto it = obj_type->fields.find(stmt.member);
        if (it != obj_type->fields.end()) {
            if (!it->second.type->is_assignable_from(val_type)) {
                report_error("Cannot assign '" + val_type->to_string() + "' to member '"
                             + stmt.member + "' of type '" + it->second.type->to_string() + "'.", stmt.loc);
            }
        }
    }
}

void TypeChecker::check_index_assign(IndexAssignStmt& stmt) {
    TypePtr obj_type = check_expr(stmt.object);
    TypePtr idx_type = check_expr(stmt.index);
    TypePtr val_type = check_expr(stmt.value);

    if (idx_type && !idx_type->is_integer()) {
        report_error("Array index must be an integer (int, tryte, trit), found '" + idx_type->to_string() + "'.", stmt.loc);
    }

    if (obj_type && obj_type->kind == TypeKind::ARRAY && obj_type->element_type && val_type) {
        if (!obj_type->element_type->is_assignable_from(val_type)) {
            report_error("Cannot assign element of type '" + val_type->to_string() + "' to '" + obj_type->to_string() + "'.", stmt.loc);
        }
    }
}

void TypeChecker::check_block(BlockStmt& stmt) {
    enter_scope();
    for (Stmt* child : stmt.statements) {
        check_stmt(child);
    }
    exit_scope();
}

void TypeChecker::check_if(IfStmt& stmt) {
    TypePtr cond_type = check_expr(stmt.condition);
    if (cond_type && cond_type->kind == TypeKind::STRING) {
        report_error("Condition in 'if' statement cannot be a string.", stmt.loc);
    }
    if (stmt.then_branch) check_stmt(stmt.then_branch);
    if (stmt.else_branch) check_stmt(stmt.else_branch);
}

void TypeChecker::check_branch3(Branch3Stmt& stmt) {
    TypePtr cond_type = check_expr(stmt.condition);
    if (cond_type && !cond_type->is_numeric() && cond_type->kind != TypeKind::ANY) {
        report_error("Condition in 'branch3' must be a numeric/ternary comparable expression (found '"
                     + cond_type->to_string() + "').", stmt.loc);
    }
    if (stmt.neg_branch) check_stmt(stmt.neg_branch);
    if (stmt.zero_branch) check_stmt(stmt.zero_branch);
    if (stmt.pos_branch) check_stmt(stmt.pos_branch);
}

void TypeChecker::check_while(WhileStmt& stmt) {
    TypePtr cond_type = check_expr(stmt.condition);
    if (cond_type && cond_type->kind == TypeKind::STRING) {
        report_error("Condition in 'while' loop cannot be a string.", stmt.loc);
    }
    if (stmt.body) check_stmt(stmt.body);
}

void TypeChecker::check_return(ReturnStmt& stmt) {
    TypePtr ret_type = stmt.value ? check_expr(stmt.value) : Type::make_void();
    if (current_fn_return_type_) {
        if (!current_fn_return_type_->is_assignable_from(ret_type)) {
            report_error("Function return type mismatch: Expected '" + current_fn_return_type_->to_string()
                         + "', but returned '" + ret_type->to_string() + "'.", stmt.loc);
        }
    }
}

void TypeChecker::check_fn_decl(FnDeclStmt& stmt) {
    TypePtr ret_type = Type::from_data_type(stmt.return_type);
    stmt.resolved_ret_type = ret_type;

    std::vector<TypePtr> param_types;
    for (auto& p : stmt.params) {
        TypePtr pt = Type::from_data_type(p.type);
        p.resolved_type = pt;
        param_types.push_back(pt);
    }

    functions_[stmt.name] = Type::make_function(param_types, ret_type);

    TypePtr prev_fn_ret = current_fn_return_type_;
    current_fn_return_type_ = ret_type;

    enter_scope();
    // Define parameters in scope
    for (size_t i = 0; i < stmt.params.size(); ++i) {
        define_symbol(stmt.params[i].name, param_types[i], true, false, stmt.loc);
    }

    if (stmt.body) {
        check_stmt(stmt.body);
    }

    exit_scope();
    current_fn_return_type_ = prev_fn_ret;
}

void TypeChecker::check_struct_decl(StructDeclStmt& stmt) {
    auto st_type = type_defs_[stmt.name];
    if (!st_type) {
        st_type = Type::make_struct(stmt.name);
        type_defs_[stmt.name] = st_type;
    }

    for (const auto& f : stmt.fields) {
        FieldTypeInfo fi;
        fi.name = f.name;
        fi.type = Type::from_data_type(f.type);
        fi.is_pub = f.is_pub;
        st_type->fields[f.name] = fi;
    }

    // Register constructor function
    std::vector<TypePtr> ctor_params;
    for (const auto& f : stmt.fields) {
        ctor_params.push_back(Type::from_data_type(f.type));
    }
    functions_[stmt.name] = Type::make_function(ctor_params, st_type);
}

void TypeChecker::check_class_decl(ClassDeclStmt& stmt) {
    auto cl_type = type_defs_[stmt.name];
    if (!cl_type) {
        cl_type = Type::make_class(stmt.name, stmt.super_class);
        type_defs_[stmt.name] = cl_type;
    }

    for (const auto& f : stmt.fields) {
        FieldTypeInfo fi;
        fi.name = f.name;
        fi.type = Type::from_data_type(f.type);
        fi.is_pub = f.is_pub;
        cl_type->fields[f.name] = fi;
    }

    // Register constructor function
    std::vector<TypePtr> ctor_params;
    for (const auto& f : stmt.fields) {
        ctor_params.push_back(Type::from_data_type(f.type));
    }
    functions_[stmt.name] = Type::make_function(ctor_params, cl_type);

    // Check methods
    for (auto& m : stmt.methods) {
        enter_scope();
        // Define 'self' or 'this' in method scope
        define_symbol("self", cl_type, true, false, stmt.loc);
        define_symbol("this", cl_type, true, false, stmt.loc);

        std::vector<TypePtr> param_types;
        for (const auto& p : m.params) {
            if (p.name == "self" || p.name == "this") continue;
            TypePtr pt = Type::from_data_type(p.type);
            define_symbol(p.name, pt, true, false, stmt.loc);
            param_types.push_back(pt);
        }

        TypePtr ret_type = Type::from_data_type(m.return_type);
        TypePtr prev_ret = current_fn_return_type_;
        current_fn_return_type_ = ret_type;

        if (m.body) {
            check_stmt(m.body);
        }

        current_fn_return_type_ = prev_ret;
        exit_scope();
    }
}

void TypeChecker::check_interface_decl(InterfaceDeclStmt& stmt) {
    if (type_defs_.find(stmt.name) == type_defs_.end()) {
        type_defs_[stmt.name] = Type::make_interface(stmt.name);
    }
}

void TypeChecker::check_enum_decl(EnumDeclStmt& stmt) {
    auto en_type = type_defs_[stmt.name];
    if (!en_type) {
        en_type = Type::make_enum(stmt.name);
        type_defs_[stmt.name] = en_type;
    }
}

void TypeChecker::check_match(MatchStmt& stmt) {
    TypePtr cond_type = check_expr(stmt.condition);

    for (const auto& arm : stmt.arms) {
        if (arm.pattern) {
            TypePtr pat_type = check_expr(arm.pattern);
            if (cond_type && pat_type && cond_type->kind != TypeKind::ANY && pat_type->kind != TypeKind::ANY) {
                if (!cond_type->is_assignable_from(pat_type) && !pat_type->is_assignable_from(cond_type)) {
                    report_error("Pattern type '" + pat_type->to_string() + "' does not match condition type '"
                                 + cond_type->to_string() + "'.", stmt.loc);
                }
            }
        }
        if (arm.guard) {
            check_expr(arm.guard);
        }
        if (arm.body) {
            check_stmt(arm.body);
        }
    }

    if (cond_type) {
        check_match_exhaustiveness(stmt, cond_type);
    }
}

void TypeChecker::check_match_exhaustiveness(const MatchStmt& stmt, TypePtr cond_type) {
    if (!cond_type) return;

    bool has_wildcard = false;
    for (const auto& arm : stmt.arms) {
        if (!arm.pattern) {
            has_wildcard = true;
            break;
        }
        if (std::holds_alternative<IdentifierExpr>(arm.pattern->data)) {
            const auto& id = std::get<IdentifierExpr>(arm.pattern->data);
            if (id.name == "_") {
                has_wildcard = true;
                break;
            }
        }
    }

    if (cond_type->kind == TypeKind::ENUM) {
        if (!has_wildcard && stmt.arms.size() < cond_type->variants.size()) {
            report_warning("Match expression on enum '" + cond_type->name + "' may not be exhaustive. Consider adding missing variants or a wildcard 'case _ =>'.", stmt.loc);
        }
    }
}

TypePtr TypeChecker::check_expr(Expr* expr) {
    if (!expr) return Type::make_any();

    TypePtr res = Type::make_any();

    std::visit([&](auto& e) {
        using T = std::decay_t<decltype(e)>;

        if constexpr (std::is_same_v<T, IntLiteralExpr>) {
            res = Type::make_int();
        } else if constexpr (std::is_same_v<T, TryteLiteralExpr>) {
            res = Type::make_tryte();
        } else if constexpr (std::is_same_v<T, TafpuLiteralExpr>) {
            res = Type::make_taf3();
        } else if constexpr (std::is_same_v<T, FloatLiteralExpr>) {
            res = Type::make_float();
        } else if constexpr (std::is_same_v<T, StringLiteralExpr>) {
            res = Type::make_string();
        } else if constexpr (std::is_same_v<T, BoolLiteralExpr>) {
            res = Type::make_bool();
        } else if constexpr (std::is_same_v<T, IdentifierExpr>) {
            if (e.name == "_") {
                res = Type::make_any();
            } else {
                auto sym = resolve_symbol(e.name);
                if (sym.has_value()) {
                    res = sym->type;
                } else if (functions_.find(e.name) != functions_.end()) {
                    res = functions_[e.name];
                } else if (type_defs_.find(e.name) != type_defs_.end()) {
                    res = type_defs_[e.name];
                } else {
                    report_error("Use of undeclared identifier '" + e.name + "'.", e.loc);
                    res = Type::make_any();
                }
            }
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            res = check_unary(e);
        } else if constexpr (std::is_same_v<T, BinaryExpr>) {
            res = check_binary(e);
        } else if constexpr (std::is_same_v<T, CallExpr>) {
            res = check_call(e);
        } else if constexpr (std::is_same_v<T, TafpuConstructExpr>) {
            check_expr(e.a); check_expr(e.b); check_expr(e.s);
            res = Type::make_taf3();
        } else if constexpr (std::is_same_v<T, FStringExpr>) {
            for (Expr* child : e.expressions) check_expr(child);
            res = Type::make_string();
        } else if constexpr (std::is_same_v<T, MemberAccessExpr>) {
            res = check_member_access(e);
        } else if constexpr (std::is_same_v<T, MethodCallExpr>) {
            res = check_method_call(e);
        } else if constexpr (std::is_same_v<T, IndexExpr>) {
            res = check_index(e);
        } else if constexpr (std::is_same_v<T, ComptimeExpr>) {
            res = check_expr(e.expr);
        } else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) {
            res = check_array_lit(e);
        }
    }, expr->data);

    expr->inferred_type = res;
    return res;
}

TypePtr TypeChecker::check_unary(UnaryExpr& expr) {
    TypePtr operand_type = check_expr(expr.operand);
    if (!operand_type) return Type::make_any();

    switch (expr.op) {
        case UnaryOp::NEG:
            if (!operand_type->is_numeric() && operand_type->kind != TypeKind::ANY) {
                report_error("Unary negation '-' operator cannot be applied to type '" + operand_type->to_string() + "'.", expr.loc);
            }
            return operand_type;
        case UnaryOp::TILDE: // Ternary logic negation (-1 -> +1, 0 -> 0, +1 -> -1)
            return operand_type;
        case UnaryOp::NOT:
            return Type::make_bool();
    }
    return operand_type;
}

TypePtr TypeChecker::check_binary(BinaryExpr& expr) {
    TypePtr left_type = check_expr(expr.left);
    TypePtr right_type = check_expr(expr.right);
    if (!left_type || !right_type) return Type::make_any();

    switch (expr.op) {
        case BinaryOp::ADD:
            if (left_type->kind == TypeKind::STRING || right_type->kind == TypeKind::STRING) {
                return Type::make_string();
            }
            [[fallthrough]];
        case BinaryOp::SUB:
        case BinaryOp::MUL:
        case BinaryOp::DIV:
            if (left_type->kind == TypeKind::TAF3 || right_type->kind == TypeKind::TAF3) {
                return Type::make_taf3();
            }
            if (left_type->kind == TypeKind::FLOAT || right_type->kind == TypeKind::FLOAT) {
                return Type::make_float();
            }
            if (left_type->kind == TypeKind::TVEC3 || right_type->kind == TypeKind::TVEC3) {
                return Type::make_tvec3();
            }
            return Type::make_int();

        case BinaryOp::MATMUL: // @ (BitNet multiplication-free GEMM)
            if (left_type->kind == TypeKind::TVEC3 || right_type->kind == TypeKind::TVEC3) {
                return Type::make_tvec3();
            }
            return Type::make_taf3();

        case BinaryOp::SPACESHIP: // <=>
            return Type::make_int(); // Returns -1, 0, +1

        case BinaryOp::EQ:
        case BinaryOp::NEQ:
        case BinaryOp::LT:
        case BinaryOp::LE:
        case BinaryOp::GT:
        case BinaryOp::GE:
            return Type::make_bool();

        case BinaryOp::MIN:
        case BinaryOp::MAX:
            return left_type;

        case BinaryOp::NULL_COALESCE:
            return left_type;
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_call(CallExpr& expr) {
    std::vector<TypePtr> arg_types;
    for (Expr* arg : expr.args) {
        arg_types.push_back(check_expr(arg));
    }

    // Check if callee is a Struct/Class constructor
    auto st_it = type_defs_.find(expr.callee);
    if (st_it != type_defs_.end() && (st_it->second->kind == TypeKind::STRUCT || st_it->second->kind == TypeKind::CLASS)) {
        return st_it->second;
    }

    auto it = functions_.find(expr.callee);
    if (it != functions_.end()) {
        TypePtr fn_type = it->second;
        if (fn_type && fn_type->kind == TypeKind::FUNCTION) {
            // Check arity
            if (expr.callee != "print" && expr.callee != "println") {
                if (arg_types.size() != fn_type->param_types.size()) {
                    report_error("Function '" + expr.callee + "' expects " + std::to_string(fn_type->param_types.size())
                                 + " argument(s), but received " + std::to_string(arg_types.size()) + ".", expr.loc);
                } else {
                    for (size_t i = 0; i < arg_types.size(); ++i) {
                        if (!fn_type->param_types[i]->is_assignable_from(arg_types[i])) {
                            report_error("Argument " + std::to_string(i + 1) + " of function '" + expr.callee
                                         + "': Cannot pass '" + arg_types[i]->to_string() + "' to parameter of type '"
                                         + fn_type->param_types[i]->to_string() + "'.", expr.loc);
                        }
                    }
                }
            }
            return fn_type->return_type;
        }
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_member_access(MemberAccessExpr& expr) {
    TypePtr obj_type = check_expr(expr.object);
    if (!obj_type) return Type::make_any();

    if (obj_type->kind == TypeKind::TVEC3) {
        if (expr.member == "x" || expr.member == "y" || expr.member == "z") {
            return Type::make_int();
        }
        report_error("tvec3 has no member '" + expr.member + "'.", expr.loc);
        return Type::make_any();
    }

    if (obj_type->kind == TypeKind::STRUCT || obj_type->kind == TypeKind::CLASS) {
        auto it = obj_type->fields.find(expr.member);
        if (it != obj_type->fields.end()) {
            return it->second.type;
        }
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_method_call(MethodCallExpr& expr) {
    TypePtr obj_type = check_expr(expr.object);
    for (Expr* arg : expr.args) check_expr(arg);

    if (obj_type && obj_type->kind == TypeKind::ARRAY) {
        if (expr.method == "append" || expr.method == "push") {
            return Type::make_void();
        }
        if (expr.method == "len") {
            return Type::make_int();
        }
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_index(IndexExpr& expr) {
    TypePtr obj_type = check_expr(expr.object);
    TypePtr idx_type = check_expr(expr.index);

    if (idx_type && !idx_type->is_integer() && idx_type->kind != TypeKind::ANY) {
        report_error("Array index must be an integer, received '" + idx_type->to_string() + "'.", expr.loc);
    }

    if (obj_type && obj_type->kind == TypeKind::ARRAY) {
        return obj_type->element_type ? obj_type->element_type : Type::make_any();
    }
    if (obj_type && obj_type->kind == TypeKind::STRING) {
        return Type::make_string();
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_array_lit(ArrayLiteralExpr& expr) {
    if (expr.elements.empty()) {
        return Type::make_array(Type::make_any());
    }

    TypePtr elem_type = nullptr;
    for (Expr* el : expr.elements) {
        TypePtr t = check_expr(el);
        if (!elem_type) {
            elem_type = t;
        } else if (!elem_type->is_assignable_from(t)) {
            // Generalize to any or promote
            if (elem_type->is_numeric() && t->is_numeric()) {
                if (elem_type->kind == TypeKind::TAF3 || t->kind == TypeKind::TAF3) elem_type = Type::make_taf3();
                else if (elem_type->kind == TypeKind::FLOAT || t->kind == TypeKind::FLOAT) elem_type = Type::make_float();
            } else {
                elem_type = Type::make_any();
            }
        }
    }

    return Type::make_array(elem_type);
}

} // namespace setun
