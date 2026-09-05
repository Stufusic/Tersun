import sys
import struct

VALID_101_OPCODES = {
    0x00: "OP_NOP",
    0x01: "OP_PUSH_INT",
    0x02: "OP_PUSH_TRYTE",
    0x03: "OP_PUSH_TAFPU",
    0x04: "OP_PUSH_FLOAT",
    0x05: "OP_PUSH_STRING",
    0x06: "OP_PUSH_BOOL",
    0x07: "OP_POP",
    0x08: "OP_DUP",
    0x10: "OP_LOAD_LOCAL",
    0x11: "OP_STORE_LOCAL",
    0x12: "OP_LOAD_GLOBAL",
    0x13: "OP_STORE_GLOBAL",
    0x20: "OP_ADD",
    0x21: "OP_SUB",
    0x22: "OP_MUL",
    0x23: "OP_DIV",
    0x24: "OP_NEG",
    0x25: "OP_TERNARY_NOT",
    0x26: "OP_TERNARY_CMP",
    0x27: "OP_TERNARY_MIN",
    0x28: "OP_TERNARY_MAX",
    0x30: "OP_EQ",
    0x31: "OP_NEQ",
    0x32: "OP_LT",
    0x33: "OP_LE",
    0x34: "OP_GT",
    0x35: "OP_GE",
    0x40: "OP_TAFPU_CONSTRUCT",
    0x41: "OP_TAFPU_ENCODE",
    0x42: "OP_TAFPU_TODBL",
    0x50: "OP_JUMP",
    0x51: "OP_JUMP_IF_FALSE",
    0x52: "OP_BRANCH_3",
    0x60: "OP_CALL",
    0x61: "OP_RET",
    0x70: "OP_PRINT",
    0x71: "OP_PRINTLN",
    0x72: "OP_TRACE",
    0x73: "OP_ASSERT_EQ",
    0x80: "OP_GFX_INIT",
    0x81: "OP_GFX_IS_RUNNING",
    0x82: "OP_GFX_CLEAR",
    0x83: "OP_GFX_DRAW_RECT",
    0x84: "OP_GFX_DRAW_CIRCLE",
    0x85: "OP_GFX_DRAW_TEXT",
    0x86: "OP_GFX_FLIP",
    0x87: "OP_GFX_GET_KEY",
    0x88: "OP_GFX_CLOSE",
    0x90: "OP_NN_CREATE_DENSE",
    0x91: "OP_NN_SET_WEIGHT",
    0x92: "OP_NN_SET_BIAS",
    0x93: "OP_NN_SET_INPUT",
    0x94: "OP_NN_GET_INPUT",
    0x95: "OP_NN_FORWARD",
    0x96: "OP_NN_GET_OUTPUT",
    0x97: "OP_NN_COPY_OUT_IN",
    0x98: "OP_NN_PREDICT",
    0x99: "OP_NN_CONFIDENCE",
    0x9A: "OP_NN_LOAD_MNIST",
    0x9B: "OP_NN_FREE_LAYER",
    0x9C: "OP_TIME_NOW_US",
    0xA0: "OP_GET_FIELD",
    0xA1: "OP_NEW_INSTANCE",
    0xA2: "OP_GET_INDEX",
    0xA3: "OP_SET_FIELD",
    0xA4: "OP_INVOKE_METHOD",
    0xA5: "OP_SET_INDEX",
    0xA6: "OP_NEW_ARRAY",
    0xFF: "OP_HALT",
}

# Instruction operand sizes in bytes
OP_OPERAND_SIZES = {
    0x00: 0, # OP_NOP
    0x01: 8, # OP_PUSH_INT (int64)
    0x02: 2, # OP_PUSH_TRYTE (int16)
    0x03: 20,# OP_PUSH_TAFPU (int64 a, int64 b, int32 s)
    0x04: 8, # OP_PUSH_FLOAT (double)
    0x05: 2, # OP_PUSH_STRING (uint16)
    0x06: 1, # OP_PUSH_BOOL (uint8)
    0x07: 0, # OP_POP
    0x08: 0, # OP_DUP
    0x10: 2, # OP_LOAD_LOCAL (uint16)
    0x11: 2, # OP_STORE_LOCAL (uint16)
    0x12: 2, # OP_LOAD_GLOBAL (uint16)
    0x13: 2, # OP_STORE_GLOBAL (uint16)
    0x20: 0, # OP_ADD
    0x21: 0, # OP_SUB
    0x22: 0, # OP_MUL
    0x23: 0, # OP_DIV
    0x24: 0, # OP_NEG
    0x25: 0, # OP_TERNARY_NOT
    0x26: 0, # OP_TERNARY_CMP
    0x27: 0, # OP_TERNARY_MIN
    0x28: 0, # OP_TERNARY_MAX
    0x30: 0, # OP_EQ
    0x31: 0, # OP_NEQ
    0x32: 0, # OP_LT
    0x33: 0, # OP_LE
    0x34: 0, # OP_GT
    0x35: 0, # OP_GE
    0x40: 0, # OP_TAFPU_CONSTRUCT
    0x41: 0, # OP_TAFPU_ENCODE
    0x42: 0, # OP_TAFPU_TODBL
    0x50: 2, # OP_JUMP (int16)
    0x51: 2, # OP_JUMP_IF_FALSE (int16)
    0x52: 6, # OP_BRANCH_3 (int16 neg, int16 zero, int16 pos)
    0x60: 3, # OP_CALL (uint16 fn_id, uint8 argc)
    0x61: 0, # OP_RET
    0x70: 0, # OP_PRINT
    0x71: 0, # OP_PRINTLN
    0x72: 0, # OP_TRACE
    0x73: 0, # OP_ASSERT_EQ
    0x80: 0, # OP_GFX_INIT
    0x81: 0, # OP_GFX_IS_RUNNING
    0x82: 0, # OP_GFX_CLEAR
    0x83: 0, # OP_GFX_DRAW_RECT
    0x84: 0, # OP_GFX_DRAW_CIRCLE
    0x85: 0, # OP_GFX_DRAW_TEXT
    0x86: 0, # OP_GFX_FLIP
    0x87: 0, # OP_GFX_GET_KEY
    0x88: 0, # OP_GFX_CLOSE
    0x90: 0, # OP_NN_CREATE_DENSE
    0x91: 0, # OP_NN_SET_WEIGHT
    0x92: 0, # OP_NN_SET_BIAS
    0x93: 0, # OP_NN_SET_INPUT
    0x94: 0, # OP_NN_GET_INPUT
    0x95: 0, # OP_NN_FORWARD
    0x96: 0, # OP_NN_GET_OUTPUT
    0x97: 0, # OP_NN_COPY_OUT_IN
    0x98: 0, # OP_NN_PREDICT
    0x99: 0, # OP_NN_CONFIDENCE
    0x9A: 0, # OP_NN_LOAD_MNIST
    0x9B: 0, # OP_NN_FREE_LAYER
    0x9C: 0, # OP_TIME_NOW_US
    0xA0: 2, # OP_GET_FIELD (uint16 str_id)
    0xA1: 3, # OP_NEW_INSTANCE (uint16 type_id, uint8 field_count)
    0xA2: 0, # OP_GET_INDEX
    0xA3: 2, # OP_SET_FIELD (uint16 str_id)
    0xA4: 3, # OP_INVOKE_METHOD (uint16 method_id, uint8 argc)
    0xA5: 0, # OP_SET_INDEX
    0xA6: 2, # OP_NEW_ARRAY (uint16 element_count)
    0xFF: 0, # OP_HALT
}

def verify_tbc_whitelist(filepath):
    print(f"=== TEST A: VERIFYING OPCODE WHITELIST FOR: {filepath} ===")
    with open(filepath, "rb") as f:
        data = f.read()

    if len(data) < 8:
        print("[FAIL] File too small to contain valid header.")
        return False

    magic, version = struct.unpack_from("<II", data, 0)
    # Magic "SETU" = 0x55544553
    if magic != 0x55544553 or version != 1:
        print(f"[FAIL] Invalid header magic (0x{magic:08X}) or version ({version}).")
        return False

    offset = 8
    # String table
    str_count, = struct.unpack_from("<I", data, offset)
    offset += 4
    string_table = []
    for _ in range(str_count):
        slen, = struct.unpack_from("<I", data, offset)
        offset += 4
        s = data[offset:offset+slen].decode("utf-8", errors="replace")
        offset += slen
        string_table.append(s)

    code_size, = struct.unpack_from("<I", data, offset)
    offset += 4
    bytecode = data[offset:offset+code_size]

    print(f"[Header OK] Magic: 'SETU', Version: 1")
    print(f"[String Table OK] Count: {len(string_table)} strings")
    print(f"[Bytecode Stream OK] Size: {len(bytecode)} bytes")

    # Disassemble & Validate Whitelist
    pc = 0
    instructions = 0
    unknown_opcodes = []
    histogram = {}

    while pc < len(bytecode):
        op = bytecode[pc]
        pc += 1
        instructions += 1

        if op not in VALID_101_OPCODES:
            unknown_opcodes.append((pc - 1, hex(op)))
            print(f"[VIOLATION] Unknown/Non-1.0.1 Opcode found at offset {pc - 1}: 0x{op:02X}")
            break

        op_name = VALID_101_OPCODES[op]
        histogram[op_name] = histogram.get(op_name, 0) + 1
        op_len = OP_OPERAND_SIZES.get(op, 0)
        pc += op_len

    if unknown_opcodes:
        print(f"[FAILED] Found {len(unknown_opcodes)} unknown opcodes! NOT backward compatible!")
        return False

    print(f"\n[PASSED 100%] All {instructions} instructions belong STRICTLY to ISA 1.0.1 Whitelist!")
    print(f"Zero Opcode Bloat Verified: 0 new opcodes added to ISA.")
    print("\nOpcode Usage Frequency:")
    for op_name, count in sorted(histogram.items(), key=lambda x: -x[1])[:10]:
        print(f"  - {op_name:20s}: {count:4d} times")
    print("===============================================================\n")
    return True

if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "Projects/ScientificLab/test_mouse_interaction.tbc"
    ok = verify_tbc_whitelist(target)
    sys.exit(0 if ok else 1)
