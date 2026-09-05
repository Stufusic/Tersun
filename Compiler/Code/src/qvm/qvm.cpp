#include "qvm/qvm.hpp"
#include <fstream>
#include <sstream>
#include <cstring>
#include <cstdio>
#include <map>
#include <iomanip>

namespace tersun {
namespace qvm {

// ============================================================================
// QChunk Serialization
// ============================================================================

bool QChunk::save_to_file(const std::string& path) const {
    std::ofstream ofs(path, std::ios::binary);
    if (!ofs.is_open()) return false;

    uint32_t magic = MAGIC;
    uint32_t ver = VERSION;
    uint32_t nq = static_cast<uint32_t>(num_qubits);
    uint32_t code_size = static_cast<uint32_t>(code.size());

    ofs.write(reinterpret_cast<const char*>(&magic), 4);
    ofs.write(reinterpret_cast<const char*>(&ver), 4);
    ofs.write(reinterpret_cast<const char*>(&nq), 4);
    ofs.write(reinterpret_cast<const char*>(&code_size), 4);

    if (code_size > 0) {
        ofs.write(reinterpret_cast<const char*>(code.data()), code_size);
    }
    return ofs.good();
}

bool QChunk::load_from_file(const std::string& path, QChunk& out_chunk) {
    std::ifstream ifs(path, std::ios::binary);
    if (!ifs.is_open()) return false;

    uint32_t magic = 0, ver = 0, nq = 0, code_size = 0;
    ifs.read(reinterpret_cast<char*>(&magic), 4);
    ifs.read(reinterpret_cast<char*>(&ver), 4);
    ifs.read(reinterpret_cast<char*>(&nq), 4);
    ifs.read(reinterpret_cast<char*>(&code_size), 4);

    if (magic != MAGIC || ver != VERSION) {
        return false;
    }
    // Untrusted-file guards (mirrors the .tbc loader policy).
    if (nq > 1024u || code_size > 67108864u) {
        return false;
    }

    out_chunk.num_qubits = nq;
    out_chunk.code.resize(code_size);
    if (code_size > 0) {
        ifs.read(reinterpret_cast<char*>(out_chunk.code.data()), code_size);
    }
    return ifs.good();
}

std::string QChunk::disassemble(const std::string& name) const {
    std::ostringstream oss;
    oss << "== QVM Quantum Bytecode Disassembly";
    if (!name.empty()) oss << ": " << name;
    oss << " ==\n";
    oss << "Header: Magic = 'QSET' | Ver = 1.0.2 | Qubits = " << num_qubits << " | CodeSize = " << code.size() << " bytes\n";
    oss << "--------------------------------------------------------------------------------\n";
    oss << " Offset | Opcode            | Operands & Semantics\n";
    oss << "--------------------------------------------------------------------------------\n";

    // Operand readers mirror QVM::run exactly (u16 little-endian, f64 for
    // rotations, absolute pc targets for jumps) so the listing can never
    // desynchronize from the executed ISA.
    size_t i = 0;
    bool truncated = false;
    auto read_u8 = [&]() -> uint8_t {
        if (i >= code.size()) { truncated = true; return 0; }
        return code[i++];
    };
    auto read_u16 = [&]() -> uint16_t {
        uint8_t b0 = read_u8();
        uint8_t b1 = read_u8();
        return static_cast<uint16_t>(b0 | (b1 << 8));
    };
    auto read_f64 = [&]() -> double {
        uint64_t bits = 0;
        for (int k = 0; k < 8; ++k) {
            bits |= (static_cast<uint64_t>(read_u8()) << (k * 8));
        }
        double v = 0.0;
        std::memcpy(&v, &bits, sizeof(double));
        return v;
    };

    std::map<std::string, int> op_counts;
    auto note = [&](const char* g) { op_counts[g]++; };

    while (i < code.size() && !truncated) {
        size_t offset = i;
        uint8_t op = code[i++];

        char buf[32];
        std::snprintf(buf, sizeof(buf), " 0x%04zX | ", offset);
        oss << buf;

        auto qop = static_cast<QOpCode>(op);
        switch (qop) {
            case QOpCode::OP_NOP:
                oss << "OP_NOP           |\n";
                break;
            case QOpCode::OP_INIT: {
                uint8_t n = read_u8();
                oss << "OP_INIT          | qubits=" << (int)n << "\n";
                note("INIT");
                break;
            }
            case QOpCode::OP_PACK2: {
                uint8_t q = read_u8();
                uint8_t r = read_u8();
                oss << "OP_PACK2         | q[" << (int)q << "] <- r[" << (int)r << "] (2-bit packing)\n";
                note("PACK2");
                break;
            }
            case QOpCode::OP_UNPACK2: {
                uint8_t r = read_u8();
                uint8_t q = read_u8();
                oss << "OP_UNPACK2       | r[" << (int)r << "] <- q[" << (int)q << "] (unpack to classical)\n";
                note("UNPACK2");
                break;
            }
            case QOpCode::OP_H: {
                uint8_t q = read_u8();
                oss << "OP_H             | q[" << (int)q << "] (Hadamard Superposition)\n";
                note("H");
                break;
            }
            case QOpCode::OP_X: {
                uint8_t q = read_u8();
                oss << "OP_X             | q[" << (int)q << "] (Pauli-X / NOT)\n";
                note("X");
                break;
            }
            case QOpCode::OP_Y: {
                uint8_t q = read_u8();
                oss << "OP_Y             | q[" << (int)q << "] (Pauli-Y)\n";
                note("Y");
                break;
            }
            case QOpCode::OP_Z: {
                uint8_t q = read_u8();
                oss << "OP_Z             | q[" << (int)q << "] (Pauli-Z Phase Flip)\n";
                note("Z");
                break;
            }
            case QOpCode::OP_S: {
                uint8_t q = read_u8();
                oss << "OP_S             | q[" << (int)q << "] (Phase pi/2)\n";
                note("S");
                break;
            }
            case QOpCode::OP_T: {
                uint8_t q = read_u8();
                oss << "OP_T             | q[" << (int)q << "] (Phase pi/4)\n";
                note("T");
                break;
            }
            case QOpCode::OP_RX: {
                uint8_t q = read_u8();
                double ang = read_f64();
                oss << "OP_RX            | q[" << (int)q << "] <- Rx(" << ang << " rad)\n";
                note("RX");
                break;
            }
            case QOpCode::OP_RY: {
                uint8_t q = read_u8();
                double ang = read_f64();
                oss << "OP_RY            | q[" << (int)q << "] <- Ry(" << ang << " rad)\n";
                note("RY");
                break;
            }
            case QOpCode::OP_RZ: {
                uint8_t q = read_u8();
                double ang = read_f64();
                oss << "OP_RZ            | q[" << (int)q << "] <- Rz(" << ang << " rad)\n";
                note("RZ");
                break;
            }
            case QOpCode::OP_CNOT: {
                uint8_t ctrl = read_u8();
                uint8_t tgt  = read_u8();
                oss << "OP_CNOT          | ctrl=q[" << (int)ctrl << "], target=q[" << (int)tgt << "]\n";
                note("CNOT");
                break;
            }
            case QOpCode::OP_CZ: {
                uint8_t ctrl = read_u8();
                uint8_t tgt  = read_u8();
                oss << "OP_CZ            | ctrl=q[" << (int)ctrl << "], target=q[" << (int)tgt << "]\n";
                note("CZ");
                break;
            }
            case QOpCode::OP_SWAP: {
                uint8_t q1 = read_u8();
                uint8_t q2 = read_u8();
                oss << "OP_SWAP          | q[" << (int)q1 << "] <-> q[" << (int)q2 << "]\n";
                note("SWAP");
                break;
            }
            case QOpCode::OP_TOFFOLI: {
                uint8_t c1 = read_u8();
                uint8_t c2 = read_u8();
                uint8_t tgt = read_u8();
                oss << "OP_TOFFOLI       | c1=q[" << (int)c1 << "], c2=q[" << (int)c2 << "], target=q[" << (int)tgt << "]\n";
                note("TOFFOLI");
                break;
            }
            case QOpCode::OP_TRIT_CYCLE: {
                uint8_t q = read_u8();
                oss << "OP_TRIT_CYCLE    | q[" << (int)q << "] (Ternary Permutation 0->+1->-1->0)\n";
                note("TRIT_CYCLE");
                break;
            }
            case QOpCode::OP_TRIT_INV: {
                uint8_t q = read_u8();
                oss << "OP_TRIT_INV      | q[" << (int)q << "] (Ternary Invert +1 <-> -1)\n";
                note("TRIT_INV");
                break;
            }
            case QOpCode::OP_MEASURE: {
                uint8_t r = read_u8();
                uint8_t q = read_u8();
                oss << "OP_MEASURE       | r[" << (int)r << "] <- measure(q[" << (int)q << "])\n";
                note("MEASURE");
                break;
            }
            case QOpCode::OP_MEASURE_TRIT: {
                uint8_t r = read_u8();
                uint8_t q = read_u8();
                oss << "OP_MEASURE_TRIT  | r[" << (int)r << "] <- trit_project(q[" << (int)q << "]) {-1, 0, +1}\n";
                note("MEASURE_TRIT");
                break;
            }
            case QOpCode::OP_JUMP: {
                uint16_t target = read_u16();
                oss << "OP_JUMP          | -> 0x" << std::hex << std::setw(4) << std::setfill('0')
                    << (int)target << std::dec << "\n";
                note("JUMP");
                break;
            }
            case QOpCode::OP_BRANCH3: {
                uint8_t q = read_u8();
                uint16_t off_neg = read_u16();
                uint16_t off_zero = read_u16();
                uint16_t off_pos = read_u16();
                oss << "OP_BRANCH3       | trit=measure_trit(q[" << (int)q << "]) -> "
                    << "neg=0x" << std::hex << std::setw(4) << std::setfill('0') << (int)off_neg
                    << ", zero=0x" << std::setw(4) << std::setfill('0') << (int)off_zero
                    << ", pos=0x" << std::setw(4) << std::setfill('0') << (int)off_pos
                    << std::dec << "\n";
                note("BRANCH3");
                break;
            }
            case QOpCode::OP_HALT:
                oss << "OP_HALT          | (Terminate QVM execution)\n";
                note("HALT");
                break;
            default:
                oss << "UNKNOWN (0x" << std::hex << (int)op << std::dec << ") |\n";
                note("UNKNOWN");
                break;
        }
        if (truncated) {
            oss << "<truncated: operand runs past end of code>\n";
        }
    }

    oss << "--------------------------------------------------------------------------------\n";
    oss << "Gate summary:";
    if (op_counts.empty()) oss << " (empty)";
    for (const auto& [g, n] : op_counts) {
        oss << "  " << g << "x" << n;
    }
    oss << "\n";
    return oss.str();
}

// ============================================================================
// QVM Implementation
// ============================================================================

QVM::QVM(size_t num_qubits)
    : qreg_(num_qubits), classical_regs_(32, 0) {
    reset();
}

void QVM::reset() {
    qreg_.reset();
    std::fill(classical_regs_.begin(), classical_regs_.end(), 0);
    pc_ = 0;
    halted_ = false;
}

void QVM::run_circuit(const QuantumCircuit& circuit) {
    circuit.execute(qreg_);
}

int64_t QVM::run(const QChunk& chunk) {
    reset();
    if (chunk.num_qubits > qreg_.size()) {
        qreg_ = QubitRegister(chunk.num_qubits);
    }

    const auto& code = chunk.code;
    size_t len = code.size();

    auto read_u8 = [&]() -> uint8_t {
        if (pc_ >= len) { halted_ = true; return 0; }
        return code[pc_++];
    };

    auto read_u16 = [&]() -> uint16_t {
        uint8_t b0 = read_u8();
        uint8_t b1 = read_u8();
        return static_cast<uint16_t>(b0 | (b1 << 8));
    };

    while (pc_ < len && !halted_) {
        uint8_t byte = read_u8();
        QOpCode op = static_cast<QOpCode>(byte);

        switch (op) {
            case QOpCode::OP_NOP:
                break;

            case QOpCode::OP_INIT: {
                uint8_t nq = read_u8();
                qreg_ = QubitRegister(nq);
                break;
            }

            case QOpCode::OP_PACK2: {
                uint8_t q_idx = read_u8();
                uint8_t reg_idx = read_u8();
                int64_t val = get_reg(reg_idx);
                qreg_.pack_2bits(q_idx, static_cast<uint8_t>(val & 0x03));
                break;
            }

            case QOpCode::OP_UNPACK2: {
                uint8_t reg_dst = read_u8();
                uint8_t q_idx = read_u8();
                uint8_t two_bits = qreg_.unpack_2bits(q_idx);
                set_reg(reg_dst, two_bits);
                break;
            }

            case QOpCode::OP_H: {
                uint8_t q = read_u8();
                GateOps::apply_h(qreg_, q);
                break;
            }

            case QOpCode::OP_X: {
                uint8_t q = read_u8();
                GateOps::apply_x(qreg_, q);
                break;
            }

            case QOpCode::OP_Y: {
                uint8_t q = read_u8();
                GateOps::apply_y(qreg_, q);
                break;
            }

            case QOpCode::OP_Z: {
                uint8_t q = read_u8();
                GateOps::apply_z(qreg_, q);
                break;
            }

            case QOpCode::OP_S: {
                uint8_t q = read_u8();
                GateOps::apply_s(qreg_, q);
                break;
            }

            case QOpCode::OP_T: {
                uint8_t q = read_u8();
                GateOps::apply_t(qreg_, q);
                break;
            }

            case QOpCode::OP_CNOT: {
                uint8_t ctrl = read_u8();
                uint8_t target = read_u8();
                GateOps::apply_cnot(qreg_, ctrl, target);
                break;
            }

            case QOpCode::OP_CZ: {
                uint8_t ctrl = read_u8();
                uint8_t target = read_u8();
                GateOps::apply_cz(qreg_, ctrl, target);
                break;
            }

            case QOpCode::OP_SWAP: {
                uint8_t q1 = read_u8();
                uint8_t q2 = read_u8();
                GateOps::apply_swap(qreg_, q1, q2);
                break;
            }

            case QOpCode::OP_TOFFOLI: {
                uint8_t c1 = read_u8();
                uint8_t c2 = read_u8();
                uint8_t target = read_u8();
                GateOps::apply_toffoli(qreg_, c1, c2, target);
                break;
            }

            case QOpCode::OP_TRIT_CYCLE: {
                uint8_t q = read_u8();
                GateOps::apply_ternary_cycle(qreg_, q);
                break;
            }

            case QOpCode::OP_TRIT_INV: {
                uint8_t q = read_u8();
                GateOps::apply_ternary_invert(qreg_, q);
                break;
            }

            case QOpCode::OP_MEASURE: {
                uint8_t reg_dst = read_u8();
                uint8_t q = read_u8();
                int outcome = qreg_.measure(q);
                set_reg(reg_dst, outcome);
                break;
            }

            case QOpCode::OP_MEASURE_TRIT: {
                uint8_t reg_dst = read_u8();
                uint8_t q = read_u8();
                int trit = qreg_.measure_trit(q);
                set_reg(reg_dst, trit);
                break;
            }

            case QOpCode::OP_BRANCH3: {
                uint8_t q = read_u8();
                uint16_t off_neg = read_u16();
                uint16_t off_zero = read_u16();
                uint16_t off_pos = read_u16();

                int trit = qreg_.measure_trit(q);
                if (trit < 0) pc_ = off_neg;
                else if (trit == 0) pc_ = off_zero;
                else pc_ = off_pos;
                break;
            }

            case QOpCode::OP_JUMP: {
                uint16_t target_pc = read_u16();
                pc_ = target_pc;
                break;
            }

            case QOpCode::OP_HALT:
                halted_ = true;
                break;

            default:
                halted_ = true;
                break;
        }
    }

    // Return reg 0 as program exit code / output
    return get_reg(0);
}

void QVM::dump(std::ostream& os) const {
    os << "================== [QVM State Dump] ==================\n";
    os << "PC: 0x" << std::hex << pc_ << std::dec << (halted_ ? " (HALTED)" : " (RUNNING)") << "\n";
    os << "Classical Registers:\n";
    for (size_t i = 0; i < 8; ++i) {
        os << "  R[" << i << "] = " << get_reg(i);
        if (i % 4 == 3) os << "\n";
    }
    qreg_.dump_state(os);
    os << "======================================================\n";
}

} // namespace qvm
} // namespace tersun
