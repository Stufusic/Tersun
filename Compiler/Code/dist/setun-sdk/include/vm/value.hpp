#pragma once

#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include <variant>
#include <string>
#include <iostream>
#include <sstream>

namespace setun {

struct VMValue {
    enum class Type {
        NIL,
        INT,
        TRYTE,
        TAFPU,
        FLOAT,
        BOOL,
        STRING
    };

    std::variant<std::monostate, int64_t, int16_t, TafpuNum, double, bool, std::string> data;

    VMValue() : data(std::monostate{}) {}
    VMValue(int64_t v) : data(v) {}
    VMValue(int16_t v) : data(v) {}
    VMValue(TafpuNum v) : data(v) {}
    VMValue(double v) : data(v) {}
    VMValue(bool v) : data(v) {}
    VMValue(std::string v) : data(std::move(v)) {}
    VMValue(const char* v) : data(std::string(v)) {}

    Type type() const {
        if (std::holds_alternative<int64_t>(data)) return Type::INT;
        if (std::holds_alternative<int16_t>(data)) return Type::TRYTE;
        if (std::holds_alternative<TafpuNum>(data)) return Type::TAFPU;
        if (std::holds_alternative<double>(data)) return Type::FLOAT;
        if (std::holds_alternative<bool>(data)) return Type::BOOL;
        if (std::holds_alternative<std::string>(data)) return Type::STRING;
        return Type::NIL;
    }

    bool is_int() const { return std::holds_alternative<int64_t>(data); }
    bool is_tryte() const { return std::holds_alternative<int16_t>(data); }
    bool is_tafpu() const { return std::holds_alternative<TafpuNum>(data); }
    bool is_float() const { return std::holds_alternative<double>(data); }
    bool is_bool() const { return std::holds_alternative<bool>(data); }
    bool is_string() const { return std::holds_alternative<std::string>(data); }

    int64_t as_int() const {
        if (is_int()) return std::get<int64_t>(data);
        if (is_tryte()) return static_cast<int64_t>(std::get<int16_t>(data));
        if (is_bool()) return std::get<bool>(data) ? 1 : 0;
        if (is_tafpu()) return static_cast<int64_t>(std::get<TafpuNum>(data).to_double());
        if (is_float()) return static_cast<int64_t>(std::get<double>(data));
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
        return false;
    }

    std::string to_string() const {
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
        return "nil";
    }

    // Arithmetic operators
    VMValue add(const VMValue& other) const {
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

} // namespace setun
