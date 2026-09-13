#pragma once

#include <cstdint>
#include <vector>
#include <cstddef>
#include <cassert>

namespace setun {

// x86-64 General Purpose 64-bit Registers
enum class X64Reg : uint8_t {
    RAX = 0,
    RCX = 1,
    RDX = 2,
    RBX = 3,
    RSP = 4,
    RBP = 5,
    RSI = 6,
    RDI = 7,
    R8  = 8,
    R9  = 9,
    R10 = 10,
    R11 = 11,
    R12 = 12,
    R13 = 13,
    R14 = 14,
    R15 = 15
};

// Branch condition codes (maps to x86 0x0F 0x80+cc)
enum class X64Cond : uint8_t {
    O   = 0x0, // Overflow
    NO  = 0x1,
    B   = 0x2, // Below (unsigned <)
    AE  = 0x3, // Above or Equal (unsigned >=)
    EQ  = 0x4, // Equal / Zero (Z)
    NE  = 0x5, // Not Equal / Not Zero (NZ)
    BE  = 0x6, // Below or Equal (unsigned <=)
    A   = 0x7, // Above (unsigned >)
    S   = 0x8, // Sign / Negative
    NS  = 0x9, // Not Sign / Non-negative
    P   = 0xA, // Parity Even
    NP  = 0xB, // Parity Odd
    LT  = 0xC, // Less Than (signed <)
    GE  = 0xD, // Greater or Equal (signed >=)
    LE  = 0xE, // Less or Equal (signed <=)
    GT  = 0xF  // Greater Than (signed >)
};

struct X64Label {
    int32_t offset{-1}; // -1 if unbound, otherwise byte offset in emitter buffer
    std::vector<size_t> fixups; // locations in code buffer needing 32-bit relative displacement
    bool is_bound() const { return offset >= 0; }
};

class X64Assembler {
public:
    X64Assembler() = default;

    // Buffer access
    const std::vector<uint8_t>& code() const { return buffer_; }
    size_t current_offset() const { return buffer_.size(); }
    void clear() { buffer_.clear(); }

    // Label management & backpatching
    void bind(X64Label& label);

    // Register & Memory instructions
    void mov_reg_imm64(X64Reg dst, int64_t imm);
    void mov_reg_reg(X64Reg dst, X64Reg src);
    void mov_reg_mem(X64Reg dst, X64Reg base, int32_t disp);
    void mov_mem_reg(X64Reg base, int32_t disp, X64Reg src);
    void mov_mem_imm32(X64Reg base, int32_t disp, int32_t imm);

    void lea_reg_mem(X64Reg dst, X64Reg base, int32_t disp);

    // Arithmetic
    void add_reg_reg(X64Reg dst, X64Reg src);
    void add_reg_imm32(X64Reg dst, int32_t imm);
    void sub_reg_reg(X64Reg dst, X64Reg src);
    void sub_reg_imm32(X64Reg dst, int32_t imm);
    void imul_reg_reg(X64Reg dst, X64Reg src);
    void idiv_reg(X64Reg src);
    void cqo();

    // Logical & Bitwise
    void and_reg_reg(X64Reg dst, X64Reg src);
    void or_reg_reg(X64Reg dst, X64Reg src);
    void xor_reg_reg(X64Reg dst, X64Reg src);
    void shl_reg_imm8(X64Reg dst, uint8_t shift);
    void shr_reg_imm8(X64Reg dst, uint8_t shift);
    void sar_reg_imm8(X64Reg dst, uint8_t shift);

    // Comparisons & Flags
    void cmp_reg_reg(X64Reg r1, X64Reg r2);
    void cmp_reg_imm32(X64Reg r, int32_t imm);
    void cmp_mem_imm8(X64Reg base, int32_t disp, int8_t imm);
    void test_reg_reg(X64Reg r1, X64Reg r2);

    // Stack operations
    void push_reg(X64Reg r);
    void pop_reg(X64Reg r);

    // Control Flow
    void jmp(X64Label& label);
    void jcc(X64Cond cond, X64Label& label);
    void call_reg(X64Reg r);
    void call_ptr(const void* target_fn, X64Reg scratch = X64Reg::RAX);
    void ret();

    // Low-level byte emitters
    void emit_u8(uint8_t byte) { buffer_.push_back(byte); }
    void emit_u16(uint16_t word);
    void emit_u32(uint32_t dword);
    void emit_u64(uint64_t qword);

private:
    std::vector<uint8_t> buffer_;

    void emit_rex(bool w, uint8_t r, uint8_t x, uint8_t b);
    void emit_modrm(uint8_t mod, uint8_t reg, uint8_t rm);
    void emit_sib(uint8_t scale, uint8_t index, uint8_t base);
    void emit_mem_disp(uint8_t reg_field, X64Reg base, int32_t disp);
};

} // namespace setun
