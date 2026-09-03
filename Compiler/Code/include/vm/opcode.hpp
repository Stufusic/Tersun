#pragma once

#include <cstdint>
#include <string_view>

namespace setun {

enum class OpCode : uint8_t {
    OP_NOP             = 0x00,
    OP_PUSH_INT        = 0x01, // int64_t
    OP_PUSH_TRYTE      = 0x02, // int16_t
    OP_PUSH_TAFPU      = 0x03, // int64_t a, int64_t b, int32_t s
    OP_PUSH_FLOAT      = 0x04, // double
    OP_PUSH_STRING     = 0x05, // uint16_t string_id
    OP_PUSH_BOOL       = 0x06, // uint8_t (0 or 1)
    OP_POP             = 0x07,
    OP_DUP             = 0x08,

    OP_LOAD_LOCAL      = 0x10, // uint16_t slot
    OP_STORE_LOCAL     = 0x11, // uint16_t slot
    OP_LOAD_GLOBAL     = 0x12, // uint16_t slot
    OP_STORE_GLOBAL    = 0x13, // uint16_t slot

    OP_ADD             = 0x20, // Polymorphic / exact TAFPU / Int / Tryte
    OP_SUB             = 0x21,
    OP_MUL             = 0x22,
    OP_DIV             = 0x23,
    OP_NEG             = 0x24,
    OP_TERNARY_NOT     = 0x25,
    OP_TERNARY_CMP     = 0x26, // <=> 3-way comparison returning -1, 0, +1
    OP_TERNARY_MIN     = 0x27, // Kleene min / AND
    OP_TERNARY_MAX     = 0x28, // Kleene max / OR

    OP_EQ              = 0x30,
    OP_NEQ             = 0x31,
    OP_LT              = 0x32,
    OP_LE              = 0x33,
    OP_GT              = 0x34,
    OP_GE              = 0x35,

    OP_TAFPU_CONSTRUCT = 0x40, // Pops s, b, a and pushes TafpuNum(a, b, s)
    OP_TAFPU_ENCODE    = 0x41, // Dynamic encoding of float/int to TafpuNum
    OP_TAFPU_TODBL     = 0x42, // TafpuNum to double

    OP_JUMP            = 0x50, // int16_t offset
    OP_JUMP_IF_FALSE   = 0x51, // int16_t offset
    OP_BRANCH_3        = 0x52, // int16_t neg_offset, int16_t zero_offset, int16_t pos_offset

    OP_CALL            = 0x60, // uint16_t fn_id, uint8_t argc
    OP_RET             = 0x61,

    OP_PRINT           = 0x70,
    OP_PRINTLN         = 0x71,
    OP_TRACE           = 0x72,
    OP_ASSERT_EQ       = 0x73,

    OP_GFX_INIT        = 0x80,
    OP_GFX_IS_RUNNING  = 0x81,
    OP_GFX_CLEAR       = 0x82,
    OP_GFX_DRAW_RECT   = 0x83,
    OP_GFX_DRAW_CIRCLE = 0x84,
    OP_GFX_DRAW_TEXT   = 0x85,
    OP_GFX_FLIP        = 0x86,
    OP_GFX_GET_KEY     = 0x87,
    OP_GFX_CLOSE       = 0x88,

    // BitNet 1.58-bit AI Engine (0x90 - 0x9B)
    OP_NN_CREATE_DENSE = 0x90,
    OP_NN_SET_WEIGHT   = 0x91,
    OP_NN_SET_BIAS     = 0x92,
    OP_NN_SET_INPUT    = 0x93,
    OP_NN_GET_INPUT    = 0x94,
    OP_NN_FORWARD      = 0x95,
    OP_NN_GET_OUTPUT   = 0x96,
    OP_NN_COPY_OUT_IN  = 0x97,
    OP_NN_PREDICT      = 0x98,
    OP_NN_CONFIDENCE   = 0x99,
    OP_NN_LOAD_MNIST   = 0x9A,
    OP_NN_FREE_LAYER   = 0x9B,
    OP_TIME_NOW_US     = 0x9C,

    OP_GET_FIELD       = 0xA0, // uint16_t field_name_string_id
    OP_NEW_INSTANCE   = 0xA1, // uint16_t type_name_string_id, uint8_t field_count
    OP_GET_INDEX       = 0xA2, // Pops index, object -> pushes element
    OP_SET_FIELD       = 0xA3, // uint16_t field_name_string_id (pops value, object)
    OP_INVOKE_METHOD   = 0xA4, // uint16_t method_name_string_id, uint8_t argc
    OP_SET_INDEX       = 0xA5, // Pops value, index, array -> array[index] = value
    OP_NEW_ARRAY       = 0xA6, // uint16_t element_count (pops elements -> pushes VMArray)

    OP_HALT            = 0xFF
};

std::string_view opcode_name(OpCode op);

} // namespace setun
