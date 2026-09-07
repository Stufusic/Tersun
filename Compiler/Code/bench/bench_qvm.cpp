// QVM harness: load a .qbc produced by `setunc compile --qvm`, count gates,
// then time QVM::run over R repetitions (statevector work only, no I/O).
#include "qvm/qvm.hpp"
#include "qvm/qopcode.hpp"
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <string>

int main(int argc, char** argv) {
    if (argc < 2) { std::fprintf(stderr, "usage: %s file.qbc [reps]\n", argv[0]); return 1; }
    int reps = (argc >= 3) ? std::atoi(argv[2]) : 5;
    tersun::qvm::QChunk chunk;
    if (!tersun::qvm::QChunk::load_from_file(argv[1], chunk)) {
        std::fprintf(stderr, "load failed: %s\n", argv[1]);
        return 1;
    }
    // Decode gate count (operand widths mirror QVM::run exactly).
    static const int W[256] = {0};
    size_t gates = 0;
    for (size_t i = 0; i < chunk.code.size();) {
        uint8_t op = chunk.code[i++];
        switch (op) {
            case 0x01: i += 1; break;              // INIT n
            case 0xFF: break;                       // HALT
            case 0x10: case 0x11: case 0x12: case 0x13:
            case 0x14: case 0x15: case 0x30: case 0x31:
                i += 1; ++gates; break;            // 1-qubit gates (no param)
            case 0x16: case 0x17: case 0x18:
                i += 9; ++gates; break;            // RX/RY/RZ (q + f64)
            case 0x20: case 0x21: case 0x22:
                i += 2; ++gates; break;            // CNOT/CZ/SWAP
            case 0x02: case 0x03: case 0x40: case 0x41:
                i += 2; break;                      // classical I/O ops (not gates)
            case 0x25: i += 3; ++gates; break;     // TOFFOLI
            case 0x51: i += 2; break;              // JUMP
            case 0x50: i += 7; break;              // BRANCH3
            default: break;
        }
    }
    size_t dim = (size_t)1 << chunk.num_qubits;
    using clk = std::chrono::steady_clock;
    auto t0 = clk::now();
    double checksum = 0.0;
    for (int r = 0; r < reps; ++r) {
        tersun::qvm::QVM qvm(chunk.num_qubits);
        qvm.run(chunk);
        checksum += std::abs(qvm.qreg().amplitudes()[dim - 1]);
    }
    auto t1 = clk::now();
    double ms = std::chrono::duration<double, std::milli>(t1 - t0).count() / reps;
    std::printf("qubits=%zu dim=%zu gates=%zu per_run_ms=%.1f gates_per_s=%.0f checksum=%.6f\n",
                chunk.num_qubits, dim, gates, ms, gates / (ms / 1000.0), checksum);
    return 0;
}
