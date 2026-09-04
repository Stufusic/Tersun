; ModuleID = 'setun_module'
source_filename = "setun_source.stn"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%struct.TafpuNum = type { i64, i64, i32, i32 }
%struct.TersunArray = type { i8*, i64, i64, i64 }
%struct.TersunString = type { i8*, i64 }
%struct.QuantumPacket = type { i64, %struct.TafpuNum, i64, i1 }

@TAFPU_ZERO = private unnamed_addr constant %struct.TafpuNum { i64 0, i64 0, i32 0, i32 0 }, align 8
@.fmt_i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@.fmt_dbl = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1
@.fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.fmt_bool_t = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.fmt_bool_f = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.fmt_taf3 = private unnamed_addr constant [25 x i8] c"[%lld, %lld, %d] (~%lf)\0A\00", align 1
@.empty_str = private unnamed_addr constant [1 x i8] c"\00", align 1

declare i32 @printf(i8*, ...) nounwind
declare i32 @puts(i8*) nounwind
declare i8* @malloc(i64) nounwind
declare void @free(i8*) nounwind
declare void @abort() noreturn nounwind

declare i32 @setun2d_init(i32, i32, i8*)
declare i32 @setun2d_is_running()
declare void @setun2d_clear(i32)
declare void @setun2d_draw_rect(i32, i32, i32, i32, i32)
declare void @setun2d_draw_circle(i32, i32, i32, i32)
declare void @setun2d_draw_text(i32, i32, i8*, i32)
declare i32 @setun2d_flip()
declare i32 @setun2d_get_key()
declare void @setun2d_close()

declare i32 @setun_nn_create_dense(i32, i32, i32)
declare void @setun_nn_set_weight(i32, i32, i32, i32)
declare void @setun_nn_set_bias(i32, i32, i64)
declare void @setun_nn_set_input(i32, i64)
declare i64 @setun_nn_get_input(i32)
declare void @setun_nn_forward(i32)
declare i64 @setun_nn_get_output(i32, i32)
declare void @setun_nn_copy_output_to_input(i32)
declare i32 @setun_nn_predict(i32)
declare i32 @setun_nn_get_confidence(i32, i32)
declare void @setun_nn_load_mnist_sample(i32)
declare void @setun_nn_free_layer(i32)

define void @tafpu_add_native(%struct.TafpuNum* noalias nocapture sret(%struct.TafpuNum) %res, %struct.TafpuNum* nocapture readonly %x1, %struct.TafpuNum* nocapture readonly %x2) alwaysinline nounwind {
entry:
    %a1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 0
    %a1 = load i64, i64* %a1.ptr, align 8
    %b1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 1
    %b1 = load i64, i64* %b1.ptr, align 8
    %s1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 2
    %s1 = load i32, i32* %s1.ptr, align 4
    %a2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 0
    %a2 = load i64, i64* %a2.ptr, align 8
    %b2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 1
    %b2 = load i64, i64* %b2.ptr, align 8
    %a_res = add i64 %a1, %a2
    %b_res = add i64 %b1, %b2
    %res.a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 0
    store i64 %a_res, i64* %res.a, align 8
    %res.b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 1
    store i64 %b_res, i64* %res.b, align 8
    %res.s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 2
    store i32 %s1, i32* %res.s, align 4
    ret void
}

define void @tafpu_sub_native(%struct.TafpuNum* noalias nocapture sret(%struct.TafpuNum) %res, %struct.TafpuNum* nocapture readonly %x1, %struct.TafpuNum* nocapture readonly %x2) alwaysinline nounwind {
entry:
    %a1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 0
    %a1 = load i64, i64* %a1.ptr, align 8
    %b1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 1
    %b1 = load i64, i64* %b1.ptr, align 8
    %s1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 2
    %s1 = load i32, i32* %s1.ptr, align 4
    %a2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 0
    %a2 = load i64, i64* %a2.ptr, align 8
    %b2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 1
    %b2 = load i64, i64* %b2.ptr, align 8
    %a_res = sub i64 %a1, %a2
    %b_res = sub i64 %b1, %b2
    %res.a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 0
    store i64 %a_res, i64* %res.a, align 8
    %res.b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 1
    store i64 %b_res, i64* %res.b, align 8
    %res.s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 2
    store i32 %s1, i32* %res.s, align 4
    ret void
}

define void @tafpu_mul_native(%struct.TafpuNum* noalias nocapture sret(%struct.TafpuNum) %res, %struct.TafpuNum* nocapture readonly %x1, %struct.TafpuNum* nocapture readonly %x2) alwaysinline nounwind {
entry:
    %a1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 0
    %a1 = load i64, i64* %a1.ptr, align 8
    %b1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 1
    %b1 = load i64, i64* %b1.ptr, align 8
    %s1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 2
    %s1 = load i32, i32* %s1.ptr, align 4
    %a2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 0
    %a2 = load i64, i64* %a2.ptr, align 8
    %b2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 1
    %b2 = load i64, i64* %b2.ptr, align 8
    %s2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 2
    %s2 = load i32, i32* %s2.ptr, align 4
    %a1a2 = mul i64 %a1, %a2
    %b1b2 = mul i64 %b1, %b2
    %b1b2_3 = mul i64 %b1b2, 3
    %a_res = add i64 %a1a2, %b1b2_3
    %a1b2 = mul i64 %a1, %b2
    %b1a2 = mul i64 %b1, %a2
    %b_res = add i64 %a1b2, %b1a2
    %s_res = add i32 %s1, %s2
    %res.a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 0
    store i64 %a_res, i64* %res.a, align 8
    %res.b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 1
    store i64 %b_res, i64* %res.b, align 8
    %res.s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 2
    store i32 %s_res, i32* %res.s, align 4
    ret void
}

define void @tafpu_div_native(%struct.TafpuNum* noalias nocapture sret(%struct.TafpuNum) %res, %struct.TafpuNum* nocapture readonly %x1, %struct.TafpuNum* nocapture readonly %x2) alwaysinline nounwind {
entry:
    %a1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 0
    %a1 = load i64, i64* %a1.ptr, align 8
    %b1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 1
    %b1 = load i64, i64* %b1.ptr, align 8
    %s1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 2
    %s1 = load i32, i32* %s1.ptr, align 4
    %a2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 0
    %a2 = load i64, i64* %a2.ptr, align 8
    %b2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 1
    %b2 = load i64, i64* %b2.ptr, align 8
    %s2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 2
    %s2 = load i32, i32* %s2.ptr, align 4
    %a2_sq = mul i64 %a2, %a2
    %b2_sq = mul i64 %b2, %b2
    %b2_sq_3 = mul i64 %b2_sq, 3
    %denom = sub i64 %a2_sq, %b2_sq_3
    %a1a2 = mul i64 %a1, %a2
    %b1b2 = mul i64 %b1, %b2
    %b1b2_3 = mul i64 %b1b2, 3
    %num_a = sub i64 %a1a2, %b1b2_3
    %b1a2 = mul i64 %b1, %a2
    %a1b2 = mul i64 %a1, %b2
    %num_b = sub i64 %b1a2, %a1b2
    %res_a_val = sdiv i64 %num_a, %denom
    %res_b_val = sdiv i64 %num_b, %denom
    %res_s_val = sub i32 %s1, %s2
    %res.a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 0
    store i64 %res_a_val, i64* %res.a, align 8
    %res.b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 1
    store i64 %res_b_val, i64* %res.b, align 8
    %res.s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 2
    store i32 %res_s_val, i32* %res.s, align 4
    ret void
}

define void @tafpu_tilde_native(%struct.TafpuNum* noalias nocapture sret(%struct.TafpuNum) %res, %struct.TafpuNum* nocapture readonly %x) alwaysinline nounwind {
entry:
    %p_a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x, i32 0, i32 0
    %a = load i64, i64* %p_a, align 8
    %p_b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x, i32 0, i32 1
    %b = load i64, i64* %p_b, align 8
    %p_s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x, i32 0, i32 2
    %s = load i32, i32* %p_s, align 4
    %neg_a = sub i64 0, %a
    %neg_b = sub i64 0, %b
    %res_a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 0
    store i64 %neg_a, i64* %res_a, align 8
    %res_b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 1
    store i64 %neg_b, i64* %res_b, align 8
    %res_s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %res, i32 0, i32 2
    store i32 %s, i32* %res_s, align 4
    ret void
}

define i32 @tafpu_cmp_native(%struct.TafpuNum* nocapture readonly %x1, %struct.TafpuNum* nocapture readonly %x2) alwaysinline nounwind {
entry:
    %a1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 0
    %a1 = load i64, i64* %a1.ptr, align 8
    %b1.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x1, i32 0, i32 1
    %b1 = load i64, i64* %b1.ptr, align 8
    %a2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 0
    %a2 = load i64, i64* %a2.ptr, align 8
    %b2.ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %x2, i32 0, i32 1
    %b2 = load i64, i64* %b2.ptr, align 8
    %diff_a = sub i64 %a1, %a2
    %diff_b = sub i64 %b1, %b2
    %da_flt = sitofp i64 %diff_a to double
    %db_flt = sitofp i64 %diff_b to double
    %db_rt3 = fmul double %db_flt, 0x3FFBB67AE8584CAA
    %val = fadd double %da_flt, %db_rt3
    %is_gt = fcmp ogt double %val, 0.00001
    %is_lt = fcmp olt double %val, -0.00001
    %res_gt = select i1 %is_gt, i32 1, i32 0
    %res = select i1 %is_lt, i32 -1, i32 %res_gt
    ret i32 %res
}

define %struct.TersunArray* @tersun_array_create(i64 %cap, i64 %elem_size) {
entry:
    %arr_raw = call i8* @malloc(i64 32)
    %arr = bitcast i8* %arr_raw to %struct.TersunArray*
    %buf_size = mul i64 %cap, %elem_size
    %buf = call i8* @malloc(i64 %buf_size)
    %p_data = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 0
    store i8* %buf, i8** %p_data, align 8
    %p_len = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 1
    store i64 0, i64* %p_len, align 8
    %p_cap = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 2
    store i64 %cap, i64* %p_cap, align 8
    %p_esize = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 3
    store i64 %elem_size, i64* %p_esize, align 8
    ret %struct.TersunArray* %arr
}

define void @tersun_array_push_i64(%struct.TersunArray* %arr, i64 %val) {
entry:
    %p_len = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 1
    %len = load i64, i64* %p_len, align 8
    %p_data = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 0
    %data = load i8*, i8** %p_data, align 8
    %data_i64 = bitcast i8* %data to i64*
    %slot = getelementptr inbounds i64, i64* %data_i64, i64 %len
    store i64 %val, i64* %slot, align 8
    %new_len = add i64 %len, 1
    store i64 %new_len, i64* %p_len, align 8
    ret void
}

define i64 @tersun_array_get_i64(%struct.TersunArray* %arr, i64 %idx) {
entry:
    %p_data = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 0
    %data = load i8*, i8** %p_data, align 8
    %data_i64 = bitcast i8* %data to i64*
    %slot = getelementptr inbounds i64, i64* %data_i64, i64 %idx
    %val = load i64, i64* %slot, align 8
    ret i64 %val
}

define void @tersun_array_set_i64(%struct.TersunArray* %arr, i64 %idx, i64 %val) {
entry:
    %p_data = getelementptr inbounds %struct.TersunArray, %struct.TersunArray* %arr, i32 0, i32 0
    %data = load i8*, i8** %p_data, align 8
    %data_i64 = bitcast i8* %data to i64*
    %slot = getelementptr inbounds i64, i64* %data_i64, i64 %idx
    store i64 %val, i64* %slot, align 8
    ret void
}

define void @tersun_print_i64(i64 %v) {
entry:
    %fmt = getelementptr inbounds [6 x i8], [6 x i8]* @.fmt_i64, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %fmt, i64 %v)
    ret void
}

define void @tersun_print_double(double %v) {
entry:
    %fmt = getelementptr inbounds [5 x i8], [5 x i8]* @.fmt_dbl, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %fmt, double %v)
    ret void
}

define void @tersun_print_str(i8* %s) {
entry:
    %fmt = getelementptr inbounds [4 x i8], [4 x i8]* @.fmt_str, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %fmt, i8* %s)
    ret void
}

define void @tersun_print_bool(i1 %b) {
entry:
    %s_t = getelementptr inbounds [6 x i8], [6 x i8]* @.fmt_bool_t, i32 0, i32 0
    %s_f = getelementptr inbounds [7 x i8], [7 x i8]* @.fmt_bool_f, i32 0, i32 0
    %s = select i1 %b, i8* %s_t, i8* %s_f
    call i32 (i8*, ...) @printf(i8* %s)
    ret void
}

define void @tersun_print_taf3(%struct.TafpuNum* %num) {
entry:
    %p_a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %num, i32 0, i32 0
    %a = load i64, i64* %p_a, align 8
    %p_b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %num, i32 0, i32 1
    %b = load i64, i64* %p_b, align 8
    %p_s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %num, i32 0, i32 2
    %s = load i32, i32* %p_s, align 4
    %fmt = getelementptr inbounds [25 x i8], [25 x i8]* @.fmt_taf3, i32 0, i32 0
    %da = sitofp i64 %a to double
    %db = sitofp i64 %b to double
    %db_rt3 = fmul double %db, 0x3FFBB67AE8584CAA
    %approx = fadd double %da, %db_rt3
    call i32 (i8*, ...) @printf(i8* %fmt, i64 %a, i64 %b, i32 %s, double %approx)
    ret void
}

@.str_1 = private unnamed_addr constant [66 x i8] c"=================================================================\00", align 1
@.str_2 = private unnamed_addr constant [66 x i8] c"  Tersun 1.0.2: Quantum-Ternary Checksum & State Engine Running  \00", align 1
@.str_3 = private unnamed_addr constant [66 x i8] c"=================================================================\00", align 1
@.str_4 = private unnamed_addr constant [40 x i8] c"Algebraic Phase Projection (-1, 0, +1):\00", align 1
@.str_5 = private unnamed_addr constant [45 x i8] c"Reversible Quantum Checksum (10 iterations):\00", align 1
@.str_6 = private unnamed_addr constant [53 x i8] c"Status: Quantum-Ternary State Engine Fully Verified!\00", align 1

define i64 @compute_quantum_checksum(i64 %param_seed, i64 %param_steps) {
entry:
    %seed.ptr = alloca i64, align 8
    store i64 %param_seed, i64* %seed.ptr, align 8
    %steps.ptr = alloca i64, align 8
    store i64 %param_steps, i64* %steps.ptr, align 8
    %t1 = load i64, i64* %seed.ptr, align 8
    %acc.ptr = alloca i64, align 8
    store i64 %t1, i64* %acc.ptr, align 8
    %i.ptr = alloca i64, align 8
    store i64 0, i64* %i.ptr, align 8
    br label %while_cond_1
while_cond_1:
    %t2 = load i64, i64* %i.ptr, align 8
    %t3 = load i64, i64* %steps.ptr, align 8
    %t4 = icmp slt i64 %t2, %t3
    br i1 %t4, label %while_body_2, label %while_exit_3
while_body_2:
    %t5 = load i64, i64* %i.ptr, align 8
    %bit0.ptr = alloca i64, align 8
    store i64 %t5, i64* %bit0.ptr, align 8
    %t6 = load i64, i64* %acc.ptr, align 8
    %bit1.ptr = alloca i64, align 8
    store i64 %t6, i64* %bit1.ptr, align 8
    %t7 = load i64, i64* %acc.ptr, align 8
    %t8 = load i64, i64* %bit0.ptr, align 8
    %t9 = add i64 %t7, %t8
    store i64 %t9, i64* %acc.ptr, align 8
    %t10 = load i64, i64* %i.ptr, align 8
    %t11 = add i64 %t10, 1
    store i64 %t11, i64* %i.ptr, align 8
    br label %while_cond_1
while_exit_3:
    %t12 = load i64, i64* %acc.ptr, align 8
    ret i64 %t12
    ret i64 0
}

define i64 @evaluate_phase(%struct.TafpuNum %param_u1, %struct.TafpuNum %param_u2) {
entry:
    %u1.ptr = alloca %struct.TafpuNum, align 8
    store %struct.TafpuNum %param_u1, %struct.TafpuNum* %u1.ptr, align 8
    %u2.ptr = alloca %struct.TafpuNum, align 8
    store %struct.TafpuNum %param_u2, %struct.TafpuNum* %u2.ptr, align 8
    %t13 = alloca %struct.TafpuNum, align 8
    call void @tafpu_mul_native(%struct.TafpuNum* %t13, %struct.TafpuNum* %u1.ptr, %struct.TafpuNum* %u2.ptr)
    %product.ptr = alloca %struct.TafpuNum, align 8
    %t14.a_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t13, i32 0, i32 0
    %t14.a = load i64, i64* %t14.a_ptr, align 8
    %t14.b_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t13, i32 0, i32 1
    %t14.b = load i64, i64* %t14.b_ptr, align 8
    %t14.s_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t13, i32 0, i32 2
    %t14.s = load i32, i32* %t14.s_ptr, align 4
    %t14.dst_a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %product.ptr, i32 0, i32 0
    store i64 %t14.a, i64* %t14.dst_a, align 8
    %t14.dst_b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %product.ptr, i32 0, i32 1
    store i64 %t14.b, i64* %t14.dst_b, align 8
    %t14.dst_s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %product.ptr, i32 0, i32 2
    store i32 %t14.s, i32* %t14.dst_s, align 4
    %t15 = call i32 @tafpu_cmp_native(%struct.TafpuNum* %product.ptr, %struct.TafpuNum* @TAFPU_ZERO)
    switch i32 %t15, label %br3_zero_5 [
        i32 -1, label %br3_neg_4
        i32 1, label %br3_pos_6
    ]
br3_neg_4:
    %t16 = sub i64 0, 1
    ret i64 %t16
    br label %br3_merge_7
br3_zero_5:
    ret i64 0
    br label %br3_merge_7
br3_pos_6:
    ret i64 1
    br label %br3_merge_7
br3_merge_7:
    ret i64 0
}

define i64 @stn_main() {
entry:
    call void @tersun_print_str(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str_1, i32 0, i32 0))
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    call void @tersun_print_str(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str_2, i32 0, i32 0))
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    call void @tersun_print_str(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str_3, i32 0, i32 0))
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    %t17 = alloca %struct.TafpuNum, align 8
    %t18.a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t17, i32 0, i32 0
    store i64 2, i64* %t18.a, align 8
    %t18.b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t17, i32 0, i32 1
    store i64 1, i64* %t18.b, align 8
    %t18.s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t17, i32 0, i32 2
    %s_i32 = trunc i64 0 to i32
    store i32 %s_i32, i32* %t18.s, align 4
    %u1.ptr = alloca %struct.TafpuNum, align 8
    %t19.a_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t17, i32 0, i32 0
    %t19.a = load i64, i64* %t19.a_ptr, align 8
    %t19.b_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t17, i32 0, i32 1
    %t19.b = load i64, i64* %t19.b_ptr, align 8
    %t19.s_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t17, i32 0, i32 2
    %t19.s = load i32, i32* %t19.s_ptr, align 4
    %t19.dst_a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %u1.ptr, i32 0, i32 0
    store i64 %t19.a, i64* %t19.dst_a, align 8
    %t19.dst_b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %u1.ptr, i32 0, i32 1
    store i64 %t19.b, i64* %t19.dst_b, align 8
    %t19.dst_s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %u1.ptr, i32 0, i32 2
    store i32 %t19.s, i32* %t19.dst_s, align 4
    %t20 = alloca %struct.TafpuNum, align 8
    %t21 = sub i64 0, 1
    %t22.a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t20, i32 0, i32 0
    store i64 2, i64* %t22.a, align 8
    %t22.b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t20, i32 0, i32 1
    store i64 %t21, i64* %t22.b, align 8
    %t22.s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t20, i32 0, i32 2
    %s_i32 = trunc i64 0 to i32
    store i32 %s_i32, i32* %t22.s, align 4
    %u2.ptr = alloca %struct.TafpuNum, align 8
    %t23.a_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t20, i32 0, i32 0
    %t23.a = load i64, i64* %t23.a_ptr, align 8
    %t23.b_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t20, i32 0, i32 1
    %t23.b = load i64, i64* %t23.b_ptr, align 8
    %t23.s_ptr = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %t20, i32 0, i32 2
    %t23.s = load i32, i32* %t23.s_ptr, align 4
    %t23.dst_a = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %u2.ptr, i32 0, i32 0
    store i64 %t23.a, i64* %t23.dst_a, align 8
    %t23.dst_b = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %u2.ptr, i32 0, i32 1
    store i64 %t23.b, i64* %t23.dst_b, align 8
    %t23.dst_s = getelementptr inbounds %struct.TafpuNum, %struct.TafpuNum* %u2.ptr, i32 0, i32 2
    store i32 %t23.s, i32* %t23.dst_s, align 4
    %t24 = call i64 @evaluate_phase(%struct.TafpuNum* %u1.ptr, %struct.TafpuNum* %u2.ptr)
    %phase_code.ptr = alloca i64, align 8
    store i64 %t24, i64* %phase_code.ptr, align 8
    call void @tersun_print_str(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str_4, i32 0, i32 0))
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    %t25 = load i64, i64* %phase_code.ptr, align 8
    call void @tersun_print_i64(i64 %t25)
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    %t26 = alloca %struct.TafpuNum, align 8
    call void @tafpu_mul_native(%struct.TafpuNum* %t26, %struct.TafpuNum* %u1.ptr, %struct.TafpuNum* %u2.ptr)
    %t27 = call i64 @QuantumPacket(i64 101, %struct.TafpuNum* %t26, i64 1, i1 1)
    %packet.ptr = alloca %struct.QuantumPacket*, align 8
    store %struct.QuantumPacket* %t27, %struct.QuantumPacket** %packet.ptr, align 8
    %t28 = load %struct.QuantumPacket*, %struct.QuantumPacket** %packet.ptr, align 8
    %t29 = getelementptr inbounds %struct.QuantumPacket, %struct.QuantumPacket* %t28, i32 0, i32 2
    %t30 = load i64, i64* %t29, align 8
    %t31 = call i64 @compute_quantum_checksum(i64 %t30, i64 10)
    %checksum.ptr = alloca i64, align 8
    store i64 %t31, i64* %checksum.ptr, align 8
    call void @tersun_print_str(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str_5, i32 0, i32 0))
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    %t32 = load i64, i64* %checksum.ptr, align 8
    call void @tersun_print_i64(i64 %t32)
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    %t33 = load i64, i64* %phase_code.ptr, align 8
    %t34 = icmp sgt i64 %t33, 0
    br i1 %t34, label %if_then_8, label %if_else_9
if_then_8:
    call void @tersun_print_str(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str_6, i32 0, i32 0))
    call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0))
    ret i64 42
    br label %if_merge_10
if_else_9:
    ret i64 0
    br label %if_merge_10
if_merge_10:
    ret i64 0
}

define i32 @main(i32 %argc, i8** %argv) {
entry:
    %m_ret = call i64 @stn_main()
    %ret_code = trunc i64 %m_ret to i32
    ret i32 %ret_code
}
