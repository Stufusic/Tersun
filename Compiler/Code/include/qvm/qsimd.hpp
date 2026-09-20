#pragma once

#include "qvm/qreg.hpp"
#include <cstdint>

#if defined(__AVX2__) && defined(__FMA__)
#include <immintrin.h>
#define TERSUN_QVM_HAS_AVX2 1
#else
#define TERSUN_QVM_HAS_AVX2 0
#endif

#ifdef _OPENMP
#include <omp.h>
#define TERSUN_QVM_HAS_OPENMP 1
#else
#define TERSUN_QVM_HAS_OPENMP 0
#endif

namespace tersun {
namespace qvm {
namespace simd {

// Returns true if AVX2/FMA is compiled in and active
inline bool has_avx2() {
    return TERSUN_QVM_HAS_AVX2 != 0;
}

// Returns active thread count
inline int get_thread_count() {
#if TERSUN_QVM_HAS_OPENMP
    return omp_get_max_threads();
#else
    return 1;
#endif
}

#if TERSUN_QVM_HAS_AVX2
// Vectorized complex multiply of two pairs of QComplex values using AVX2:
//   v = [v0_real, v0_imag, v1_real, v1_imag]
//   p = [p0_real, p0_imag, p1_real, p1_imag]
// Output:
//   res = [v0*p0, v1*p1]
inline __m256d cmul_pd(__m256d v, __m256d p) {
    // ar = [v0_real, v0_real, v1_real, v1_real]
    __m256d ar = _mm256_unpacklo_pd(v, v);
    // ai = [v0_imag, v0_imag, v1_imag, v1_imag]
    __m256d ai = _mm256_unpackhi_pd(v, v);
    // p_flip = [p0_imag, p0_real, p1_imag, p1_real]
    __m256d p_flip = _mm256_permute_pd(p, 0x5);

    __m256d prod1 = _mm256_mul_pd(ar, p);
    __m256d prod2 = _mm256_mul_pd(ai, p_flip);
    return _mm256_addsub_pd(prod1, prod2);
}
#endif

} // namespace simd
} // namespace qvm
} // namespace tersun
