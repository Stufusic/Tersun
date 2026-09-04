#pragma once

#include <cstdint>
#include <vector>
#include <string>

namespace tersun {
namespace qvm {

// ============================================================================
// Q-ISA: Quantum Instruction Set Architecture for Tersun 1.0.2
// ============================================================================
enum class QOpCode : uint8_t {
    OP_NOP          = 0x00,
    OP_INIT         = 0x01, // INIT n_qubits
    OP_PACK2        = 0x02, // PACK2 q_idx, r_val (packs 2-bit value into qubit state)
    OP_UNPACK2      = 0x03, // UNPACK2 r_dst, q_idx (measures/reads 2-bit value)
    
    // 1-Qubit Quantum Gates
    OP_H            = 0x10, // H q_idx
    OP_X            = 0x11, // X q_idx (Pauli-X / NOT)
    OP_Y            = 0x12, // Y q_idx
    OP_Z            = 0x13, // Z q_idx (Phase flip)
    OP_S            = 0x14, // S q_idx (Phase pi/2)
    OP_T            = 0x15, // T q_idx (pi/4)
    OP_RX           = 0x16, // RX q_idx, angle_f64
    OP_RY           = 0x17, // RY q_idx, angle_f64
    OP_RZ           = 0x18, // RZ q_idx, angle_f64

    // 2-Qubit & Multi-Qubit Gates
    OP_CNOT         = 0x20, // CNOT ctrl_q, target_q
    OP_CZ           = 0x21, // CZ ctrl_q, target_q
    OP_SWAP         = 0x22, // SWAP q1, q2
    OP_TOFFOLI      = 0x25, // TOFFOLI c1, c2, target_q

    // Ternary Algebraic Gates
    OP_TRIT_CYCLE   = 0x30, // TRIT_CYCLE q_idx (0 -> +1 -> -1 -> 0)
    OP_TRIT_INV     = 0x31, // TRIT_INV q_idx (+1 <-> -1, 0 -> 0)

    // Measurement & Projection
    OP_MEASURE      = 0x40, // MEASURE dst_reg, q_idx (returns 0 or 1)
    OP_MEASURE_TRIT = 0x41, // MEASURE_TRIT dst_reg, q_idx (returns -1, 0, or +1)

    // Control Flow
    OP_BRANCH3      = 0x50, // BRANCH3 q_idx, offset_neg, offset_zero, offset_pos
    OP_JUMP         = 0x51, // JUMP offset
    OP_HALT         = 0xFF  // HALT
};

// ============================================================================
// QVM Bytecode Chunk (.qbc)
// ============================================================================
struct QChunk {
    static constexpr uint32_t MAGIC = 0x54455351; // "QSET" in little-endian ('Q','S','E','T')
    static constexpr uint32_t VERSION = 0x00010002; // Version 1.0.2

    size_t num_qubits{8};
    std::vector<uint8_t> code;
    std::vector<double> constant_pool_f64;

    void emit_byte(uint8_t b) {
        code.push_back(b);
    }

    void emit_u16(uint16_t v) {
        code.push_back(static_cast<uint8_t>(v & 0xFF));
        code.push_back(static_cast<uint8_t>((v >> 8) & 0xFF));
    }

    void emit_u32(uint32_t v) {
        code.push_back(static_cast<uint8_t>(v & 0xFF));
        code.push_back(static_cast<uint8_t>((v >> 8) & 0xFF));
        code.push_back(static_cast<uint8_t>((v >> 16) & 0xFF));
        code.push_back(static_cast<uint8_t>((v >> 24) & 0xFF));
    }

    bool save_to_file(const std::string& path) const;
    static bool load_from_file(const std::string& path, QChunk& out_chunk);
    std::string disassemble(const std::string& name = "") const;
};

} // namespace qvm
} // namespace tersun
