#include "compiler/types.hpp"
#include <sstream>

namespace setun {

TypePtr Type::make_primitive(TypeKind k) {
    auto t = std::make_shared<Type>();
    t->kind = k;
    switch (k) {
        case TypeKind::VOID: t->name = "void"; break;
        case TypeKind::INT: t->name = "int"; break;
        case TypeKind::TRYTE: t->name = "tryte"; break;
        case TypeKind::TRIT: t->name = "trit"; break;
        case TypeKind::TAF3: t->name = "taf3"; break;
        case TypeKind::FLOAT: t->name = "float"; break;
        case TypeKind::BOOL: t->name = "bool"; break;
        case TypeKind::STRING: t->name = "string"; break;
        case TypeKind::TVEC3: t->name = "tvec3"; break;
        case TypeKind::TQUAT: t->name = "tquat"; break;
        default: t->name = "unknown"; break;
    }
    return t;
}

TypePtr Type::make_void() { return make_primitive(TypeKind::VOID); }
TypePtr Type::make_int() { return make_primitive(TypeKind::INT); }
TypePtr Type::make_tryte() { return make_primitive(TypeKind::TRYTE); }
TypePtr Type::make_trit() { return make_primitive(TypeKind::TRIT); }
TypePtr Type::make_taf3() { return make_primitive(TypeKind::TAF3); }
TypePtr Type::make_float() { return make_primitive(TypeKind::FLOAT); }
TypePtr Type::make_bool() { return make_primitive(TypeKind::BOOL); }
TypePtr Type::make_string() { return make_primitive(TypeKind::STRING); }
TypePtr Type::make_tvec3() { return make_primitive(TypeKind::TVEC3); }
TypePtr Type::make_tquat() { return make_primitive(TypeKind::TQUAT); }

TypePtr Type::make_any() {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::ANY;
    t->name = "any";
    return t;
}

TypePtr Type::make_unknown() {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::UNKNOWN;
    t->name = "<unknown>";
    return t;
}

TypePtr Type::make_array(TypePtr elem_type) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::ARRAY;
    t->element_type = elem_type ? elem_type : make_any();
    t->name = "Array<" + t->element_type->to_string() + ">";
    return t;
}

TypePtr Type::make_struct(const std::string& name) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::STRUCT;
    t->name = name;
    return t;
}

TypePtr Type::make_class(const std::string& name, const std::string& super) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::CLASS;
    t->name = name;
    t->super_name = super;
    return t;
}

TypePtr Type::make_interface(const std::string& name) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::INTERFACE;
    t->name = name;
    return t;
}

TypePtr Type::make_enum(const std::string& name) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::ENUM;
    t->name = name;
    return t;
}

TypePtr Type::make_function(const std::vector<TypePtr>& params, TypePtr ret) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::FUNCTION;
    t->param_types = params;
    t->return_type = ret ? ret : make_void();

    std::ostringstream oss;
    oss << "fn(";
    for (size_t i = 0; i < params.size(); ++i) {
        if (i > 0) oss << ", ";
        oss << (params[i] ? params[i]->to_string() : "any");
    }
    oss << ") -> " << t->return_type->to_string();
    t->name = oss.str();
    return t;
}

TypePtr Type::make_generic_param(const std::string& param_name) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::GENERIC_PARAM;
    t->name = param_name;
    return t;
}

TypePtr Type::make_generic_instance(const std::string& base_name, const std::vector<TypePtr>& args) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::GENERIC_INSTANCE;
    t->name = base_name;
    t->type_args = args;
    return t;
}

TypePtr Type::from_data_type(DataType dt) {
    switch (dt) {
        case DataType::VOID: return make_void();
        case DataType::INT: return make_int();
        case DataType::TRYTE: return make_tryte();
        case DataType::TAF3: return make_taf3();
        case DataType::FLOAT: return make_float();
        case DataType::BOOL: return make_bool();
        case DataType::STRING: return make_string();
        case DataType::ARRAY: return make_array(make_any());
        case DataType::TVEC3: return make_tvec3();
        case DataType::OBJECT: return make_any();
        case DataType::ANY: return make_any();
        default: return make_unknown();
    }
}

DataType Type::to_data_type() const {
    switch (kind) {
        case TypeKind::VOID: return DataType::VOID;
        case TypeKind::INT: return DataType::INT;
        case TypeKind::TRYTE:
        case TypeKind::TRIT: return DataType::TRYTE;
        case TypeKind::TAF3: return DataType::TAF3;
        case TypeKind::FLOAT: return DataType::FLOAT;
        case TypeKind::BOOL: return DataType::BOOL;
        case TypeKind::STRING: return DataType::STRING;
        case TypeKind::ARRAY: return DataType::ARRAY;
        case TypeKind::TVEC3: return DataType::TVEC3;
        case TypeKind::STRUCT:
        case TypeKind::CLASS:
        case TypeKind::INTERFACE:
        case TypeKind::ENUM: return DataType::OBJECT;
        default: return DataType::ANY;
    }
}

bool Type::is_numeric() const {
    return kind == TypeKind::INT || kind == TypeKind::TRYTE ||
           kind == TypeKind::TRIT || kind == TypeKind::TAF3 ||
           kind == TypeKind::FLOAT;
}

bool Type::is_integer() const {
    return kind == TypeKind::INT || kind == TypeKind::TRYTE || kind == TypeKind::TRIT;
}

bool Type::is_algebraic() const {
    return kind == TypeKind::TAF3;
}

bool Type::is_boolean() const {
    return kind == TypeKind::BOOL;
}

bool Type::is_void() const {
    return kind == TypeKind::VOID;
}

bool Type::is_any() const {
    return kind == TypeKind::ANY;
}

bool Type::is_generic() const {
    return kind == TypeKind::GENERIC_PARAM;
}

bool Type::is_equal_to(const TypePtr& other) const {
    if (!other) return false;
    if (this == other.get()) return true;

    if (kind == TypeKind::ANY || other->kind == TypeKind::ANY) {
        return true;
    }

    if (kind != other->kind) return false;

    switch (kind) {
        case TypeKind::VOID ... TypeKind::STRING:
        case TypeKind::TVEC3:
        case TypeKind::TQUAT:
            return true;
        case TypeKind::ARRAY:
            if (!element_type || !other->element_type) return true;
            return element_type->is_equal_to(other->element_type);
        case TypeKind::STRUCT:
        case TypeKind::CLASS:
        case TypeKind::INTERFACE:
        case TypeKind::ENUM:
        case TypeKind::GENERIC_PARAM:
            return name == other->name;
        case TypeKind::GENERIC_INSTANCE:
            if (name != other->name) return false;
            if (type_args.size() != other->type_args.size()) return false;
            for (size_t i = 0; i < type_args.size(); ++i) {
                if (!type_args[i]->is_equal_to(other->type_args[i])) return false;
            }
            return true;
        case TypeKind::FUNCTION: {
            if (param_types.size() != other->param_types.size()) return false;
            for (size_t i = 0; i < param_types.size(); ++i) {
                if (!param_types[i]->is_equal_to(other->param_types[i])) return false;
            }
            if (!return_type || !other->return_type) return true;
            return return_type->is_equal_to(other->return_type);
        }
        default:
            return true;
    }
}

bool Type::is_assignable_from(const TypePtr& source) const {
    if (!source) return false;
    if (kind == TypeKind::ANY || source->kind == TypeKind::ANY) return true;

    if (is_equal_to(source)) return true;

    // Promotion: int / tryte / trit can promote to taf3 in Q(sqrt(3))
    if (kind == TypeKind::TAF3 && source->is_integer()) {
        return true;
    }

    // Tryte can promote to int
    if (kind == TypeKind::INT && (source->kind == TypeKind::TRYTE || source->kind == TypeKind::TRIT)) {
        return true;
    }

    // Integer/Tryte can promote to float
    if (kind == TypeKind::FLOAT && source->is_numeric()) {
        return true;
    }

    // Enum can be assigned from integer (variant discriminant)
    if (kind == TypeKind::ENUM && source->is_integer()) {
        return true;
    }

    // Class inheritance check
    if (kind == TypeKind::CLASS && source->kind == TypeKind::CLASS) {
        if (source->super_name == name) return true;
        for (const auto& iface : source->interfaces) {
            if (iface == name) return true;
        }
    }

    // Interface implementation check
    if (kind == TypeKind::INTERFACE) {
        for (const auto& iface : source->interfaces) {
            if (iface == name) return true;
        }
    }

    // Generic parameter match
    if (kind == TypeKind::GENERIC_PARAM || source->kind == TypeKind::GENERIC_PARAM) {
        return true;
    }

    return false;
}

bool Type::can_promote_to(const TypePtr& target) const {
    if (!target) return false;
    return target->is_assignable_from(std::const_pointer_cast<Type>(shared_from_this()));
}

std::string Type::to_string() const {
    if (kind == TypeKind::ARRAY) {
        return "Array<" + (element_type ? element_type->to_string() : "any") + ">";
    }
    if (kind == TypeKind::GENERIC_INSTANCE) {
        std::ostringstream oss;
        oss << name << "<";
        for (size_t i = 0; i < type_args.size(); ++i) {
            if (i > 0) oss << ", ";
            oss << (type_args[i] ? type_args[i]->to_string() : "any");
        }
        oss << ">";
        return oss.str();
    }
    return name.empty() ? "<unnamed>" : name;
}

} // namespace setun
