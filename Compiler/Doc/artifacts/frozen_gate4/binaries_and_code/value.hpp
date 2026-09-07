#pragma once

#include "tafpu/trit.hpp"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include "vm/vm_arena.hpp"
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>
#include <memory>
#include <iostream>
#include <sstream>
#include <cassert>
#include <cmath>
#include <limits>
#include <type_traits>
#include <unordered_map>

namespace setun {

struct VMObject;
struct VMClosure;
struct VMValue;

struct VTable {
    std::string class_name;
    std::string super_class;
    std::unordered_map<std::string, uint16_t> methods; // method_name -> bytecode IP
};

// ============================================================================
// Gate 3: Dynamic Heap Payload Container
// Allocated via VMArena bump-pointer allocator with 32-bit handle indexing
// ============================================================================
struct HeapPayload {
    enum class Kind : uint8_t { STRING, TAFPU, OBJECT, ARRAY, CLOSURE, BOXED_INT64 } kind;

    std::string str;
    TafpuNum tafpu{0, 0, 0};
    int64_t boxed_int{0};
    std::shared_ptr<VMObject> obj;
    std::shared_ptr<std::vector<VMValue>> arr;
    std::shared_ptr<VMClosure> fn;

    explicit HeapPayload(std::string s) : kind(Kind::STRING), str(std::move(s)) {}
    explicit HeapPayload(const char* s) : kind(Kind::STRING), str(s ? s : "") {}
    explicit HeapPayload(TafpuNum t) : kind(Kind::TAFPU), tafpu(t) {}
    explicit HeapPayload(int64_t v) : kind(Kind::BOXED_INT64), boxed_int(v) {}
    explicit HeapPayload(std::shared_ptr<VMObject> o) : kind(Kind::OBJECT), obj(std::move(o)) {}
    explicit HeapPayload(std::shared_ptr<std::vector<VMValue>> a) : kind(Kind::ARRAY), arr(std::move(a)) {}
    explicit HeapPayload(std::shared_ptr<VMClosure> f) : kind(Kind::CLOSURE), fn(std::move(f)) {}
};

// ============================================================================
// Gate 3 Core Representation: 8B NaNBoxValue (Exact 64-bit scalar word)
// Formally verified: std::is_trivially_copyable_v<VMValue> == true
// ============================================================================

enum class HeapSubtype : uint16_t {
    STRING      = 0,
    TAFPU       = 1,
    OBJECT      = 2,
    ARRAY       = 3,
    FUNCTION    = 4,
    BOXED_INT64 = 5
};

struct alignas(8) VMValue {
    // Legacy compatible Type enum
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

    // Bit Masks & Boundaries
    static constexpr uint64_t TAG_BASE        = 0xFFF8000000000000ULL;
    static constexpr uint64_t TAG_MAJOR_MASK  = 0xFFFF000000000000ULL;
    static constexpr uint64_t PAYLOAD_MASK    = 0x0000FFFFFFFFFFFFULL;
    static constexpr uint64_t HANDLE_MASK     = 0x00000000FFFFFFFFULL;

    // 8 Major Tags (Top 16 Bits)
    static constexpr uint64_t TAG_INT         = 0xFFF8000000000000ULL; // 48-bit immediate signed int
    static constexpr uint64_t TAG_TRYTE       = 0xFFF9000000000000ULL; // 16-bit tryte ([-364, 364])
    static constexpr uint64_t TAG_BOOL        = 0xFFFA000000000000ULL; // 1-bit boolean
    static constexpr uint64_t TAG_NIL         = 0xFFFB000000000000ULL; // Nil
    static constexpr uint64_t TAG_FLOAT_NAN   = 0xFFFC000000000000ULL; // Canonical IEEE 754 quiet NaN
    static constexpr uint64_t TAG_HEAP        = 0xFFFD000000000000ULL; // VMArena Managed Heap Reference
    static constexpr uint64_t TAG_SPECIAL     = 0xFFFE000000000000ULL; // Reserved
    static constexpr uint64_t TAG_RESERVED    = 0xFFFF000000000000ULL; // Reserved

    // 48-bit Signed Integer Boundaries
    static constexpr int64_t MIN_INT48        = -140737488355328LL;    // -2^47
    static constexpr int64_t MAX_INT48        =  140737488355327LL;    //  2^47 - 1

    uint64_t raw_{TAG_NIL};

    // --- Constructors (Default, Trivially Copyable) ---
    VMValue() : raw_(TAG_NIL) {}
    VMValue(const VMValue&) = default;
    VMValue(VMValue&&) = default;
    VMValue& operator=(const VMValue&) = default;
    VMValue& operator=(VMValue&&) = default;
    ~VMValue() = default;

    // Static factory for raw bits
    static VMValue from_raw(uint64_t raw_bits) {
        VMValue v;
        v.raw_ = raw_bits;
        return v;
    }

    // Float Constructor (IEEE 754 with canonical NaN)
    VMValue(double v) {
        if (std::isnan(v)) {
            raw_ = TAG_FLOAT_NAN;
        } else {
            std::memcpy(&raw_, &v, sizeof(double));
        }
    }

    // Integer Constructors (Immediate 48-bit or Boxed Int64)
    VMValue(int64_t v) {
        if (__builtin_expect(v >= MIN_INT48 && v <= MAX_INT48, 1)) {
            raw_ = TAG_INT | (static_cast<uint64_t>(v) & PAYLOAD_MASK);
        } else {
            auto* p = VMArena::instance().make<HeapPayload>(v);
            uint32_t h = VMArena::instance().to_handle(p);
            raw_ = encode_heap(HeapSubtype::BOXED_INT64, h);
        }
    }
    VMValue(int v) : VMValue(static_cast<int64_t>(v)) {}
    VMValue(uint64_t v) : VMValue(static_cast<int64_t>(v)) {}

    // Tryte Constructor (16-bit balanced tryte)
    VMValue(int16_t v) : raw_(TAG_TRYTE | (static_cast<uint64_t>(static_cast<uint16_t>(v)))) {}

    // Bool Constructor
    VMValue(bool v) : raw_(TAG_BOOL | (v ? 1ULL : 0ULL)) {}

    // Heap Constructors (VMArena Handle Indexing)
    VMValue(TafpuNum v) {
        auto* p = VMArena::instance().make<HeapPayload>(v);
        raw_ = encode_heap(HeapSubtype::TAFPU, VMArena::instance().to_handle(p));
    }
    VMValue(std::string v) {
        auto* p = VMArena::instance().make<HeapPayload>(std::move(v));
        raw_ = encode_heap(HeapSubtype::STRING, VMArena::instance().to_handle(p));
    }
    VMValue(const char* v) {
        auto* p = VMArena::instance().make<HeapPayload>(v);
        raw_ = encode_heap(HeapSubtype::STRING, VMArena::instance().to_handle(p));
    }
    VMValue(std::shared_ptr<VMObject> obj) {
        auto* p = VMArena::instance().make<HeapPayload>(std::move(obj));
        raw_ = encode_heap(HeapSubtype::OBJECT, VMArena::instance().to_handle(p));
    }
    VMValue(std::shared_ptr<std::vector<VMValue>> arr) {
        auto* p = VMArena::instance().make<HeapPayload>(std::move(arr));
        raw_ = encode_heap(HeapSubtype::ARRAY, VMArena::instance().to_handle(p));
    }
    VMValue(std::shared_ptr<VMClosure> fn) {
        auto* p = VMArena::instance().make<HeapPayload>(std::move(fn));
        raw_ = encode_heap(HeapSubtype::FUNCTION, VMArena::instance().to_handle(p));
    }

    // --- Tag & Classification Helpers ---
    inline static uint64_t encode_heap(HeapSubtype sub, uint32_t handle) {
        return TAG_HEAP | (static_cast<uint64_t>(sub) << 32) | static_cast<uint64_t>(handle);
    }

    inline uint64_t major_tag() const {
        return raw_ & TAG_MAJOR_MASK;
    }

    inline HeapSubtype heap_subtype() const {
        return static_cast<HeapSubtype>((raw_ >> 32) & 0xFFFFULL);
    }

    inline uint32_t handle() const {
        return static_cast<uint32_t>(raw_ & HANDLE_MASK);
    }

    inline bool is_heap_type() const {
        return major_tag() == TAG_HEAP && handle() != VMArena::NULL_HANDLE;
    }

    inline bool has_handle() const {
        return is_heap_type();
    }

    inline HeapPayload* payload() const {
        assert(is_heap_type() && "VMValue: Attempted to dereference non-heap value");
        return static_cast<HeapPayload*>(VMArena::instance().from_handle(handle()));
    }

    // --- Type Queries ---
    inline bool is_float() const {
        return (raw_ < TAG_BASE) || (raw_ == TAG_FLOAT_NAN);
    }

    inline bool is_immediate_int() const {
        return major_tag() == TAG_INT;
    }

    inline static bool is_both_immediate_int(VMValue a, VMValue b) {
        return ((a.raw_ & 0xFFFF000000000000ULL) == TAG_INT) &&
               ((b.raw_ & 0xFFFF000000000000ULL) == TAG_INT);
    }

    inline int64_t as_immediate_int_fast() const {
        return (static_cast<int64_t>(raw_ << 16)) >> 16;
    }

    inline bool is_boxed_int() const {
        return major_tag() == TAG_HEAP && heap_subtype() == HeapSubtype::BOXED_INT64;
    }

    inline bool is_int() const {
        return is_immediate_int() || is_boxed_int();
    }

    inline bool is_tryte() const {
        return major_tag() == TAG_TRYTE;
    }

    inline bool is_bool() const {
        return major_tag() == TAG_BOOL;
    }

    inline bool is_nil() const {
        return major_tag() == TAG_NIL;
    }

    inline bool is_string() const {
        return major_tag() == TAG_HEAP && heap_subtype() == HeapSubtype::STRING;
    }

    inline bool is_tafpu() const {
        return major_tag() == TAG_HEAP && heap_subtype() == HeapSubtype::TAFPU;
    }

    inline bool is_object() const {
        return major_tag() == TAG_HEAP && heap_subtype() == HeapSubtype::OBJECT;
    }

    inline bool is_array() const {
        return major_tag() == TAG_HEAP && heap_subtype() == HeapSubtype::ARRAY;
    }

    inline bool is_function() const {
        return major_tag() == TAG_HEAP && heap_subtype() == HeapSubtype::FUNCTION;
    }

    // Type query matching legacy Type enum
    Type type() const {
        if (is_int()) return Type::INT;
        if (is_tryte()) return Type::TRYTE;
        if (is_bool()) return Type::BOOL;
        if (is_string()) return Type::STRING;
        if (is_tafpu()) return Type::TAFPU;
        if (is_object()) return Type::OBJECT;
        if (is_array()) return Type::ARRAY;
        if (is_function()) return Type::FUNCTION;
        if (is_float()) return Type::FLOAT;
        return Type::NIL;
    }

    // --- Accessors ---
    std::shared_ptr<VMClosure> as_closure() const {
        if (is_function()) return payload()->fn;
        return nullptr;
    }

    std::shared_ptr<VMObject> as_object() const {
        if (is_object()) return payload()->obj;
        return nullptr;
    }

    std::shared_ptr<std::vector<VMValue>> as_array() const {
        if (is_array()) return payload()->arr;
        return nullptr;
    }

    inline int64_t as_int() const {
        if (__builtin_expect(is_immediate_int(), 1)) {
            uint64_t p = raw_ & PAYLOAD_MASK;
            if (p & 0x0000800000000000ULL) {
                p |= 0xFFFF000000000000ULL; // sign-extend bit 47 to 63
            }
            return static_cast<int64_t>(p);
        }
        if (is_boxed_int()) return payload()->boxed_int;
        if (is_tryte()) return static_cast<int64_t>(as_tryte());
        if (is_bool()) return as_bool() ? 1 : 0;
        if (is_float()) return static_cast<int64_t>(as_float());
        if (is_tafpu()) return static_cast<int64_t>(payload()->tafpu.to_double());
        if (is_array() && payload()->arr) return static_cast<int64_t>(payload()->arr->size());
        return 0;
    }

    inline int16_t as_tryte() const {
        if (is_tryte()) return static_cast<int16_t>(raw_ & 0xFFFFULL);
        if (is_int()) return static_cast<int16_t>(as_int());
        return 0;
    }

    inline TafpuNum as_tafpu() const {
        if (is_tafpu()) return payload()->tafpu;
        if (is_int()) return TafpuNum(as_int(), 0, 0);
        if (is_tryte()) return TafpuNum(as_tryte(), 0, 0);
        if (is_float()) return encode_dynamic(as_float());
        return TafpuNum(0, 0, 0);
    }

    inline double as_float() const {
        if (__builtin_expect(raw_ < TAG_BASE, 1)) {
            double v;
            std::memcpy(&v, &raw_, sizeof(double));
            return v;
        }
        if (raw_ == TAG_FLOAT_NAN) return std::numeric_limits<double>::quiet_NaN();
        if (is_int()) return static_cast<double>(as_int());
        if (is_tryte()) return static_cast<double>(as_tryte());
        if (is_tafpu()) return payload()->tafpu.to_double();
        return 0.0;
    }

    inline bool as_bool() const {
        if (is_bool()) return (raw_ & 1ULL) != 0;
        if (is_int()) return as_int() != 0;
        if (is_tryte()) return as_tryte() != 0;
        if (is_float()) return as_float() != 0.0;
        if (is_tafpu()) return (payload()->tafpu.a != 0 || payload()->tafpu.b != 0);
        if (is_object()) return as_object() != nullptr;
        if (is_array()) return as_array() && !as_array()->empty();
        return false;
    }

    std::string to_string() const;

    // --- Fast Arithmetic & Logical Operators ---
    VMValue add(const VMValue& other) const {
        if (__builtin_expect(is_int() && other.is_int(), 1)) {
            return VMValue(as_int() + other.as_int());
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
            return VMValue(as_int() - other.as_int());
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
            return VMValue(as_int() * other.as_int());
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

// Compile-Time Size and Trivial Copy Assertions (Gate 3 Core Invariants)
static_assert(sizeof(VMValue) == 8, "VMValue must be exactly 8 bytes for Gate 3!");
static_assert(std::is_trivially_copyable_v<VMValue>, "VMValue must be trivially copyable for Gate 3!");

struct VMClosure {
    uint32_t entry{0};
    uint16_t fn_idx{0};
    size_t frame_size{32};
    std::string name;
    std::vector<VMValue> captures;
};

// ============================================================================
// Gate 4: Shape-based Object Model & Fixed-Slot Layout (Inline Cache Ready)
// ============================================================================
struct VMShape {
    uint32_t shape_id{0};
    std::string class_name;
    std::unordered_map<std::string, uint16_t> field_to_slot;
    std::vector<std::string> slot_to_field;

    int get_slot(const std::string& name) const {
        auto it = field_to_slot.find(name);
        if (it != field_to_slot.end()) return static_cast<int>(it->second);
        return -1;
    }

    uint16_t add_field(const std::string& name) {
        auto it = field_to_slot.find(name);
        if (it != field_to_slot.end()) return it->second;
        uint16_t slot = static_cast<uint16_t>(slot_to_field.size());
        field_to_slot[name] = slot;
        slot_to_field.push_back(name);
        return slot;
    }
};

struct VMObject {
    std::string type_name;
    bool is_class{false}; // true: Class (Ref Type), false: Struct (Value Type)
    std::shared_ptr<VTable> vtable;
    std::shared_ptr<VMShape> shape;
    std::vector<VMValue> fields_array;
    std::unique_ptr<std::unordered_map<std::string, VMValue>> dynamic_fields;

    size_t field_count() const {
        return fields_array.size() + (dynamic_fields ? dynamic_fields->size() : 0);
    }

    bool has_field(const std::string& name) const {
        if (shape) {
            int slot = shape->get_slot(name);
            if (slot >= 0 && static_cast<size_t>(slot) < fields_array.size()) return true;
        }
        if (dynamic_fields && dynamic_fields->find(name) != dynamic_fields->end()) return true;
        return false;
    }

    VMValue get_field(const std::string& name) const {
        if (shape) {
            int slot = shape->get_slot(name);
            if (slot >= 0 && static_cast<size_t>(slot) < fields_array.size()) {
                return fields_array[slot];
            }
        }
        if (dynamic_fields) {
            auto it = dynamic_fields->find(name);
            if (it != dynamic_fields->end()) return it->second;
        }
        return VMValue();
    }

    void set_field(const std::string& name, const VMValue& val) {
        if (!shape) {
            shape = std::make_shared<VMShape>();
            static uint32_t g_next_shape_id = 1;
            shape->shape_id = g_next_shape_id++;
            shape->class_name = type_name;
        }
        int slot = shape->get_slot(name);
        if (slot >= 0) {
            if (static_cast<size_t>(slot) >= fields_array.size()) {
                fields_array.resize(slot + 1);
            }
            fields_array[slot] = val;
            return;
        }
        uint16_t new_slot = shape->add_field(name);
        if (static_cast<size_t>(new_slot) >= fields_array.size()) {
            fields_array.resize(new_slot + 1);
        }
        fields_array[new_slot] = val;
    }
};

inline std::string VMValue::to_string() const {
    if (is_string()) return payload()->str;
    if (is_int()) return std::to_string(as_int());
    if (is_tryte()) {
        std::ostringstream oss;
        oss << as_tryte() << " (tryte @" << to_ternary_string(as_tryte()) << ")";
        return oss.str();
    }
    if (is_tafpu()) return payload()->tafpu.to_string();
    if (is_float()) return std::to_string(as_float());
    if (is_bool()) return as_bool() ? "true" : "false";
    if (is_object()) {
        auto obj = as_object();
        if (!obj) return "nil";
        std::ostringstream oss;
        oss << obj->type_name << " { ";
        size_t idx = 0;
        if (obj->shape) {
            for (size_t i = 0; i < obj->fields_array.size() && i < obj->shape->slot_to_field.size(); ++i) {
                if (idx++ > 0) oss << ", ";
                oss << obj->shape->slot_to_field[i] << ": " << obj->fields_array[i].to_string();
            }
        }
        if (obj->dynamic_fields) {
            for (const auto& [k, v] : *obj->dynamic_fields) {
                if (idx++ > 0) oss << ", ";
                oss << k << ": " << v.to_string();
            }
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
