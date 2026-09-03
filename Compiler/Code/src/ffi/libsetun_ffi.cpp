#include "ffi/libsetun_ffi.h"
#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include "vm/vm.hpp"
#include "compiler/emitter.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/arena.hpp"
#include <fstream>
#include <sstream>

using namespace setun;

struct SetunVM_T {
    VM vm_instance;
};

extern "C" {

SetunVM_Handle setun_create_vm(void) {
    return new SetunVM_T();
}

void setun_destroy_vm(SetunVM_Handle vm) {
    if (vm) {
        delete vm;
    }
}

int setun_load_bytecode(SetunVM_Handle vm, const uint8_t* bytecode, size_t size) {
    if (!vm || !bytecode || size == 0) return -1;
    try {
        Chunk chunk;
        if (size >= 8 && bytecode[0] == 'S' && bytecode[1] == 'E' && bytecode[2] == 'T' && bytecode[3] == 'U') {
            std::string temp_data(reinterpret_cast<const char*>(bytecode), size);
            std::istringstream iss(temp_data);
            uint32_t magic = 0, version = 0, code_size = 0;
            iss.read(reinterpret_cast<char*>(&magic), 4);
            iss.read(reinterpret_cast<char*>(&version), 4);
            iss.read(reinterpret_cast<char*>(&code_size), 4);
            chunk.code.resize(code_size);
            iss.read(reinterpret_cast<char*>(chunk.code.data()), code_size);
            chunk.lines.resize(code_size, 1);
            uint32_t str_count = 0;
            if (iss.read(reinterpret_cast<char*>(&str_count), 4)) {
                for (uint32_t i = 0; i < str_count; ++i) {
                    uint32_t len = 0;
                    iss.read(reinterpret_cast<char*>(&len), 4);
                    std::string s(len, '\0');
                    iss.read(&s[0], len);
                    chunk.string_table.push_back(s);
                }
            }
        } else {
            chunk.code.assign(bytecode, bytecode + size);
            chunk.lines.resize(size, 1);
        }
        vm->vm_instance.run(chunk);
        return 0;
    } catch (...) {
        return -2;
    }
}

int setun_run_bytecode(SetunVM_Handle vm, const uint8_t* bytecode, size_t size) {
    return setun_load_bytecode(vm, bytecode, size);
}

int setun_run_file(SetunVM_Handle vm, const char* filepath) {
    if (!vm || !filepath) return -1;
    std::string path(filepath);

    try {
        Chunk chunk;
        if (path.size() >= 4 && path.substr(path.size() - 4) == ".tbc") {
            if (!Chunk::load_from_file(path, chunk)) return -2;
        } else {
            std::ifstream file(path);
            if (!file.is_open()) return -3;
            std::stringstream buffer;
            buffer << file.rdbuf();
            std::string src = buffer.str();

            ArenaAllocator arena;
            Lexer lexer(src);
            auto tokens = lexer.tokenize();
            Parser parser(tokens, arena);
            Program prog = parser.parse_program();
            BytecodeEmitter emitter;
            chunk = emitter.compile(prog);
        }
        vm->vm_instance.run(chunk);
        return 0;
    } catch (...) {
        return -4;
    }
}

TAF_Register_C setun_encode_double(double val) {
    TafpuNum num = encode_dynamic(val);
    return TAF_Register_C{num.a, num.b, num.s, 0};
}

double setun_decode_double(TAF_Register_C reg) {
    TafpuNum num(reg.a, reg.b, reg.s);
    return num.to_double();
}

TAF_Register_C setun_tafpu_add(TAF_Register_C x1, TAF_Register_C x2) {
    TafpuNum a(x1.a, x1.b, x1.s);
    TafpuNum b(x2.a, x2.b, x2.s);
    TafpuNum res = a + b;
    return TAF_Register_C{res.a, res.b, res.s, 0};
}

TAF_Register_C setun_tafpu_sub(TAF_Register_C x1, TAF_Register_C x2) {
    TafpuNum a(x1.a, x1.b, x1.s);
    TafpuNum b(x2.a, x2.b, x2.s);
    TafpuNum res = a - b;
    return TAF_Register_C{res.a, res.b, res.s, 0};
}

TAF_Register_C setun_tafpu_mul(TAF_Register_C x1, TAF_Register_C x2) {
    TafpuNum a(x1.a, x1.b, x1.s);
    TafpuNum b(x2.a, x2.b, x2.s);
    TafpuNum res = a * b;
    return TAF_Register_C{res.a, res.b, res.s, 0};
}

TAF_Register_C setun_tafpu_div(TAF_Register_C x1, TAF_Register_C x2, int* out_error) {
    TafpuNum a(x1.a, x1.b, x1.s);
    TafpuNum b(x2.a, x2.b, x2.s);
    if (out_error) *out_error = 0;
    try {
        TafpuNum res = a / b;
        return TAF_Register_C{res.a, res.b, res.s, 0};
    } catch (const IsotropicDivisionException&) {
        if (out_error) *out_error = 1;
        return TAF_Register_C{0, 0, 0, 0};
    }
}

TAF_Register_C setun_calc_dist3d_sq(
    TAF_Register_C x1, TAF_Register_C y1, TAF_Register_C z1,
    TAF_Register_C x2, TAF_Register_C y2, TAF_Register_C z2
) {
    TafpuNum px1(x1.a, x1.b, x1.s), py1(y1.a, y1.b, y1.s), pz1(z1.a, z1.b, z1.s);
    TafpuNum px2(x2.a, x2.b, x2.s), py2(y2.a, y2.b, y2.s), pz2(z2.a, z2.b, z2.s);
    TafpuNum d2 = distance_squared_3d(px1, py1, pz1, px2, py2, pz2);
    return TAF_Register_C{d2.a, d2.b, d2.s, 0};
}

} // extern "C"
