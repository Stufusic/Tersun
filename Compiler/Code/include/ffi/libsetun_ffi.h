#pragma once

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

// -----------------------------------------------------------------------------
// TAF_Register_C: C-compatible struct for Q(sqrt(3)) algebraic floating-point
// X = (A + B * sqrt(3)) * 3^(S / 2)
// -----------------------------------------------------------------------------
typedef struct {
    int64_t a;
    int64_t b;
    int32_t s;
    int32_t _pad;
} TAF_Register_C;

// Opaque Setun VM handle for C/C++ embedding
typedef struct SetunVM_T* SetunVM_Handle;

// -----------------------------------------------------------------------------
// Native C API for Setun-70 Embeddable Engine
// -----------------------------------------------------------------------------

// VM Lifecycle
SetunVM_Handle setun_create_vm(void);
void setun_destroy_vm(SetunVM_Handle vm);

// Bytecode Execution
int setun_load_bytecode(SetunVM_Handle vm, const uint8_t* bytecode, size_t size);
int setun_run_bytecode(SetunVM_Handle vm, const uint8_t* bytecode, size_t size);
int setun_run_file(SetunVM_Handle vm, const char* filepath);

// Direct TAFPU C Arithmetic & Marshalling
TAF_Register_C setun_encode_double(double val);
double setun_decode_double(TAF_Register_C reg);

TAF_Register_C setun_tafpu_add(TAF_Register_C x1, TAF_Register_C x2);
TAF_Register_C setun_tafpu_sub(TAF_Register_C x1, TAF_Register_C x2);
TAF_Register_C setun_tafpu_mul(TAF_Register_C x1, TAF_Register_C x2);
TAF_Register_C setun_tafpu_div(TAF_Register_C x1, TAF_Register_C x2, int* out_error);

// 3D Distance Squared via C FFI
TAF_Register_C setun_calc_dist3d_sq(
    TAF_Register_C x1, TAF_Register_C y1, TAF_Register_C z1,
    TAF_Register_C x2, TAF_Register_C y2, TAF_Register_C z2
);

#ifdef __cplusplus
}
#endif
