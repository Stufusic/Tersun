#pragma once

#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
#include <iostream>
#include <sstream>
#include <cstdint>
#include <cstring>
#include <cassert>

namespace setun {

struct VMObject;
struct VTable;
struct VMClosure;

// ============================================================================
// V1 Control Variant: TaggedValue (16 Bytes)
// uint32_t type + uint32_t extra + 64-bit union = 16 bytes exactly
// ============================================================================
struct alignas(16) TaggedValue {
    enum class Type : uint32_t {
        NIL = 0,
        INT,
        TRYTE,
        TAFPU,
        FLOAT,
        BOOL,
        STRING,
        OBJECT,
        ARRAY,
        FUNCTION
    };

    Type type_{Type::NIL};
    uint32_t extra_{0};

    union ValueUnion {
        int64_t as_int;
        double as_float;
        int16_t as_tryte;
        bool as_bool;
        void* as_ptr;

        ValueUnion() : as_int(0) {}
        ValueUnion(int64_t v) : as_int(v) {}
        ValueUnion(double v) : as_float(v) {}
        ValueUnion(int16_t v) : as_tryte(v) {}
        ValueUnion(bool v) : as_bool(v) {}
        ValueUnion(void* v) : as_ptr(v) {}
    } val_{};

    // Constructors
    TaggedValue() : type_(Type::NIL) { val_.as_int = 0; }
    TaggedValue(int64_t v) : type_(Type::INT) { val_.as_int = v; }
    TaggedValue(int16_t v) : type_(Type::TRYTE) { val_.as_tryte = v; }
    TaggedValue(double v) : type_(Type::FLOAT) { val_.as_float = v; }
    TaggedValue(bool v) : type_(Type::BOOL) { val_.as_bool = v; }

    TaggedValue(TafpuNum v) : type_(Type::TAFPU) {
        val_.as_ptr = new TafpuNum(v);
    }

    TaggedValue(std::string v) : type_(Type::STRING) {
        val_.as_ptr = new std::string(std::move(v));
    }

    TaggedValue(const char* v) : type_(Type::STRING) {
        val_.as_ptr = new std::string(v);
    }

    // Destructor
    ~TaggedValue() {
        free_payload();
    }

    // Copy Constructor
    TaggedValue(const TaggedValue& other) : type_(other.type_), extra_(other.extra_) {
        copy_payload(other);
    }

    // Move Constructor
    TaggedValue(TaggedValue&& other) noexcept : type_(other.type_), extra_(other.extra_), val_(other.val_) {
        other.type_ = Type::NIL;
        other.val_.as_int = 0;
    }

    // Copy Assignment
    TaggedValue& operator=(const TaggedValue& other) {
        if (this != &other) {
            free_payload();
            type_ = other.type_;
            extra_ = other.extra_;
            copy_payload(other);
        }
        return *this;
    }

    // Move Assignment
    TaggedValue& operator=(TaggedValue&& other) noexcept {
        if (this != &other) {
            free_payload();
            type_ = other.type_;
            extra_ = other.extra_;
            val_ = other.val_;
            other.type_ = Type::NIL;
            other.val_.as_int = 0;
        }
        return *this;
    }

    // Type queries
    Type type() const { return type_; }
    bool is_int() const { return type_ == Type::INT; }
    bool is_tryte() const { return type_ == Type::TRYTE; }
    bool is_tafpu() const { return type_ == Type::TAFPU; }
    bool is_float() const { return type_ == Type::FLOAT; }
    bool is_bool() const { return type_ == Type::BOOL; }
    bool is_string() const { return type_ == Type::STRING; }
    bool is_object() const { return type_ == Type::OBJECT; }
    bool is_function() const { return type_ == Type::FUNCTION; }
    bool is_array() const { return type_ == Type::ARRAY; }
    bool is_nil() const { return type_ == Type::NIL; }

    // Accessors
    int64_t as_int() const {
        if (is_int()) return val_.as_int;
        if (is_tryte()) return static_cast<int64_t>(val_.as_tryte);
        if (is_bool()) return val_.as_bool ? 1 : 0;
        if (is_float()) return static_cast<int64_t>(val_.as_float);
        return 0;
    }

    int16_t as_tryte() const {
        if (is_tryte()) return val_.as_tryte;
        if (is_int()) return static_cast<int16_t>(val_.as_int);
        return 0;
    }

    double as_float() const {
        if (is_float()) return val_.as_float;
        if (is_int()) return static_cast<double>(val_.as_int);
        if (is_tryte()) return static_cast<double>(val_.as_tryte);
        return 0.0;
    }

    bool as_bool() const {
        if (is_bool()) return val_.as_bool;
        if (is_int()) return val_.as_int != 0;
        if (is_tryte()) return val_.as_tryte != 0;
        if (is_float()) return val_.as_float != 0.0;
        return false;
    }

    std::string to_string() const {
        if (is_string() && val_.as_ptr) return *static_cast<std::string*>(val_.as_ptr);
        if (is_int()) return std::to_string(as_int());
        if (is_tryte()) return std::to_string(as_tryte());
        if (is_float()) return std::to_string(as_float());
        if (is_bool()) return as_bool() ? "true" : "false";
        return "nil";
    }

private:
    void free_payload() {
        if (is_string() && val_.as_ptr) {
            delete static_cast<std::string*>(val_.as_ptr);
            val_.as_ptr = nullptr;
        } else if (is_tafpu() && val_.as_ptr) {
            delete static_cast<TafpuNum*>(val_.as_ptr);
            val_.as_ptr = nullptr;
        }
    }

    void copy_payload(const TaggedValue& other) {
        if (other.is_string() && other.val_.as_ptr) {
            val_.as_ptr = new std::string(*static_cast<std::string*>(other.val_.as_ptr));
        } else if (other.is_tafpu() && other.val_.as_ptr) {
            val_.as_ptr = new TafpuNum(*static_cast<TafpuNum*>(other.val_.as_ptr));
        } else {
            val_ = other.val_;
        }
    }
};

static_assert(sizeof(TaggedValue) == 16, "TaggedValue must be exactly 16 bytes!");

} // namespace setun
