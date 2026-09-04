#include "compiler/llvm2qvm.hpp"
#include <sstream>
#include <fstream>
#include <iostream>
#include <regex>

namespace tersun {
namespace compiler {

LLVM2QVMTranslator::LLVM2QVMTranslator()
    : circuit_(16) {}

size_t LLVM2QVMTranslator::allocate_qubit_for(const std::string& var_name) {
    auto it = var_to_qubit_.find(var_name);
    if (it != var_to_qubit_.end()) {
        return it->second;
    }
    size_t q = next_qubit_id_++;
    var_to_qubit_[var_name] = q;
    return q;
}

bool LLVM2QVMTranslator::translate_ir(const std::string& llvm_ir, qvm::QChunk& out_chunk) {
    out_chunk.code.clear();
    out_chunk.num_qubits = 16;
    next_qubit_id_ = 0;
    var_to_qubit_.clear();
    circuit_ = qvm::QuantumCircuit(16);

    // Emit INIT 16 qubits
    out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_INIT));
    out_chunk.emit_byte(16);

    std::istringstream iss(llvm_ir);
    std::string line;

    while (std::getline(iss, line)) {
        // Strip leading whitespace
        size_t start = line.find_first_not_of(" \t");
        if (start == std::string::npos) continue;
        std::string s = line.substr(start);

        // 1. Bitwise XOR -> CNOT gate (XOR is reversible quantum CNOT)
        // %res = xor i64 %a, %b
        if (s.find("= xor") != std::string::npos) {
            std::smatch m;
            std::regex re(R"(%(\w+)\s*=\s*xor\s+\w+\s*%(\w+),\s*%(\w+))");
            if (std::regex_search(s, m, re)) {
                size_t qa = allocate_qubit_for(m[2].str());
                size_t qb = allocate_qubit_for(m[3].str());
                circuit_.cnot(qa, qb);

                out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_CNOT));
                out_chunk.emit_byte(static_cast<uint8_t>(qa));
                out_chunk.emit_byte(static_cast<uint8_t>(qb));
                var_to_qubit_[m[1].str()] = qb;
            }
        }
        // 2. Subtraction from zero / Negation -> Pauli-X or Ternary-Invert
        // %t5 = sub i64 0, %a
        else if (s.find("= sub") != std::string::npos && s.find("0,") != std::string::npos) {
            std::smatch m;
            std::regex re(R"(%(\w+)\s*=\s*sub\s+\w+\s*0,\s*%?(\w+))");
            if (std::regex_search(s, m, re)) {
                size_t q = allocate_qubit_for(m[2].str());
                circuit_.ternary_invert(q);

                out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_TRIT_INV));
                out_chunk.emit_byte(static_cast<uint8_t>(q));
                var_to_qubit_[m[1].str()] = q;
            }
        }
        // 3. Store constant -> 2-bit packing to Qubit
        // store i64 <val>, i64* %ptr
        else if (s.find("store i64") != std::string::npos) {
            std::smatch m;
            std::regex re(R"(store\s+i64\s+(-?\d+),\s*.*%(\w+))");
            if (std::regex_search(s, m, re)) {
                int64_t val = std::stoll(m[1].str());
                size_t q = allocate_qubit_for(m[2].str());
                
                // Pack 2-bit state: 0 -> ZERO (00), >0 -> ONE (01), <0 -> MINUS (10)
                uint8_t two_bits = 0;
                if (val > 0) two_bits = 0b01;
                else if (val < 0) two_bits = 0b10;
                else two_bits = 0b00;

                // Set classical reg 0 = two_bits, then OP_PACK2
                out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_PACK2));
                out_chunk.emit_byte(static_cast<uint8_t>(q));
                out_chunk.emit_byte(0); // reg 0
                if (two_bits == 0b01) circuit_.x(q);
                else if (two_bits == 0b10) { circuit_.x(q); circuit_.z(q); }
            }
        }
        // 4. Branch3 Lowering -> OP_BRANCH3 or Measurement
        else if (s.find("switch i32") != std::string::npos) {
            // Find condition qubit
            std::smatch m;
            std::regex re(R"(switch\s+i32\s*%(\w+))");
            size_t cond_q = 0;
            if (std::regex_search(s, m, re)) {
                cond_q = allocate_qubit_for(m[1].str());
            }
            out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_MEASURE_TRIT));
            out_chunk.emit_byte(0); // target reg 0
            out_chunk.emit_byte(static_cast<uint8_t>(cond_q));
        }
        // 5. Return statement
        else if (s.find("ret i") != std::string::npos) {
            std::smatch m;
            std::regex re(R"(ret\s+i\d+\s+(-?\d+))");
            if (std::regex_search(s, m, re)) {
                int64_t ret_val = std::stoll(m[1].str());
                // Pack return value into qubit 0 and unpack to reg 0
                out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_UNPACK2));
                out_chunk.emit_byte(0); // reg 0
                out_chunk.emit_byte(0); // qubit 0
            }
            out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_HALT));
        }
    }

    // Default termination if no ret found
    if (out_chunk.code.empty() || out_chunk.code.back() != static_cast<uint8_t>(qvm::QOpCode::OP_HALT)) {
        out_chunk.emit_byte(static_cast<uint8_t>(qvm::QOpCode::OP_HALT));
    }

    return true;
}

bool LLVM2QVMTranslator::translate_file(const std::string& ll_path, const std::string& qbc_path) {
    std::ifstream ifs(ll_path);
    if (!ifs.is_open()) return false;
    std::stringstream buf;
    buf << ifs.rdbuf();

    qvm::QChunk chunk;
    if (!translate_ir(buf.str(), chunk)) return false;
    return chunk.save_to_file(qbc_path);
}

std::string LLVM2QVMTranslator::to_openqasm() const {
    return circuit_.to_openqasm("llvm_lowered_quantum_circuit");
}

} // namespace compiler
} // namespace tersun
