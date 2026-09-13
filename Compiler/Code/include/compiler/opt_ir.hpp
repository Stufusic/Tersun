#pragma once

#include "compiler/ast.hpp"
#include <string>
#include <vector>
#include <memory>
#include <unordered_map>
#include <sstream>
#include <iostream>

namespace setun {

class CFG;

enum class IROp {
    NOP,
    LABEL,

    // Constant loads
    CONST_INT,
    CONST_FLOAT,
    CONST_BOOL,
    CONST_STR,
    CONST_TRYTE,
    CONST_TAFPU,
    CONST_NIL,

    // Dataflow & variables
    MOVE,          // dst = src1 (register copy)
    LOAD_LOCAL,    // dst = local[slot]
    STORE_LOCAL,   // local[slot] = src1
    LOAD_GLOBAL,   // dst = global[name]
    STORE_GLOBAL,  // global[name] = src1

    // Arithmetic
    ADD,
    SUB,
    MUL,
    DIV,
    MOD,
    NEG,

    // Bitwise / Ternary Logic
    BIT_AND,
    BIT_OR,
    BIT_XOR,
    BIT_NOT,
    SHL,
    SHR,
    TRIT_NOT,
    TAFPU_ADD,
    TAFPU_SUB,
    TAFPU_MUL,
    TAFPU_DIV,

    // Comparisons
    CMP_EQ,
    CMP_NE,
    CMP_LT,
    CMP_LE,
    CMP_GT,
    CMP_GE,

    // Control Flow
    JUMP,
    BRANCH_IF_TRUE,
    BRANCH_IF_FALSE,
    BRANCH3,       // ternary branch: negative, zero, positive targets

    // Functions
    CALL,
    PARAM,
    RETURN,

    // Heap / Object / Array
    ALLOC_ARRAY,
    LOAD_ELEM,
    STORE_ELEM,
    ARRAY_LEN,
    ALLOC_OBJ,
    LOAD_FIELD,
    STORE_FIELD,

    // Traps / Runtime
    VM_FALLBACK
};

inline const char* ir_op_to_string(IROp op) {
    switch (op) {
        case IROp::NOP: return "NOP";
        case IROp::LABEL: return "LABEL";
        case IROp::CONST_INT: return "CONST_INT";
        case IROp::CONST_FLOAT: return "CONST_FLOAT";
        case IROp::CONST_BOOL: return "CONST_BOOL";
        case IROp::CONST_STR: return "CONST_STR";
        case IROp::CONST_TRYTE: return "CONST_TRYTE";
        case IROp::CONST_TAFPU: return "CONST_TAFPU";
        case IROp::CONST_NIL: return "CONST_NIL";
        case IROp::MOVE: return "MOVE";
        case IROp::LOAD_LOCAL: return "LOAD_LOCAL";
        case IROp::STORE_LOCAL: return "STORE_LOCAL";
        case IROp::LOAD_GLOBAL: return "LOAD_GLOBAL";
        case IROp::STORE_GLOBAL: return "STORE_GLOBAL";
        case IROp::ADD: return "ADD";
        case IROp::SUB: return "SUB";
        case IROp::MUL: return "MUL";
        case IROp::DIV: return "DIV";
        case IROp::MOD: return "MOD";
        case IROp::NEG: return "NEG";
        case IROp::BIT_AND: return "BIT_AND";
        case IROp::BIT_OR: return "BIT_OR";
        case IROp::BIT_XOR: return "BIT_XOR";
        case IROp::BIT_NOT: return "BIT_NOT";
        case IROp::SHL: return "SHL";
        case IROp::SHR: return "SHR";
        case IROp::TRIT_NOT: return "TRIT_NOT";
        case IROp::TAFPU_ADD: return "TAFPU_ADD";
        case IROp::TAFPU_SUB: return "TAFPU_SUB";
        case IROp::TAFPU_MUL: return "TAFPU_MUL";
        case IROp::TAFPU_DIV: return "TAFPU_DIV";
        case IROp::CMP_EQ: return "CMP_EQ";
        case IROp::CMP_NE: return "CMP_NE";
        case IROp::CMP_LT: return "CMP_LT";
        case IROp::CMP_LE: return "CMP_LE";
        case IROp::CMP_GT: return "CMP_GT";
        case IROp::CMP_GE: return "CMP_GE";
        case IROp::JUMP: return "JUMP";
        case IROp::BRANCH_IF_TRUE: return "BRANCH_IF_TRUE";
        case IROp::BRANCH_IF_FALSE: return "BRANCH_IF_FALSE";
        case IROp::BRANCH3: return "BRANCH3";
        case IROp::CALL: return "CALL";
        case IROp::PARAM: return "PARAM";
        case IROp::RETURN: return "RETURN";
        case IROp::ALLOC_ARRAY: return "ALLOC_ARRAY";
        case IROp::LOAD_ELEM: return "LOAD_ELEM";
        case IROp::STORE_ELEM: return "STORE_ELEM";
        case IROp::ARRAY_LEN: return "ARRAY_LEN";
        case IROp::ALLOC_OBJ: return "ALLOC_OBJ";
        case IROp::LOAD_FIELD: return "LOAD_FIELD";
        case IROp::STORE_FIELD: return "STORE_FIELD";
        case IROp::VM_FALLBACK: return "VM_FALLBACK";
        default: return "UNKNOWN";
    }
}

struct IROperand {
    enum class Kind {
        NONE,
        VREG,         // Virtual register v0, v1, v2...
        LOCAL_SLOT,   // Local variable slot
        CONST_INT,
        CONST_FLOAT,
        CONST_BOOL,
        CONST_STR,
        LABEL_REF
    } kind{Kind::NONE};

    int64_t val_i{0};
    double val_f{0.0};
    std::string val_s{};

    IROperand() = default;
    IROperand(const IROperand&) = default;
    IROperand(IROperand&&) noexcept = default;
    IROperand& operator=(const IROperand&) = default;
    IROperand& operator=(IROperand&&) noexcept = default;

    static IROperand none() { return IROperand(); }
    static IROperand vreg(size_t id) {
        IROperand op;
        op.kind = Kind::VREG;
        op.val_i = static_cast<int64_t>(id);
        return op;
    }
    static IROperand local(size_t slot, const std::string& name = "") {
        IROperand op;
        op.kind = Kind::LOCAL_SLOT;
        op.val_i = static_cast<int64_t>(slot);
        op.val_s = name;
        return op;
    }
    static IROperand const_int(int64_t v) {
        IROperand op;
        op.kind = Kind::CONST_INT;
        op.val_i = v;
        return op;
    }
    static IROperand const_float(double v) {
        IROperand op;
        op.kind = Kind::CONST_FLOAT;
        op.val_f = v;
        return op;
    }
    static IROperand const_bool(bool v) {
        IROperand op;
        op.kind = Kind::CONST_BOOL;
        op.val_i = v ? 1 : 0;
        return op;
    }
    static IROperand const_str(const std::string& v) {
        IROperand op;
        op.kind = Kind::CONST_STR;
        op.val_s = v;
        return op;
    }
    static IROperand label(const std::string& lbl) {
        IROperand op;
        op.kind = Kind::LABEL_REF;
        op.val_s = lbl;
        return op;
    }

    bool is_none() const { return kind == Kind::NONE; }
    bool is_vreg() const { return kind == Kind::VREG; }
    bool is_local() const { return kind == Kind::LOCAL_SLOT; }
    bool is_const() const {
        return kind == Kind::CONST_INT || kind == Kind::CONST_FLOAT ||
               kind == Kind::CONST_BOOL || kind == Kind::CONST_STR;
    }
    bool is_label() const { return kind == Kind::LABEL_REF; }

    bool operator==(const IROperand& o) const {
        if (kind != o.kind) return false;
        switch (kind) {
            case Kind::NONE: return true;
            case Kind::VREG:
            case Kind::LOCAL_SLOT:
            case Kind::CONST_INT:
            case Kind::CONST_BOOL:
                return val_i == o.val_i;
            case Kind::CONST_FLOAT:
                return val_f == o.val_f;
            case Kind::CONST_STR:
            case Kind::LABEL_REF:
                return val_s == o.val_s;
        }
        return false;
    }

    std::string to_string() const {
        switch (kind) {
            case Kind::NONE: return "_";
            case Kind::VREG: return "v" + std::to_string(val_i);
            case Kind::LOCAL_SLOT:
                if (!val_s.empty()) return "loc[" + std::to_string(val_i) + ":" + val_s + "]";
                return "loc[" + std::to_string(val_i) + "]";
            case Kind::CONST_INT: return std::to_string(val_i);
            case Kind::CONST_FLOAT: return std::to_string(val_f);
            case Kind::CONST_BOOL: return val_i ? "true" : "false";
            case Kind::CONST_STR: return "\"" + val_s + "\"";
            case Kind::LABEL_REF: return "@" + val_s;
        }
        return "?";
    }
};

struct IRInstruction {
    IROp op{IROp::NOP};
    IROperand dst{IROperand::none()};
    IROperand src1{IROperand::none()};
    IROperand src2{IROperand::none()};
    std::vector<IROperand> args{};

    // Semantic & Hardware Metadata
    bool has_side_effect{false};
    bool may_trap{false};
    bool is_induction_var{false};
    size_t line{0};

    std::string to_string() const {
        std::ostringstream oss;
        if (op == IROp::LABEL) {
            oss << dst.val_s << ":";
            return oss.str();
        }
        oss << "  ";
        if (!dst.is_none()) {
            oss << dst.to_string() << " = ";
        }
        oss << ir_op_to_string(op);
        if (!src1.is_none()) oss << " " << src1.to_string();
        if (!src2.is_none()) oss << ", " << src2.to_string();
        for (const auto& a : args) {
            oss << ", " << a.to_string();
        }
        if (is_induction_var) oss << " [induction_var]";
        return oss.str();
    }
};

struct IRFunction {
    std::string name;
    size_t num_params{0};
    size_t num_locals{0};
    std::vector<std::string> param_names;
    std::vector<IRInstruction> instructions;
    std::shared_ptr<CFG> cfg;

    std::string dump() const {
        std::ostringstream oss;
        oss << "fn " << name << "(";
        for (size_t i = 0; i < param_names.size(); ++i) {
            if (i > 0) oss << ", ";
            oss << param_names[i];
        }
        oss << ") [locals=" << num_locals << "] {\n";
        for (const auto& inst : instructions) {
            oss << inst.to_string() << "\n";
        }
        oss << "}\n";
        return oss.str();
    }
};

struct IRModule {
    std::vector<IRFunction> functions;
    IRFunction toplevel;
    std::vector<std::string> string_table;

    std::string dump() const {
        std::ostringstream oss;
        oss << "; === TERSUN LINEAR OPTIMIZATION IR (GATE 5.3) ===\n\n";
        for (const auto& fn : functions) {
            oss << fn.dump() << "\n";
        }
        oss << "; === TOPLEVEL ===\n";
        oss << toplevel.dump();
        return oss.str();
    }
};

// AST Lowering to Linear IR Builder
class IRBuilder {
public:
    IRBuilder() = default;

    IRModule build_module(const Program& program);

private:
    void lower_function(const FnDeclStmt& fn, IRFunction& out_fn);
    void lower_stmt(Stmt* stmt, IRFunction& out_fn);
    IROperand lower_expr(Expr* expr, IRFunction& out_fn);

    IROperand alloc_vreg() {
        return IROperand::vreg(next_vreg_++);
    }

    std::string alloc_label(const std::string& prefix = "bb") {
        return prefix + "_" + std::to_string(next_label_++);
    }

    size_t next_vreg_{0};
    size_t next_label_{0};
    std::unordered_map<std::string, size_t> local_slots_;
    std::vector<std::string> break_labels_;
    std::vector<std::string> continue_labels_;
};

} // namespace setun
