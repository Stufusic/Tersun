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
    functions_["monotonic_now_us"] = Type::make_function({}, Type::make_int());
    functions_["assert_eq"] = Type::make_function({Type::make_any(), Type::make_any()}, Type::make_void());
    functions_["slice"] = Type::make_function({Type::make_any(), Type::make_int(), Type::make_int()}, Type::make_slice(Type::make_any()));

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

    // taf3 constructor function: taf3(a, b, s) / taf3(a, b)
    functions_["taf3"] = Type::make_function({Type::make_any(), Type::make_any(), Type::make_any()}, Type::make_taf3());

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

TypePtr TypeChecker::resolve_type_syntax(std::string_view syntax) {
    // 1. Trim whitespace
    while (!syntax.empty() && (syntax.front() == ' ' || syntax.front() == '\t' || syntax.front() == '\r' || syntax.front() == '\n')) {
        syntax.remove_prefix(1);
    }
    while (!syntax.empty() && (syntax.back() == ' ' || syntax.back() == '\t' || syntax.back() == '\r' || syntax.back() == '\n')) {
        syntax.remove_suffix(1);
    }
    if (syntax.empty()) return nullptr;

    // 2. Primitives
    if (syntax == "int" || syntax == "Int") return Type::make_int();
    if (syntax == "trit" || syntax == "Trit") return Type::make_trit();
    if (syntax == "tryte" || syntax == "Tryte") return Type::make_tryte();
    if (syntax == "bool" || syntax == "Bool") return Type::make_bool();
    if (syntax == "float" || syntax == "Float") return Type::make_float();
    if (syntax == "taf3" || syntax == "TAF3") return Type::make_taf3();
    if (syntax == "string" || syntax == "String") return Type::make_string();
    if (syntax == "void" || syntax == "Void") return Type::make_void();
    if (syntax == "any" || syntax == "Any") return Type::make_any();
    if (syntax == "tvec3" || syntax == "Tvec3") return Type::make_tvec3();

    std::string s(syntax);

    // 3. User-defined types from type_defs_
    auto custom = get_type_definition(s);
    if (custom) return custom;

    // 4. TensorView<T, Rank>
    if (s.rfind("TensorView<", 0) == 0 && s.back() == '>') {
        std::string inner = s.substr(11, s.size() - 12);
        size_t comma = inner.find(',');
        size_t rank = 2;
        std::string elem_str = inner;
        if (comma != std::string::npos) {
            elem_str = inner.substr(0, comma);
            std::string rank_str = inner.substr(comma + 1);
            size_t rb = rank_str.find_first_not_of(" \t");
            size_t re = rank_str.find_last_not_of(" \t");
            if (rb != std::string::npos && re != std::string::npos) {
                rank_str = rank_str.substr(rb, re - rb + 1);
            }
            try { rank = std::stoull(rank_str); } catch (...) { rank = 2; }
        }
        TypePtr elem_type = resolve_type_syntax(elem_str);
        return Type::make_tensor_view(elem_type ? elem_type : Type::make_any(), rank);
    }

    // 5. Tuple (T1, T2, ...)
    if (s.size() >= 2 && s.front() == '(' && s.back() == ')') {
        std::string inner = s.substr(1, s.size() - 2);
        std::vector<TypePtr> elems;
        size_t start = 0;
        int depth = 0;
        for (size_t i = 0; i <= inner.size(); ++i) {
            if (i == inner.size() || (inner[i] == ',' && depth == 0)) {
                std::string segment = inner.substr(start, i - start);
                size_t sb = segment.find_first_not_of(" \t");
                size_t se = segment.find_last_not_of(" \t");
                if (sb != std::string::npos && se != std::string::npos) {
                    segment = segment.substr(sb, se - sb + 1);
                    TypePtr resolved_el = resolve_type_syntax(segment);
                    elems.push_back(resolved_el ? resolved_el : Type::make_any());
                }
                start = i + 1;
            } else if (inner[i] == '(' || inner[i] == '<' || inner[i] == '[') {
                depth++;
            } else if (inner[i] == ')' || inner[i] == '>' || inner[i] == ']') {
                depth--;
            }
        }
        return Type::make_tuple(elems);
    }

    // 6. Mutable slice &mut [T]
    if (s.size() > 6 && s.substr(0, 6) == "&mut [" && s.back() == ']') {
        std::string inner = s.substr(6, s.size() - 7);
        TypePtr elem_type = resolve_type_syntax(inner);
        return Type::make_mut_slice(elem_type ? elem_type : Type::make_any());
    }

    // 7. Slice &[T]
    if (s.size() > 3 && s.substr(0, 2) == "&[" && s.back() == ']') {
        std::string inner = s.substr(2, s.size() - 3);
        TypePtr elem_type = resolve_type_syntax(inner);
        return Type::make_slice(elem_type ? elem_type : Type::make_any());
    }

    // 8. Fixed array [T; N]
    if (s.size() > 3 && s.front() == '[' && s.back() == ']') {
        size_t semi = s.find(';');
        if (semi != std::string::npos) {
            std::string inner_elem = s.substr(1, semi - 1);
            std::string size_str = s.substr(semi + 1, s.size() - semi - 2);
            size_t sb = size_str.find_first_not_of(" \t");
            size_t se = size_str.find_last_not_of(" \t");
            if (sb != std::string::npos && se != std::string::npos) {
                size_str = size_str.substr(sb, se - sb + 1);
            }
            size_t n = 0;
            try { n = std::stoull(size_str); } catch (...) { n = 0; }
            TypePtr elem_type = resolve_type_syntax(inner_elem);
            return Type::make_fixed_array(elem_type ? elem_type : Type::make_any(), n);
        }
        std::string inner_elem = s.substr(1, s.size() - 2);
        TypePtr elem_type = resolve_type_syntax(inner_elem);
        return Type::make_array(elem_type ? elem_type : Type::make_any());
    }

    // 9. Array<T>
    if (s.rfind("Array<", 0) == 0 && s.back() == '>') {
        std::string inner = s.substr(6, s.size() - 7);
        TypePtr elem_type = resolve_type_syntax(inner);
        return Type::make_array(elem_type ? elem_type : Type::make_any());
    }

    // 10. Generic instance Base<T1, T2>
    size_t lt = s.find('<');
    if (lt != std::string::npos && s.back() == '>') {
        std::string base_name = s.substr(0, lt);
        std::string args_str = s.substr(lt + 1, s.size() - lt - 2);
        std::vector<TypePtr> targs;
        size_t start = 0;
        int depth = 0;
        for (size_t i = 0; i <= args_str.size(); ++i) {
            if (i == args_str.size() || (args_str[i] == ',' && depth == 0)) {
                std::string segment = args_str.substr(start, i - start);
                TypePtr targ = resolve_type_syntax(segment);
                targs.push_back(targ ? targ : Type::make_any());
                start = i + 1;
            } else if (args_str[i] == '<' || args_str[i] == '(' || args_str[i] == '[') {
                depth++;
            } else if (args_str[i] == '>' || args_str[i] == ')' || args_str[i] == ']') {
                depth--;
            }
        }
        return Type::make_generic_instance(base_name, targs);
    }

    return Type::make_any();
}

TypePtr TypeChecker::resolve_type_from_data_type(DataType dt, const std::string& type_name) {
    if (!type_name.empty()) {
        TypePtr t = resolve_type_syntax(type_name);
        if (t && t->kind != TypeKind::ANY) return t;
    }
    if (dt == DataType::TRIT) {
        return Type::make_trit();
    }
    return Type::from_data_type(dt);
}

// Build a MethodTypeInfo signature from a method declaration, excluding the
// implicit 'self'/'this' receiver so it matches call-site argument lists.
// User-defined parameter types are resolved against type_defs_ so methods
// receive real class types instead of generic 'any'.
MethodTypeInfo TypeChecker::make_method_info(const MethodDecl& m) {
    MethodTypeInfo mi;
    mi.name = m.name;
    for (const auto& p : m.params) {
        if (p.name == "self" || p.name == "this") continue;
        TypePtr pt = (!p.custom_type_name.empty()) ? resolve_type_syntax(p.custom_type_name) : Type::from_data_type(p.type);
        mi.param_types.push_back(pt ? pt : Type::make_any());
        mi.param_names.push_back(p.name);
    }
    mi.return_type = (!m.return_custom_name.empty()) ? resolve_type_syntax(m.return_custom_name) : Type::from_data_type(m.return_type);
    if (!mi.return_type) mi.return_type = Type::make_void();
    mi.is_pub = m.is_pub;
    return mi;
}

void TypeChecker::report_error(const std::string& message, SourceLocation loc) {    errors_.push_back(TypeError{message, loc, false});
}

void TypeChecker::report_warning(const std::string& message, SourceLocation loc) {
    errors_.push_back(TypeError{message, loc, true});
}

std::string TypeChecker::format_diagnostics(const std::string& /*source_code*/) const {
    std::ostringstream oss;
    for (const auto& err : errors_) {
        oss << (err.is_warning ? "[Warning]" : "[Type Error]") << " ";
        if (!err.loc.file.empty()) {
            oss << err.loc.file << ":";
        } else {
            oss << "Line ";
        }
        oss << err.loc.line << ":" << err.loc.column << " - "
            << err.message << "\n";
    }
    return oss.str();
}

bool TypeChecker::check_program(Program& program) {
    errors_.clear();
    declared_fn_locs_.clear();
    declared_type_locs_.clear();
    import_aliases_.clear();
    init_builtins();

    // Pass 1: Register all Struct, Class, Interface, Enum and Function forward signatures
    for (Stmt* stmt : program.statements) {
        if (!stmt) continue;
        if (std::holds_alternative<StructDeclStmt>(stmt->data)) {
            auto& s = std::get<StructDeclStmt>(stmt->data);
            if (declared_type_locs_.count(s.name)) {
                report_error("Redefinition of struct '" + s.name + "' (previously declared at line "
                             + std::to_string(declared_type_locs_[s.name].line) + ").", s.loc);
            } else {
                declared_type_locs_[s.name] = s.loc;
            }
            auto st_type = Type::make_struct(s.name);
            for (const auto& m : s.methods) {
                st_type->methods[m.name] = make_method_info(m);
            }
            type_defs_[s.name] = st_type;
        } else if (std::holds_alternative<ClassDeclStmt>(stmt->data)) {
            auto& c = std::get<ClassDeclStmt>(stmt->data);
            if (declared_type_locs_.count(c.name)) {
                report_error("Redefinition of class '" + c.name + "' (previously declared at line "
                             + std::to_string(declared_type_locs_[c.name].line) + ").", c.loc);
            } else {
                declared_type_locs_[c.name] = c.loc;
            }
            auto cl_type = Type::make_class(c.name, c.super_class);
            for (const auto& m : c.methods) {
                cl_type->methods[m.name] = make_method_info(m);
            }
            type_defs_[c.name] = cl_type;
        } else if (std::holds_alternative<InterfaceDeclStmt>(stmt->data)) {
            auto& i = std::get<InterfaceDeclStmt>(stmt->data);
            if (declared_type_locs_.count(i.name)) {
                report_error("Redefinition of interface '" + i.name + "' (previously declared at line "
                             + std::to_string(declared_type_locs_[i.name].line) + ").", i.loc);
            } else {
                declared_type_locs_[i.name] = i.loc;
            }
            auto iface_type = Type::make_interface(i.name);
            for (const auto& m : i.methods) {
                iface_type->methods[m.name] = make_method_info(m);
            }
            type_defs_[i.name] = iface_type;
        } else if (std::holds_alternative<EnumDeclStmt>(stmt->data)) {
            auto& e = std::get<EnumDeclStmt>(stmt->data);
            if (declared_type_locs_.count(e.name)) {
                report_error("Redefinition of enum '" + e.name + "' (previously declared at line "
                             + std::to_string(declared_type_locs_[e.name].line) + ").", e.loc);
            } else {
                declared_type_locs_[e.name] = e.loc;
            }
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
        } else if (std::holds_alternative<ImportStmt>(stmt->data)) {
            auto& imp = std::get<ImportStmt>(stmt->data);
            if (!imp.alias.empty()) {
                import_aliases_.insert(imp.alias);
            }
        } else if (std::holds_alternative<FnDeclStmt>(stmt->data)) {
            auto& f = std::get<FnDeclStmt>(stmt->data);
            if (declared_fn_locs_.count(f.name)) {
                report_error("Redefinition of function '" + f.name + "' (previously declared at line "
                             + std::to_string(declared_fn_locs_[f.name].line) + ").", f.loc);
            } else {
                declared_fn_locs_[f.name] = f.loc;
            }
            std::vector<TypePtr> param_types;
            for (const auto& p : f.params) {
                TypePtr pt = (!p.custom_type_name.empty()) ? resolve_type_syntax(p.custom_type_name) : Type::from_data_type(p.type);
                param_types.push_back(pt ? pt : Type::make_any());
            }
            TypePtr ret_type = (!f.return_custom_name.empty()) ? resolve_type_syntax(f.return_custom_name) : Type::from_data_type(f.return_type);
            functions_[f.name] = Type::make_function(param_types, ret_type ? ret_type : Type::make_void());
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

    // Resolve ambiguous [a, b, c] triples BEFORE checking, so downstream
    // checks see a concrete TafpuConstructExpr or ArrayLiteralExpr.
    resolve_triples_stmt(stmt);

    std::visit([&](auto& s) {
        using T = std::decay_t<decltype(s)>;

        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            check_var_decl(s);
        } else if constexpr (std::is_same_v<T, TupleDestructureStmt>) {
            check_tuple_destructure(s);
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
        } else if constexpr (std::is_same_v<T, ForStmt>) {
            check_for(s);
        } else if constexpr (std::is_same_v<T, BreakContinueStmt>) {
            // Pure control flow; legality (inside a loop) is enforced by the emitter.
        } else if constexpr (std::is_same_v<T, TryCatchStmt>) {
            check_stmt(s.try_body);
            enter_scope();
            if (!s.catch_var.empty()) {
                define_symbol(s.catch_var, Type::make_string(), true, false, s.loc);
            }
            check_stmt(s.catch_body);
            exit_scope();
        } else if constexpr (std::is_same_v<T, ThrowStmt>) {
            if (s.value) check_expr(s.value);
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
    TypePtr declared_type = nullptr;
    if (!stmt.custom_type_name.empty()) {
        declared_type = resolve_type_syntax(stmt.custom_type_name);
    } else if (stmt.type != DataType::ANY) {
        declared_type = Type::from_data_type(stmt.type);
    }
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

void TypeChecker::check_tuple_destructure(TupleDestructureStmt& stmt) {
    TypePtr init_type = stmt.init ? check_expr(stmt.init) : nullptr;
    if (init_type && init_type->kind == TypeKind::TUPLE) {
        if (stmt.names.size() != init_type->tuple_elements.size()) {
            report_error("Tuple destructuring arity mismatch: expected " +
                         std::to_string(init_type->tuple_elements.size()) +
                         " variables, got " + std::to_string(stmt.names.size()) + ".", stmt.loc);
        }
        for (size_t i = 0; i < stmt.names.size(); ++i) {
            TypePtr elem_type = (i < init_type->tuple_elements.size()) ? init_type->tuple_elements[i] : Type::make_any();
            stmt.resolved_types.push_back(elem_type);
            define_symbol(stmt.names[i], elem_type, true, stmt.is_const, stmt.loc);
        }
        if (stmt.names.size() == 2 && stmt.init && std::holds_alternative<CallExpr>(stmt.init->data)) {
            const auto& call = std::get<CallExpr>(stmt.init->data);
            if (call.callee == "split_at_mut") {
                memory_facts_.add_disjoint(stmt.names[0], stmt.names[1]);
            }
        }
    } else {
        if (init_type && init_type->kind != TypeKind::ANY) {
            report_error("Cannot destructure non-tuple expression of type '" + init_type->to_string() + "'.", stmt.loc);
        }
        for (const auto& name : stmt.names) {
            stmt.resolved_types.push_back(Type::make_any());
            define_symbol(name, Type::make_any(), true, stmt.is_const, stmt.loc);
        }
    }
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
            if (it->second.type->kind == TypeKind::SLICE_VIEW || it->second.type->kind == TypeKind::TENSOR_VIEW) {
                report_error("Cannot store borrowed view '" + it->second.type->to_string() + "' in struct field '" + stmt.member + "': violates region lifetime invariant.", stmt.loc);
                return;
            }
            if (!it->second.type->is_assignable_from(val_type)) {
                report_error("Cannot assign '" + val_type->to_string() + "' to member '"
                             + stmt.member + "' of type '" + it->second.type->to_string() + "'.", stmt.loc);
            }
        }
    }
}

void TypeChecker::check_index_assign(IndexAssignStmt& stmt) {
    TypePtr obj_type = check_expr(stmt.object);
    if (!stmt.indices.empty()) {
        for (Expr* idx : stmt.indices) {
            TypePtr it = check_expr(idx);
            if (it && !it->is_integer() && it->kind != TypeKind::ANY) {
                report_error("Array index must be an integer (int, tryte, trit), found '" + it->to_string() + "'.", stmt.loc);
            }
        }
    } else if (stmt.index) {
        TypePtr idx_type = check_expr(stmt.index);
        if (idx_type && !idx_type->is_integer() && idx_type->kind != TypeKind::ANY) {
            report_error("Array index must be an integer (int, tryte, trit), found '" + idx_type->to_string() + "'.", stmt.loc);
        }
    }
    TypePtr val_type = check_expr(stmt.value);

    if (obj_type) {
        if (obj_type->kind == TypeKind::TENSOR_VIEW) {
            size_t num_indices = stmt.indices.empty() ? (stmt.index ? 1 : 0) : stmt.indices.size();
            if (num_indices != obj_type->rank) {
                report_error("TensorView with rank " + std::to_string(obj_type->rank) + " indexed with " + std::to_string(num_indices) + " indices.", stmt.loc);
            }
            if (obj_type->element_type && val_type && !obj_type->element_type->is_assignable_from(val_type)) {
                report_error("Cannot assign element of type '" + val_type->to_string() + "' to TensorView of '" + obj_type->element_type->to_string() + "'.", stmt.loc);
            }
            return;
        }
        if (obj_type->kind == TypeKind::SLICE_VIEW) {
            if (!obj_type->is_mut_slice) {
                report_error("Cannot mutate elements through immutable slice view '" + obj_type->to_string() + "'. Consider using '&mut [T]'.", stmt.loc);
                return;
            }
            if (obj_type->element_type && val_type && !obj_type->element_type->is_assignable_from(val_type)) {
                report_error("Cannot assign element of type '" + val_type->to_string() + "' to mutable slice of '" + obj_type->element_type->to_string() + "'.", stmt.loc);
            }
        } else if ((obj_type->kind == TypeKind::ARRAY || obj_type->kind == TypeKind::FIXED_ARRAY) && obj_type->element_type && val_type) {
            if (!obj_type->element_type->is_assignable_from(val_type)) {
                report_error("Cannot assign element of type '" + val_type->to_string() + "' to '" + obj_type->to_string() + "'.", stmt.loc);
            }
        }
    }
}

void TypeChecker::check_block(BlockStmt& stmt) {
    if (!stmt.is_transparent_scope) enter_scope();
    for (Stmt* child : stmt.statements) {
        check_stmt(child);
    }
    if (!stmt.is_transparent_scope) exit_scope();
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

void TypeChecker::check_for(ForStmt& stmt) {
    enter_scope();
    if (stmt.init) check_stmt(stmt.init);

    if (stmt.is_for_in) {
        TypePtr it = check_expr(stmt.iterable);
        TypePtr elem = Type::make_any();
        if (it) {
            if (it->kind == TypeKind::ARRAY) {
                elem = it->element_type ? it->element_type : Type::make_any();
            } else if (it->kind == TypeKind::STRING) {
                elem = Type::make_string();
            }
        }
        define_symbol(stmt.loop_var, elem, true, false, stmt.loc);
    } else if (stmt.cond) {
        check_expr(stmt.cond);
    }

    if (stmt.update) check_stmt(stmt.update);
    if (stmt.body) check_stmt(stmt.body);
    exit_scope();
}

// ============================================================================
// Ambiguous [a, b, c] triple resolution
// ============================================================================

void TypeChecker::rewrite_triple(Expr* expr, bool as_tafpu) {
    auto& triple = std::get<AmbiguousTripleExpr>(expr->data);
    if (triple.elements.size() == 3) {
        if (as_tafpu) {
            expr->data = TafpuConstructExpr{triple.elements[0], triple.elements[1],
                                            triple.elements[2], expr->loc};
        } else {
            expr->data = ArrayLiteralExpr{{triple.elements[0], triple.elements[1],
                                           triple.elements[2]}, expr->loc};
        }
    } else if (triple.elements.size() == 2) {
        expr->data = ArrayLiteralExpr{{triple.elements[0], triple.elements[1]}, expr->loc};
    }
}

bool TypeChecker::is_tafpuish(Expr* expr) {
    if (!expr) return false;
    if (std::holds_alternative<TafpuConstructExpr>(expr->data)
        || std::holds_alternative<TafpuLiteralExpr>(expr->data)) {
        return true;
    }
    if (std::holds_alternative<IdentifierExpr>(expr->data)) {
        auto sym = resolve_symbol(std::get<IdentifierExpr>(expr->data).name);
        return sym && sym->type && sym->type->kind == TypeKind::TAF3;
    }
    if (std::holds_alternative<MemberAccessExpr>(expr->data)) {
        auto& ma = std::get<MemberAccessExpr>(expr->data);
        return member_is_taf3(ma.object, ma.member);
    }
    if (std::holds_alternative<CallExpr>(expr->data)) {
        auto& ce = std::get<CallExpr>(expr->data);
        auto it = functions_.find(ce.callee);
        if (it != functions_.end() && it->second && it->second->return_type) {
            return it->second->return_type->kind == TypeKind::TAF3;
        }
    }
    return false;
}

bool TypeChecker::member_is_taf3(Expr* object_expr, const std::string& member) {
    if (!object_expr) return false;
    if (!std::holds_alternative<IdentifierExpr>(object_expr->data)) return false;
    auto sym = resolve_symbol(std::get<IdentifierExpr>(object_expr->data).name);
    if (!sym || !sym->type) return false;
    if (sym->type->kind != TypeKind::CLASS && sym->type->kind != TypeKind::STRUCT) return false;
    auto fit = sym->type->fields.find(member);
    if (fit == sym->type->fields.end() || !fit->second.type) return false;
    return fit->second.type->kind == TypeKind::TAF3;
}

void TypeChecker::resolve_triples_expr(Expr* expr, bool expect_taf3) {
    if (!expr) return;
    std::visit([&](auto& e) {
        using T = std::decay_t<decltype(e)>;
        if constexpr (std::is_same_v<T, AmbiguousTripleExpr>) {
            rewrite_triple(expr, expect_taf3);
        } else if constexpr (std::is_same_v<T, BinaryExpr>) {
            bool arith = (e.op == BinaryOp::ADD || e.op == BinaryOp::SUB
                          || e.op == BinaryOp::MUL || e.op == BinaryOp::DIV
                          || e.op == BinaryOp::MATMUL);
            bool left_is_triple = std::holds_alternative<AmbiguousTripleExpr>(e.left->data);
            bool right_is_triple = std::holds_alternative<AmbiguousTripleExpr>(e.right->data);
            if (arith && (left_is_triple || right_is_triple)) {
                // Resolve the non-triple side first so an existing TAFPU anchor
                // is visible before deciding the triple side(s).
                if (!left_is_triple) resolve_triples_expr(e.left, false);
                if (!right_is_triple) resolve_triples_expr(e.right, false);
                bool tafpu_ctx = is_tafpuish(e.left) || is_tafpuish(e.right)
                                 // Legacy: two bare triples in arithmetic were TAFPU math.
                                 || (left_is_triple && right_is_triple);
                if (left_is_triple) rewrite_triple(e.left, tafpu_ctx);
                if (right_is_triple) rewrite_triple(e.right, tafpu_ctx);
            } else {
                resolve_triples_expr(e.left, false);
                resolve_triples_expr(e.right, false);
            }
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            resolve_triples_expr(e.operand, false);
        } else if constexpr (std::is_same_v<T, CallExpr>) {
            // assert_eq(a, b): a triple argument follows the OTHER side's type.
            if (e.callee == "assert_eq" && e.args.size() == 2) {
                resolve_triples_expr(e.args[0], false);
                bool a0_tafpu = is_tafpuish(e.args[0]);
                resolve_triples_expr(e.args[1], a0_tafpu);
                return;
            }
            auto sig = functions_.find(e.callee);
            for (size_t i = 0; i < e.args.size(); ++i) {
                bool arg_expect = false;
                if (sig != functions_.end() && sig->second
                    && i < sig->second->param_types.size()
                    && sig->second->param_types[i]
                    && sig->second->param_types[i]->kind == TypeKind::TAF3) {
                    arg_expect = true;
                }
                resolve_triples_expr(e.args[i], arg_expect);
            }
        } else if constexpr (std::is_same_v<T, TafpuConstructExpr>) {
            resolve_triples_expr(e.a, false);
            resolve_triples_expr(e.b, false);
            resolve_triples_expr(e.s, false);
        } else if constexpr (std::is_same_v<T, MemberAccessExpr>) {
            resolve_triples_expr(e.object, false);
        } else if constexpr (std::is_same_v<T, MethodCallExpr>) {
            resolve_triples_expr(e.object, false);
            for (Expr* arg : e.args) resolve_triples_expr(arg, false);
        } else if constexpr (std::is_same_v<T, IndexExpr>) {
            resolve_triples_expr(e.object, false);
            if (!e.indices.empty()) {
                for (Expr* idx : e.indices) resolve_triples_expr(idx, false);
            } else {
                resolve_triples_expr(e.index, false);
            }
        } else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) {
            for (Expr* el : e.elements) resolve_triples_expr(el, false);
        } else if constexpr (std::is_same_v<T, TupleLiteralExpr>) {
            for (Expr* el : e.elements) resolve_triples_expr(el, false);
        } else if constexpr (std::is_same_v<T, FStringExpr>) {
            for (Expr* child : e.expressions) resolve_triples_expr(child, false);
        } else if constexpr (std::is_same_v<T, ComptimeExpr>) {
            resolve_triples_expr(e.expr, false);
        }
        // Literals: nothing to descend into.
    }, expr->data);
}

void TypeChecker::resolve_triples_stmt(Stmt* stmt) {
    if (!stmt) return;
    // NOTE: only the DIRECT expressions of this statement are resolved here.
    // Nested statements are resolved lazily by their own check_stmt calls,
    // so sibling declarations (e.g. `let x: taf3 = ...`) are already in
    // scope when a later assignment needs their type.
    std::visit([&](auto& s) {
        using T = std::decay_t<decltype(s)>;
        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            bool expect = (s.type == DataType::TAF3);
            if (s.init) resolve_triples_expr(s.init, expect);
        } else if constexpr (std::is_same_v<T, TupleDestructureStmt>) {
            if (s.init) resolve_triples_expr(s.init, false);
        } else if constexpr (std::is_same_v<T, AssignStmt>) {
            auto sym = resolve_symbol(s.name);
            bool expect = sym && sym->type && sym->type->kind == TypeKind::TAF3;
            if (s.value) resolve_triples_expr(s.value, expect);
        } else if constexpr (std::is_same_v<T, MemberAssignStmt>) {
            bool expect = member_is_taf3(s.object, s.member);
            resolve_triples_expr(s.object, false);
            if (s.value) resolve_triples_expr(s.value, expect);
        } else if constexpr (std::is_same_v<T, IndexAssignStmt>) {
            resolve_triples_expr(s.object, false);
            if (!s.indices.empty()) {
                for (Expr* idx : s.indices) resolve_triples_expr(idx, false);
            } else {
                resolve_triples_expr(s.index, false);
            }
            resolve_triples_expr(s.value, false);
        } else if constexpr (std::is_same_v<T, ExprStmt>) {
            resolve_triples_expr(s.expr, false);
        } else if constexpr (std::is_same_v<T, IfStmt>) {
            resolve_triples_expr(s.condition, false);
        } else if constexpr (std::is_same_v<T, WhileStmt>) {
            resolve_triples_expr(s.condition, false);
        } else if constexpr (std::is_same_v<T, ForStmt>) {
            resolve_triples_stmt(s.init);
            resolve_triples_expr(s.cond, false);
            resolve_triples_stmt(s.update);
            resolve_triples_expr(s.iterable, false);
        } else if constexpr (std::is_same_v<T, ReturnStmt>) {
            bool expect = current_fn_return_type_
                          && current_fn_return_type_->kind == TypeKind::TAF3;
            if (s.value) resolve_triples_expr(s.value, expect);
        } else if constexpr (std::is_same_v<T, Branch3Stmt>) {
            resolve_triples_expr(s.condition, false);
        }
        // BlockStmt/IfStmt branches/MatchStmt arms/FnDeclStmt bodies: resolved
        // lazily when their own check_stmt runs. Declarations/imports: nothing.
    }, stmt->data);
}

void TypeChecker::check_return(ReturnStmt& stmt) {
    TypePtr ret_type = stmt.value ? check_expr(stmt.value) : Type::make_void();
    if (current_fn_return_type_) {
        // Non-escaping slice check: cannot return slice referencing local stack array
        if (current_fn_return_type_->kind == TypeKind::SLICE_VIEW && stmt.value) {
            if (std::holds_alternative<IdentifierExpr>(stmt.value->data)) {
                const auto& var_name = std::get<IdentifierExpr>(stmt.value->data).name;
                auto sym = resolve_symbol(var_name);
                if (sym && sym->type && sym->type->kind == TypeKind::FIXED_ARRAY) {
                    report_error("Non-escaping slice violation: cannot return slice referencing local stack array '" + var_name + "'; slice would outlive stack frame.", stmt.loc);
                    return;
                }
            }
            if (ret_type && ret_type->kind == TypeKind::FIXED_ARRAY) {
                report_error("Non-escaping slice violation: cannot return slice referencing temporary local array; slice would outlive stack frame.", stmt.loc);
                return;
            }
        }

        if (!current_fn_return_type_->is_assignable_from(ret_type)) {
            report_error("Function return type mismatch: Expected '" + current_fn_return_type_->to_string()
                         + "', but returned '" + ret_type->to_string() + "'.", stmt.loc);
        }
    }
}

void TypeChecker::check_fn_decl(FnDeclStmt& stmt) {
    TypePtr ret_type = (!stmt.return_custom_name.empty()) ? resolve_type_syntax(stmt.return_custom_name) : Type::from_data_type(stmt.return_type);
    stmt.resolved_ret_type = ret_type ? ret_type : Type::make_void();

    std::vector<TypePtr> param_types;
    for (auto& p : stmt.params) {
        TypePtr pt = (!p.custom_type_name.empty()) ? resolve_type_syntax(p.custom_type_name) : Type::from_data_type(p.type);
        p.resolved_type = pt ? pt : Type::make_any();
        param_types.push_back(p.resolved_type);
    }

    functions_[stmt.name] = Type::make_function(param_types, stmt.resolved_ret_type);

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
    if (declared_fn_locs_.count(stmt.name)) {
        report_error("Cannot declare struct '" + stmt.name + "' with the same name as a function (declared at line "
                         + std::to_string(declared_fn_locs_[stmt.name].line) + ").",
                     stmt.loc);
    }
    auto st_type = type_defs_[stmt.name];
    if (!st_type) {
        st_type = Type::make_struct(stmt.name);
        type_defs_[stmt.name] = st_type;
    }

    for (const auto& f : stmt.fields) {
        TypePtr ftype = resolve_type_from_data_type(f.type, f.custom_type_name);
        if (ftype && (ftype->kind == TypeKind::SLICE_VIEW || ftype->kind == TypeKind::TENSOR_VIEW)) {
            report_error("Struct field '" + f.name + "' cannot hold borrowed view '" + ftype->to_string() + "': violates region lifetime invariant.", stmt.loc);
        }
        FieldTypeInfo fi;
        fi.name = f.name;
        fi.type = ftype ? ftype : Type::from_data_type(f.type);
        fi.is_pub = f.is_pub;
        st_type->fields[f.name] = fi;
    }

    // Register constructor function
    std::vector<TypePtr> ctor_params;
    for (const auto& f : stmt.fields) {
        TypePtr ftype = resolve_type_from_data_type(f.type, f.custom_type_name);
        ctor_params.push_back(ftype ? ftype : Type::from_data_type(f.type));
    }
    functions_[stmt.name] = Type::make_function(ctor_params, st_type);
}

void TypeChecker::check_class_decl(ClassDeclStmt& stmt) {
    if (declared_fn_locs_.count(stmt.name)) {
        report_error("Cannot declare class '" + stmt.name + "' with the same name as a function (declared at line "
                         + std::to_string(declared_fn_locs_[stmt.name].line) + ").",
                     stmt.loc);
    }
    auto cl_type = type_defs_[stmt.name];
    if (!cl_type) {
        cl_type = Type::make_class(stmt.name, stmt.super_class);
        type_defs_[stmt.name] = cl_type;
    }

    for (const auto& f : stmt.fields) {
        TypePtr ftype = resolve_type_from_data_type(f.type, f.custom_type_name);
        if (ftype && (ftype->kind == TypeKind::SLICE_VIEW || ftype->kind == TypeKind::TENSOR_VIEW)) {
            report_error("Class field '" + f.name + "' cannot hold borrowed view '" + ftype->to_string() + "': violates region lifetime invariant.", stmt.loc);
        }
        FieldTypeInfo fi;
        fi.name = f.name;
        fi.type = ftype ? ftype : Type::from_data_type(f.type);
        fi.is_pub = f.is_pub;
        cl_type->fields[f.name] = fi;
    }

    // Register constructor function
    std::vector<TypePtr> ctor_params;
    for (const auto& f : stmt.fields) {
        TypePtr ftype = resolve_type_from_data_type(f.type, f.custom_type_name);
        ctor_params.push_back(ftype ? ftype : Type::from_data_type(f.type));
    }
    functions_[stmt.name] = Type::make_function(ctor_params, cl_type);

    // Interface conformance: every method of every implemented interface
    // must exist on the class (by name and arity).
    std::vector<std::string> ifaces = stmt.interfaces;
    if (!stmt.super_class.empty()) ifaces.push_back(stmt.super_class);
    for (const auto& iname : ifaces) {
        auto iit = type_defs_.find(iname);
        if (iit == type_defs_.end() || !iit->second
            || iit->second->kind != TypeKind::INTERFACE) continue;
        for (const auto& [mname, mi] : iit->second->methods) {
            auto cit = cl_type->methods.find(mname);
            if (cit == cl_type->methods.end()) {
                report_error("Class '" + stmt.name + "' does not implement interface '"
                                 + iname + "': missing method '" + mname + "'.", stmt.loc);
            } else if (cit->second.param_types.size() != mi.param_types.size()) {
                report_error("Method '" + mname + "' of class '" + stmt.name
                                 + "' does not match interface '" + iname + "': expected "
                                 + std::to_string(mi.param_types.size()) + " argument(s), found "
                                 + std::to_string(cit->second.param_types.size()) + ".", stmt.loc);
            }
        }
    }

    // Check methods
    for (auto& m : stmt.methods) {
        enter_scope();
        // Define 'self' or 'this' in method scope
        define_symbol("self", cl_type, true, false, stmt.loc);
        define_symbol("this", cl_type, true, false, stmt.loc);

        std::vector<TypePtr> param_types;
        for (const auto& p : m.params) {
            if (p.name == "self" || p.name == "this") continue;
            TypePtr pt = resolve_type_from_data_type(p.type, p.custom_type_name);
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
    bool cond_tafpu = is_tafpuish(stmt.condition);

    for (const auto& arm : stmt.arms) {
        // Resolve triple patterns against the condition's type context first.
        if (arm.pattern && std::holds_alternative<AmbiguousTripleExpr>(arm.pattern->data)) {
            resolve_triples_expr(arm.pattern, cond_tafpu);
        }
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
                } else if (functions_.count(e.name)) {
                    // First-class function value.
                    res = functions_[e.name];
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
        } else if constexpr (std::is_same_v<T, TupleLiteralExpr>) {
            res = check_tuple_literal(e);
        } else if constexpr (std::is_same_v<T, TritVecLiteralExpr>) {
            if (e.trits.size() == 1) {
                res = Type::make_trit();
            } else {
                res = Type::make_fixed_array(Type::make_trit(), e.trits.size());
            }
        } else if constexpr (std::is_same_v<T, LambdaExpr>) {
            std::vector<TypePtr> lam_params;
            enter_scope();
            for (auto& p : e.params) {
                TypePtr pt = (!p.custom_type_name.empty()) ? resolve_type_syntax(p.custom_type_name) : Type::from_data_type(p.type);
                p.resolved_type = pt ? pt : Type::make_any();
                define_symbol(p.name, p.resolved_type, true, false, e.loc);
                lam_params.push_back(p.resolved_type);
            }
            TypePtr lam_ret = (!e.return_custom_name.empty()) ? resolve_type_syntax(e.return_custom_name) : Type::from_data_type(e.return_type);
            e.resolved_ret_type = lam_ret ? lam_ret : Type::make_void();
            TypePtr saved_ret = current_fn_return_type_;
            current_fn_return_type_ = e.resolved_ret_type;
            if (e.body) check_stmt(e.body);
            current_fn_return_type_ = saved_ret;
            exit_scope();
            res = Type::make_function(lam_params, e.resolved_ret_type);
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
            if (operand_type->kind == TypeKind::TRIT) return Type::make_trit();
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
            if (left_type->kind == TypeKind::TRIT && right_type->kind == TypeKind::TRIT) {
                return Type::make_int(); // Automatic integer accumulator promotion
            }
            [[fallthrough]];
        case BinaryOp::SUB:
            if (left_type->kind == TypeKind::TRIT && right_type->kind == TypeKind::TRIT) {
                return Type::make_int(); // Automatic integer accumulator promotion
            }
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

        case BinaryOp::MUL:
            if (left_type->kind == TypeKind::TRIT && right_type->kind == TypeKind::TRIT) {
                return Type::make_trit();
            }
            if ((left_type->kind == TypeKind::TRIT && right_type->kind == TypeKind::TRYTE) ||
                (left_type->kind == TypeKind::TRYTE && right_type->kind == TypeKind::TRIT)) {
                return Type::make_tryte();
            }
            if ((left_type->kind == TypeKind::TRIT && right_type->kind == TypeKind::INT) ||
                (left_type->kind == TypeKind::INT && right_type->kind == TypeKind::TRIT)) {
                return Type::make_int();
            }
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

        case BinaryOp::MOD:
            if (left_type->kind == TypeKind::TRYTE || right_type->kind == TypeKind::TRYTE) {
                return Type::make_tryte();
            }
            return Type::make_int();

        case BinaryOp::BIT_AND:
        case BinaryOp::BIT_OR:
            if (left_type->kind == TypeKind::TRYTE || right_type->kind == TypeKind::TRYTE) {
                return Type::make_tryte();
            }
            if (left_type->kind == TypeKind::BOOL && right_type->kind == TypeKind::BOOL) {
                return Type::make_bool();
            }
            return Type::make_int();

        case BinaryOp::BIT_XOR: // ^ (GF(3) addition for trit, XOR for ints)
            if (left_type->kind == TypeKind::TRIT && right_type->kind == TypeKind::TRIT) {
                return Type::make_trit();
            }
            if (left_type->kind == TypeKind::TRYTE || right_type->kind == TypeKind::TRYTE) {
                return Type::make_tryte();
            }
            if (left_type->kind == TypeKind::BOOL && right_type->kind == TypeKind::BOOL) {
                return Type::make_bool();
            }
            return Type::make_int();

        case BinaryOp::SHL:
        case BinaryOp::SHR:
            if (left_type->kind == TypeKind::TRYTE) {
                return Type::make_tryte();
            }
            return Type::make_int();

        case BinaryOp::MATMUL: // @ (BitNet multiplication-free GEMM)
            if (left_type->kind == TypeKind::TVEC3 || right_type->kind == TypeKind::TVEC3) {
                return Type::make_tvec3();
            }
            return Type::make_taf3();

        case BinaryOp::SPACESHIP: // <=> 3-way comparison returning trit (-1, 0, +1)
            return Type::make_trit();

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

        case BinaryOp::LOGICAL_AND:
        case BinaryOp::LOGICAL_OR:
            return Type::make_bool();

        case BinaryOp::NULL_COALESCE:
            return left_type;
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_call(CallExpr& expr) {
    // Indirect call through a closure-typed variable: f(args)
    auto vsym = resolve_symbol(expr.callee);
    if (vsym && vsym->type && vsym->type->kind == TypeKind::FUNCTION) {
        std::vector<TypePtr> indirect_args;
        for (Expr* arg : expr.args) indirect_args.push_back(check_expr(arg));
        TypePtr ft = vsym->type;
        if (indirect_args.size() != ft->param_types.size()) {
            report_error("Function '" + expr.callee + "' expects "
                             + std::to_string(ft->param_types.size()) + " argument(s), but received "
                             + std::to_string(indirect_args.size()) + ".", expr.loc);
        }
        return ft->return_type ? ft->return_type : Type::make_any();
    }
    std::vector<TypePtr> arg_types;
    for (Expr* arg : expr.args) {
        arg_types.push_back(check_expr(arg));
    }

    // Check if callee is a Struct/Class constructor
    auto st_it = type_defs_.find(expr.callee);
    if (st_it != type_defs_.end() && (st_it->second->kind == TypeKind::STRUCT || st_it->second->kind == TypeKind::CLASS)) {
        return st_it->second;
    }

    // taf3 constructor: 3 args (a, b, s) or 2 args (a, b; implies s = 0)
    if (expr.callee == "taf3" && (expr.args.size() == 2 || expr.args.size() == 3)) {
        return Type::make_taf3();
    }

    if (expr.callee == "slice" && expr.args.size() >= 3) {
        TypePtr src_t = check_expr(expr.args[0]);
        check_expr(expr.args[1]);
        check_expr(expr.args[2]);
        if (src_t && src_t->element_type) {
            return src_t->is_mut_slice ? Type::make_mut_slice(src_t->element_type) : Type::make_slice(src_t->element_type);
        }
        return Type::make_slice(Type::make_any());
    }

    if (expr.callee == "split_at_mut" && expr.args.size() == 2) {
        TypePtr src_t = check_expr(expr.args[0]);
        check_expr(expr.args[1]);
        TypePtr elem_t = (src_t && src_t->element_type) ? src_t->element_type : Type::make_any();
        TypePtr slice_t = Type::make_mut_slice(elem_t);
        return Type::make_tuple({slice_t, slice_t});
    }

    if (expr.callee == "tensor_view" && expr.args.size() >= 2) {
        TypePtr src_t = check_expr(expr.args[0]);
        for (size_t i = 1; i < expr.args.size(); ++i) {
            TypePtr dt = check_expr(expr.args[i]);
            if (dt && !dt->is_integer() && dt->kind != TypeKind::ANY) {
                report_error("TensorView dimension argument must be an integer, got '" + dt->to_string() + "'.", expr.loc);
            }
        }
        TypePtr elem_t = (src_t && src_t->element_type) ? src_t->element_type : Type::make_any();
        size_t rank = expr.args.size() - 1;
        return Type::make_tensor_view(elem_t, rank);
    }

    auto it = functions_.find(expr.callee);
    if (it != functions_.end()) {
        TypePtr fn_type = it->second;
        if (fn_type && fn_type->kind == TypeKind::FUNCTION) {
            // Static Alias Analysis for mutable slice parameters
            for (size_t i = 0; i < fn_type->param_types.size() && i < expr.args.size(); ++i) {
                if (fn_type->param_types[i]->is_mut_slice && expr.args[i]) {
                    if (std::holds_alternative<IdentifierExpr>(expr.args[i]->data)) {
                        const std::string& out_name = std::get<IdentifierExpr>(expr.args[i]->data).name;
                        for (size_t j = 0; j < expr.args.size(); ++j) {
                            if (i != j && expr.args[j] && std::holds_alternative<IdentifierExpr>(expr.args[j]->data)) {
                                const std::string& other_name = std::get<IdentifierExpr>(expr.args[j]->data).name;
                                if (out_name == other_name) {
                                    report_error("Aliasing violation in call to '" + expr.callee + "': Mutable output slice '"
                                                 + out_name + "' (arg " + std::to_string(i + 1)
                                                 + ") aliases with argument " + std::to_string(j + 1) + ".", expr.loc);
                                }
                            }
                        }
                    }
                }
            }

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
    // Aliased import: gui.fn(args) checks as a plain function call.
    if (expr.object && std::holds_alternative<IdentifierExpr>(expr.object->data)) {
        const auto& obj_name = std::get<IdentifierExpr>(expr.object->data).name;
        if (import_aliases_.count(obj_name)) {
            std::vector<TypePtr> arg_types;
            for (Expr* arg : expr.args) {
                arg_types.push_back(check_expr(arg));
            }
            std::string callee = obj_name + "." + expr.method;
            auto it = functions_.find(callee);
            if (it == functions_.end()) {
                report_error("Unknown function '" + callee + "' (module '"
                                 + obj_name + "' has no public function '" + expr.method + "').",
                             expr.loc);
                return Type::make_any();
            }
            TypePtr fn_type = it->second;
            if (fn_type && fn_type->kind == TypeKind::FUNCTION) {
                if (arg_types.size() != fn_type->param_types.size()) {
                    report_error("Function '" + callee + "' expects "
                                     + std::to_string(fn_type->param_types.size())
                                     + " argument(s), but received " + std::to_string(arg_types.size()) + ".",
                                 expr.loc);
                } else {
                    for (size_t i = 0; i < arg_types.size(); ++i) {
                        if (!fn_type->param_types[i]->is_assignable_from(arg_types[i])) {
                            report_error("Argument " + std::to_string(i + 1) + " of function '"
                                             + callee + "': Cannot pass '" + arg_types[i]->to_string()
                                             + "' to parameter of type '"
                                             + fn_type->param_types[i]->to_string() + "'.",
                                         expr.loc);
                        }
                    }
                }
                return fn_type->return_type;
            }
            return Type::make_any();
        }
    }

    TypePtr obj_type = check_expr(expr.object);
    std::vector<TypePtr> arg_types;
    for (Expr* arg : expr.args) {
        arg_types.push_back(check_expr(arg));
    }

    if (obj_type && obj_type->kind == TypeKind::ARRAY) {
        if (expr.method == "append" || expr.method == "push") {
            return Type::make_void();
        }
        if (expr.method == "len") {
            return Type::make_int();
        }
        if (expr.method == "slice" || expr.method == "sort" || expr.method == "reverse"
            || expr.method == "concat") {
            return Type::make_array(Type::make_any());
        }
        if (expr.method == "contains") {
            return Type::make_bool();
        }
        if (expr.method == "index_of") {
            return Type::make_int();
        }
        if (expr.method == "join") {
            return Type::make_string();
        }
        if (expr.method == "map" || expr.method == "filter") {
            for (Expr* a : expr.args) check_expr(a);
            return Type::make_array(Type::make_any());
        }
        if (expr.method == "reduce") {
            for (Expr* a : expr.args) check_expr(a);
            return Type::make_any();
        }
        return Type::make_any();
    }

    if (obj_type && obj_type->kind == TypeKind::STRING) {
        if (expr.method == "len" || expr.method == "length" || expr.method == "size"
            || expr.method == "index_of" || expr.method == "ulen" || expr.method == "text_width") {
            return Type::make_int();
        }
        if (expr.method == "pop" || expr.method == "slice" || expr.method == "substr"
            || expr.method == "trim" || expr.method == "uslice" || expr.method == "uindex") {
            return Type::make_string();
        }
        if (expr.method == "split") {
            return Type::make_array(Type::make_string());
        }
        if (expr.method == "contains") {
            return Type::make_bool();
        }
        report_error("string has no method '" + expr.method + "'.", expr.loc);
        return Type::make_any();
    }

    if (obj_type && obj_type->kind == TypeKind::INTERFACE) {
        // Interface-typed receiver: dispatch is dynamic at runtime; here we
        // validate the method exists on the interface and check arity.
        auto mit = obj_type->methods.find(expr.method);
        if (mit == obj_type->methods.end()) {
            report_error("Interface '" + obj_type->name + "' has no method '" + expr.method + "'.", expr.loc);
            return Type::make_any();
        }
        const auto& mi = mit->second;
        if (arg_types.size() != mi.param_types.size()) {
            report_error("Method '" + expr.method + "' of interface '" + obj_type->name + "' expects "
                             + std::to_string(mi.param_types.size()) + " argument(s), but received "
                             + std::to_string(arg_types.size()) + ".", expr.loc);
        }
        return mi.return_type ? mi.return_type : Type::make_any();
    }

    if (obj_type && (obj_type->kind == TypeKind::CLASS || obj_type->kind == TypeKind::STRUCT)) {
        // Walk the inheritance chain looking for the method.
        const TypePtr* cursor = &obj_type;
        int depth = 0;
        while (cursor && *cursor && depth < 32) {
            auto mit = (*cursor)->methods.find(expr.method);
            if (mit != (*cursor)->methods.end()) {
                const auto& mi = mit->second;
                if (arg_types.size() != mi.param_types.size()) {
                    report_error("Method '" + expr.method + "' of class '" + obj_type->name + "' expects "
                                     + std::to_string(mi.param_types.size()) + " argument(s), but received "
                                     + std::to_string(arg_types.size()) + ".",
                                 expr.loc);
                } else {
                    for (size_t i = 0; i < arg_types.size(); ++i) {
                        if (!mi.param_types[i]->is_assignable_from(arg_types[i])) {
                            report_error("Argument " + std::to_string(i + 1) + " of method '" + expr.method
                                             + "': Cannot pass '" + arg_types[i]->to_string() + "' to parameter of type '"
                                             + mi.param_types[i]->to_string() + "'.",
                                         expr.loc);
                        }
                    }
                }
                return mi.return_type ? mi.return_type : Type::make_any();
            }
            if ((*cursor)->super_name.empty()) break;
            auto sit = type_defs_.find((*cursor)->super_name);
            if (sit == type_defs_.end()) break;
            cursor = &sit->second;
            ++depth;
        }
        report_error("Class '" + obj_type->name + "' has no method '" + expr.method + "'.", expr.loc);
        return Type::make_any();
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_index(IndexExpr& expr) {
    TypePtr obj_type = check_expr(expr.object);
    if (!expr.indices.empty()) {
        for (Expr* idx : expr.indices) {
            TypePtr idx_type = check_expr(idx);
            if (idx_type && !idx_type->is_integer() && idx_type->kind != TypeKind::ANY) {
                report_error("Index must be an integer, received '" + idx_type->to_string() + "'.", expr.loc);
            }
        }
    } else if (expr.index) {
        TypePtr idx_type = check_expr(expr.index);
        if (idx_type && !idx_type->is_integer() && idx_type->kind != TypeKind::ANY) {
            report_error("Array index must be an integer, received '" + idx_type->to_string() + "'.", expr.loc);
        }
    }

    if (obj_type) {
        if (obj_type->kind == TypeKind::TENSOR_VIEW) {
            size_t num_indices = expr.indices.empty() ? (expr.index ? 1 : 0) : expr.indices.size();
            if (num_indices != obj_type->rank) {
                report_error("TensorView with rank " + std::to_string(obj_type->rank) + " indexed with " + std::to_string(num_indices) + " indices.", expr.loc);
            }
            return obj_type->element_type ? obj_type->element_type : Type::make_any();
        }
        if (obj_type->kind == TypeKind::ARRAY || obj_type->kind == TypeKind::FIXED_ARRAY || obj_type->kind == TypeKind::SLICE_VIEW) {
            return obj_type->element_type ? obj_type->element_type : Type::make_any();
        }
        if (obj_type->kind == TypeKind::STRING) {
            return Type::make_string();
        }
    }

    return Type::make_any();
}

TypePtr TypeChecker::check_tuple_literal(TupleLiteralExpr& expr) {
    std::vector<TypePtr> elem_types;
    for (Expr* el : expr.elements) {
        elem_types.push_back(check_expr(el));
    }
    return Type::make_tuple(elem_types);
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
