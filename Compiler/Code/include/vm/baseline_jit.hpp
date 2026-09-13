#pragma once

#include "compiler/emitter.hpp"
#include "vm/x64_assembler.hpp"
#include "vm/jit_buffer.hpp"
#include "vm/jit_frame.hpp"
#include "vm/jit_safepoint.hpp"
#include "vm/jit_lir.hpp"
#include "vm/jit_osr.hpp"
#include "vm/jit_deopt.hpp"
#include <memory>
#include <unordered_map>

namespace setun {

class BaselineJITCompiler {
public:
    BaselineJITCompiler() = default;

    // Lower Bytecode Chunk to LIR
    bool lower_to_lir(const Chunk& chunk, size_t start_ip, size_t end_ip, LIRProgram& out_lir);

    // Compile LIR to native x86-64 executable buffer with OSR and Deopt tables
    bool compile_lir(const LIRProgram& lir, JITCodeBuffer& out_buffer, JITSafepointTable& out_safepoints,
                     OSREntryTable& out_osr_table, DeoptTable& out_deopt_table);

    // End-to-end compilation with full OSR & Deopt metadata
    bool compile_chunk(const Chunk& chunk, size_t start_ip, size_t end_ip,
                       JITCodeBuffer& out_buffer, JITSafepointTable& out_safepoints,
                       OSREntryTable& out_osr_table, DeoptTable& out_deopt_table);

    // Legacy overload for Gate 5.7 compatibility
    bool compile_chunk(const Chunk& chunk, size_t start_ip, size_t end_ip,
                       JITCodeBuffer& out_buffer, JITSafepointTable& out_safepoints) {
        OSREntryTable osr;
        DeoptTable deopt;
        return compile_chunk(chunk, start_ip, end_ip, out_buffer, out_safepoints, osr, deopt);
    }

private:
    X64Assembler asm_;
};

} // namespace setun
