#pragma once

#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include "vm/vm_arena.hpp"
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
struct VMValue;

struct VTable {
    std::string class_name;
    std::string super_class;
    std::unordered_map<std::string, uint16_t> methods; // method_name -> bytecode IP
};

// ============================================================================
// Gate 2: Intrusive Ref-Counted Container for Dynamic Heap Payloads
// Allocated via VMArena bump-pointer allocator (Zero malloc locks)
// ============================================================================
struct HeapPayload {
    mutable uint32_t ref_count{1};
    enum class Kind : uint8_t { STRING, TAFPU, OBJECT, ARRAY, CLOSURE } kind;

    std::string str;
    TafpuNum tafpu{0, 0, 0};
    std::shared_ptr<VMObject> obj;
    std::shared_ptr<std::vector<VMValue>> arr;
    std::shared_ptr<VMClosure> fn;

    explicit HeapPayload(std::string s) : kind(Kind::STRING), str(std::move(s)) {}
    explicit HeapPayload(const char* s) : kind(Kind::STRING), str(s ? s : "") {}
    explicit HeapPayload(TafpuNum t) : kind(Kind::TAFPU), tafpu(t) {}
    explicit HeapPayload(std::shared_ptr<VMObject> o) : kind(Kind::OBJECT), obj(std::move(o)) {}
    explicit HeapPayload(std::shared_ptr<std::vector<VMValue>> a) : kind(Kind::ARRAY), arr(std::move(a)) {}
    explicit HeapPayload(std::shared_ptr<VMClosure> f) : kind(Kind::CLOSURE), fn(std::move(f)) {}

    void retain() const {
        ++ref_count;
    }

    bool release() const {
        return (--ref_count == 0);
    }
};

// ============================================================================
// Gate 1 & 2 Core Representation: TaggedValue (Exactly 16 Bytes, 128-bit aligned)
// Controlled 32-bit handle indexing through VMArena
// ============================================================================
struct alignas(16) VMValue {
    enum class Type : uint32_t {
        NIL = 0,
        INT = 1,
        TRYTE = 2,
        FLOAT = 3,
        BOOL = 4,
        STRING = 5,
        TAFPU = 6,
        OBJECT = 7,
        ARRAY = 8,
        FUNCTION = 9
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
    VMValue() : type_(Type::NIL), extra_(0) { val_.as_int = 0; }
    VMValue(int64_t v) : type_(Type::INT), extra_(0) { val_.as_int = v; }
    VMValue(int v) : type_(Type::INT), extra_(0) { val_.as_int = static_cast<int64_t>(v); }
    VMValue(uint64_t v) : type_(Type::INT), extra_(0) { val_.as_int = static_cast<int64_t>(v); }
    VMValue(int16_t v) : type_(Type::TRYTE), extra_(0) { val_.as_tryte = v; }
    VMValue(double v) : type_(Type::FLOAT), extra_(0) { val_.as_float = v; }
    VMValue(bool v) : type_(Type::BOOL), extra_(0) { val_.as_bool = v; }

    // Heap Constructors via VMArena Bump Allocator
    VMValue(TafpuNum v) : type_(Type::TAFPU) {
        val_.as_ptr = VMArena::instance().make<HeapPayload>(v);
        extra_ = VMArena::instance().to_handle(val_.as_ptr);
    }
    VMValue(std::string v) : type_(Type::STRING) {
        val_.as_ptr = VMArena::instance().make<HeapPayload>(std::move(v));
        extra_ = VMArena::instance().to_handle(val_.as_ptr);
    }
    VMValue(const char* v) : type_(Type::STRING) {
        val_.as_ptr = VMArena::instance().make<HeapPayload>(v);
        extra_ = VMArena::instance().to_handle(val_.as_ptr);
    }
    VMValue(std::shared_ptr<VMObject> obj) : type_(Type::OBJECT) {
        val_.as_ptr = VMArena::instance().make<HeapPayload>(std::move(obj));
        extra_ = VMArena::instance().to_handle(val_.as_ptr);
    }
    VMValue(std::shared_ptr<std::vector<VMValue>> arr) : type_(Type::ARRAY) {
        val_.as_ptr = VMArena::instance().make<HeapPayload>(std::move(arr));
        extra_ = VMArena::instance().to_handle(val_.as_ptr);
    }
    VMValue(std::shared_ptr<VMClosure> fn) : type_(Type::FUNCTION) {
        val_.as_ptr = VMArena::instance().make<HeapPayload>(std::move(fn));
        extra_ = VMArena::instance().to_handle(val_.as_ptr);
    }

    // Controlled 32-bit VMArena Handle Accessor
    uint32_t handle() const { return extra_; }
    bool has_handle() const { return is_heap_type() && extra_ != 0; }

    // Destructor
    ~VMValue() {
        free_payload();
    }

    // Copy Constructor
    VMValue(const VMValue& other) : type_(other.type_), extra_(other.extra_), val_(other.val_) {
        retain_payload();
    }

    // Move Constructor
    VMValue(VMValue&& other) noexcept : type_(other.type_), extra_(other.extra_), val_(other.val_) {
        other.type_ = Type::NIL;
        other.val_.as_int = 0;
    }

    // Copy Assignment
    VMValue& operator=(const VMValue& other) {
        if (this != &other) {
            free_payload();
            type_ = other.type_;
            extra_ = other.extra_;
            val_ = other.val_;
            retain_payload();
        }
        return *this;
    }

    // Move Assignment
    VMValue& operator=(VMValue&& other) noexcept {
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

    // Heap Payload Helpers
    inline bool is_heap_type() const {
        return type_ >= Type::STRING && val_.as_ptr != nullptr;
    }

    inline void retain_payload() const {
        if (is_heap_type()) {
            static_cast<HeapPayload*>(val_.as_ptr)->retain();
        }
    }

    inline void free_payload() {
        if (is_heap_type()) {
            auto* p = static_cast<HeapPayload*>(val_.as_ptr);
            if (p->release()) {
                p->~HeapPayload(); // Call in-place destructor, memory remains in VMArena
            }
            val_.as_ptr = nullptr;
        }
    }

    inline HeapPayload* payload() const {
        return static_cast<HeapPayload*>(val_.as_ptr);
    }

    // Type Queries
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

    std::shared_ptr<VMClosure> as_closure() const {
        if (is_function() && val_.as_ptr) return payload()->fn;
        return nullptr;
    }

    std::shared_ptr<VMObject> as_object() const {
        if (is_object() && val_.as_ptr) return payload()->obj;
        return nullptr;
    }

    std::shared_ptr<std::vector<VMValue>> as_array() const {
        if (is_array() && val_.as_ptr) return payload()->arr;
        return nullptr;
    }

    int64_t as_int() const {
        if (is_int()) return val_.as_int;
        if (is_tryte()) return static_cast<int64_t>(val_.as_tryte);
        if (is_bool()) return val_.as_bool ? 1 : 0;
        if (is_float()) return static_cast<int64_t>(val_.as_float);
        if (is_tafpu() && val_.as_ptr) return static_cast<int64_t>(payload()->tafpu.to_double());
        if (is_array() && val_.as_ptr && payload()->arr) return static_cast<int64_t>(payload()->arr->size());
        return 0;
    }

    int16_t as_tryte() const {
        if (is_tryte()) return val_.as_tryte;
        if (is_int()) return static_cast<int16_t>(val_.as_int);
        return 0;
    }

    TafpuNum as_tafpu() const {
        if (is_tafpu() && val_.as_ptr) return payload()->tafpu;
        if (is_int()) return TafpuNum(val_.as_int, 0, 0);
        if (is_tryte()) return TafpuNum(val_.as_tryte, 0, 0);
        if (is_float()) return encode_dynamic(val_.as_float);
        return TafpuNum(0, 0, 0);
    }

    double as_float() const {
        if (is_float()) return val_.as_float;
        if (is_tafpu() && val_.as_ptr) return payload()->tafpu.to_double();
        if (is_int()) return static_cast<double>(val_.as_int);
        if (is_tryte()) return static_cast<double>(val_.as_tryte);
        return 0.0;
    }

    bool as_bool() const {
        if (is_bool()) return val_.as_bool;
        if (is_int()) return val_.as_int != 0;
        if (is_tryte()) return val_.as_tryte != 0;
        if (is_float()) return val_.as_float != 0.0;
        if (is_tafpu() && val_.as_ptr) return (payload()->tafpu.a != 0 || payload()->tafpu.b != 0);
        if (is_object()) return as_object() != nullptr;
        if (is_array()) return as_array() && !as_array()->empty();
        return false;
    }

    std::string to_string() const;

    // Fast Arithmetic Operators
    VMValue add(const VMValue& other) const {
        if (__builtin_expect(is_int() && other.is_int(), 1)) {
            return VMValue(val_.as_int + other.val_.as_int);
        }
        if (is_string() || other.is_string()) {
            return VMValue(to_string() + other.to_string());
        }
        if (is_tafpu() || other.is_tafpu()) {
            return VMValue(tafpu_add(as_tafpu(), other.as_tafpu()));
        }
        if (is_float() || other.is_float()) {
            return VMValue(as_float() + other.as_float());
        }
        if (is_tryte() && other.is_tryte()) {
            return VMValue(static_cast<int16_t>(as_tryte() + other.as_tryte()));
        }
        return VMValue(as_int() + other.as_int());
    }

    VMValue sub(const VMValue& other) const {
        if (__builtin_expect(is_int() && other.is_int(), 1)) {
            return VMValue(val_.as_int - other.val_.as_int);
        }
        if (is_tafpu() || other.is_tafpu()) {
            return VMValue(tafpu_sub(as_tafpu(), other.as_tafpu()));
        }
        if (is_float() || other.is_float()) {
            return VMValue(as_float() - other.as_float());
        }
        if (is_tryte() && other.is_tryte()) {
            return VMValue(static_cast<int16_t>(as_tryte() - other.as_tryte()));
        }
        return VMValue(as_int() - other.as_int());
    }

    VMValue mul(const VMValue& other) const {
        if (__builtin_expect(is_int() && other.is_int(), 1)) {
            return VMValue(val_.as_int * other.val_.as_int);
        }
        if (is_tafpu() || other.is_tafpu()) {
            return VMValue(tafpu_mul(as_tafpu(), other.as_tafpu()));
        }
        if (is_float() || other.is_float()) {
            return VMValue(as_float() * other.as_float());
        }
        if (is_tryte() && other.is_tryte()) {
            return VMValue(static_cast<int16_t>(as_tryte() * other.as_tryte()));
        }
        return VMValue(as_int() * other.as_int());
    }

    VMValue div(const VMValue& other) const {
        if (is_tafpu() || other.is_tafpu()) {
            return VMValue(tafpu_div(as_tafpu(), other.as_tafpu()));
        }
        if (is_float() || other.is_float()) {
            if (other.as_float() == 0.0) throw VMException("Division by zero in floating point arithmetic.");
            return VMValue(as_float() / other.as_float());
        }
        if (other.as_int() == 0) throw VMException("Division by zero in integer arithmetic.");
        return VMValue(as_int() / other.as_int());
    }

    VMValue mod(const VMValue& other) const {
        int64_t b = other.as_int();
        if (b == 0) throw VMException("Division by zero in integer modulo.");
        int64_t a = as_int();
        if (a == INT64_MIN && b == -1) {
            if (is_tryte() && other.is_tryte()) return VMValue(static_cast<int16_t>(0));
            return VMValue(static_cast<int64_t>(0));
        }
        int64_t rem = a % b;
        if (is_tryte() && other.is_tryte()) {
            return VMValue(static_cast<int16_t>(rem));
        }
        return VMValue(rem);
    }

    VMValue bit_and(const VMValue& other) const {
        if (is_tryte() && other.is_tryte()) {
            auto ta = unpack_tryte(as_tryte());
            auto tb = unpack_tryte(other.as_tryte());
            std::array<Trit, 6> res;
            for (size_t i = 0; i < 6; ++i) res[i] = trit_min(ta[i], tb[i]);
            return VMValue(pack_tryte(res));
        }
        if (is_bool() && other.is_bool()) {
            return VMValue(as_bool() && other.as_bool());
        }
        return VMValue(as_int() & other.as_int());
    }

    VMValue bit_or(const VMValue& other) const {
        if (is_tryte() && other.is_tryte()) {
            auto ta = unpack_tryte(as_tryte());
            auto tb = unpack_tryte(other.as_tryte());
            std::array<Trit, 6> res;
            for (size_t i = 0; i < 6; ++i) res[i] = trit_max(ta[i], tb[i]);
            return VMValue(pack_tryte(res));
        }
        if (is_bool() && other.is_bool()) {
            return VMValue(as_bool() || other.as_bool());
        }
        return VMValue(as_int() | other.as_int());
    }

    VMValue bit_xor(const VMValue& other) const {
        if (is_tryte() && other.is_tryte()) {
            auto ta = unpack_tryte(as_tryte());
            auto tb = unpack_tryte(other.as_tryte());
            std::array<Trit, 6> res;
            for (size_t i = 0; i < 6; ++i) {
                int sum = static_cast<int>(ta[i]) + static_cast<int>(tb[i]);
                if (sum == 2) res[i] = Trit::NEG;
                else if (sum == -2) res[i] = Trit::POS;
                else res[i] = static_cast<Trit>(sum);
            }
            return VMValue(pack_tryte(res));
        }
        if (is_bool() && other.is_bool()) {
            return VMValue(as_bool() != other.as_bool());
        }
        return VMValue(as_int() ^ other.as_int());
    }

    VMValue shl(const VMValue& other) const {
        int64_t k = other.as_int();
        if (k < 0) throw VMException("Negative shift count in shift left.");
        if (is_tryte()) {
            if (k >= 6) return VMValue(static_cast<int16_t>(0));
            if (k == 0) return VMValue(as_tryte());
            auto t = unpack_tryte(as_tryte());
            std::array<Trit, 6> res;
            for (size_t i = 0; i < 6; ++i) {
                if (i >= static_cast<size_t>(k)) res[i] = t[i - static_cast<size_t>(k)];
                else res[i] = Trit::ZERO;
            }
            return VMValue(pack_tryte(res));
        }
        if (k >= 64) return VMValue(static_cast<int64_t>(0));
        return VMValue(as_int() << k);
    }

    VMValue shr(const VMValue& other) const {
        int64_t k = other.as_int();
        if (k < 0) throw VMException("Negative shift count in shift right.");
        if (is_tryte()) {
            if (k >= 6) return VMValue(static_cast<int16_t>(0));
            if (k == 0) return VMValue(as_tryte());
            auto t = unpack_tryte(as_tryte());
            std::array<Trit, 6> res;
            for (size_t i = 0; i < 6; ++i) {
                if (i + static_cast<size_t>(k) < 6) res[i] = t[i + static_cast<size_t>(k)];
                else res[i] = Trit::ZERO;
            }
            return VMValue(pack_tryte(res));
        }
        if (k >= 64) return VMValue(as_int() < 0 ? static_cast<int64_t>(-1) : static_cast<int64_t>(0));
        return VMValue(as_int() >> k);
    }

    VMValue neg() const {
        if (is_tafpu()) return VMValue(tafpu_neg(as_tafpu()));
        if (is_float()) return VMValue(-as_float());
        if (is_tryte()) return VMValue(static_cast<int16_t>(-as_tryte()));
        return VMValue(-as_int());
    }

    VMValue ternary_cmp(const VMValue& other) const {
        if (is_string() || other.is_string()) {
            std::string s1 = to_string();
            std::string s2 = other.to_string();
            if (s1 < s2) return VMValue(static_cast<int64_t>(-1));
            if (s1 > s2) return VMValue(static_cast<int64_t>(1));
            return VMValue(static_cast<int64_t>(0));
        }
        if (is_tafpu() || other.is_tafpu()) {
            return VMValue(static_cast<int64_t>(tafpu_cmp(as_tafpu(), other.as_tafpu())));
        }
        if (is_float() || other.is_float()) {
            double d1 = as_float();
            double d2 = other.as_float();
            if (d1 < d2) return VMValue(static_cast<int64_t>(-1));
            if (d1 > d2) return VMValue(static_cast<int64_t>(1));
            return VMValue(static_cast<int64_t>(0));
        }
        int64_t v1 = as_int();
        int64_t v2 = other.as_int();
        if (v1 < v2) return VMValue(static_cast<int64_t>(-1));
        if (v1 > v2) return VMValue(static_cast<int64_t>(1));
        return VMValue(static_cast<int64_t>(0));
    }
};

static_assert(sizeof(VMValue) == 16, "VMValue must be exactly 16 bytes for Gate 1!");

struct VMClosure {
    uint32_t entry{0};
    std::string name;
    std::vector<VMValue> captures;
};

// ============================================================================
// Gate 2: High-Speed Small Object Layout for VMObject
// Linear cache scan for <= 8 fields (TreeNode, Point, Box), hash table for > 8
// ============================================================================
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
    if (is_string() && val_.as_ptr) return payload()->str;
    if (is_int()) return std::to_string(val_.as_int);
    if (is_tryte()) {
        std::ostringstream oss;
        oss << val_.as_tryte << " (tryte @" << to_ternary_string(val_.as_tryte) << ")";
        return oss.str();
    }
    if (is_tafpu() && val_.as_ptr) return payload()->tafpu.to_string();
    if (is_float()) return std::to_string(val_.as_float);
    if (is_bool()) return val_.as_bool ? "true" : "false";
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
    if (is_function()) {
        auto f = as_closure();
        if (!f) return "<fn>";
        return "<fn " + f->name + ">";
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
