#include "compiler/types.hpp"
#include <sstream>
#include <iostream>

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

TypePtr Type::make_fixed_array(TypePtr elem_type, size_t size) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::FIXED_ARRAY;
    t->element_type = elem_type ? elem_type : make_any();
    t->fixed_size = size;
    t->name = "[" + t->element_type->to_string() + "; " + std::to_string(size) + "]";
    return t;
}

TypePtr Type::make_slice(TypePtr elem_type) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::SLICE_VIEW;
    t->element_type = elem_type ? elem_type : make_any();
    t->is_mut_slice = false;
    t->name = "&[" + t->element_type->to_string() + "]";
    return t;
}

TypePtr Type::make_mut_slice(TypePtr elem_type) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::SLICE_VIEW;
    t->element_type = elem_type ? elem_type : make_any();
    t->is_mut_slice = true;
    t->name = "&mut [" + t->element_type->to_string() + "]";
    return t;
}

TypePtr Type::make_tuple(const std::vector<TypePtr>& elements) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::TUPLE;
    t->tuple_elements = elements;
    std::ostringstream oss;
    oss << "(";
    for (size_t i = 0; i < elements.size(); ++i) {
        if (i > 0) oss << ", ";
        oss << (elements[i] ? elements[i]->to_string() : "any");
    }
    oss << ")";
    t->name = oss.str();
    return t;
}

TypePtr Type::make_tensor_view(TypePtr elem_type, size_t rank) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::TENSOR_VIEW;
    t->element_type = elem_type ? elem_type : make_any();
    t->rank = rank;
    t->name = "TensorView<" + t->element_type->to_string() + ", " + std::to_string(rank) + ">";
    return t;
}

TypePtr Type::make_struct(const std::string& name) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::STRUCT;
    t->name = name;
    return t;
}

TypePtr Type::make_value_struct(const std::string& name) {
    auto t = std::make_shared<Type>();
    t->kind = TypeKind::VALUE_STRUCT;
    t->name = name;
    t->is_value_struct = true;
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
        case DataType::TRIT: return make_trit();
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
        case TypeKind::TRYTE: return DataType::TRYTE;
        case TypeKind::TRIT: return DataType::TRIT;
        case TypeKind::TAF3: return DataType::TAF3;
        case TypeKind::FLOAT: return DataType::FLOAT;
        case TypeKind::BOOL: return DataType::BOOL;
        case TypeKind::STRING: return DataType::STRING;
        case TypeKind::ARRAY:
        case TypeKind::FIXED_ARRAY:
        case TypeKind::SLICE_VIEW: return DataType::ARRAY;
        case TypeKind::TVEC3: return DataType::TVEC3;
        case TypeKind::STRUCT:
        case TypeKind::VALUE_STRUCT:
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
        case TypeKind::FIXED_ARRAY:
            if (fixed_size != other->fixed_size) return false;
            if (!element_type || !other->element_type) return true;
            return element_type->is_equal_to(other->element_type);
        case TypeKind::SLICE_VIEW:
            if (is_mut_slice != other->is_mut_slice) return false;
            if (!element_type || !other->element_type) return true;
            return element_type->is_equal_to(other->element_type);
        case TypeKind::STRUCT:
        case TypeKind::VALUE_STRUCT:
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
        case TypeKind::TUPLE: {
            if (tuple_elements.size() != other->tuple_elements.size()) return false;
            for (size_t i = 0; i < tuple_elements.size(); ++i) {
                if (!tuple_elements[i] || !other->tuple_elements[i]) return false;
                if (!tuple_elements[i]->is_equal_to(other->tuple_elements[i])) return false;
            }
            return true;
        }
        case TypeKind::TENSOR_VIEW: {
            if (rank != other->rank) return false;
            if (!element_type || !other->element_type) return false;
            return element_type->is_equal_to(other->element_type);
        }
        default:
            return false;
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

    // Trit promotes to tryte
    if (kind == TypeKind::TRYTE && source->kind == TypeKind::TRIT) {
        return true;
    }

    // Tryte/trit can promote to int
    if (kind == TypeKind::INT && (source->kind == TypeKind::TRYTE || source->kind == TypeKind::TRIT)) {
        return true;
    }

    // Contextual literal compatibility: trit <-> [trit; 1]
    if (kind == TypeKind::TRIT && source->kind == TypeKind::FIXED_ARRAY && source->fixed_size == 1 && source->element_type && source->element_type->kind == TypeKind::TRIT) {
        return true;
    }
    if (kind == TypeKind::FIXED_ARRAY && fixed_size == 1 && element_type && element_type->kind == TypeKind::TRIT && source->kind == TypeKind::TRIT) {
        return true;
    }

    // Slice &[T] is assignable from another slice &[T], or fixed array [T; N], or array Array<T>
    // Note: slice elements must match exactly (invariant) because &[T] is a zero-copy memory view
    if (kind == TypeKind::SLICE_VIEW) {
        if (source->kind == TypeKind::SLICE_VIEW || source->kind == TypeKind::FIXED_ARRAY || source->kind == TypeKind::ARRAY) {
            if (!element_type || !source->element_type) return true;
            if (!element_type->is_equal_to(source->element_type)) return false;
            // Mutable slice cannot be assigned from immutable slice!
            if (is_mut_slice && source->kind == TypeKind::SLICE_VIEW && !source->is_mut_slice) {
                return false;
            }
            return true;
        }
    }

    // Tuple check
    if (kind == TypeKind::TUPLE && source->kind == TypeKind::TUPLE) {
        if (tuple_elements.size() != source->tuple_elements.size()) return false;
        for (size_t i = 0; i < tuple_elements.size(); ++i) {
            if (!tuple_elements[i]->is_assignable_from(source->tuple_elements[i])) return false;
        }
        return true;
    }

    // TensorView check
    if (kind == TypeKind::TENSOR_VIEW && source->kind == TypeKind::TENSOR_VIEW) {
        if (rank != source->rank) return false;
        if (!element_type || !source->element_type) return true;
        return element_type->is_equal_to(source->element_type);
    }

    // Fixed array [T; N]
    if (kind == TypeKind::FIXED_ARRAY && source->kind == TypeKind::FIXED_ARRAY) {
        if (fixed_size != source->fixed_size) return false;
        if (!element_type || !source->element_type) return true;
        return element_type->is_equal_to(source->element_type);
    }

    // Value struct
    if (kind == TypeKind::VALUE_STRUCT && source->kind == TypeKind::VALUE_STRUCT) {
        return name == source->name;
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

    // Interface implementation check: a class whose (single) inheritance
    // slot names the interface, or that lists it explicitly.
    if (kind == TypeKind::INTERFACE) {
        if (source->kind == TypeKind::CLASS || source->kind == TypeKind::STRUCT) {
            if (source->super_name == name) return true;
        }
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
    if (kind == TypeKind::FIXED_ARRAY) {
        return "[" + (element_type ? element_type->to_string() : "any") + "; " + std::to_string(fixed_size) + "]";
    }
    if (kind == TypeKind::SLICE_VIEW) {
        return (is_mut_slice ? "&mut [" : "&[") + (element_type ? element_type->to_string() : "any") + "]";
    }
    if (kind == TypeKind::TUPLE) {
        std::ostringstream oss;
        oss << "(";
        for (size_t i = 0; i < tuple_elements.size(); ++i) {
            if (i > 0) oss << ", ";
            oss << (tuple_elements[i] ? tuple_elements[i]->to_string() : "any");
        }
        oss << ")";
        return oss.str();
    }
    if (kind == TypeKind::TENSOR_VIEW) {
        return "TensorView<" + (element_type ? element_type->to_string() : "any") + ", " + std::to_string(rank) + ">";
    }
    if (kind == TypeKind::VALUE_STRUCT) {
        return "struct " + name;
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
