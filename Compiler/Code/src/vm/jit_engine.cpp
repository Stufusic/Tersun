#include "vm/jit_engine.hpp"

#include <iostream>
#include <cstring>

#if defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <sys/mman.h>
#endif

namespace setun {

SetunJITEngine::SetunJITEngine() {
    allocate_buffer(65536); // 64 KB executable JIT memory
}

SetunJITEngine::~SetunJITEngine() {
    free_buffer();
}

bool SetunJITEngine::allocate_buffer(size_t size) {
    buffer_capacity_ = size;
    code_size_ = 0;
#if defined(_WIN32)
    exec_buffer_ = (uint8_t*)VirtualAlloc(NULL, size, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
    return exec_buffer_ != nullptr;
#else
    exec_buffer_ = (uint8_t*)mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
    return exec_buffer_ != MAP_FAILED;
#endif
}

void SetunJITEngine::free_buffer() {
    if (!exec_buffer_) return;
#if defined(_WIN32)
    VirtualFree(exec_buffer_, 0, MEM_RELEASE);
#else
    munmap(exec_buffer_, buffer_capacity_);
#endif
    exec_buffer_ = nullptr;
    buffer_capacity_ = 0;
    code_size_ = 0;
}

void SetunJITEngine::emit_byte(uint8_t b) {
    if (code_size_ < buffer_capacity_) {
        exec_buffer_[code_size_++] = b;
    }
}

void SetunJITEngine::emit_bytes(const std::vector<uint8_t>& bytes) {
    for (uint8_t b : bytes) emit_byte(b);
}

void SetunJITEngine::emit_int32(int32_t val) {
    uint8_t* p = reinterpret_cast<uint8_t*>(&val);
    for (int i = 0; i < 4; ++i) emit_byte(p[i]);
}

void SetunJITEngine::emit_int64(int64_t val) {
    uint8_t* p = reinterpret_cast<uint8_t*>(&val);
    for (int i = 0; i < 8; ++i) emit_byte(p[i]);
}

bool SetunJITEngine::is_supported() {
#if defined(__x86_64__) || defined(_M_X64)
    return true;
#else
    return false;
#endif
}

bool SetunJITEngine::compile(const Chunk& chunk) {
    if (!exec_buffer_) return false;
    code_size_ = 0;

    // Standard x86-64 Function Prologue (Windows x64 & System V ABI compliant):
    // push rbp
    // push rbx
    // mov rbp, rsp
    // sub rsp, 256
    emit_bytes({0x55, 0x53, 0x48, 0x89, 0xE5, 0x48, 0x81, 0xEC, 0x00, 0x01, 0x00, 0x00});

    size_t ip = 0;
    // If the chunk begins with OP_JUMP skipping over function definitions, start compiling from first function
    if (chunk.code.size() >= 3 && static_cast<OpCode>(chunk.code[0]) == OpCode::OP_JUMP) {
        ip = 3;
    }

    while (ip < chunk.code.size()) {
        uint8_t opcode = chunk.code[ip++];
        OpCode op = static_cast<OpCode>(opcode);

        switch (op) {
            case OpCode::OP_PUSH_INT: {
                if (ip + 8 > chunk.code.size()) return false;
                int64_t val = 0;
                std::memcpy(&val, &chunk.code[ip], 8);
                ip += 8;

                // mov rax, imm64 (0x48, 0xB8, imm64)
                emit_bytes({0x48, 0xB8});
                emit_int64(val);
                // push rax (0x50)
                emit_byte(0x50);
                break;
            }
            case OpCode::OP_STORE_LOCAL: {
                if (ip + 2 > chunk.code.size()) return false;
                uint16_t slot = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                if (slot >= 30) return false;
                int8_t disp = -static_cast<int8_t>((slot + 1) * 8);
                // pop rax (0x58), mov [rbp + disp], rax (0x48, 0x89, 0x45, disp)
                emit_bytes({0x58, 0x48, 0x89, 0x45, static_cast<uint8_t>(disp)});
                break;
            }
            case OpCode::OP_LOAD_LOCAL: {
                if (ip + 2 > chunk.code.size()) return false;
                uint16_t slot = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                if (slot >= 30) return false;
                int8_t disp = -static_cast<int8_t>((slot + 1) * 8);
                // mov rax, [rbp + disp] (0x48, 0x8B, 0x45, disp), push rax (0x50)
                emit_bytes({0x48, 0x8B, 0x45, static_cast<uint8_t>(disp), 0x50});
                break;
            }
            case OpCode::OP_POP: {
                // pop rax (0x58)
                emit_byte(0x58);
                break;
            }
            case OpCode::OP_ADD: {
                // pop rcx (0x59), pop rax (0x58), add rax, rcx (0x48, 0x01, 0xC8), push rax (0x50)
                emit_bytes({0x59, 0x58, 0x48, 0x01, 0xC8, 0x50});
                break;
            }
            case OpCode::OP_SUB: {
                // pop rcx (0x59), pop rax (0x58), sub rax, rcx (0x48, 0x29, 0xC8), push rax (0x50)
                emit_bytes({0x59, 0x58, 0x48, 0x29, 0xC8, 0x50});
                break;
            }
            case OpCode::OP_MUL: {
                // pop rcx (0x59), pop rax (0x58), imul rax, rcx (0x48, 0x0F, 0xAF, 0xC1), push rax (0x50)
                emit_bytes({0x59, 0x58, 0x48, 0x0F, 0xAF, 0xC1, 0x50});
                break;
            }
            case OpCode::OP_DIV: {
                // pop rcx (0x59), pop rax (0x58), cqo (0x48, 0x99), idiv rcx (0x48, 0xF7, 0xF9), push rax (0x50)
                emit_bytes({0x59, 0x58, 0x48, 0x99, 0x48, 0xF7, 0xF9, 0x50});
                break;
            }
            case OpCode::OP_HALT:
            case OpCode::OP_RET: {
                // pop rax (0x58) -> return value
                // mov rsp, rbp (0x48, 0x89, 0xEC)
                // pop rbx (0x5B)
                // pop rbp (0x5D)
                // ret (0xC3)
                emit_bytes({0x58, 0x48, 0x89, 0xEC, 0x5B, 0x5D, 0xC3});
                return true;
            }
            default: {
                // Return false to safely fallback to VM for unsupported or complex control-flow opcodes
                return false;
            }
        }
    }

    // Default fallback epilogue: return 0
    emit_bytes({0x48, 0x31, 0xC0, 0x48, 0x89, 0xEC, 0x5B, 0x5D, 0xC3});
    return true;
}

int64_t SetunJITEngine::run() {
    if (!exec_buffer_) return 0;
    typedef int64_t (*JITFunc)();
    JITFunc func = reinterpret_cast<JITFunc>(exec_buffer_);
    return func();
}

} // namespace setun
