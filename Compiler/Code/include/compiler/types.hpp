#pragma once

#include "compiler/ast.hpp"
#include <string>
#include <vector>
#include <memory>
#include <unordered_map>
#include <string_view>

namespace setun {

enum class TypeKind {
    VOID,
    INT,
    TRYTE,
    TRIT,
    TAF3,
    FLOAT,
    BOOL,
    STRING,
    TVEC3,
    TMAT,
    TQUAT,
    ARRAY,
    STRUCT,
    CLASS,
    INTERFACE,
    ENUM,
    FUNCTION,
    GENERIC_PARAM,
    GENERIC_INSTANCE,
    ANY,
    UNKNOWN
};

struct Type;
using TypePtr = std::shared_ptr<Type>;

struct EnumVariantType {
    std::string name;
    std::vector<TypePtr> payload_types;
};

struct FieldTypeInfo {
    std::string name;
    TypePtr type;
    bool is_pub{true};
    bool is_mut{true};
};

struct MethodTypeInfo {
    std::string name;
    std::vector<TypePtr> param_types;
    std::vector<std::string> param_names;
    TypePtr return_type;
    bool is_pub{true};
    bool is_static{false};
};

struct Type : public std::enable_shared_from_this<Type> {
    TypeKind kind{TypeKind::UNKNOWN};
    std::string name; // Name for Struct, Class, Enum, Generic param ("T"), etc.

    // For Array<T>
    TypePtr element_type{nullptr};

    // For Struct / Class / Interface
    std::string super_name;
    std::vector<std::string> interfaces;
    std::unordered_map<std::string, FieldTypeInfo> fields;
    std::unordered_map<std::string, MethodTypeInfo> methods;

    // For Enum ADT
    std::unordered_map<std::string, EnumVariantType> variants;

    // For Function (params -> return)
    std::vector<TypePtr> param_types;
    TypePtr return_type{nullptr};

    // For Generic Instance e.g. Array<int>, Option<taf3>, Pair<int, string>
    std::vector<TypePtr> type_args;

    // Factory methods
    static TypePtr make_primitive(TypeKind k);
    static TypePtr make_void();
    static TypePtr make_int();
    static TypePtr make_tryte();
    static TypePtr make_trit();
    static TypePtr make_taf3();
    static TypePtr make_float();
    static TypePtr make_bool();
    static TypePtr make_string();
    static TypePtr make_tvec3();
    static TypePtr make_tquat();
    static TypePtr make_any();
    static TypePtr make_unknown();

    static TypePtr make_array(TypePtr elem_type);
    static TypePtr make_struct(const std::string& name);
    static TypePtr make_class(const std::string& name, const std::string& super = "");
    static TypePtr make_interface(const std::string& name);
    static TypePtr make_enum(const std::string& name);
    static TypePtr make_function(const std::vector<TypePtr>& params, TypePtr ret);
    static TypePtr make_generic_param(const std::string& param_name);
    static TypePtr make_generic_instance(const std::string& base_name, const std::vector<TypePtr>& args);

    // From legacy DataType
    static TypePtr from_data_type(DataType dt);
    DataType to_data_type() const;

    // Inspection and Compatibility checks
    bool is_numeric() const;
    bool is_integer() const;
    bool is_algebraic() const;
    bool is_boolean() const;
    bool is_void() const;
    bool is_any() const;
    bool is_generic() const;

    bool is_equal_to(const TypePtr& other) const;
    bool is_assignable_from(const TypePtr& source) const;
    bool can_promote_to(const TypePtr& target) const;

    std::string to_string() const;
};

} // namespace setun
