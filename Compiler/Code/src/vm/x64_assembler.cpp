#include "vm/x64_assembler.hpp"
#include <cstring>

namespace setun {

void X64Assembler::emit_u16(uint16_t word) {
    buffer_.push_back(static_cast<uint8_t>(word & 0xFF));
    buffer_.push_back(static_cast<uint8_t>((word >> 8) & 0xFF));
}

void X64Assembler::emit_u32(uint32_t dword) {
    buffer_.push_back(static_cast<uint8_t>(dword & 0xFF));
    buffer_.push_back(static_cast<uint8_t>((dword >> 8) & 0xFF));
    buffer_.push_back(static_cast<uint8_t>((dword >> 16) & 0xFF));
    buffer_.push_back(static_cast<uint8_t>((dword >> 24) & 0xFF));
}

void X64Assembler::emit_u64(uint64_t qword) {
    for (int i = 0; i < 8; ++i) {
        buffer_.push_back(static_cast<uint8_t>((qword >> (i * 8)) & 0xFF));
    }
}

void X64Assembler::emit_rex(bool w, uint8_t r, uint8_t x, uint8_t b) {
    uint8_t rex = 0x40 | (w ? 0x08 : 0) | ((r & 1) << 2) | ((x & 1) << 1) | (b & 1);
    buffer_.push_back(rex);
}

void X64Assembler::emit_modrm(uint8_t mod, uint8_t reg, uint8_t rm) {
    uint8_t byte = ((mod & 3) << 6) | ((reg & 7) << 3) | (rm & 7);
    buffer_.push_back(byte);
}

void X64Assembler::emit_sib(uint8_t scale, uint8_t index, uint8_t base) {
    uint8_t byte = ((scale & 3) << 6) | ((index & 7) << 3) | (base & 7);
    buffer_.push_back(byte);
}

void X64Assembler::emit_mem_disp(uint8_t reg_field, X64Reg base, int32_t disp) {
    uint8_t b = static_cast<uint8_t>(base) & 7;
    bool needs_sib = (b == 4); // RSP or R12
    bool is_rbp_base = (b == 5); // RBP or R13

    if (disp == 0 && !is_rbp_base) {
        // mod = 00
        emit_modrm(0x00, reg_field, b);
        if (needs_sib) emit_sib(0, 4, 4); // [rsp]
    } else if (disp >= -128 && disp <= 127) {
        // mod = 01 (disp8)
        emit_modrm(0x01, reg_field, b);
        if (needs_sib) emit_sib(0, 4, 4);
        buffer_.push_back(static_cast<uint8_t>(disp & 0xFF));
    } else {
        // mod = 10 (disp32)
        emit_modrm(0x02, reg_field, b);
        if (needs_sib) emit_sib(0, 4, 4);
        emit_u32(static_cast<uint32_t>(disp));
    }
}

void X64Assembler::emit_mem_sib(uint8_t reg_field, X64Reg base, X64Reg index, uint8_t scale, int32_t disp) {
    uint8_t b = static_cast<uint8_t>(base) & 7;
    uint8_t idx = static_cast<uint8_t>(index) & 7;
    bool is_rbp_base = (b == 5); // RBP or R13

    if (disp == 0 && !is_rbp_base) {
        emit_modrm(0x00, reg_field, 4); // rm = 4 indicates SIB follows
        emit_sib(scale, idx, b);
    } else if (disp >= -128 && disp <= 127) {
        emit_modrm(0x01, reg_field, 4);
        emit_sib(scale, idx, b);
        emit_u8(static_cast<uint8_t>(disp & 0xFF));
    } else {
        emit_modrm(0x02, reg_field, 4);
        emit_sib(scale, idx, b);
        emit_u32(static_cast<uint32_t>(disp));
    }
}

void X64Assembler::emit_vex3(uint8_t r_reg, uint8_t x_reg, uint8_t b_reg, uint8_t m_mmmmm, uint8_t w, uint8_t vvvv, uint8_t l, uint8_t pp) {
    uint8_t r_inv = (r_reg < 8) ? 1 : 0;
    uint8_t x_inv = (x_reg < 8) ? 1 : 0;
    uint8_t b_inv = (b_reg < 8) ? 1 : 0;
    uint8_t b2 = ((r_inv & 1) << 7) | ((x_inv & 1) << 6) | ((b_inv & 1) << 5) | (m_mmmmm & 0x1F);
    uint8_t b3 = ((w & 1) << 7) | ((~vvvv & 0xF) << 3) | ((l & 1) << 2) | (pp & 3);
    emit_u8(0xC4);
    emit_u8(b2);
    emit_u8(b3);
}

void X64Assembler::bind(X64Label& label) {
    assert(!label.is_bound() && "Label already bound!");
    label.offset = static_cast<int32_t>(current_offset());

    // Resolve all forward branch fixups
    for (size_t fixup_pos : label.fixups) {
        int32_t rel = label.offset - static_cast<int32_t>(fixup_pos + 4);
        uint32_t u_rel = static_cast<uint32_t>(rel);
        buffer_[fixup_pos + 0] = static_cast<uint8_t>(u_rel & 0xFF);
        buffer_[fixup_pos + 1] = static_cast<uint8_t>((u_rel >> 8) & 0xFF);
        buffer_[fixup_pos + 2] = static_cast<uint8_t>((u_rel >> 16) & 0xFF);
        buffer_[fixup_pos + 3] = static_cast<uint8_t>((u_rel >> 24) & 0xFF);
    }
    label.fixups.clear();
}

void X64Assembler::mov_reg_imm64(X64Reg dst, int64_t imm) {
    uint8_t d = static_cast<uint8_t>(dst);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0xB8 + (d & 7));
    emit_u64(static_cast<uint64_t>(imm));
}

void X64Assembler::mov_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (d >= 8 ? 1 : 0));
    emit_u8(0x89);
    emit_modrm(0x03, s & 7, d & 7);
}

void X64Assembler::mov_reg_mem(X64Reg dst, X64Reg base, int32_t disp) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t b = static_cast<uint8_t>(base);
    emit_rex(true, (d >= 8 ? 1 : 0), 0, (b >= 8 ? 1 : 0));
    emit_u8(0x8B);
    emit_mem_disp(d & 7, base, disp);
}

void X64Assembler::mov_mem_reg(X64Reg base, int32_t disp, X64Reg src) {
    uint8_t b = static_cast<uint8_t>(base);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (b >= 8 ? 1 : 0));
    emit_u8(0x89);
    emit_mem_disp(s & 7, base, disp);
}

void X64Assembler::mov_mem_imm32(X64Reg base, int32_t disp, int32_t imm) {
    uint8_t b = static_cast<uint8_t>(base);
    emit_rex(true, 0, 0, (b >= 8 ? 1 : 0));
    emit_u8(0xC7);
    emit_mem_disp(0, base, disp);
    emit_u32(static_cast<uint32_t>(imm));
}

void X64Assembler::lea_reg_mem(X64Reg dst, X64Reg base, int32_t disp) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t b = static_cast<uint8_t>(base);
    emit_rex(true, (d >= 8 ? 1 : 0), 0, (b >= 8 ? 1 : 0));
    emit_u8(0x8D);
    emit_mem_disp(d & 7, base, disp);
}

void X64Assembler::add_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (d >= 8 ? 1 : 0));
    emit_u8(0x01);
    emit_modrm(0x03, s & 7, d & 7);
}

void X64Assembler::add_reg_imm32(X64Reg dst, int32_t imm) {
    uint8_t d = static_cast<uint8_t>(dst);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0x81);
    emit_modrm(0x03, 0, d & 7);
    emit_u32(static_cast<uint32_t>(imm));
}

void X64Assembler::sub_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (d >= 8 ? 1 : 0));
    emit_u8(0x29);
    emit_modrm(0x03, s & 7, d & 7);
}

void X64Assembler::sub_reg_imm32(X64Reg dst, int32_t imm) {
    uint8_t d = static_cast<uint8_t>(dst);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0x81);
    emit_modrm(0x03, 5, d & 7);
    emit_u32(static_cast<uint32_t>(imm));
}

void X64Assembler::imul_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (d >= 8 ? 1 : 0), 0, (s >= 8 ? 1 : 0));
    emit_u8(0x0F);
    emit_u8(0xAF);
    emit_modrm(0x03, d & 7, s & 7);
}

void X64Assembler::idiv_reg(X64Reg src) {
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, 0, 0, (s >= 8 ? 1 : 0));
    emit_u8(0xF7);
    emit_modrm(0x03, 7, s & 7);
}

void X64Assembler::cqo() {
    emit_u8(0x48);
    emit_u8(0x99);
}

void X64Assembler::and_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (d >= 8 ? 1 : 0));
    emit_u8(0x21);
    emit_modrm(0x03, s & 7, d & 7);
}

void X64Assembler::or_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (d >= 8 ? 1 : 0));
    emit_u8(0x09);
    emit_modrm(0x03, s & 7, d & 7);
}

void X64Assembler::xor_reg_reg(X64Reg dst, X64Reg src) {
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s = static_cast<uint8_t>(src);
    emit_rex(true, (s >= 8 ? 1 : 0), 0, (d >= 8 ? 1 : 0));
    emit_u8(0x31);
    emit_modrm(0x03, s & 7, d & 7);
}

void X64Assembler::shl_reg_imm8(X64Reg dst, uint8_t shift) {
    uint8_t d = static_cast<uint8_t>(dst);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0xC1);
    emit_modrm(0x03, 4, d & 7);
    emit_u8(shift);
}

void X64Assembler::shr_reg_imm8(X64Reg dst, uint8_t shift) {
    uint8_t d = static_cast<uint8_t>(dst);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0xC1);
    emit_modrm(0x03, 5, d & 7);
    emit_u8(shift);
}

void X64Assembler::sar_reg_imm8(X64Reg dst, uint8_t shift) {
    uint8_t d = static_cast<uint8_t>(dst);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0xC1);
    emit_modrm(0x03, 7, d & 7);
    emit_u8(shift);
}

void X64Assembler::cmp_reg_reg(X64Reg r1, X64Reg r2) {
    uint8_t d1 = static_cast<uint8_t>(r1);
    uint8_t d2 = static_cast<uint8_t>(r2);
    emit_rex(true, (d2 >= 8 ? 1 : 0), 0, (d1 >= 8 ? 1 : 0));
    emit_u8(0x39);
    emit_modrm(0x03, d2 & 7, d1 & 7);
}

void X64Assembler::cmp_reg_imm32(X64Reg r, int32_t imm) {
    uint8_t d = static_cast<uint8_t>(r);
    emit_rex(true, 0, 0, (d >= 8 ? 1 : 0));
    emit_u8(0x81);
    emit_modrm(0x03, 7, d & 7);
    emit_u32(static_cast<uint32_t>(imm));
}

void X64Assembler::cmp_mem_imm8(X64Reg base, int32_t disp, int8_t imm) {
    uint8_t b = static_cast<uint8_t>(base);
    if (b >= 8) {
        emit_u8(0x41); // REX.B
    }
    emit_u8(0x80);
    emit_mem_disp(7, base, disp);
    emit_u8(static_cast<uint8_t>(imm));
}

void X64Assembler::test_reg_reg(X64Reg r1, X64Reg r2) {
    uint8_t d1 = static_cast<uint8_t>(r1);
    uint8_t d2 = static_cast<uint8_t>(r2);
    emit_rex(true, (d2 >= 8 ? 1 : 0), 0, (d1 >= 8 ? 1 : 0));
    emit_u8(0x85);
    emit_modrm(0x03, d2 & 7, d1 & 7);
}

void X64Assembler::push_reg(X64Reg r) {
    uint8_t d = static_cast<uint8_t>(r);
    if (d >= 8) {
        emit_u8(0x41);
    }
    emit_u8(0x50 + (d & 7));
}

void X64Assembler::pop_reg(X64Reg r) {
    uint8_t d = static_cast<uint8_t>(r);
    if (d >= 8) {
        emit_u8(0x41);
    }
    emit_u8(0x58 + (d & 7));
}

void X64Assembler::jmp(X64Label& label) {
    emit_u8(0xE9);
    if (label.is_bound()) {
        int32_t rel = label.offset - static_cast<int32_t>(current_offset() + 4);
        emit_u32(static_cast<uint32_t>(rel));
    } else {
        label.fixups.push_back(current_offset());
        emit_u32(0);
    }
}

void X64Assembler::jcc(X64Cond cond, X64Label& label) {
    emit_u8(0x0F);
    emit_u8(0x80 + static_cast<uint8_t>(cond));
    if (label.is_bound()) {
        int32_t rel = label.offset - static_cast<int32_t>(current_offset() + 4);
        emit_u32(static_cast<uint32_t>(rel));
    } else {
        label.fixups.push_back(current_offset());
        emit_u32(0);
    }
}

void X64Assembler::call_reg(X64Reg r) {
    uint8_t d = static_cast<uint8_t>(r);
    if (d >= 8) {
        emit_u8(0x41);
    }
    emit_u8(0xFF);
    emit_modrm(0x03, 2, d & 7);
}

void X64Assembler::call_ptr(const void* target_fn, X64Reg scratch) {
    mov_reg_imm64(scratch, reinterpret_cast<int64_t>(target_fn));
    call_reg(scratch);
}

void X64Assembler::ret() {
    emit_u8(0xC3);
}

bool X64Assembler::has_avx2() {
#if defined(__x86_64__) || defined(_M_X64)
    return __builtin_cpu_supports("avx2");
#else
    return false;
#endif
}

bool X64Assembler::has_fma() {
#if defined(__x86_64__) || defined(_M_X64)
    return __builtin_cpu_supports("fma");
#else
    return false;
#endif
}

void X64Assembler::vzeroall() {
    emit_u8(0xC5);
    emit_u8(0xFC);
    emit_u8(0x77);
}

void X64Assembler::vpbroadcastq(YmmReg dst, X64Reg base, int32_t disp) {
    // VEX.256.66.0F38.W0 59 /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(d, 0, b, 0x02, 0, 0, 1, 0x01);
    emit_u8(0x59);
    emit_mem_disp(d & 7, base, disp);
}

void X64Assembler::vmovdqu_reg_mem_sib(YmmReg dst, X64Reg base, X64Reg index, uint8_t scale, int32_t disp) {
    // VEX.256.F3.0F.WIG 6F /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t idx = static_cast<uint8_t>(index);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(d, idx, b, 0x01, 0, 0, 1, 0x02);
    emit_u8(0x6F);
    emit_mem_sib(d & 7, base, index, scale, disp);
}

void X64Assembler::vmovdqu_mem_sib_reg(X64Reg base, X64Reg index, uint8_t scale, int32_t disp, YmmReg src) {
    // VEX.256.F3.0F.WIG 7F /r
    uint8_t s = static_cast<uint8_t>(src);
    uint8_t idx = static_cast<uint8_t>(index);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(s, idx, b, 0x01, 0, 0, 1, 0x02);
    emit_u8(0x7F);
    emit_mem_sib(s & 7, base, index, scale, disp);
}

void X64Assembler::vpmuludq_reg_reg_reg(YmmReg dst, YmmReg src1, YmmReg src2) {
    // VEX.256.66.0F.WIG F4 /r (dst = src1 * src2)
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t s2 = static_cast<uint8_t>(src2);
    emit_vex3(d, 0, s2, 0x01, 0, s1, 1, 0x01);
    emit_u8(0xF4);
    emit_modrm(0x03, d & 7, s2 & 7);
}

void X64Assembler::vpaddq_reg_reg_reg(YmmReg dst, YmmReg src1, YmmReg src2) {
    // VEX.256.66.0F.WIG D4 /r (dst = src1 + src2)
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t s2 = static_cast<uint8_t>(src2);
    emit_vex3(d, 0, s2, 0x01, 0, s1, 1, 0x01);
    emit_u8(0xD4);
    emit_modrm(0x03, d & 7, s2 & 7);
}

void X64Assembler::vpaddq_reg_reg_mem_sib(YmmReg dst, YmmReg src1, X64Reg base, X64Reg index, uint8_t scale, int32_t disp) {
    // VEX.256.66.0F.WIG D4 /r (dst = src1 + [base+index*scale+disp])
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t idx = static_cast<uint8_t>(index);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(d, idx, b, 0x01, 0, s1, 1, 0x01);
    emit_u8(0xD4);
    emit_mem_sib(d & 7, base, index, scale, disp);
}

void X64Assembler::vbroadcastsd(YmmReg dst, X64Reg base, int32_t disp) {
    // VEX.256.66.0F38.W0 19 /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(d, 0, b, 0x02, 0, 0, 1, 0x01);
    emit_u8(0x19);
    emit_mem_disp(d & 7, base, disp);
}

void X64Assembler::vmovupd_reg_mem_sib(YmmReg dst, X64Reg base, X64Reg index, uint8_t scale, int32_t disp) {
    // VEX.256.66.0F.WIG 10 /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t idx = static_cast<uint8_t>(index);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(d, idx, b, 0x01, 0, 0, 1, 0x01);
    emit_u8(0x10);
    emit_mem_sib(d & 7, base, index, scale, disp);
}

void X64Assembler::vmovupd_mem_sib_reg(X64Reg base, X64Reg index, uint8_t scale, int32_t disp, YmmReg src) {
    // VEX.256.66.0F.WIG 11 /r
    uint8_t s = static_cast<uint8_t>(src);
    uint8_t idx = static_cast<uint8_t>(index);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(s, idx, b, 0x01, 0, 0, 1, 0x01);
    emit_u8(0x11);
    emit_mem_sib(s & 7, base, index, scale, disp);
}

void X64Assembler::vmulpd_reg_reg_reg(YmmReg dst, YmmReg src1, YmmReg src2) {
    // VEX.256.66.0F.WIG 59 /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t s2 = static_cast<uint8_t>(src2);
    emit_vex3(d, 0, s2, 0x01, 0, s1, 1, 0x01);
    emit_u8(0x59);
    emit_modrm(0x03, d & 7, s2 & 7);
}

void X64Assembler::vaddpd_reg_reg_reg(YmmReg dst, YmmReg src1, YmmReg src2) {
    // VEX.256.66.0F.WIG 58 /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t s2 = static_cast<uint8_t>(src2);
    emit_vex3(d, 0, s2, 0x01, 0, s1, 1, 0x01);
    emit_u8(0x58);
    emit_modrm(0x03, d & 7, s2 & 7);
}

void X64Assembler::vfmadd231pd_reg_reg_reg(YmmReg dst, YmmReg src1, YmmReg src2) {
    // VEX.256.66.0F38.W1 B8 /r (dst = dst + src1 * src2)
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t s2 = static_cast<uint8_t>(src2);
    emit_vex3(d, 0, s2, 0x02, 1, s1, 1, 0x01);
    emit_u8(0xB8);
    emit_modrm(0x03, d & 7, s2 & 7);
}

void X64Assembler::vfmadd231pd_reg_reg_mem_sib(YmmReg dst, YmmReg src1, X64Reg base, X64Reg index, uint8_t scale, int32_t disp) {
    // VEX.256.66.0F38.W1 B8 /r (dst = dst + src1 * [base+index*scale+disp])
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t idx = static_cast<uint8_t>(index);
    uint8_t b = static_cast<uint8_t>(base);
    emit_vex3(d, idx, b, 0x02, 1, s1, 1, 0x01);
    emit_u8(0xB8);
    emit_mem_sib(d & 7, base, index, scale, disp);
}

void X64Assembler::vxorpd_reg_reg_reg(YmmReg dst, YmmReg src1, YmmReg src2) {
    // VEX.256.66.0F.WIG 57 /r
    uint8_t d = static_cast<uint8_t>(dst);
    uint8_t s1 = static_cast<uint8_t>(src1);
    uint8_t s2 = static_cast<uint8_t>(src2);
    emit_vex3(d, 0, s2, 0x01, 0, s1, 1, 0x01);
    emit_u8(0x57);
    emit_modrm(0x03, d & 7, s2 & 7);
}

} // namespace setun
