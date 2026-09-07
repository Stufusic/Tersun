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

namespace setun {

struct VMObject;
struct VTable;
struct VMClosure;

// ============================================================================
// V2 Target Variant: NaNBoxValue (8 Bytes)
// Uses IEEE 754 Quiet NaN payload space (48 bits) with VMArena offsets
// ============================================================================
struct alignas(8) NaNBoxValue {
    uint64_t raw{0};

    // Bit Masks
    static constexpr uint64_t QNAN_MASK      = 0xFFF8000000000000ULL;
    static constexpr uint64_t CLASS_MASK     = 0x0007000000000000ULL;
    static constexpr uint64_t PAYLOAD_MASK   = 0x0000FFFFFFFFFFFFULL;

    // Type Classes (stored in bits 50..48)
    static constexpr uint64_t TAG_INT        = 0xFFF8000000000000ULL; // Integer (48-bit signed)
    static constexpr uint64_t TAG_TRYTE      = 0xFFF9000000000000ULL; // Tryte ([-364, 364])
    static constexpr uint64_t TAG_BOOL       = 0xFFFA000000000000ULL; // Boolean
    static constexpr uint64_t TAG_NIL        = 0xFFFB000000000000ULL; // Nil
    static constexpr uint64_t TAG_TAFPU_PTR  = 0xFFFC000000000000ULL; // Tafpu Pointer / Arena Offset
    static constexpr uint64_t TAG_STRING_PTR = 0xFFFD000000000000ULL; // String Pointer / Arena Offset
    static constexpr uint64_t TAG_ARRAY_PTR  = 0xFFFE000000000000ULL; // Array Pointer / Arena Offset
    static constexpr uint64_t TAG_OBJECT_PTR = 0xFFFF000000000000ULL; // Object/Closure Pointer

    // Constructors
    NaNBoxValue() : raw(TAG_NIL) {}

    NaNBoxValue(double v) {
        std::memcpy(&raw, &v, sizeof(double));
        // Canonicalize any actual hardware NaN to quiet nil to prevent tag collision
        if ((raw & QNAN_MASK) == QNAN_MASK) {
            raw = TAG_NIL;
        }
    }

    NaNBoxValue(int64_t v) {
        raw = TAG_INT | (static_cast<uint64_t>(v) & PAYLOAD_MASK);
    }

    NaNBoxValue(int16_t v) {
        raw = TAG_TRYTE | (static_cast<uint64_t>(v) & 0xFFFFULL);
    }

    NaNBoxValue(bool v) {
        raw = TAG_BOOL | (v ? 1ULL : 0ULL);
    }

    explicit NaNBoxValue(uint64_t raw_bits) : raw(raw_bits) {}

    // Type Queries
    bool is_float() const {
        return (raw & QNAN_MASK) != QNAN_MASK;
    }

    bool is_int() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_INT;
    }

    bool is_tryte() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_TRYTE;
    }

    bool is_bool() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_BOOL;
    }

    bool is_nil() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_NIL;
    }

    bool is_tafpu() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_TAFPU_PTR;
    }

    bool is_string() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_STRING_PTR;
    }

    bool is_array() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_ARRAY_PTR;
    }

    bool is_object() const {
        return (raw & 0xFFFF000000000000ULL) == TAG_OBJECT_PTR;
    }

    // Accessors
    double as_float() const {
        if (is_float()) {
            double v;
            std::memcpy(&v, &raw, sizeof(double));
            return v;
        }
        if (is_int()) return static_cast<double>(as_int());
        if (is_tryte()) return static_cast<double>(as_tryte());
        return 0.0;
    }

    int64_t as_int() const {
        if (is_int()) {
            uint64_t payload = raw & PAYLOAD_MASK;
            // Sign-extend 48-bit to 64-bit
            if (payload & 0x0000800000000000ULL) {
                payload |= 0xFFFF000000000000ULL;
            }
            return static_cast<int64_t>(payload);
        }
        if (is_tryte()) return as_tryte();
        if (is_bool()) return as_bool() ? 1 : 0;
        if (is_float()) return static_cast<int64_t>(as_float());
        return 0;
    }

    int16_t as_tryte() const {
        if (is_tryte()) {
            int16_t val = static_cast<int16_t>(raw & 0xFFFFULL);
            return val;
        }
        if (is_int()) return static_cast<int16_t>(as_int());
        return 0;
    }

    bool as_bool() const {
        if (is_bool()) return (raw & 0x1ULL) != 0;
        if (is_int()) return as_int() != 0;
        if (is_tryte()) return as_tryte() != 0;
        if (is_float()) return as_float() != 0.0;
        return false;
    }

    uint64_t payload() const {
        return raw & PAYLOAD_MASK;
    }
};

static_assert(sizeof(NaNBoxValue) == 8, "NaNBoxValue must be exactly 8 bytes!");

} // namespace setun
