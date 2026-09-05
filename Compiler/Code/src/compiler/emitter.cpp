#include "compiler/emitter.hpp"
#include "tafpu/exception.hpp"
#include <sstream>
#include <fstream>
#include <iomanip>
#include <cstring>
#include <map>

namespace setun {

// "file:line:col" when the source file is known, "line:col" otherwise.
static std::string loc_str(const SourceLocation& loc) {
    if (!loc.file.empty()) {
        return loc.file + ":" + std::to_string(loc.line) + ":" + std::to_string(loc.column);
    }
    return std::to_string(loc.line) + ":" + std::to_string(loc.column);
}

std::string_view opcode_name(OpCode op) {
    switch (op) {
        case OpCode::OP_NOP: return "OP_NOP";
        case OpCode::OP_PUSH_INT: return "OP_PUSH_INT";
        case OpCode::OP_PUSH_TRYTE: return "OP_PUSH_TRYTE";
        case OpCode::OP_PUSH_TAFPU: return "OP_PUSH_TAFPU";
        case OpCode::OP_PUSH_FLOAT: return "OP_PUSH_FLOAT";
        case OpCode::OP_PUSH_STRING: return "OP_PUSH_STRING";
        case OpCode::OP_PUSH_BOOL: return "OP_PUSH_BOOL";
        case OpCode::OP_POP: return "OP_POP";
        case OpCode::OP_DUP: return "OP_DUP";
        case OpCode::OP_LOAD_LOCAL: return "OP_LOAD_LOCAL";
        case OpCode::OP_STORE_LOCAL: return "OP_STORE_LOCAL";
        case OpCode::OP_LOAD_GLOBAL: return "OP_LOAD_GLOBAL";
        case OpCode::OP_STORE_GLOBAL: return "OP_STORE_GLOBAL";
        case OpCode::OP_ADD: return "OP_ADD";
        case OpCode::OP_SUB: return "OP_SUB";
        case OpCode::OP_MUL: return "OP_MUL";
        case OpCode::OP_DIV: return "OP_DIV";
        case OpCode::OP_NEG: return "OP_NEG";
        case OpCode::OP_TERNARY_NOT: return "OP_TERNARY_NOT";
        case OpCode::OP_TERNARY_CMP: return "OP_TERNARY_CMP";
        case OpCode::OP_TERNARY_MIN: return "OP_TERNARY_MIN";
        case OpCode::OP_TERNARY_MAX: return "OP_TERNARY_MAX";
        case OpCode::OP_EQ: return "OP_EQ";
        case OpCode::OP_NEQ: return "OP_NEQ";
        case OpCode::OP_LT: return "OP_LT";
        case OpCode::OP_LE: return "OP_LE";
        case OpCode::OP_GT: return "OP_GT";
        case OpCode::OP_GE: return "OP_GE";
        case OpCode::OP_TAFPU_CONSTRUCT: return "OP_TAFPU_CONSTRUCT";
        case OpCode::OP_TAFPU_ENCODE: return "OP_TAFPU_ENCODE";
        case OpCode::OP_TAFPU_TODBL: return "OP_TAFPU_TODBL";
        case OpCode::OP_JUMP: return "OP_JUMP";
        case OpCode::OP_JUMP_IF_FALSE: return "OP_JUMP_IF_FALSE";
        case OpCode::OP_BRANCH_3: return "OP_BRANCH_3";
        case OpCode::OP_CALL: return "OP_CALL";
        case OpCode::OP_RET: return "OP_RET";
        case OpCode::OP_PRINT: return "OP_PRINT";
        case OpCode::OP_PRINTLN: return "OP_PRINTLN";
        case OpCode::OP_TRACE: return "OP_TRACE";
        case OpCode::OP_ASSERT_EQ: return "OP_ASSERT_EQ";
        case OpCode::OP_GFX_INIT: return "OP_GFX_INIT";
        case OpCode::OP_GFX_IS_RUNNING: return "OP_GFX_IS_RUNNING";
        case OpCode::OP_GFX_CLEAR: return "OP_GFX_CLEAR";
        case OpCode::OP_GFX_DRAW_RECT: return "OP_GFX_DRAW_RECT";
        case OpCode::OP_GFX_DRAW_CIRCLE: return "OP_GFX_DRAW_CIRCLE";
        case OpCode::OP_GFX_DRAW_TEXT: return "OP_GFX_DRAW_TEXT";
        case OpCode::OP_GFX_FLIP: return "OP_GFX_FLIP";
        case OpCode::OP_GFX_GET_KEY: return "OP_GFX_GET_KEY";
        case OpCode::OP_GFX_CLOSE: return "OP_GFX_CLOSE";
        case OpCode::OP_NN_CREATE_DENSE: return "OP_NN_CREATE_DENSE";
        case OpCode::OP_NN_SET_WEIGHT: return "OP_NN_SET_WEIGHT";
        case OpCode::OP_NN_SET_BIAS: return "OP_NN_SET_BIAS";
        case OpCode::OP_NN_SET_INPUT: return "OP_NN_SET_INPUT";
        case OpCode::OP_NN_GET_INPUT: return "OP_NN_GET_INPUT";
        case OpCode::OP_NN_FORWARD: return "OP_NN_FORWARD";
        case OpCode::OP_NN_GET_OUTPUT: return "OP_NN_GET_OUTPUT";
        case OpCode::OP_NN_COPY_OUT_IN: return "OP_NN_COPY_OUT_IN";
        case OpCode::OP_NN_PREDICT: return "OP_NN_PREDICT";
        case OpCode::OP_NN_CONFIDENCE: return "OP_NN_CONFIDENCE";
        case OpCode::OP_NN_LOAD_MNIST: return "OP_NN_LOAD_MNIST";
        case OpCode::OP_NN_FREE_LAYER: return "OP_NN_FREE_LAYER";
        case OpCode::OP_TIME_NOW_US: return "OP_TIME_NOW_US";
        case OpCode::OP_GET_FIELD: return "OP_GET_FIELD";
        case OpCode::OP_NEW_INSTANCE: return "OP_NEW_INSTANCE";
        case OpCode::OP_GET_INDEX: return "OP_GET_INDEX";
        case OpCode::OP_SET_FIELD: return "OP_SET_FIELD";
        case OpCode::OP_INVOKE_METHOD: return "OP_INVOKE_METHOD";
        case OpCode::OP_SET_INDEX: return "OP_SET_INDEX";
        case OpCode::OP_NEW_ARRAY: return "OP_NEW_ARRAY";
        case OpCode::OP_TRY: return "OP_TRY";
        case OpCode::OP_THROW: return "OP_THROW";
        case OpCode::OP_POP_TRY: return "OP_POP_TRY";
        case OpCode::OP_HALT: return "OP_HALT";
    }
    return "UNKNOWN_OP";
}

void Chunk::write_byte(uint8_t byte, size_t line) {
    code.push_back(byte);
    lines.push_back(line);
}

void Chunk::write_opcode(OpCode op, size_t line) {
    write_byte(static_cast<uint8_t>(op), line);
}

void Chunk::write_int16(int16_t val, size_t line) {
    uint8_t b1 = static_cast<uint8_t>(val & 0xFF);
    uint8_t b2 = static_cast<uint8_t>((val >> 8) & 0xFF);
    write_byte(b1, line);
    write_byte(b2, line);
}

void Chunk::write_int32(int32_t val, size_t line) {
    for (int i = 0; i < 4; ++i) {
        write_byte(static_cast<uint8_t>((val >> (i * 8)) & 0xFF), line);
    }
}

void Chunk::write_int64(int64_t val, size_t line) {
    for (int i = 0; i < 8; ++i) {
        write_byte(static_cast<uint8_t>((val >> (i * 8)) & 0xFF), line);
    }
}

void Chunk::write_double(double val, size_t line) {
    uint64_t bits;
    std::memcpy(&bits, &val, sizeof(double));
    write_int64(static_cast<int64_t>(bits), line);
}

size_t Chunk::emit_jump(OpCode jump_op, size_t line) {
    write_opcode(jump_op, line);
    write_int16(0, line); // Placeholder 16-bit offset
    return code.size() - 2;
}

void Chunk::patch_jump(size_t offset) {
    // Jump target is the current end of code
    int16_t jump_dist = static_cast<int16_t>(code.size() - (offset + 2));
    code[offset] = static_cast<uint8_t>(jump_dist & 0xFF);
    code[offset + 1] = static_cast<uint8_t>((jump_dist >> 8) & 0xFF);
}

void Chunk::patch_jump_to(size_t patch_location, size_t target_location) {
    int16_t jump_dist = static_cast<int16_t>(target_location - (patch_location + 2));
    code[patch_location] = static_cast<uint8_t>(jump_dist & 0xFF);
    code[patch_location + 1] = static_cast<uint8_t>((jump_dist >> 8) & 0xFF);
}

std::string Chunk::disassemble(const std::string& name) const {
    std::ostringstream oss;
    oss << "=== Disassembly: " << name << " (" << code.size() << " bytes) ===\n";

    size_t offset = 0;
    while (offset < code.size()) {
        oss << std::setw(4) << std::setfill('0') << offset << "  ";
        OpCode op = static_cast<OpCode>(code[offset]);
        oss << std::setw(18) << std::setfill(' ') << std::left << opcode_name(op);

        offset++;
        switch (op) {
            case OpCode::OP_PUSH_INT: {
                int64_t val = 0;
                for (int i = 0; i < 8; ++i) {
                    val |= (static_cast<int64_t>(code[offset++]) << (i * 8));
                }
                oss << " " << val;
                break;
            }
            case OpCode::OP_PUSH_TRYTE: {
                int16_t val = static_cast<int16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                oss << " " << val << " (@" << to_ternary_string(val) << ")";
                break;
            }
            case OpCode::OP_PUSH_TAFPU: {
                int64_t a = 0, b = 0;
                int32_t s = 0;
                for (int i = 0; i < 8; ++i) a |= (static_cast<int64_t>(code[offset++]) << (i * 8));
                for (int i = 0; i < 8; ++i) b |= (static_cast<int64_t>(code[offset++]) << (i * 8));
                for (int i = 0; i < 4; ++i) s |= (static_cast<int32_t>(code[offset++]) << (i * 8));
                oss << " [" << a << ", " << b << ", " << s << "]";
                break;
            }
            case OpCode::OP_PUSH_FLOAT: {
                uint64_t bits = 0;
                for (int i = 0; i < 8; ++i) bits |= (static_cast<uint64_t>(code[offset++]) << (i * 8));
                double val;
                std::memcpy(&val, &bits, sizeof(double));
                oss << " " << val;
                break;
            }
            case OpCode::OP_PUSH_STRING: {
                uint16_t str_id = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                std::string s = (str_id < string_table.size()) ? string_table[str_id] : "<invalid>";
                oss << " \"" << s << "\"";
                break;
            }
            case OpCode::OP_PUSH_BOOL: {
                uint8_t b = code[offset++];
                oss << " " << (b ? "true" : "false");
                break;
            }
            case OpCode::OP_LOAD_LOCAL:
            case OpCode::OP_STORE_LOCAL:
            case OpCode::OP_LOAD_GLOBAL:
            case OpCode::OP_STORE_GLOBAL: {
                uint16_t slot = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                oss << " slot " << slot;
                break;
            }
            case OpCode::OP_JUMP:
            case OpCode::OP_JUMP_IF_FALSE: {
                int16_t jmp = static_cast<int16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                oss << " offset " << jmp << " -> " << (offset + jmp);
                break;
            }
            case OpCode::OP_BRANCH_3: {
                int16_t neg_jmp = static_cast<int16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                int16_t zero_jmp = static_cast<int16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                int16_t pos_jmp = static_cast<int16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                oss << " [neg -> " << (offset - 4 + neg_jmp)
                    << ", zero -> " << (offset - 2 + zero_jmp)
                    << ", pos -> " << (offset + pos_jmp) << "]";
                break;
            }
            case OpCode::OP_CALL: {
                uint16_t fn_id = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                uint8_t argc = code[offset++];
                oss << " fn_id " << fn_id << " (argc " << static_cast<int>(argc) << ")";
                break;
            }
            case OpCode::OP_GET_FIELD:
            case OpCode::OP_SET_FIELD: {
                uint16_t str_id = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                std::string s = (str_id < string_table.size()) ? string_table[str_id] : "<invalid>";
                oss << " \"" << s << "\"";
                break;
            }
            case OpCode::OP_NEW_INSTANCE: {
                uint16_t tid = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                uint8_t count = code[offset++];
                std::string s = (tid < string_table.size()) ? string_table[tid] : "<invalid>";
                oss << " \"" << s << "\" (fields " << static_cast<int>(count) << ")";
                break;
            }
            case OpCode::OP_INVOKE_METHOD: {
                uint16_t mid = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                uint8_t argc = code[offset++];
                std::string s = (mid < string_table.size()) ? string_table[mid] : "<invalid>";
                oss << " \"" << s << "\" (argc " << static_cast<int>(argc) << ")";
                break;
            }
            case OpCode::OP_TRY: {
                int16_t off = static_cast<int16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                oss << " catch -> " << (offset + off);
                break;
            }
            case OpCode::OP_THROW:
            case OpCode::OP_POP_TRY:
                break;
            case OpCode::OP_NEW_ARRAY: {
                uint16_t count = static_cast<uint16_t>(code[offset] | (code[offset + 1] << 8));
                offset += 2;
                oss << " " << count;
                break;
            }
            default:
                break;
        }
        oss << "\n";
    }
    return oss.str();
}

bool Chunk::save_to_file(const std::string& filename) const {
    std::ofstream file(filename, std::ios::binary);
    if (!file.is_open()) return false;

    // Header: Magic "SETU" (0x55544553) + Version (1)
    const uint32_t magic = 0x55544553;
    const uint32_t version = 1;
    file.write(reinterpret_cast<const char*>(&magic), sizeof(magic));
    file.write(reinterpret_cast<const char*>(&version), sizeof(version));

    // String Table
    uint32_t str_count = static_cast<uint32_t>(string_table.size());
    file.write(reinterpret_cast<const char*>(&str_count), sizeof(str_count));
    for (const auto& str : string_table) {
        uint32_t len = static_cast<uint32_t>(str.size());
        file.write(reinterpret_cast<const char*>(&len), sizeof(len));
        if (len > 0) {
            file.write(str.data(), len);
        }
    }

    // Bytecode
    uint32_t code_size = static_cast<uint32_t>(code.size());
    file.write(reinterpret_cast<const char*>(&code_size), sizeof(code_size));
    if (code_size > 0) {
        file.write(reinterpret_cast<const char*>(code.data()), code_size);
    }

    // V-Tables (Class Methods Map for OOP method dispatch)
    // Written through sorted copies so bytecode output is byte-reproducible.
    std::map<std::string, std::map<std::string, uint16_t>> sorted_vtables;
    for (const auto& [cname, methods] : vtables) {
        sorted_vtables[cname].insert(methods.begin(), methods.end());
    }
    uint32_t class_count = static_cast<uint32_t>(sorted_vtables.size());
    file.write(reinterpret_cast<const char*>(&class_count), sizeof(class_count));
    for (const auto& [cname, methods] : sorted_vtables) {
        uint32_t clen = static_cast<uint32_t>(cname.size());
        file.write(reinterpret_cast<const char*>(&clen), sizeof(clen));
        if (clen > 0) file.write(cname.data(), clen);

        uint32_t method_count = static_cast<uint32_t>(methods.size());
        file.write(reinterpret_cast<const char*>(&method_count), sizeof(method_count));
        for (const auto& [mname, offset] : methods) {
            uint32_t mlen = static_cast<uint32_t>(mname.size());
            file.write(reinterpret_cast<const char*>(&mlen), sizeof(mlen));
            if (mlen > 0) file.write(mname.data(), mlen);
            file.write(reinterpret_cast<const char*>(&offset), sizeof(offset));
        }
    }

    return file.good();
}

bool Chunk::load_from_file(const std::string& filename, Chunk& out_chunk) {
    std::ifstream file(filename, std::ios::binary);
    if (!file.is_open()) return false;

    uint32_t magic = 0;
    uint32_t version = 0;
    file.read(reinterpret_cast<char*>(&magic), sizeof(magic));
    file.read(reinterpret_cast<char*>(&version), sizeof(version));

    if (magic != 0x55544553 || version != 1) {
        return false; // Invalid binary magic or incompatible version
    }

    out_chunk = Chunk{};

    // String Table
    uint32_t str_count = 0;
    file.read(reinterpret_cast<char*>(&str_count), sizeof(str_count));
    if (!file || str_count > 1000000u) return false; // Untrusted length
    out_chunk.string_table.resize(str_count);
    for (uint32_t i = 0; i < str_count; ++i) {
        uint32_t len = 0;
        file.read(reinterpret_cast<char*>(&len), sizeof(len));
        if (!file || len > 4096u) return false;
        std::string s(len, '\0');
        if (len > 0) {
            file.read(&s[0], len);
        }
        if (!file) return false;
        out_chunk.string_table[i] = std::move(s);
    }

    // Bytecode
    uint32_t code_size = 0;
    file.read(reinterpret_cast<char*>(&code_size), sizeof(code_size));
    if (!file || code_size > 268435456u) return false; // 256 MB cap
    out_chunk.code.resize(code_size);
    out_chunk.lines.resize(code_size, 1);
    if (code_size > 0) {
        file.read(reinterpret_cast<char*>(out_chunk.code.data()), code_size);
    }
    if (!file) return false;

    // V-Tables (Optional OOP method dispatch table)
    if (file.peek() != EOF) {
        uint32_t class_count = 0;
        if (!file.read(reinterpret_cast<char*>(&class_count), sizeof(class_count))) return false;
        if (class_count > 65536u) return false;
        for (uint32_t c = 0; c < class_count; ++c) {
            uint32_t clen = 0;
            file.read(reinterpret_cast<char*>(&clen), sizeof(clen));
            if (!file || clen > 4096u) return false;
            std::string cname(clen, '\0');
            if (clen > 0) file.read(&cname[0], clen);

            uint32_t method_count = 0;
            file.read(reinterpret_cast<char*>(&method_count), sizeof(method_count));
            if (!file || method_count > 65536u) return false;
            std::unordered_map<std::string, uint16_t> methods;
            for (uint32_t m = 0; m < method_count; ++m) {
                uint32_t mlen = 0;
                file.read(reinterpret_cast<char*>(&mlen), sizeof(mlen));
                if (!file || mlen > 4096u) return false;
                std::string mname(mlen, '\0');
                if (mlen > 0) file.read(&mname[0], mlen);
                uint16_t offset = 0;
                file.read(reinterpret_cast<char*>(&offset), sizeof(offset));
                if (!file) return false;
                methods[mname] = offset;
            }
            out_chunk.vtables[cname] = std::move(methods);
        }
    }

    return file.good();
}

BytecodeEmitter::BytecodeEmitter() = default;

Chunk BytecodeEmitter::compile(const Program& program) {
    chunk_ = Chunk{};
    symbol_table_ = SymbolTable{};
    next_local_slot_ = 0;
    next_global_slot_ = 0;
    functions_.clear();
    unresolved_calls_.clear();
    import_aliases_.clear();
    class_fields_.clear();
    class_methods_.clear();
    class_init_arity_.clear();

    // Collect aliased imports for dotted-call lowering
    for (Stmt* stmt : program.statements) {
        if (stmt && std::holds_alternative<ImportStmt>(stmt->data)) {
            auto& imp = std::get<ImportStmt>(stmt->data);
            if (!imp.alias.empty()) import_aliases_.insert(imp.alias);
        }
    }

    for (Stmt* stmt : program.statements) {
        emit_stmt(stmt);
    }

    // Auto-invoke main() if defined in the program
    auto it_main = functions_.find("main");
    if (it_main != functions_.end()) {
        chunk_.write_opcode(OpCode::OP_CALL, 1);
        chunk_.write_int16(static_cast<int16_t>(it_main->second), 1);
        chunk_.write_byte(0, 1); // 0 arguments
        chunk_.write_opcode(OpCode::OP_POP, 1); // Discard return value on stack
    }

    chunk_.write_opcode(OpCode::OP_HALT, program.statements.empty() ? 1 : program.statements.back()->loc.line);

    // Patch all unresolved function calls
    for (const auto& uc : unresolved_calls_) {
        const size_t patch_offset = std::get<0>(uc);
        const std::string& fn_name = std::get<1>(uc);
        const SourceLocation& loc = std::get<2>(uc);
        auto it = functions_.find(fn_name);
        if (it == functions_.end()) {
            throw CompilerException("[Emitter Error] " + loc_str(loc) + " - Undefined function '" + fn_name + "' called.");
        }
        uint16_t fn_entry = it->second;
        chunk_.code[patch_offset] = static_cast<uint8_t>(fn_entry & 0xFF);
        chunk_.code[patch_offset + 1] = static_cast<uint8_t>((fn_entry >> 8) & 0xFF);
    }

    chunk_.vtables = class_methods_;

    return chunk_;
}

void BytecodeEmitter::emit_stmt(Stmt* stmt) {
    if (!stmt) return;
    std::visit([this](const auto& s) {
        using T = std::decay_t<decltype(s)>;
        if constexpr (std::is_same_v<T, VarDeclStmt>) emit_var_decl(s);
        else if constexpr (std::is_same_v<T, AssignStmt>) emit_assign(s);
        else if constexpr (std::is_same_v<T, MemberAssignStmt>) {
            if (s.object) emit_expr(s.object);
            if (s.value) emit_expr(s.value);
            uint16_t fid = chunk_.add_string(s.member);
            chunk_.write_opcode(OpCode::OP_SET_FIELD, s.loc.line);
            chunk_.write_int16(static_cast<int16_t>(fid), s.loc.line);
        }
        else if constexpr (std::is_same_v<T, IndexAssignStmt>) {
            if (s.object) emit_expr(s.object);
            if (s.index) emit_expr(s.index);
            if (s.value) emit_expr(s.value);
            chunk_.write_opcode(OpCode::OP_SET_INDEX, s.loc.line);
        }
        else if constexpr (std::is_same_v<T, ExprStmt>) emit_expr_stmt(s);
        else if constexpr (std::is_same_v<T, BlockStmt>) emit_block(s);
        else if constexpr (std::is_same_v<T, IfStmt>) emit_if(s);
        else if constexpr (std::is_same_v<T, Branch3Stmt>) emit_branch3(s);
        else if constexpr (std::is_same_v<T, WhileStmt>) emit_while(s);
        else if constexpr (std::is_same_v<T, ForStmt>) emit_for_stmt(s);
        else if constexpr (std::is_same_v<T, BreakContinueStmt>) emit_break_continue(s);
        else if constexpr (std::is_same_v<T, TryCatchStmt>) emit_try_catch(s);
        else if constexpr (std::is_same_v<T, ThrowStmt>) emit_throw_stmt(s);
        else if constexpr (std::is_same_v<T, ReturnStmt>) emit_return(s);
        else if constexpr (std::is_same_v<T, FnDeclStmt>) emit_fn_decl(s);
        else if constexpr (std::is_same_v<T, MatchStmt>) emit_match(s);
        else if constexpr (std::is_same_v<T, StructDeclStmt>) emit_struct_decl(s);
        else if constexpr (std::is_same_v<T, ClassDeclStmt>) emit_class_decl(s);
        else if constexpr (std::is_same_v<T, InterfaceDeclStmt>) { /* Interface contract */ }
        else if constexpr (std::is_same_v<T, EnumDeclStmt>) { /* Enum metadata registered */ }
        else if constexpr (std::is_same_v<T, ImportStmt>) { /* Module import registered */ }
    }, stmt->data);
}

void BytecodeEmitter::emit_expr(Expr* expr) {
    if (!expr) return;
    std::visit([this](const auto& e) {
        using T = std::decay_t<decltype(e)>;
        if constexpr (std::is_same_v<T, IntLiteralExpr>) emit_int_lit(e);
        else if constexpr (std::is_same_v<T, TryteLiteralExpr>) emit_tryte_lit(e);
        else if constexpr (std::is_same_v<T, TafpuLiteralExpr>) emit_tafpu_lit(e);
        else if constexpr (std::is_same_v<T, FloatLiteralExpr>) emit_float_lit(e);
        else if constexpr (std::is_same_v<T, StringLiteralExpr>) emit_string_lit(e);
        else if constexpr (std::is_same_v<T, FStringExpr>) emit_fstring_lit(e);
        else if constexpr (std::is_same_v<T, BoolLiteralExpr>) emit_bool_lit(e);
        else if constexpr (std::is_same_v<T, IdentifierExpr>) emit_identifier(e);
        else if constexpr (std::is_same_v<T, UnaryExpr>) emit_unary(e);
        else if constexpr (std::is_same_v<T, BinaryExpr>) emit_binary(e);
        else if constexpr (std::is_same_v<T, CallExpr>) emit_call(e);
        else if constexpr (std::is_same_v<T, TafpuConstructExpr>) emit_tafpu_construct(e);
        else if constexpr (std::is_same_v<T, AmbiguousTripleExpr>) emit_ambiguous_triple(e);
        else if constexpr (std::is_same_v<T, MemberAccessExpr>) emit_member_access(e);
        else if constexpr (std::is_same_v<T, MethodCallExpr>) emit_method_call(e);
        else if constexpr (std::is_same_v<T, IndexExpr>) emit_index(e);
        else if constexpr (std::is_same_v<T, ComptimeExpr>) emit_comptime(e);
        else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) emit_array_lit(e);
    }, expr->data);
}

void BytecodeEmitter::emit_var_decl(const VarDeclStmt& stmt) {
    bool is_global = symbol_table_.is_global_scope();
    uint16_t slot = is_global ? next_global_slot_++ : next_local_slot_++;

    if (!symbol_table_.define(stmt.name, stmt.type, is_global, slot)) {
        throw CompilerException("[Emitter Error] " + loc_str(stmt.loc) + " - Variable '" + stmt.name + "' already defined in this scope.");
    }

    if (stmt.init) {
        emit_expr(stmt.init);
    } else {
        // Push default 0
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(0, stmt.loc.line);
    }

    if (is_global) {
        chunk_.write_opcode(OpCode::OP_STORE_GLOBAL, stmt.loc.line);
    } else {
        chunk_.write_opcode(OpCode::OP_STORE_LOCAL, stmt.loc.line);
    }
    chunk_.write_int16(static_cast<int16_t>(slot), stmt.loc.line);
}

void BytecodeEmitter::emit_assign(const AssignStmt& stmt) {
    auto opt_sym = symbol_table_.resolve(stmt.name);
    if (!opt_sym.has_value()) {
        throw CompilerException("[Emitter Error] " + loc_str(stmt.loc) + " - Undefined variable '" + stmt.name + "'.");
    }
    emit_expr(stmt.value);

    Symbol sym = opt_sym.value();
    if (sym.is_global) {
        chunk_.write_opcode(OpCode::OP_STORE_GLOBAL, stmt.loc.line);
    } else {
        chunk_.write_opcode(OpCode::OP_STORE_LOCAL, stmt.loc.line);
    }
    chunk_.write_int16(static_cast<int16_t>(sym.slot_index), stmt.loc.line);
}

void BytecodeEmitter::emit_expr_stmt(const ExprStmt& stmt) {
    emit_expr(stmt.expr);
    chunk_.write_opcode(OpCode::OP_POP, stmt.loc.line);
}

void BytecodeEmitter::emit_block(const BlockStmt& stmt) {
    symbol_table_.enter_scope();
    for (Stmt* s : stmt.statements) {
        emit_stmt(s);
    }
    symbol_table_.exit_scope();
}

void BytecodeEmitter::emit_if(const IfStmt& stmt) {
    emit_expr(stmt.condition);
    size_t jump_to_else = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);

    emit_stmt(stmt.then_branch);

    if (stmt.else_branch) {
        size_t jump_to_end = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
        chunk_.patch_jump(jump_to_else);
        emit_stmt(stmt.else_branch);
        chunk_.patch_jump(jump_to_end);
    } else {
        chunk_.patch_jump(jump_to_else);
    }
}

// Setun-70 3-way Branching Emitter
void BytecodeEmitter::emit_branch3(const Branch3Stmt& stmt) {
    emit_expr(stmt.condition);

    // Emit OP_BRANCH_3 with placeholders for 3 jump offsets
    chunk_.write_opcode(OpCode::OP_BRANCH_3, stmt.loc.line);
    size_t neg_patch = chunk_.code.size();
    chunk_.write_int16(0, stmt.loc.line);
    size_t zero_patch = chunk_.code.size();
    chunk_.write_int16(0, stmt.loc.line);
    size_t pos_patch = chunk_.code.size();
    chunk_.write_int16(0, stmt.loc.line);

    std::vector<size_t> exit_jumps;

    // 1. Negative Branch (Case -1 / T)
    size_t neg_target = chunk_.code.size();
    chunk_.patch_jump_to(neg_patch, neg_target);
    if (stmt.neg_branch) {
        emit_stmt(stmt.neg_branch);
    }
    exit_jumps.push_back(chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line));

    // 2. Zero Branch (Case 0)
    size_t zero_target = chunk_.code.size();
    chunk_.patch_jump_to(zero_patch, zero_target);
    if (stmt.zero_branch) {
        emit_stmt(stmt.zero_branch);
    }
    exit_jumps.push_back(chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line));

    // 3. Positive Branch (Case +1 / 1)
    size_t pos_target = chunk_.code.size();
    chunk_.patch_jump_to(pos_patch, pos_target);
    if (stmt.pos_branch) {
        emit_stmt(stmt.pos_branch);
    }

    // Patch all exits to current location (end of branch3)
    for (size_t exit_jump : exit_jumps) {
        chunk_.patch_jump(exit_jump);
    }
}

void BytecodeEmitter::emit_while(const WhileStmt& stmt) {
    loop_stack_.push_back(LoopContext{});
    const size_t loop_index = loop_stack_.size() - 1;
    loop_stack_[loop_index].label = stmt.label;

    size_t loop_start = chunk_.code.size();
    emit_expr(stmt.condition);

    size_t exit_jump = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);
    emit_stmt(stmt.body);

    // 'continue' re-evaluates the condition
    for (size_t off : loop_stack_[loop_index].continue_jumps) {
        chunk_.patch_jump(off);
    }

    // Jump back to loop start
    chunk_.write_opcode(OpCode::OP_JUMP, stmt.loc.line);
    int16_t back_dist = static_cast<int16_t>(loop_start - (chunk_.code.size() + 2));
    chunk_.write_int16(back_dist, stmt.loc.line);

    chunk_.patch_jump(exit_jump);
    for (size_t off : loop_stack_[loop_index].break_jumps) {
        chunk_.patch_jump(off);
    }
    loop_stack_.pop_back();
}

void BytecodeEmitter::emit_for_stmt(const ForStmt& stmt) {
    symbol_table_.enter_scope();
    loop_stack_.push_back(LoopContext{});
    const size_t loop_index = loop_stack_.size() - 1;
    loop_stack_[loop_index].label = stmt.label;

    auto store_slot = [&](uint16_t slot) {
        chunk_.write_opcode(OpCode::OP_STORE_LOCAL, stmt.loc.line);
        chunk_.write_int16(static_cast<int16_t>(slot), stmt.loc.line);
    };
    auto load_slot = [&](uint16_t slot) {
        chunk_.write_opcode(OpCode::OP_LOAD_LOCAL, stmt.loc.line);
        chunk_.write_int16(static_cast<int16_t>(slot), stmt.loc.line);
    };

    if (stmt.is_for_in) {
        // range(a, b, step) is desugared into a pure index loop (no allocation).
        const CallExpr* range_call = nullptr;
        if (stmt.iterable && std::holds_alternative<CallExpr>(stmt.iterable->data)) {
            const auto& ce = std::get<CallExpr>(stmt.iterable->data);
            if (ce.callee == "range") range_call = &ce;
        }

        if (range_call) {
            if (range_call->args.empty() || range_call->args.size() > 3) {
                throw CompilerException("[Emitter Error] " + loc_str(stmt.loc)
                                        + " - range() takes 1 to 3 arguments (stop | start, stop | start, stop, step).");
            }
            const uint16_t var_slot = next_local_slot_++;
            symbol_table_.define(stmt.loop_var, DataType::INT, false, var_slot);
            const uint16_t stop_slot = next_local_slot_++;
            const uint16_t step_slot = next_local_slot_++;

            // NOTE: OP_STORE_LOCAL peeks (does not pop), so each value must be
            // pushed and stored as an immediate pair — pushing all three first
            // would leave every slot holding the top value.
            auto push_int = [&](int64_t v) {
                chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
                chunk_.write_int64(v, stmt.loc.line);
            };

            if (range_call->args.size() == 1) {
                push_int(1);                      // step = 1
                store_slot(step_slot);
                emit_expr(range_call->args[0]);   // stop
                store_slot(stop_slot);
                push_int(0);                      // var = 0
                store_slot(var_slot);
            } else if (range_call->args.size() == 2) {
                push_int(1);                      // step = 1
                store_slot(step_slot);
                emit_expr(range_call->args[1]);   // stop
                store_slot(stop_slot);
                emit_expr(range_call->args[0]);   // var = start
                store_slot(var_slot);
            } else {
                emit_expr(range_call->args[2]);   // step
                store_slot(step_slot);
                emit_expr(range_call->args[1]);   // stop
                store_slot(stop_slot);
                emit_expr(range_call->args[0]);   // var = start
                store_slot(var_slot);
            }

            size_t loop_start = chunk_.code.size();
            // cond = (step > 0 && var < stop) || (step < 0 && var > stop)
            load_slot(step_slot);
            push_int(0);
            chunk_.write_opcode(OpCode::OP_GT, stmt.loc.line);
            load_slot(var_slot);
            load_slot(stop_slot);
            chunk_.write_opcode(OpCode::OP_LT, stmt.loc.line);
            chunk_.write_opcode(OpCode::OP_TERNARY_MIN, stmt.loc.line); // &&
            load_slot(step_slot);
            push_int(0);
            chunk_.write_opcode(OpCode::OP_LT, stmt.loc.line);
            load_slot(var_slot);
            load_slot(stop_slot);
            chunk_.write_opcode(OpCode::OP_GT, stmt.loc.line);
            chunk_.write_opcode(OpCode::OP_TERNARY_MIN, stmt.loc.line); // &&
            chunk_.write_opcode(OpCode::OP_TERNARY_MAX, stmt.loc.line); // ||
            size_t exit_jump = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);

            if (stmt.body) emit_stmt(stmt.body);

            for (size_t off : loop_stack_[loop_index].continue_jumps) {
                chunk_.patch_jump(off);
            }
            load_slot(var_slot);
            load_slot(step_slot);
            chunk_.write_opcode(OpCode::OP_ADD, stmt.loc.line);
            store_slot(var_slot);

            chunk_.write_opcode(OpCode::OP_JUMP, stmt.loc.line);
            int16_t back_dist = static_cast<int16_t>(loop_start - (chunk_.code.size() + 2));
            chunk_.write_int16(back_dist, stmt.loc.line);

            chunk_.patch_jump(exit_jump);
            for (size_t off : loop_stack_[loop_index].break_jumps) {
                chunk_.patch_jump(off);
            }
        } else {
        // Evaluate the iterable exactly once into a hidden slot.
        emit_expr(stmt.iterable);
        const uint16_t coll_slot = next_local_slot_++;
        store_slot(coll_slot);

        // Hidden index, starts at 0.
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(0, stmt.loc.line);
        const uint16_t idx_slot = next_local_slot_++;
        store_slot(idx_slot);

        // Cached element count (collection.len()) — pushing during the loop
        // will not extend the iteration, mirroring Python snapshot semantics.
        load_slot(coll_slot);
        uint16_t len_fid = chunk_.add_string("length");
        chunk_.write_opcode(OpCode::OP_GET_FIELD, stmt.loc.line);
        chunk_.write_int16(static_cast<int16_t>(len_fid), stmt.loc.line);
        const uint16_t len_slot = next_local_slot_++;
        store_slot(len_slot);

        // Declared loop variable
        const uint16_t var_slot = next_local_slot_++;
        symbol_table_.define(stmt.loop_var, DataType::ANY, false, var_slot);

        size_t loop_start = chunk_.code.size();

        // Condition: idx < len
        load_slot(idx_slot);
        load_slot(len_slot);
        chunk_.write_opcode(OpCode::OP_LT, stmt.loc.line);
        size_t exit_jump = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);

        // Loop variable = collection[idx]
        load_slot(coll_slot);
        load_slot(idx_slot);
        chunk_.write_opcode(OpCode::OP_GET_INDEX, stmt.loc.line);
        store_slot(var_slot);

        if (stmt.body) emit_stmt(stmt.body);

        // 'continue' lands on the increment
        for (size_t off : loop_stack_[loop_index].continue_jumps) {
            chunk_.patch_jump(off);
        }
        load_slot(idx_slot);
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(1, stmt.loc.line);
        chunk_.write_opcode(OpCode::OP_ADD, stmt.loc.line);
        store_slot(idx_slot);

        chunk_.write_opcode(OpCode::OP_JUMP, stmt.loc.line);
        int16_t back_dist = static_cast<int16_t>(loop_start - (chunk_.code.size() + 2));
        chunk_.write_int16(back_dist, stmt.loc.line);

        chunk_.patch_jump(exit_jump);
        for (size_t off : loop_stack_[loop_index].break_jumps) {
            chunk_.patch_jump(off);
        }
        }
    } else {
        // C-style: for (init; cond; update) body
        if (stmt.init) emit_stmt(stmt.init);

        size_t loop_start = chunk_.code.size();
        if (stmt.cond) {
            emit_expr(stmt.cond);
        } else {
            chunk_.write_opcode(OpCode::OP_PUSH_BOOL, stmt.loc.line);
            chunk_.write_byte(1, stmt.loc.line);
        }
        size_t exit_jump = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);

        if (stmt.body) emit_stmt(stmt.body);

        // 'continue' lands before the update clause
        for (size_t off : loop_stack_[loop_index].continue_jumps) {
            chunk_.patch_jump(off);
        }
        if (stmt.update) emit_stmt(stmt.update);

        chunk_.write_opcode(OpCode::OP_JUMP, stmt.loc.line);
        int16_t back_dist = static_cast<int16_t>(loop_start - (chunk_.code.size() + 2));
        chunk_.write_int16(back_dist, stmt.loc.line);

        chunk_.patch_jump(exit_jump);
        for (size_t off : loop_stack_[loop_index].break_jumps) {
            chunk_.patch_jump(off);
        }
    }

    loop_stack_.pop_back();
    symbol_table_.exit_scope();
}

void BytecodeEmitter::emit_try_catch(const TryCatchStmt& stmt) {
    chunk_.write_opcode(OpCode::OP_TRY, stmt.loc.line);
    size_t catch_patch = chunk_.code.size();
    chunk_.write_int16(0, stmt.loc.line); // catch target placeholder

    ++try_depth_;
    emit_stmt(stmt.try_body);
    --try_depth_;

    chunk_.write_opcode(OpCode::OP_POP_TRY, stmt.loc.line); // normal path
    size_t end_jump = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);

    size_t catch_target = chunk_.code.size();
    chunk_.patch_jump_to(catch_patch, catch_target);
    // The VM pushes the error message string before landing here.

    symbol_table_.enter_scope();
    if (!stmt.catch_var.empty()) {
        uint16_t slot = next_local_slot_++;
        symbol_table_.define(stmt.catch_var, DataType::STRING, false, slot);
        chunk_.write_opcode(OpCode::OP_STORE_LOCAL, stmt.loc.line);
        chunk_.write_int16(static_cast<int16_t>(slot), stmt.loc.line);
    }
    emit_stmt(stmt.catch_body);
    symbol_table_.exit_scope();

    chunk_.patch_jump(end_jump);
}

void BytecodeEmitter::emit_throw_stmt(const ThrowStmt& stmt) {
    if (stmt.value) {
        emit_expr(stmt.value);
    } else {
        uint16_t id = chunk_.add_string("error");
        chunk_.write_opcode(OpCode::OP_PUSH_STRING, stmt.loc.line);
        chunk_.write_int16(static_cast<int16_t>(id), stmt.loc.line);
    }
    chunk_.write_opcode(OpCode::OP_THROW, stmt.loc.line);
}

void BytecodeEmitter::emit_break_continue(const BreakContinueStmt& stmt) {
    if (loop_stack_.empty()) {
        throw CompilerException("[Emitter Error] " + loc_str(stmt.loc) + " - '"
                                + (stmt.is_break ? std::string("break") : std::string("continue"))
                                + "' outside of a loop.");
    }

    // Escaping the loop also escapes any enclosing try bodies.
    for (int t = 0; t < try_depth_; ++t) {
        chunk_.write_opcode(OpCode::OP_POP_TRY, stmt.loc.line);
    }

    auto emit_jump_to = [&](LoopContext& loop, bool is_break) {
        if (is_break) {
            size_t off = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
            loop.break_jumps.push_back(off);
        } else {
            size_t off = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
            loop.continue_jumps.push_back(off);
        }
    };

    if (stmt.label.empty()) {
        emit_jump_to(loop_stack_.back(), stmt.is_break);
        return;
    }
    for (auto it = loop_stack_.rbegin(); it != loop_stack_.rend(); ++it) {
        if (it->label == stmt.label) {
            emit_jump_to(*it, stmt.is_break);
            return;
        }
    }
    throw CompilerException("[Emitter Error] " + loc_str(stmt.loc) + " - No loop labeled '" + stmt.label + "'.");
}

void BytecodeEmitter::emit_return(const ReturnStmt& stmt) {
    if (stmt.value) {
        emit_expr(stmt.value);
    } else {
        // Push 0 / void default
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(0, stmt.loc.line);
    }
    // Returning also escapes any enclosing try bodies.
    for (int t = 0; t < try_depth_; ++t) {
        chunk_.write_opcode(OpCode::OP_POP_TRY, stmt.loc.line);
    }
    chunk_.write_opcode(OpCode::OP_RET, stmt.loc.line);
}

void BytecodeEmitter::emit_fn_decl(const FnDeclStmt& stmt) {
    if (!stmt.body) {
        // Extern function declaration: register entry as a stub returning 0
        functions_[stmt.name] = static_cast<uint16_t>(chunk_.code.size());
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(0, stmt.loc.line);
        chunk_.write_opcode(OpCode::OP_RET, stmt.loc.line);
        return;
    }

    // Jump over function body in top-level execution
    size_t jump_over = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
    
    uint16_t func_entry = static_cast<uint16_t>(chunk_.code.size());
    functions_[stmt.name] = func_entry;

    // Enter local scope for function parameters and body
    symbol_table_.enter_scope();
    uint16_t saved_local_slot = next_local_slot_;
    next_local_slot_ = 0;

    for (size_t i = 0; i < stmt.params.size(); ++i) {
        symbol_table_.define(stmt.params[i].name, stmt.params[i].type, false, next_local_slot_++);
    }

    emit_stmt(stmt.body);

    // Default return 0 if no return executed
    chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
    chunk_.write_int64(0, stmt.loc.line);
    chunk_.write_opcode(OpCode::OP_RET, stmt.loc.line);

    symbol_table_.exit_scope();
    next_local_slot_ = saved_local_slot;

    chunk_.patch_jump(jump_over);
}

void BytecodeEmitter::emit_int_lit(const IntLiteralExpr& expr) {
    chunk_.write_opcode(OpCode::OP_PUSH_INT, expr.loc.line);
    chunk_.write_int64(expr.value, expr.loc.line);
}

void BytecodeEmitter::emit_tryte_lit(const TryteLiteralExpr& expr) {
    chunk_.write_opcode(OpCode::OP_PUSH_TRYTE, expr.loc.line);
    chunk_.write_int16(expr.value, expr.loc.line);
}

void BytecodeEmitter::emit_tafpu_lit(const TafpuLiteralExpr& expr) {
    chunk_.write_opcode(OpCode::OP_PUSH_TAFPU, expr.loc.line);
    chunk_.write_int64(expr.value.a, expr.loc.line);
    chunk_.write_int64(expr.value.b, expr.loc.line);
    chunk_.write_int32(expr.value.s, expr.loc.line);
}

void BytecodeEmitter::emit_float_lit(const FloatLiteralExpr& expr) {
    chunk_.write_opcode(OpCode::OP_PUSH_FLOAT, expr.loc.line);
    chunk_.write_double(expr.value, expr.loc.line);
}

void BytecodeEmitter::emit_string_lit(const StringLiteralExpr& expr) {
    uint16_t id = static_cast<uint16_t>(chunk_.string_table.size());
    chunk_.string_table.push_back(expr.value);
    chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
    chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
}

void BytecodeEmitter::emit_bool_lit(const BoolLiteralExpr& expr) {
    chunk_.write_opcode(OpCode::OP_PUSH_BOOL, expr.loc.line);
    chunk_.write_byte(expr.value ? 1 : 0, expr.loc.line);
}

void BytecodeEmitter::emit_identifier(const IdentifierExpr& expr) {
    auto opt_sym = symbol_table_.resolve(expr.name);
    if (!opt_sym.has_value()) {
        throw CompilerException("[Emitter Error] " + loc_str(expr.loc) + " - Undefined variable '" + expr.name + "'.");
    }
    Symbol sym = opt_sym.value();
    if (sym.is_global) {
        chunk_.write_opcode(OpCode::OP_LOAD_GLOBAL, expr.loc.line);
    } else {
        chunk_.write_opcode(OpCode::OP_LOAD_LOCAL, expr.loc.line);
    }
    chunk_.write_int16(static_cast<int16_t>(sym.slot_index), expr.loc.line);
}

void BytecodeEmitter::emit_unary(const UnaryExpr& expr) {
    emit_expr(expr.operand);
    switch (expr.op) {
        case UnaryOp::NEG:
            chunk_.write_opcode(OpCode::OP_NEG, expr.loc.line);
            break;
        case UnaryOp::TILDE:
            chunk_.write_opcode(OpCode::OP_TERNARY_NOT, expr.loc.line);
            break;
        case UnaryOp::NOT:
            // Logical not: lower to (operand == false) so bools and truthy
            // values negate correctly (OP_NEG is arithmetic sign-flip).
            chunk_.write_opcode(OpCode::OP_PUSH_BOOL, expr.loc.line);
            chunk_.write_byte(0, expr.loc.line);
            chunk_.write_opcode(OpCode::OP_EQ, expr.loc.line);
            break;
    }
}

void BytecodeEmitter::emit_binary(const BinaryExpr& expr) {
    // Post-order traversal: left, then right, then operator
    emit_expr(expr.left);
    emit_expr(expr.right);

    switch (expr.op) {
        case BinaryOp::ADD: chunk_.write_opcode(OpCode::OP_ADD, expr.loc.line); break;
        case BinaryOp::SUB: chunk_.write_opcode(OpCode::OP_SUB, expr.loc.line); break;
        case BinaryOp::MUL: chunk_.write_opcode(OpCode::OP_MUL, expr.loc.line); break;
        case BinaryOp::DIV: chunk_.write_opcode(OpCode::OP_DIV, expr.loc.line); break;
        case BinaryOp::MATMUL: chunk_.write_opcode(OpCode::OP_MUL, expr.loc.line); break;
        case BinaryOp::NULL_COALESCE: chunk_.write_opcode(OpCode::OP_DUP, expr.loc.line); break;
        case BinaryOp::EQ: chunk_.write_opcode(OpCode::OP_EQ, expr.loc.line); break;
        case BinaryOp::NEQ: chunk_.write_opcode(OpCode::OP_NEQ, expr.loc.line); break;
        case BinaryOp::LT: chunk_.write_opcode(OpCode::OP_LT, expr.loc.line); break;
        case BinaryOp::LE: chunk_.write_opcode(OpCode::OP_LE, expr.loc.line); break;
        case BinaryOp::GT: chunk_.write_opcode(OpCode::OP_GT, expr.loc.line); break;
        case BinaryOp::GE: chunk_.write_opcode(OpCode::OP_GE, expr.loc.line); break;
        case BinaryOp::SPACESHIP: chunk_.write_opcode(OpCode::OP_TERNARY_CMP, expr.loc.line); break;
        case BinaryOp::LOGICAL_AND: // Kleene min; VM preserves bool-ness
        case BinaryOp::MIN: chunk_.write_opcode(OpCode::OP_TERNARY_MIN, expr.loc.line); break;
        case BinaryOp::LOGICAL_OR: // Kleene max; VM preserves bool-ness
        case BinaryOp::MAX: chunk_.write_opcode(OpCode::OP_TERNARY_MAX, expr.loc.line); break;
    }
}

void BytecodeEmitter::emit_match(const MatchStmt& stmt) {
    emit_expr(stmt.condition);

    std::vector<size_t> exit_jumps;

    for (size_t i = 0; i < stmt.arms.size(); ++i) {
        const auto& arm = stmt.arms[i];

        // Duplicate condition value on stack for comparison
        chunk_.write_opcode(OpCode::OP_DUP, stmt.loc.line);
        emit_expr(arm.pattern);
        chunk_.write_opcode(OpCode::OP_EQ, stmt.loc.line);

        if (arm.guard) {
            emit_expr(arm.guard);
            chunk_.write_opcode(OpCode::OP_TERNARY_MIN, stmt.loc.line);
        }

        size_t next_arm_jump = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);

        // Match succeeded: pop matched condition value from stack
        chunk_.write_opcode(OpCode::OP_POP, stmt.loc.line);
        emit_stmt(arm.body);
        exit_jumps.push_back(chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line));

        chunk_.patch_jump(next_arm_jump);
    }

    // If no arm matched, pop the remaining condition value
    chunk_.write_opcode(OpCode::OP_POP, stmt.loc.line);

    for (size_t exit_jump : exit_jumps) {
        chunk_.patch_jump(exit_jump);
    }
}

void BytecodeEmitter::emit_call(const CallExpr& expr) {
    // Handle builtin functions
    if (expr.callee == "print") {
        if (!expr.args.empty()) {
            emit_expr(expr.args[0]);
        } else {
            uint16_t id = static_cast<uint16_t>(chunk_.string_table.size());
            chunk_.string_table.push_back("");
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
        }
        chunk_.write_opcode(OpCode::OP_PRINT, expr.loc.line);
        return;
    }
    if (expr.callee == "println") {
        if (!expr.args.empty()) {
            emit_expr(expr.args[0]);
        } else {
            uint16_t id = static_cast<uint16_t>(chunk_.string_table.size());
            chunk_.string_table.push_back("");
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
        }
        chunk_.write_opcode(OpCode::OP_PRINTLN, expr.loc.line);
        return;
    }
    if (expr.callee == "len") {
        if (!expr.args.empty()) {
            emit_expr(expr.args[0]);
            uint16_t fid = chunk_.add_string("length");
            chunk_.write_opcode(OpCode::OP_GET_FIELD, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(fid), expr.loc.line);
            return;
        }
    }
    if (expr.callee == "append" || expr.callee == "push") {
        if (expr.args.size() == 2) {
            emit_expr(expr.args[0]); // array
            emit_expr(expr.args[1]); // item
            uint16_t mid = chunk_.add_string("append");
            chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(mid), expr.loc.line);
            chunk_.write_byte(1, expr.loc.line);
            return;
        }
    }
    if (expr.callee == "pop") {
        if (!expr.args.empty()) {
            emit_expr(expr.args[0]);
            uint16_t mid = chunk_.add_string("pop");
            chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(mid), expr.loc.line);
            chunk_.write_byte(0, expr.loc.line);
            return;
        }
    }
    if (expr.callee == "tvec3") {
        if (expr.args.size() == 3) {
            emit_expr(expr.args[0]);
            emit_expr(expr.args[1]);
            emit_expr(expr.args[2]);
            uint16_t tid = chunk_.add_string("tvec3");
            chunk_.write_opcode(OpCode::OP_NEW_INSTANCE, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(tid), expr.loc.line);
            chunk_.write_byte(3, expr.loc.line);
            return;
        }
    }
    // User-defined Class or Struct construction e.g. Point(10, 20)
    if (class_fields_.find(expr.callee) != class_fields_.end()) {
        emit_class_ctor(expr.callee, expr.args, expr.loc);
        return;
    }
    if (expr.callee == "trace") {
        chunk_.write_opcode(OpCode::OP_TRACE, expr.loc.line);
        return;
    }
    if (expr.callee == "assert_eq") {
        if (expr.args.size() >= 2) {
            emit_expr(expr.args[0]);
            emit_expr(expr.args[1]);
            chunk_.write_opcode(OpCode::OP_ASSERT_EQ, expr.loc.line);
        }
        return;
    }
    if (expr.callee == "encode_tafpu") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_TAFPU_ENCODE, expr.loc.line);
        return;
    }
    if (expr.callee == "to_double") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_TAFPU_TODBL, expr.loc.line);
        return;
    }

    // Setun2D Graphics Builtins
    if (expr.callee == "setun2d_init") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_GFX_INIT, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_is_running") {
        chunk_.write_opcode(OpCode::OP_GFX_IS_RUNNING, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_clear") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_GFX_CLEAR, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_draw_rect") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_GFX_DRAW_RECT, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_draw_circle") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_GFX_DRAW_CIRCLE, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_draw_text") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_GFX_DRAW_TEXT, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_flip") {
        chunk_.write_opcode(OpCode::OP_GFX_FLIP, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_get_key") {
        chunk_.write_opcode(OpCode::OP_GFX_GET_KEY, expr.loc.line);
        return;
    }
    if (expr.callee == "setun2d_close") {
        chunk_.write_opcode(OpCode::OP_GFX_CLOSE, expr.loc.line);
        return;
    }

    // BitNet AI Builtins
    if (expr.callee == "bitnet_create_dense") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_NN_CREATE_DENSE, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_set_weight") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_NN_SET_WEIGHT, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_set_bias") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_NN_SET_BIAS, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_set_input") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_NN_SET_INPUT, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_get_input") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_NN_GET_INPUT, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_forward") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_NN_FORWARD, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_get_output") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_NN_GET_OUTPUT, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_copy_output_to_input") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_NN_COPY_OUT_IN, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_predict") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_NN_PREDICT, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_get_confidence") {
        for (Expr* arg : expr.args) emit_expr(arg);
        chunk_.write_opcode(OpCode::OP_NN_CONFIDENCE, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_load_mnist_sample") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_NN_LOAD_MNIST, expr.loc.line);
        return;
    }
    if (expr.callee == "bitnet_free_layer") {
        if (!expr.args.empty()) emit_expr(expr.args[0]);
        chunk_.write_opcode(OpCode::OP_NN_FREE_LAYER, expr.loc.line);
        return;
    }
    if (expr.callee == "time_now_us") {
        chunk_.write_opcode(OpCode::OP_TIME_NOW_US, expr.loc.line);
        return;
    }

    // taf3(a, b, s) / taf3(a, b) — explicit TAFPU constructor call
    if (expr.callee == "taf3") {
        if (expr.args.size() == 2 || expr.args.size() == 3) {
            emit_expr(expr.args[0]);
            emit_expr(expr.args[1]);
            if (expr.args.size() == 3) {
                emit_expr(expr.args[2]);
            } else {
                chunk_.write_opcode(OpCode::OP_PUSH_INT, expr.loc.line);
                chunk_.write_int64(0, expr.loc.line);
            }
            chunk_.write_opcode(OpCode::OP_TAFPU_CONSTRUCT, expr.loc.line);
            return;
        }
        throw CompilerException("[Emitter Error] " + loc_str(expr.loc)
                                + " - taf3() takes 2 or 3 arguments (taf3(a, b, s) or taf3(a, b)).");
    }

    if (expr.callee == "range") {
        throw CompilerException("[Emitter Error] " + loc_str(expr.loc)
                                + " - range() is only supported as a for-in iterable: 'for i in range(...)'.");
    }

    // User-defined function call
    for (Expr* arg : expr.args) {
        emit_expr(arg);
    }
    chunk_.write_opcode(OpCode::OP_CALL, expr.loc.line);
    size_t patch_offset = chunk_.code.size();
    chunk_.write_int16(0, expr.loc.line); // Function ID / address placeholder
    chunk_.write_byte(static_cast<uint8_t>(expr.args.size()), expr.loc.line);

    auto it = functions_.find(expr.callee);
    if (it != functions_.end()) {
        uint16_t fn_entry = it->second;
        chunk_.code[patch_offset] = static_cast<uint8_t>(fn_entry & 0xFF);
        chunk_.code[patch_offset + 1] = static_cast<uint8_t>((fn_entry >> 8) & 0xFF);
    } else {
        unresolved_calls_.push_back({patch_offset, expr.callee, expr.loc});
    }
}

// Shared class-construction lowering: X() (legacy manual-init) or
// X(args...) which auto-calls init(args...).
void BytecodeEmitter::emit_class_ctor(const std::string& callee,
                                      const std::vector<Expr*>& args,
                                      const SourceLocation& loc) {
    auto arity_it = class_init_arity_.find(callee);
    int init_arity = (arity_it != class_init_arity_.end()) ? arity_it->second : -1;

    if (args.empty()) {
        // Legacy pattern: X() then obj.init(...) called manually.
        uint16_t tid = chunk_.add_string(callee);
        chunk_.write_opcode(OpCode::OP_NEW_INSTANCE, loc.line);
        chunk_.write_int16(static_cast<int16_t>(tid), loc.line);
        chunk_.write_byte(0, loc.line);
        return;
    }

    if (init_arity < 0) {
        throw CompilerException("[Emitter Error] " + loc_str(loc) + " - Class '" + callee + "' has no init() method; construct it with '" + callee + "()' and set its fields afterwards.");
    }
    if (init_arity == 0) {
        throw CompilerException("[Emitter Error] " + loc_str(loc) + " - init() of class '" + callee + "' takes no arguments; construct with '" + callee + "()' then call init().");
    }
    if (static_cast<int>(args.size()) != init_arity) {
        throw CompilerException("[Emitter Error] " + loc_str(loc) + " - Constructor of class '" + callee + "' (init) expects " + std::to_string(init_arity)
                                + " argument(s), but received " + std::to_string(args.size()) + ".");
    }

    // X(args...) lowers to: obj = X(); obj.init(args...)
    uint16_t tid = chunk_.add_string(callee);
    chunk_.write_opcode(OpCode::OP_NEW_INSTANCE, loc.line);
    chunk_.write_int16(static_cast<int16_t>(tid), loc.line);
    chunk_.write_byte(0, loc.line);
    chunk_.write_opcode(OpCode::OP_DUP, loc.line);
    for (Expr* arg : args) {
        emit_expr(arg);
    }
    uint16_t iid = chunk_.add_string("init");
    chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, loc.line);
    chunk_.write_int16(static_cast<int16_t>(iid), loc.line);
    chunk_.write_byte(static_cast<uint8_t>(args.size()), loc.line);
    // Discard init's default return value; the object stays on the stack.
    chunk_.write_opcode(OpCode::OP_POP, loc.line);
}

void BytecodeEmitter::emit_tafpu_construct(const TafpuConstructExpr& expr) {
    // Evaluate A, B, S on stack
    emit_expr(expr.a);
    emit_expr(expr.b);
    emit_expr(expr.s);
    chunk_.write_opcode(OpCode::OP_TAFPU_CONSTRUCT, expr.loc.line);
}

// Checker-less paths (REPL, disasm, emit-qasm, emit-c) keep the legacy
// interpretation: a bare numeric triple is a TAFPU construct.
void BytecodeEmitter::emit_ambiguous_triple(const AmbiguousTripleExpr& expr) {
    if (expr.elements.size() == 3) {
        emit_expr(expr.elements[0]);
        emit_expr(expr.elements[1]);
        emit_expr(expr.elements[2]);
        chunk_.write_opcode(OpCode::OP_TAFPU_CONSTRUCT, expr.loc.line);
    } else if (expr.elements.size() == 2) {
        emit_expr(expr.elements[0]);
        emit_expr(expr.elements[1]);
        chunk_.write_opcode(OpCode::OP_PUSH_INT, expr.loc.line);
        chunk_.write_int64(0, expr.loc.line);
        chunk_.write_opcode(OpCode::OP_TAFPU_CONSTRUCT, expr.loc.line);
    } else {
        for (Expr* el : expr.elements) emit_expr(el);
        chunk_.write_opcode(OpCode::OP_NEW_ARRAY, expr.loc.line);
        chunk_.write_int16(static_cast<int16_t>(expr.elements.size()), expr.loc.line);
    }
}

void BytecodeEmitter::emit_fstring_lit(const FStringExpr& expr) {
    if (expr.parts.empty()) {
        // No interpolation segments: legacy raw format string.
        uint16_t id = static_cast<uint16_t>(chunk_.string_table.size());
        chunk_.string_table.push_back(expr.format_string);
        chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
        chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
        return;
    }

    for (size_t i = 0; i < expr.parts.size(); ++i) {
        const FStringPart& part = expr.parts[i];
        if (part.is_literal) {
            uint16_t id = chunk_.add_string(part.text);
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
        } else {
            emit_expr(part.expr);
            // target.fmt(spec) — the VM renders the value per MATLAB-style spec
            uint16_t mid = chunk_.add_string("fmt");
            uint16_t sid = chunk_.add_string(part.text);
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(sid), expr.loc.line);
            chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, expr.loc.line);
            chunk_.write_int16(static_cast<int16_t>(mid), expr.loc.line);
            chunk_.write_byte(1, expr.loc.line);
        }
        if (i > 0) {
            chunk_.write_opcode(OpCode::OP_ADD, expr.loc.line);
        }
    }
}

void BytecodeEmitter::emit_member_access(const MemberAccessExpr& expr) {
    if (expr.object) emit_expr(expr.object);
    uint16_t id = static_cast<uint16_t>(chunk_.string_table.size());
    chunk_.string_table.push_back(expr.member);
    chunk_.write_opcode(OpCode::OP_GET_FIELD, expr.loc.line);
    chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
}

void BytecodeEmitter::emit_method_call(const MethodCallExpr& expr) {
    // Aliased import call: gui.fn(args) is a plain function call of "gui.fn",
    // or a namespaced constructor when callee names a known class.
    if (expr.object && std::holds_alternative<IdentifierExpr>(expr.object->data)) {
        const auto& obj_name = std::get<IdentifierExpr>(expr.object->data).name;
        if (import_aliases_.count(obj_name)) {
            std::string callee = obj_name + "." + expr.method;

            if (class_fields_.count(callee)) {
                // Namespaced constructor: mx.Meter(100)
                emit_class_ctor(callee, expr.args, expr.loc);
                return;
            }

            for (Expr* arg : expr.args) {
                emit_expr(arg);
            }
            chunk_.write_opcode(OpCode::OP_CALL, expr.loc.line);
            size_t patch_offset = chunk_.code.size();
            chunk_.write_int16(0, expr.loc.line);
            chunk_.write_byte(static_cast<uint8_t>(expr.args.size()), expr.loc.line);
            auto it = functions_.find(callee);
            if (it != functions_.end()) {
                uint16_t fn_entry = it->second;
                chunk_.code[patch_offset] = static_cast<uint8_t>(fn_entry & 0xFF);
                chunk_.code[patch_offset + 1] = static_cast<uint8_t>((fn_entry >> 8) & 0xFF);
            } else {
                unresolved_calls_.push_back({patch_offset, callee, expr.loc});
            }
            return;
        }
    }

    if (expr.object) emit_expr(expr.object);
    for (Expr* arg : expr.args) {
        emit_expr(arg);
    }
    uint16_t id = chunk_.add_string(expr.method);
    chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, expr.loc.line);
    chunk_.write_int16(static_cast<int16_t>(id), expr.loc.line);
    chunk_.write_byte(static_cast<uint8_t>(expr.args.size()), expr.loc.line);
}

void BytecodeEmitter::emit_index(const IndexExpr& expr) {
    if (expr.object) emit_expr(expr.object);
    if (expr.index) emit_expr(expr.index);
    chunk_.write_opcode(OpCode::OP_GET_INDEX, expr.loc.line);
}

void BytecodeEmitter::emit_comptime(const ComptimeExpr& expr) {
    if (expr.expr) emit_expr(expr.expr);
}

void BytecodeEmitter::emit_array_lit(const ArrayLiteralExpr& expr) {
    for (Expr* el : expr.elements) {
        emit_expr(el);
    }
    chunk_.write_opcode(OpCode::OP_NEW_ARRAY, expr.loc.line);
    chunk_.write_int16(static_cast<int16_t>(expr.elements.size()), expr.loc.line);
}

// Number of init() parameters excluding 'self'; -1 when the class has no init.
static int compute_init_arity(const std::string& class_name, const std::vector<MethodDecl>& methods) {
    for (const auto& m : methods) {
        if (m.name != "init") continue;
        int arity = 0;
        for (const auto& p : m.params) {
            if (p.name != "self") ++arity;
        }
        return arity;
    }
    (void)class_name;
    return -1;
}

void BytecodeEmitter::emit_struct_decl(const StructDeclStmt& stmt) {
    std::vector<std::string> fnames;
    for (const auto& f : stmt.fields) fnames.push_back(f.name);
    class_fields_[stmt.name] = fnames;
    class_init_arity_[stmt.name] = compute_init_arity(stmt.name, stmt.methods);

    for (const auto& m : stmt.methods) {
        if (!m.body) continue;
        std::string mangled_name = stmt.name + "_" + m.name;
        size_t jump_over = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
        uint16_t fn_entry = static_cast<uint16_t>(chunk_.code.size());
        functions_[mangled_name] = fn_entry;
        class_methods_[stmt.name][m.name] = fn_entry;

        symbol_table_.enter_scope();
        uint16_t prev_locals = next_local_slot_;
        next_local_slot_ = 0;
        for (const auto& p : m.params) {
            symbol_table_.define(p.name, p.type, false, next_local_slot_++);
        }
        emit_stmt(m.body);
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(0, stmt.loc.line);
        chunk_.write_opcode(OpCode::OP_RET, stmt.loc.line);
        symbol_table_.exit_scope();
        next_local_slot_ = prev_locals;
        chunk_.patch_jump(jump_over);
    }
}

void BytecodeEmitter::emit_class_decl(const ClassDeclStmt& stmt) {
    std::vector<std::string> fnames;
    if (!stmt.super_class.empty() && class_fields_.find(stmt.super_class) != class_fields_.end()) {
        fnames = class_fields_[stmt.super_class];
    }
    for (const auto& f : stmt.fields) fnames.push_back(f.name);
    class_fields_[stmt.name] = fnames;
    class_init_arity_[stmt.name] = compute_init_arity(stmt.name, stmt.methods);

    if (!stmt.super_class.empty() && class_methods_.find(stmt.super_class) != class_methods_.end()) {
        class_methods_[stmt.name] = class_methods_[stmt.super_class];
    }

    for (const auto& m : stmt.methods) {
        if (!m.body) continue;
        std::string mangled_name = stmt.name + "_" + m.name;
        size_t jump_over = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
        uint16_t fn_entry = static_cast<uint16_t>(chunk_.code.size());
        functions_[mangled_name] = fn_entry;
        class_methods_[stmt.name][m.name] = fn_entry;

        symbol_table_.enter_scope();
        uint16_t prev_locals = next_local_slot_;
        next_local_slot_ = 0;
        for (const auto& p : m.params) {
            symbol_table_.define(p.name, p.type, false, next_local_slot_++);
        }
        emit_stmt(m.body);
        chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
        chunk_.write_int64(0, stmt.loc.line);
        chunk_.write_opcode(OpCode::OP_RET, stmt.loc.line);
        symbol_table_.exit_scope();
        next_local_slot_ = prev_locals;
        chunk_.patch_jump(jump_over);
    }
}

} // namespace setun
