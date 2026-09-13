#include "compiler/opt_ir.hpp"
#include <cassert>
#include <type_traits>

namespace setun {

IRModule IRBuilder::build_module(const Program& program) {
    IRModule mod;
    next_vreg_ = 0;
    next_label_ = 0;
    local_slots_.clear();
    break_labels_.clear();
    continue_labels_.clear();

    mod.toplevel.name = "__toplevel__";

    class_fields_.clear();
    class_init_arity_.clear();

    for (const auto* stmt : program.statements) {
        if (!stmt) continue;
        if (const auto* cd = std::get_if<ClassDeclStmt>(&stmt->data)) {
            std::vector<std::string> fnames;
            if (!cd->super_class.empty() && class_fields_.find(cd->super_class) != class_fields_.end()) {
                fnames = class_fields_[cd->super_class];
            }
            for (const auto& f : cd->fields) fnames.push_back(f.name);
            class_fields_[cd->name] = fnames;
            int arity = -1;
            for (const auto& m : cd->methods) {
                if (m.name == "init") {
                    arity = 0;
                    for (const auto& p : m.params) {
                        if (p.name != "self") ++arity;
                    }
                    break;
                }
            }
            class_init_arity_[cd->name] = arity;
        } else if (const auto* sd = std::get_if<StructDeclStmt>(&stmt->data)) {
            std::vector<std::string> fnames;
            for (const auto& f : sd->fields) fnames.push_back(f.name);
            class_fields_[sd->name] = fnames;
            int arity = -1;
            for (const auto& m : sd->methods) {
                if (m.name == "init") {
                    arity = 0;
                    for (const auto& p : m.params) {
                        if (p.name != "self") ++arity;
                    }
                    break;
                }
            }
            class_init_arity_[sd->name] = arity;
        }
    }

    for (const auto* stmt : program.statements) {
        if (!stmt) continue;
        if (const auto* fn_decl = std::get_if<FnDeclStmt>(&stmt->data)) {
            IRFunction fn;
            lower_function(*fn_decl, fn);
            mod.functions.push_back(std::move(fn));
        } else if (const auto* cd = std::get_if<ClassDeclStmt>(&stmt->data)) {
            for (const auto& m : cd->methods) {
                if (!m.body) continue;
                FnDeclStmt dummy_fn;
                dummy_fn.name = cd->name + "_" + m.name;
                dummy_fn.params = m.params;
                dummy_fn.body = m.body;
                dummy_fn.loc = cd->loc;
                IRFunction fn;
                lower_function(dummy_fn, fn);
                mod.functions.push_back(std::move(fn));
            }
        } else if (const auto* sd = std::get_if<StructDeclStmt>(&stmt->data)) {
            for (const auto& m : sd->methods) {
                if (!m.body) continue;
                FnDeclStmt dummy_fn;
                dummy_fn.name = sd->name + "_" + m.name;
                dummy_fn.params = m.params;
                dummy_fn.body = m.body;
                dummy_fn.loc = sd->loc;
                IRFunction fn;
                lower_function(dummy_fn, fn);
                mod.functions.push_back(std::move(fn));
            }
        } else {
            lower_stmt(const_cast<Stmt*>(stmt), mod.toplevel);
        }
    }

    // Ensure toplevel has a return if it didn't end with one
    if (mod.toplevel.instructions.empty() ||
        mod.toplevel.instructions.back().op != IROp::RETURN) {
        IRInstruction ret;
        ret.op = IROp::RETURN;
        ret.dst = IROperand::none();
        mod.toplevel.instructions.push_back(ret);
    }
    mod.toplevel.num_locals = local_slots_.size();

    return mod;
}

void IRBuilder::lower_function(const FnDeclStmt& fn, IRFunction& out_fn) {
    out_fn.name = fn.name;
    out_fn.num_params = fn.params.size();
    for (const auto& p : fn.params) {
        out_fn.param_names.push_back(p.name);
    }

    size_t saved_vreg = next_vreg_;
    size_t saved_label = next_label_;
    auto saved_locals = local_slots_;
    auto saved_breaks = break_labels_;
    auto saved_continues = continue_labels_;

    local_slots_.clear();
    break_labels_.clear();
    continue_labels_.clear();
    next_vreg_ = 0;

    // Register parameters as first locals
    for (size_t i = 0; i < fn.params.size(); ++i) {
        local_slots_[fn.params[i].name] = i;
    }

    if (fn.body) {
        lower_stmt(fn.body, out_fn);
    }

    // Ensure function ends with return
    if (out_fn.instructions.empty() || out_fn.instructions.back().op != IROp::RETURN) {
        IRInstruction ret;
        ret.op = IROp::RETURN;
        ret.dst = IROperand::none();
        out_fn.instructions.push_back(ret);
    }

    out_fn.num_locals = local_slots_.size();

    next_vreg_ = saved_vreg;
    next_label_ = saved_label;
    local_slots_ = saved_locals;
    break_labels_ = saved_breaks;
    continue_labels_ = saved_continues;
}

void IRBuilder::lower_stmt(Stmt* stmt, IRFunction& out_fn) {
    if (!stmt) return;

    std::visit([&](const auto& s) {
        using T = std::decay_t<decltype(s)>;

        if constexpr (std::is_same_v<T, VarDeclStmt>) {
            size_t slot;
            auto it = local_slots_.find(s.name);
            if (it == local_slots_.end()) {
                slot = local_slots_.size();
                local_slots_[s.name] = slot;
            } else {
                slot = it->second;
            }

            if (s.init) {
                IROperand val = lower_expr(s.init, out_fn);
                IRInstruction inst;
                inst.op = IROp::STORE_LOCAL;
                inst.dst = IROperand::local(slot, s.name);
                inst.src1 = val;
                inst.line = s.loc.line;
                out_fn.instructions.push_back(inst);
            }
        } else if constexpr (std::is_same_v<T, AssignStmt>) {
            size_t slot;
            auto it = local_slots_.find(s.name);
            if (it == local_slots_.end()) {
                slot = local_slots_.size();
                local_slots_[s.name] = slot;
            } else {
                slot = it->second;
            }

            if (s.value) {
                IROperand val = lower_expr(s.value, out_fn);
                IRInstruction inst;
                inst.op = IROp::STORE_LOCAL;
                inst.dst = IROperand::local(slot, s.name);
                inst.src1 = val;
                inst.line = s.loc.line;
                out_fn.instructions.push_back(inst);
            }
        } else if constexpr (std::is_same_v<T, MemberAssignStmt>) {
            IROperand obj = lower_expr(s.object, out_fn);
            IROperand val = lower_expr(s.value, out_fn);

            IRInstruction inst;
            inst.op = IROp::STORE_FIELD;
            inst.dst = obj;
            inst.src1 = IROperand::const_str(s.member);
            inst.src2 = val;
            inst.has_side_effect = true;
            inst.line = s.loc.line;
            out_fn.instructions.push_back(inst);
        } else if constexpr (std::is_same_v<T, IndexAssignStmt>) {
            IROperand arr = lower_expr(s.object, out_fn);
            IROperand index = lower_expr(s.index, out_fn);
            IROperand val = lower_expr(s.value, out_fn);

            IRInstruction inst;
            inst.op = IROp::STORE_ELEM;
            inst.dst = arr;
            inst.src1 = index;
            inst.src2 = val;
            inst.has_side_effect = true;
            inst.line = s.loc.line;
            out_fn.instructions.push_back(inst);
        } else if constexpr (std::is_same_v<T, ExprStmt>) {
            if (s.expr) {
                lower_expr(s.expr, out_fn);
            }
        } else if constexpr (std::is_same_v<T, BlockStmt>) {
            for (auto* sub_stmt : s.statements) {
                if (sub_stmt) lower_stmt(sub_stmt, out_fn);
            }
        } else if constexpr (std::is_same_v<T, IfStmt>) {
            IROperand cond = lower_expr(s.condition, out_fn);
            std::string then_lbl = alloc_label("if_then");
            std::string else_lbl = alloc_label("if_else");
            std::string end_lbl = alloc_label("if_end");

            if (s.else_branch) {
                IRInstruction br;
                br.op = IROp::BRANCH_IF_FALSE;
                br.src1 = cond;
                br.src2 = IROperand::label(else_lbl);
                out_fn.instructions.push_back(br);

                IRInstruction l_then;
                l_then.op = IROp::LABEL;
                l_then.dst = IROperand::label(then_lbl);
                out_fn.instructions.push_back(l_then);

                lower_stmt(s.then_branch, out_fn);

                IRInstruction jmp_end;
                jmp_end.op = IROp::JUMP;
                jmp_end.src1 = IROperand::label(end_lbl);
                out_fn.instructions.push_back(jmp_end);

                IRInstruction l_else;
                l_else.op = IROp::LABEL;
                l_else.dst = IROperand::label(else_lbl);
                out_fn.instructions.push_back(l_else);

                lower_stmt(s.else_branch, out_fn);

                IRInstruction l_end;
                l_end.op = IROp::LABEL;
                l_end.dst = IROperand::label(end_lbl);
                out_fn.instructions.push_back(l_end);
            } else {
                IRInstruction br;
                br.op = IROp::BRANCH_IF_FALSE;
                br.src1 = cond;
                br.src2 = IROperand::label(end_lbl);
                out_fn.instructions.push_back(br);

                IRInstruction l_then;
                l_then.op = IROp::LABEL;
                l_then.dst = IROperand::label(then_lbl);
                out_fn.instructions.push_back(l_then);

                lower_stmt(s.then_branch, out_fn);

                IRInstruction l_end;
                l_end.op = IROp::LABEL;
                l_end.dst = IROperand::label(end_lbl);
                out_fn.instructions.push_back(l_end);
            }
        } else if constexpr (std::is_same_v<T, WhileStmt>) {
            std::string hdr_lbl = alloc_label("while_hdr");
            std::string body_lbl = alloc_label("while_body");
            std::string end_lbl = alloc_label("while_end");

            break_labels_.push_back(end_lbl);
            continue_labels_.push_back(hdr_lbl);

            IRInstruction l_hdr;
            l_hdr.op = IROp::LABEL;
            l_hdr.dst = IROperand::label(hdr_lbl);
            out_fn.instructions.push_back(l_hdr);

            IROperand cond = lower_expr(s.condition, out_fn);

            IRInstruction br;
            br.op = IROp::BRANCH_IF_FALSE;
            br.src1 = cond;
            br.src2 = IROperand::label(end_lbl);
            out_fn.instructions.push_back(br);

            IRInstruction l_body;
            l_body.op = IROp::LABEL;
            l_body.dst = IROperand::label(body_lbl);
            out_fn.instructions.push_back(l_body);

            lower_stmt(s.body, out_fn);

            IRInstruction jmp;
            jmp.op = IROp::JUMP;
            jmp.src1 = IROperand::label(hdr_lbl);
            out_fn.instructions.push_back(jmp);

            IRInstruction l_end;
            l_end.op = IROp::LABEL;
            l_end.dst = IROperand::label(end_lbl);
            out_fn.instructions.push_back(l_end);

            break_labels_.pop_back();
            continue_labels_.pop_back();
        } else if constexpr (std::is_same_v<T, ForStmt>) {
            if (s.is_for_in) {
                const CallExpr* range_call = nullptr;
                if (s.iterable && std::holds_alternative<CallExpr>(s.iterable->data)) {
                    const auto& ce = std::get<CallExpr>(s.iterable->data);
                    if (ce.callee == "range") range_call = &ce;
                }

                if (range_call) {
                    IROperand start_op = IROperand::const_int(0);
                    IROperand stop_op = IROperand::const_int(0);
                    IROperand step_op = IROperand::const_int(1);

                    if (range_call->args.size() == 1) {
                        stop_op = lower_expr(range_call->args[0], out_fn);
                    } else if (range_call->args.size() == 2) {
                        start_op = lower_expr(range_call->args[0], out_fn);
                        stop_op = lower_expr(range_call->args[1], out_fn);
                    } else if (range_call->args.size() >= 3) {
                        start_op = lower_expr(range_call->args[0], out_fn);
                        stop_op = lower_expr(range_call->args[1], out_fn);
                        step_op = lower_expr(range_call->args[2], out_fn);
                    }

                    size_t var_slot;
                    auto it_var = local_slots_.find(s.loop_var);
                    if (it_var == local_slots_.end()) {
                        var_slot = local_slots_.size();
                        local_slots_[s.loop_var] = var_slot;
                    } else {
                        var_slot = it_var->second;
                    }

                    // var = start
                    IRInstruction init_inst;
                    init_inst.op = IROp::STORE_LOCAL;
                    init_inst.dst = IROperand::local(var_slot, s.loop_var);
                    init_inst.src1 = start_op;
                    init_inst.line = s.loc.line;
                    out_fn.instructions.push_back(init_inst);

                    std::string hdr_lbl = alloc_label("for_range_hdr");
                    std::string body_lbl = alloc_label("for_range_body");
                    std::string inc_lbl = alloc_label("for_range_inc");
                    std::string end_lbl = alloc_label("for_range_end");

                    break_labels_.push_back(end_lbl);
                    continue_labels_.push_back(inc_lbl);

                    IRInstruction l_hdr;
                    l_hdr.op = IROp::LABEL;
                    l_hdr.dst = IROperand::label(hdr_lbl);
                    out_fn.instructions.push_back(l_hdr);

                    IROperand cur_var = alloc_vreg();
                    IRInstruction load_v;
                    load_v.op = IROp::LOAD_LOCAL;
                    load_v.dst = cur_var;
                    load_v.src1 = IROperand::local(var_slot, s.loop_var);
                    load_v.line = s.loc.line;
                    out_fn.instructions.push_back(load_v);

                    IROperand cond = alloc_vreg();
                    IRInstruction cmp_inst;
                    cmp_inst.op = IROp::CMP_LT;
                    cmp_inst.dst = cond;
                    cmp_inst.src1 = cur_var;
                    cmp_inst.src2 = stop_op;
                    cmp_inst.line = s.loc.line;
                    out_fn.instructions.push_back(cmp_inst);

                    IRInstruction br;
                    br.op = IROp::BRANCH_IF_FALSE;
                    br.src1 = cond;
                    br.src2 = IROperand::label(end_lbl);
                    out_fn.instructions.push_back(br);

                    IRInstruction l_body;
                    l_body.op = IROp::LABEL;
                    l_body.dst = IROperand::label(body_lbl);
                    out_fn.instructions.push_back(l_body);

                    lower_stmt(s.body, out_fn);

                    IRInstruction l_inc;
                    l_inc.op = IROp::LABEL;
                    l_inc.dst = IROperand::label(inc_lbl);
                    out_fn.instructions.push_back(l_inc);

                    IROperand v_before_inc = alloc_vreg();
                    IRInstruction load_v2;
                    load_v2.op = IROp::LOAD_LOCAL;
                    load_v2.dst = v_before_inc;
                    load_v2.src1 = IROperand::local(var_slot, s.loop_var);
                    load_v2.line = s.loc.line;
                    out_fn.instructions.push_back(load_v2);

                    IROperand v_after_inc = alloc_vreg();
                    IRInstruction add_inst;
                    add_inst.op = IROp::ADD;
                    add_inst.dst = v_after_inc;
                    add_inst.src1 = v_before_inc;
                    add_inst.src2 = step_op;
                    add_inst.line = s.loc.line;
                    out_fn.instructions.push_back(add_inst);

                    IRInstruction store_v;
                    store_v.op = IROp::STORE_LOCAL;
                    store_v.dst = IROperand::local(var_slot, s.loop_var);
                    store_v.src1 = v_after_inc;
                    store_v.line = s.loc.line;
                    out_fn.instructions.push_back(store_v);

                    IRInstruction jmp;
                    jmp.op = IROp::JUMP;
                    jmp.src1 = IROperand::label(hdr_lbl);
                    out_fn.instructions.push_back(jmp);

                    IRInstruction l_end;
                    l_end.op = IROp::LABEL;
                    l_end.dst = IROperand::label(end_lbl);
                    out_fn.instructions.push_back(l_end);

                    break_labels_.pop_back();
                    continue_labels_.pop_back();
                    return;
                }
            }

            if (s.init) lower_stmt(s.init, out_fn);

            std::string hdr_lbl = alloc_label("for_hdr");
            std::string body_lbl = alloc_label("for_body");
            std::string inc_lbl = alloc_label("for_inc");
            std::string end_lbl = alloc_label("for_end");

            break_labels_.push_back(end_lbl);
            continue_labels_.push_back(inc_lbl);

            IRInstruction l_hdr;
            l_hdr.op = IROp::LABEL;
            l_hdr.dst = IROperand::label(hdr_lbl);
            out_fn.instructions.push_back(l_hdr);

            if (s.cond) {
                IROperand cond = lower_expr(s.cond, out_fn);
                IRInstruction br;
                br.op = IROp::BRANCH_IF_FALSE;
                br.src1 = cond;
                br.src2 = IROperand::label(end_lbl);
                out_fn.instructions.push_back(br);
            }

            IRInstruction l_body;
            l_body.op = IROp::LABEL;
            l_body.dst = IROperand::label(body_lbl);
            out_fn.instructions.push_back(l_body);

            lower_stmt(s.body, out_fn);

            IRInstruction l_inc;
            l_inc.op = IROp::LABEL;
            l_inc.dst = IROperand::label(inc_lbl);
            out_fn.instructions.push_back(l_inc);

            if (s.update) lower_stmt(s.update, out_fn);

            IRInstruction jmp;
            jmp.op = IROp::JUMP;
            jmp.src1 = IROperand::label(hdr_lbl);
            out_fn.instructions.push_back(jmp);

            IRInstruction l_end;
            l_end.op = IROp::LABEL;
            l_end.dst = IROperand::label(end_lbl);
            out_fn.instructions.push_back(l_end);

            break_labels_.pop_back();
            continue_labels_.pop_back();
        } else if constexpr (std::is_same_v<T, Branch3Stmt>) {
            IROperand val = lower_expr(s.condition, out_fn);
            std::string neg_lbl = alloc_label("br3_neg");
            std::string zero_lbl = alloc_label("br3_zero");
            std::string pos_lbl = alloc_label("br3_pos");
            std::string end_lbl = alloc_label("br3_end");

            IRInstruction b3;
            b3.op = IROp::BRANCH3;
            b3.src1 = val;
            b3.args = {IROperand::label(neg_lbl), IROperand::label(zero_lbl), IROperand::label(pos_lbl)};
            out_fn.instructions.push_back(b3);

            // Negative branch
            IRInstruction l_neg;
            l_neg.op = IROp::LABEL;
            l_neg.dst = IROperand::label(neg_lbl);
            out_fn.instructions.push_back(l_neg);
            if (s.neg_branch) lower_stmt(s.neg_branch, out_fn);
            IRInstruction j1;
            j1.op = IROp::JUMP;
            j1.src1 = IROperand::label(end_lbl);
            out_fn.instructions.push_back(j1);

            // Zero branch
            IRInstruction l_zero;
            l_zero.op = IROp::LABEL;
            l_zero.dst = IROperand::label(zero_lbl);
            out_fn.instructions.push_back(l_zero);
            if (s.zero_branch) lower_stmt(s.zero_branch, out_fn);
            IRInstruction j2;
            j2.op = IROp::JUMP;
            j2.src1 = IROperand::label(end_lbl);
            out_fn.instructions.push_back(j2);

            // Positive branch
            IRInstruction l_pos;
            l_pos.op = IROp::LABEL;
            l_pos.dst = IROperand::label(pos_lbl);
            out_fn.instructions.push_back(l_pos);
            if (s.pos_branch) lower_stmt(s.pos_branch, out_fn);

            IRInstruction l_end;
            l_end.op = IROp::LABEL;
            l_end.dst = IROperand::label(end_lbl);
            out_fn.instructions.push_back(l_end);
        } else if constexpr (std::is_same_v<T, ReturnStmt>) {
            IRInstruction inst;
            inst.op = IROp::RETURN;
            if (s.value) {
                inst.src1 = lower_expr(s.value, out_fn);
            }
            inst.line = s.loc.line;
            out_fn.instructions.push_back(inst);
        } else if constexpr (std::is_same_v<T, BreakContinueStmt>) {
            IRInstruction jmp;
            jmp.op = IROp::JUMP;
            if (s.is_break) {
                if (!break_labels_.empty()) {
                    jmp.src1 = IROperand::label(break_labels_.back());
                    out_fn.instructions.push_back(jmp);
                }
            } else {
                if (!continue_labels_.empty()) {
                    jmp.src1 = IROperand::label(continue_labels_.back());
                    out_fn.instructions.push_back(jmp);
                }
            }
        }
    }, stmt->data);
}

IROperand IRBuilder::lower_expr(Expr* expr, IRFunction& out_fn) {
    if (!expr) return IROperand::none();

    return std::visit([&](const auto& e) -> IROperand {
        using T = std::decay_t<decltype(e)>;

        if constexpr (std::is_same_v<T, IntLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CONST_INT;
            inst.dst = dst;
            inst.src1 = IROperand::const_int(e.value);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, FloatLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CONST_FLOAT;
            inst.dst = dst;
            inst.src1 = IROperand::const_float(e.value);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, BoolLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CONST_BOOL;
            inst.dst = dst;
            inst.src1 = IROperand::const_bool(e.value);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, StringLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CONST_STR;
            inst.dst = dst;
            inst.src1 = IROperand::const_str(e.value);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, TryteLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CONST_TRYTE;
            inst.dst = dst;
            inst.src1 = IROperand::const_int(e.value);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, TafpuLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CONST_TAFPU;
            inst.dst = dst;
            inst.src1 = IROperand::const_int(e.value.a);
            inst.src2 = IROperand::const_int(e.value.b);
            inst.args.push_back(IROperand::const_int(e.value.s));
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, IdentifierExpr>) {
            IROperand dst = alloc_vreg();
            auto it = local_slots_.find(e.name);
            if (it != local_slots_.end()) {
                IRInstruction inst;
                inst.op = IROp::LOAD_LOCAL;
                inst.dst = dst;
                inst.src1 = IROperand::local(it->second, e.name);
                inst.line = e.loc.line;
                out_fn.instructions.push_back(inst);
            } else {
                IRInstruction inst;
                inst.op = IROp::LOAD_GLOBAL;
                inst.dst = dst;
                inst.src1 = IROperand::const_str(e.name);
                inst.line = e.loc.line;
                out_fn.instructions.push_back(inst);
            }
            return dst;
        } else if constexpr (std::is_same_v<T, BinaryExpr>) {
            IROperand left = lower_expr(e.left, out_fn);
            IROperand right = lower_expr(e.right, out_fn);
            IROperand dst = alloc_vreg();

            IRInstruction inst;
            inst.dst = dst;
            inst.src1 = left;
            inst.src2 = right;
            inst.line = e.loc.line;

            switch (e.op) {
                case BinaryOp::ADD: inst.op = IROp::ADD; break;
                case BinaryOp::SUB: inst.op = IROp::SUB; break;
                case BinaryOp::MUL: inst.op = IROp::MUL; break;
                case BinaryOp::DIV: inst.op = IROp::DIV; inst.may_trap = true; break;
                case BinaryOp::MOD: inst.op = IROp::MOD; inst.may_trap = true; break;
                case BinaryOp::EQ:  inst.op = IROp::CMP_EQ; break;
                case BinaryOp::NEQ: inst.op = IROp::CMP_NE; break;
                case BinaryOp::LT:  inst.op = IROp::CMP_LT; break;
                case BinaryOp::LE:  inst.op = IROp::CMP_LE; break;
                case BinaryOp::GT:  inst.op = IROp::CMP_GT; break;
                case BinaryOp::GE:  inst.op = IROp::CMP_GE; break;
                case BinaryOp::BIT_AND: inst.op = IROp::BIT_AND; break;
                case BinaryOp::BIT_OR:  inst.op = IROp::BIT_OR; break;
                case BinaryOp::BIT_XOR: inst.op = IROp::BIT_XOR; break;
                case BinaryOp::SHL:     inst.op = IROp::SHL; break;
                case BinaryOp::SHR:     inst.op = IROp::SHR; break;
                case BinaryOp::MATMUL:  inst.op = IROp::TAFPU_MUL; break;
                default: inst.op = IROp::VM_FALLBACK; break;
            }
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, UnaryExpr>) {
            IROperand operand = lower_expr(e.operand, out_fn);
            IROperand dst = alloc_vreg();

            IRInstruction inst;
            inst.dst = dst;
            inst.src1 = operand;
            inst.line = e.loc.line;

            switch (e.op) {
                case UnaryOp::NEG: inst.op = IROp::NEG; break;
                case UnaryOp::NOT: inst.op = IROp::TRIT_NOT; break;
                case UnaryOp::TILDE: inst.op = IROp::BIT_NOT; break;
                default: inst.op = IROp::VM_FALLBACK; break;
            }
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, CallExpr>) {
            auto it_cls = class_fields_.find(e.callee);
            if (it_cls != class_fields_.end()) {
                // Object / Struct instantiation
                IROperand obj = alloc_vreg();
                IRInstruction alloc_inst;
                alloc_inst.op = IROp::ALLOC_OBJ;
                alloc_inst.dst = obj;
                alloc_inst.src1 = IROperand::const_str(e.callee);
                alloc_inst.has_side_effect = true;
                alloc_inst.line = e.loc.line;
                out_fn.instructions.push_back(alloc_inst);

                auto it_arity = class_init_arity_.find(e.callee);
                int init_arity = (it_arity != class_init_arity_.end()) ? it_arity->second : -1;

                if (init_arity >= 0) {
                    std::vector<IROperand> init_args;
                    for (auto* a : e.args) {
                        init_args.push_back(lower_expr(a, out_fn));
                    }
                    IROperand init_res = alloc_vreg();
                    IRInstruction init_inst;
                    init_inst.op = IROp::INVOKE_METHOD;
                    init_inst.dst = init_res;
                    init_inst.src1 = obj;
                    init_inst.src2 = IROperand::const_str("init");
                    init_inst.args = std::move(init_args);
                    init_inst.has_side_effect = true;
                    init_inst.line = e.loc.line;
                    out_fn.instructions.push_back(init_inst);
                } else if (!e.args.empty()) {
                    const auto& names = it_cls->second;
                    size_t n = std::min(names.size(), e.args.size());
                    for (size_t i = 0; i < n; ++i) {
                        IROperand val = lower_expr(e.args[i], out_fn);
                        IRInstruction sf;
                        sf.op = IROp::STORE_FIELD;
                        sf.dst = obj;
                        sf.src1 = IROperand::const_str(names[i]);
                        sf.src2 = val;
                        sf.has_side_effect = true;
                        sf.line = e.loc.line;
                        out_fn.instructions.push_back(sf);
                    }
                }
                return obj;
            }

            std::vector<IROperand> arg_operands;
            for (auto* a : e.args) {
                arg_operands.push_back(lower_expr(a, out_fn));
            }

            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::CALL;
            inst.dst = dst;
            inst.src1 = IROperand::const_str(e.callee);
            inst.args = std::move(arg_operands);
            inst.has_side_effect = true;
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, ArrayLiteralExpr>) {
            IROperand dst = alloc_vreg();
            IRInstruction alloc_inst;
            alloc_inst.op = IROp::ALLOC_ARRAY;
            alloc_inst.dst = dst;
            alloc_inst.src1 = IROperand::const_int(e.elements.size());
            alloc_inst.line = e.loc.line;
            out_fn.instructions.push_back(alloc_inst);

            for (size_t i = 0; i < e.elements.size(); ++i) {
                IROperand elem = lower_expr(e.elements[i], out_fn);
                IRInstruction store_inst;
                store_inst.op = IROp::STORE_ELEM;
                store_inst.dst = dst;
                store_inst.src1 = IROperand::const_int(i);
                store_inst.src2 = elem;
                store_inst.has_side_effect = true;
                out_fn.instructions.push_back(store_inst);
            }
            return dst;
        } else if constexpr (std::is_same_v<T, IndexExpr>) {
            IROperand arr = lower_expr(e.object, out_fn);
            IROperand index = lower_expr(e.index, out_fn);
            IROperand dst = alloc_vreg();

            IRInstruction inst;
            inst.op = IROp::LOAD_ELEM;
            inst.dst = dst;
            inst.src1 = arr;
            inst.src2 = index;
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, MemberAccessExpr>) {
            IROperand obj = lower_expr(e.object, out_fn);
            IROperand dst = alloc_vreg();

            IRInstruction inst;
            inst.op = IROp::LOAD_FIELD;
            inst.dst = dst;
            inst.src1 = obj;
            inst.src2 = IROperand::const_str(e.member);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, TafpuConstructExpr>) {
            IROperand a = lower_expr(e.a, out_fn);
            IROperand b = lower_expr(e.b, out_fn);
            IROperand s = lower_expr(e.s, out_fn);
            IROperand dst = alloc_vreg();

            IRInstruction inst;
            inst.op = IROp::CONST_TAFPU;
            inst.dst = dst;
            inst.src1 = a;
            inst.src2 = b;
            inst.args.push_back(s);
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else if constexpr (std::is_same_v<T, MethodCallExpr>) {
            IROperand obj = lower_expr(e.object, out_fn);
            std::vector<IROperand> arg_ops;
            for (auto* a : e.args) {
                arg_ops.push_back(lower_expr(a, out_fn));
            }
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::INVOKE_METHOD;
            inst.dst = dst;
            inst.src1 = obj;
            inst.src2 = IROperand::const_str(e.method);
            inst.args = std::move(arg_ops);
            inst.has_side_effect = true;
            inst.line = e.loc.line;
            out_fn.instructions.push_back(inst);
            return dst;
        } else {
            // Default fallback
            IROperand dst = alloc_vreg();
            IRInstruction inst;
            inst.op = IROp::VM_FALLBACK;
            inst.dst = dst;
            out_fn.instructions.push_back(inst);
            return dst;
        }
    }, expr->data);
}

} // namespace setun
