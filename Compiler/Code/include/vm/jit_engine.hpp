#pragma once

#include "compiler/emitter.hpp"
#include "vm/value.hpp"
#include <vector>
#include <cstdint>
#include <string>

namespace setun {

class SetunJITEngine {
public:
    SetunJITEngine();
    ~SetunJITEngine();

    // Compile a bytecode Chunk directly to native x86-64 machine code in RAM
    bool compile(const Chunk& chunk);

    // Execute the compiled JIT code directly on the CPU
    int64_t run();

    // Check if JIT compilation is supported on host system
    static bool is_supported();

    size_t code_size() const { return code_size_; }

private:
    uint8_t* exec_buffer_{nullptr};
    size_t buffer_capacity_{0};
    size_t code_size_{0};

    void emit_byte(uint8_t b);
    void emit_bytes(const std::vector<uint8_t>& bytes);
    void emit_int32(int32_t val);
    void emit_int64(int64_t val);

    bool allocate_buffer(size_t size);
    void free_buffer();
};

} // namespace setun
