#pragma once

#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include <variant>
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
#include <iostream>
#include <sstream>

namespace setun {

struct VMObject;
struct VTable;

struct VTable {
    std::string class_name;
    std::string super_class;
    std::unordered_map<std::string, uint16_t> methods; // method_name -> bytecode IP
};

struct VMValue {
    enum class Type {
        NIL,
        INT,
        TRYTE,
        TAFPU,
        FLOAT,
        BOOL,
        STRING,
        OBJECT,
        ARRAY
    };

    std::variant<std::monostate, int64_t, int16_t, TafpuNum, double, bool, std::string,
                 std::shared_ptr<VMObject>, std::shared_ptr<std::vector<VMValue>>> data;

    VMValue() : data(std::monostate{}) {}
    VMValue(int64_t v) : data(v) {}
    VMValue(int16_t v) : data(v) {}
    VMValue(TafpuNum v) : data(v) {}
    VMValue(double v) : data(v) {}
    VMValue(bool v) : data(v) {}
    VMValue(std::string v) : data(std::move(v)) {}
    VMValue(const char* v) : data(std::string(v)) {}
    VMValue(std::shared_ptr<VMObject> obj) : data(std::move(obj)) {}
    VMValue(std::shared_ptr<std::vector<VMValue>> arr) : data(std::move(arr)) {}

    Type type() const {
        if (std::holds_alternative<int64_t>(data)) return Type::INT;
        if (std::holds_alternative<int16_t>(data)) return Type::TRYTE;
        if (std::holds_alternative<TafpuNum>(data)) return Type::TAFPU;
        if (std::holds_alternative<double>(data)) return Type::FLOAT;
        if (std::holds_alternative<bool>(data)) return Type::BOOL;
        if (std::holds_alternative<std::string>(data)) return Type::STRING;
        if (std::holds_alternative<std::shared_ptr<VMObject>>(data)) return Type::OBJECT;
        if (std::holds_alternative<std::shared_ptr<std::vector<VMValue>>>(data)) return Type::ARRAY;
        return Type::NIL;
    }

    bool is_int() const { return std::holds_alternative<int64_t>(data); }
    bool is_tryte() const { return std::holds_alternative<int16_t>(data); }
    bool is_tafpu() const { return std::holds_alternative<TafpuNum>(data); }
    bool is_float() const { return std::holds_alternative<double>(data); }
    bool is_bool() const { return std::holds_alternative<bool>(data); }
    bool is_string() const { return std::holds_alternative<std::string>(data); }
    bool is_object() const { return std::holds_alternative<std::shared_ptr<VMObject>>(data); }
    bool is_array() const { return std::holds_alternative<std::shared_ptr<std::vector<VMValue>>>(data); }

    std::shared_ptr<VMObject> as_object() const {
        if (is_object()) return std::get<std::shared_ptr<VMObject>>(data);
        return nullptr;
    }

    std::shared_ptr<std::vector<VMValue>> as_array() const {
        if (is_array()) return std::get<std::shared_ptr<std::vector<VMValue>>>(data);
        return nullptr;
    }

    int64_t as_int() const {
        if (is_int()) return std::get<int64_t>(data);
        if (is_tryte()) return static_cast<int64_t>(std::get<int16_t>(data));
        if (is_bool()) return std::get<bool>(data) ? 1 : 0;
        if (is_tafpu()) return static_cast<int64_t>(std::get<TafpuNum>(data).to_double());
        if (is_float()) return static_cast<int64_t>(std::get<double>(data));
        if (is_array()) return static_cast<int64_t>(as_array() ? as_array()->size() : 0);
        return 0;
    }

    int16_t as_tryte() const {
        if (is_tryte()) return std::get<int16_t>(data);
        if (is_int()) return static_cast<int16_t>(std::get<int64_t>(data));
        return 0;
    }

    TafpuNum as_tafpu() const {
        if (is_tafpu()) return std::get<TafpuNum>(data);
        if (is_int()) return TafpuNum(std::get<int64_t>(data), 0, 0);
        if (is_tryte()) return TafpuNum(std::get<int16_t>(data), 0, 0);
        if (is_float()) return encode_dynamic(std::get<double>(data));
        return TafpuNum(0, 0, 0);
    }

    double as_float() const {
        if (is_float()) return std::get<double>(data);
        if (is_tafpu()) return std::get<TafpuNum>(data).to_double();
        if (is_int()) return static_cast<double>(std::get<int64_t>(data));
        if (is_tryte()) return static_cast<double>(std::get<int16_t>(data));
        return 0.0;
    }

    bool as_bool() const {
        if (is_bool()) return std::get<bool>(data);
        if (is_int()) return std::get<int64_t>(data) != 0;
        if (is_tryte()) return std::get<int16_t>(data) != 0;
        if (is_float()) return std::get<double>(data) != 0.0;
        if (is_tafpu()) return (std::get<TafpuNum>(data).a != 0 || std::get<TafpuNum>(data).b != 0);
        if (is_object()) return as_object() != nullptr;
        if (is_array()) return as_array() && !as_array()->empty();
        return false;
    }

    std::string to_string() const;

    // Arithmetic operators
    VMValue add(const VMValue& other) const {
        if (is_string() || other.is_string()) {
            return to_string() + other.to_string();
        }
        if (is_tafpu() || other.is_tafpu()) {
            return tafpu_add(as_tafpu(), other.as_tafpu());
        }
        if (is_float() || other.is_float()) {
            return as_float() + other.as_float();
        }
        if (is_tryte() && other.is_tryte()) {
            return static_cast<int16_t>(as_tryte() + other.as_tryte());
        }
        return as_int() + other.as_int();
    }

    VMValue sub(const VMValue& other) const {
        if (is_tafpu() || other.is_tafpu()) {
            return tafpu_sub(as_tafpu(), other.as_tafpu());
        }
        if (is_float() || other.is_float()) {
            return as_float() - other.as_float();
        }
        if (is_tryte() && other.is_tryte()) {
            return static_cast<int16_t>(as_tryte() - other.as_tryte());
        }
        return as_int() - other.as_int();
    }

    VMValue mul(const VMValue& other) const {
        if (is_tafpu() || other.is_tafpu()) {
            return tafpu_mul(as_tafpu(), other.as_tafpu());
        }
        if (is_float() || other.is_float()) {
            return as_float() * other.as_float();
        }
        if (is_tryte() && other.is_tryte()) {
            return static_cast<int16_t>(as_tryte() * other.as_tryte());
        }
        return as_int() * other.as_int();
    }

    VMValue div(const VMValue& other) const {
        if (is_tafpu() || other.is_tafpu()) {
            return tafpu_div(as_tafpu(), other.as_tafpu());
        }
        if (is_float() || other.is_float()) {
            if (other.as_float() == 0.0) throw VMException("Division by zero in floating point arithmetic.");
            return as_float() / other.as_float();
        }
        if (other.as_int() == 0) throw VMException("Division by zero in integer arithmetic.");
        return as_int() / other.as_int();
    }

    VMValue neg() const {
        if (is_tafpu()) return tafpu_neg(as_tafpu());
        if (is_float()) return -as_float();
        if (is_tryte()) return static_cast<int16_t>(-as_tryte());
        return -as_int();
    }

    VMValue ternary_cmp(const VMValue& other) const {
        if (is_string() || other.is_string()) {
            std::string s1 = to_string();
            std::string s2 = other.to_string();
            if (s1 < s2) return static_cast<int64_t>(-1);
            if (s1 > s2) return static_cast<int64_t>(1);
            return static_cast<int64_t>(0);
        }
        if (is_tafpu() || other.is_tafpu()) {
            return static_cast<int64_t>(tafpu_cmp(as_tafpu(), other.as_tafpu()));
        }
        if (is_float() || other.is_float()) {
            double d1 = as_float();
            double d2 = other.as_float();
            if (d1 < d2) return static_cast<int64_t>(-1);
            if (d1 > d2) return static_cast<int64_t>(1);
            return static_cast<int64_t>(0);
        }
        int64_t v1 = as_int();
        int64_t v2 = other.as_int();
        if (v1 < v2) return static_cast<int64_t>(-1);
        if (v1 > v2) return static_cast<int64_t>(1);
        return static_cast<int64_t>(0);
    }
};

struct VMObject {
    std::string type_name;
    bool is_class{false}; // true: Class (Ref Type), false: Struct (Value Type)
    std::shared_ptr<VTable> vtable;
    std::unordered_map<std::string, VMValue> fields;

    bool has_field(const std::string& name) const {
        return fields.find(name) != fields.end();
    }

    VMValue get_field(const std::string& name) const {
        auto it = fields.find(name);
        if (it != fields.end()) return it->second;
        return VMValue();
    }

    void set_field(const std::string& name, const VMValue& val) {
        fields[name] = val;
    }
};

inline std::string VMValue::to_string() const {
    if (is_string()) return std::get<std::string>(data);
    if (is_int()) return std::to_string(std::get<int64_t>(data));
    if (is_tryte()) {
        std::ostringstream oss;
        oss << std::get<int16_t>(data) << " (tryte @" << to_ternary_string(std::get<int16_t>(data)) << ")";
        return oss.str();
    }
    if (is_tafpu()) return std::get<TafpuNum>(data).to_string();
    if (is_float()) return std::to_string(std::get<double>(data));
    if (is_bool()) return std::get<bool>(data) ? "true" : "false";
    if (is_object()) {
        auto obj = as_object();
        if (!obj) return "nil";
        std::ostringstream oss;
        oss << obj->type_name << " { ";
        size_t idx = 0;
        for (const auto& [k, v] : obj->fields) {
            if (idx++ > 0) oss << ", ";
            oss << k << ": " << v.to_string();
        }
        oss << " }";
        return oss.str();
    }
    if (is_array()) {
        auto arr = as_array();
        if (!arr) return "[]";
        std::ostringstream oss;
        oss << "[";
        for (size_t i = 0; i < arr->size(); ++i) {
            if (i > 0) oss << ", ";
            oss << (*arr)[i].to_string();
        }
        oss << "]";
        return oss.str();
    }
    return "nil";
}

} // namespace setun
