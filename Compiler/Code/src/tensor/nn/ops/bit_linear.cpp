#include "tensor/nn/ops/bit_linear.hpp"
#include "tensor/kernels/microkernels.hpp"
#include "tensor/nn/runtime/parallel_planner.hpp"
#include <random>
#include <cmath>
#include <algorithm>

#if defined(__x86_64__) || defined(_M_X64)
#include <immintrin.h>
#endif

#if defined(_OPENMP)
#include <omp.h>
#endif

namespace setun::tensor::nn {

// ============================================================================
// SIMD Helpers for Absmax Scan, Int8 Quantization, and Dequantization
// ============================================================================

static float vec_absmax_avx2(const float* x, size_t n) noexcept {
#if defined(__AVX2__)
    __m256 sign_mask = _mm256_set1_ps(-0.0f); // 0x80000000 to clear sign bit
    __m256 vmax = _mm256_set1_ps(1e-5f);

    size_t i = 0;
    for (; i + 32 <= n; i += 32) {
        __m256 v0 = _mm256_andnot_ps(sign_mask, _mm256_loadu_ps(x + i + 0));
        __m256 v1 = _mm256_andnot_ps(sign_mask, _mm256_loadu_ps(x + i + 8));
        __m256 v2 = _mm256_andnot_ps(sign_mask, _mm256_loadu_ps(x + i + 16));
        __m256 v3 = _mm256_andnot_ps(sign_mask, _mm256_loadu_ps(x + i + 24));

        v0 = _mm256_max_ps(v0, v1);
        v2 = _mm256_max_ps(v2, v3);
        v0 = _mm256_max_ps(v0, v2);
        vmax = _mm256_max_ps(vmax, v0);
    }
    for (; i + 8 <= n; i += 8) {
        __m256 v = _mm256_andnot_ps(sign_mask, _mm256_loadu_ps(x + i));
        vmax = _mm256_max_ps(vmax, v);
    }

    __m128 lo = _mm256_castps256_ps128(vmax);
    __m128 hi = _mm256_extractf128_ps(vmax, 1);
    __m128 m128 = _mm_max_ps(lo, hi);
    __m128 shuf = _mm_shuffle_ps(m128, m128, _MM_SHUFFLE(1, 0, 3, 2));
    m128 = _mm_max_ps(m128, shuf);
    shuf = _mm_shuffle_ps(m128, m128, _MM_SHUFFLE(2, 3, 0, 1));
    m128 = _mm_max_ps(m128, shuf);
    float max_val = _mm_cvtss_f32(m128);

    for (; i < n; ++i) {
        float abs_v = std::fabs(x[i]);
        if (abs_v > max_val) max_val = abs_v;
    }
    return max_val;
#else
    float max_val = 1e-5f;
    for (size_t i = 0; i < n; ++i) {
        float abs_v = std::fabs(x[i]);
        if (abs_v > max_val) max_val = abs_v;
    }
    return max_val;
#endif
}

static void vec_quantize_int8_avx2(const float* x, int32_t* q_out, size_t n, float quant_scale) noexcept {
#if defined(__AVX2__)
    __m256 vscale = _mm256_set1_ps(quant_scale);
    __m256i vmin = _mm256_set1_epi32(-128);
    __m256i vmax = _mm256_set1_epi32(127);

    size_t i = 0;
    for (; i + 16 <= n; i += 16) {
        __m256 f0 = _mm256_mul_ps(_mm256_loadu_ps(x + i), vscale);
        __m256 f1 = _mm256_mul_ps(_mm256_loadu_ps(x + i + 8), vscale);

        f0 = _mm256_round_ps(f0, _MM_FROUND_TO_NEAREST_INT | _MM_FROUND_NO_EXC);
        f1 = _mm256_round_ps(f1, _MM_FROUND_TO_NEAREST_INT | _MM_FROUND_NO_EXC);

        __m256i i0 = _mm256_cvtps_epi32(f0);
        __m256i i1 = _mm256_cvtps_epi32(f1);

        i0 = _mm256_min_epi32(_mm256_max_epi32(i0, vmin), vmax);
        i1 = _mm256_min_epi32(_mm256_max_epi32(i1, vmin), vmax);

        _mm256_storeu_si256(reinterpret_cast<__m256i*>(q_out + i), i0);
        _mm256_storeu_si256(reinterpret_cast<__m256i*>(q_out + i + 8), i1);
    }
    for (; i + 8 <= n; i += 8) {
        __m256 f = _mm256_mul_ps(_mm256_loadu_ps(x + i), vscale);
        f = _mm256_round_ps(f, _MM_FROUND_TO_NEAREST_INT | _MM_FROUND_NO_EXC);
        __m256i iv = _mm256_cvtps_epi32(f);
        iv = _mm256_min_epi32(_mm256_max_epi32(iv, vmin), vmax);
        _mm256_storeu_si256(reinterpret_cast<__m256i*>(q_out + i), iv);
    }
    for (; i < n; ++i) {
        int32_t v = static_cast<int32_t>(std::round(x[i] * quant_scale));
        q_out[i] = std::clamp(v, -128, 127);
    }
#else
    for (size_t i = 0; i < n; ++i) {
        int32_t v = static_cast<int32_t>(std::round(x[i] * quant_scale));
        q_out[i] = std::clamp(v, -128, 127);
    }
#endif
}

static void vec_dequantize_f32_avx2(
    const int32_t* int_in,
    float* f_out,
    size_t n,
    float dequant_scale,
    const int32_t* bias_ptr,
    float weight_scale
) noexcept {
#if defined(__AVX2__)
    __m256 vdeq = _mm256_set1_ps(dequant_scale);
    __m256 vwscale = _mm256_set1_ps(weight_scale);

    size_t j = 0;
    for (; j + 8 <= n; j += 8) {
        __m256i iv = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(int_in + j));
        __m256 val = _mm256_mul_ps(_mm256_cvtepi32_ps(iv), vdeq);

        if (bias_ptr) {
            __m256i bv = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(bias_ptr + j));
            val = _mm256_fmadd_ps(_mm256_cvtepi32_ps(bv), vwscale, val);
        }

        _mm256_storeu_ps(f_out + j, val);
    }
    for (; j < n; ++j) {
        float val = static_cast<float>(int_in[j]) * dequant_scale;
        if (bias_ptr) {
            val += static_cast<float>(bias_ptr[j]) * weight_scale;
        }
        f_out[j] = val;
    }
#else
    for (size_t j = 0; j < n; ++j) {
        float val = static_cast<float>(int_in[j]) * dequant_scale;
        if (bias_ptr) {
            val += static_cast<float>(bias_ptr[j]) * weight_scale;
        }
        f_out[j] = val;
    }
#endif
}

BitLinear::BitLinear(
    std::string name,
    size_t in_features,
    size_t out_features,
    bool has_bias)
    : name_(std::move(name)),
      in_features_(in_features),
      out_features_(out_features),
      has_bias_(has_bias),
      weight_packed_(TensorShape(out_features, in_features), TensorDType::TERNARY_PACKED_2B),
      bias_(TensorShape(out_features), TensorDType::INT32) {
    update_param_refs();
}

void BitLinear::update_param_refs() {
    param_refs_.clear();
    param_refs_.emplace_back(name_ + ".weight", weight_packed_.view(), ParameterRole::Weight, true);
    if (has_bias_) {
        param_refs_.emplace_back(name_ + ".bias", bias_.view(), ParameterRole::Bias, false);
    }
}

TensorShape BitLinear::output_shape(const TensorShape& in_shape) const {
    if (in_shape.rank() == 1) {
        return TensorShape(out_features_);
    }
    if (in_shape.rank() == 2) {
        return TensorShape(in_shape.dim(0), out_features_);
    }
    if (in_shape.rank() == 3) {
        return TensorShape(in_shape.dim(0), in_shape.dim(1), out_features_);
    }
    std::vector<size_t> dims = in_shape.dims();
    dims.back() = out_features_;
    return TensorShape(dims);
}

Span<const ParameterRef> BitLinear::parameters() const noexcept {
    return Span<const ParameterRef>(param_refs_.data(), param_refs_.size());
}

void BitLinear::init_synthetic(uint32_t seed) {
    std::mt19937 rng(seed);
    size_t packed_bytes = weight_packed_.byte_size();
    uint8_t* w_ptr = static_cast<uint8_t*>(weight_packed_.raw_data());
    for (size_t i = 0; i < packed_bytes; ++i) {
        w_ptr[i] = static_cast<uint8_t>(rng() & 0xFF);
    }

    if (has_bias_) {
        int32_t* b_ptr = static_cast<int32_t*>(bias_.raw_data());
        std::uniform_int_distribution<int32_t> dist(-100, 100);
        for (size_t i = 0; i < out_features_; ++i) {
            b_ptr[i] = dist(rng);
        }
    }

    weight_scale_ = 1.0f / std::sqrt(static_cast<float>(in_features_));
    update_param_refs();
}

Status BitLinear::forward(
    ExecutionContext& ctx,
    const TensorView& input,
    TensorView& output
) noexcept {
    size_t in_k = input.dim(input.rank() - 1);
    if (in_k != in_features_) {
        return Status(StatusCode::DimensionMismatch, "BitLinear: input features do not match layer weight K");
    }

    size_t out_n = output.dim(output.rank() - 1);
    if (out_n != out_features_) {
        return Status(StatusCode::DimensionMismatch, "BitLinear: output dimension does not match layer out_features");
    }

    size_t batch_elements = input.total_elements() / in_features_;
    const uint8_t* packed_w = static_cast<const uint8_t*>(weight_packed_.raw_data());
    const int32_t* bias_ptr = has_bias_ ? static_cast<const int32_t*>(bias_.raw_data()) : nullptr;

    bool use_avx2 = ctx.capabilities().has_avx2;

    // Plan Parallel Execution based on shape & available hardware threads
    WorkEstimate work{batch_elements, out_features_, in_features_};
    int max_threads = 1;
#if defined(_OPENMP)
    max_threads = omp_get_max_threads();
#endif
    ParallelPlan plan = ParallelPlanner::plan_gemm(work, max_threads);
    uint32_t num_threads = plan.num_threads;

    // Handle Float32 input via dynamic per-token absmax quantization
    if (input.dtype() == TensorDType::FLOAT32) {
        const float* f_in = static_cast<const float*>(input.raw_data());
        float* f_out = static_cast<float*>(output.raw_data());

        // Allocate thread-local scratch space for quantized input and integer logits
        size_t thread_scratch_elements = in_features_ + out_features_;
        size_t total_scratch_bytes = num_threads * thread_scratch_elements * sizeof(int32_t);

        void* scratch_mem = nullptr;
        if (ctx.workspace_arena().try_allocate(total_scratch_bytes, 64, &scratch_mem) != ArenaStatus::OK) {
            return Status(StatusCode::WorkspaceExceeded, "BitLinear: failed to allocate workspace for quantization");
        }

        int32_t* scratch_base = static_cast<int32_t*>(scratch_mem);

        // Case A: Prefill Mode (batch_elements > 1) -> Parallelize across rows (tokens)
        if (batch_elements > 1) {
#if defined(_OPENMP)
            #pragma omp parallel for schedule(dynamic, 1) num_threads(num_threads)
#endif
            for (int64_t b_idx = 0; b_idx < static_cast<int64_t>(batch_elements); ++b_idx) {
                size_t b = static_cast<size_t>(b_idx);
                int tid = 0;
#if defined(_OPENMP)
                tid = omp_get_thread_num();
#endif
                int32_t* q_in = scratch_base + tid * thread_scratch_elements;
                int32_t* int_out = q_in + in_features_;

                const float* row_in = f_in + b * in_features_;
                float* row_out = f_out + b * out_features_;

                // 1. Absmax scaling: find max(|X|)
                float max_val = vec_absmax_avx2(row_in, in_features_);
                float quant_scale = 127.0f / max_val;
                float dequant_scale = (max_val / 127.0f) * weight_scale_;

                // 2. Vectorized Quantization
                vec_quantize_int8_avx2(row_in, q_in, in_features_, quant_scale);

                // 3. Multiplication-free Ternary GEMV
                if (use_avx2) {
                    kernels::gemv_packed_avx2(q_in, packed_w, int_out, out_features_, in_features_);
                } else {
                    kernels::gemv_packed_scalar(q_in, packed_w, int_out, out_features_, in_features_);
                }

                // 4. Vectorized Dequantization & Bias Addition
                vec_dequantize_f32_avx2(int_out, row_out, out_features_, dequant_scale, bias_ptr, weight_scale_);
            }
        } else {
            // Case B: Decode Mode (batch_elements == 1) -> Parallelize across columns (neurons)
            int32_t* q_in = scratch_base;
            int32_t* int_out = q_in + in_features_;

            float max_val = vec_absmax_avx2(f_in, in_features_);
            float quant_scale = 127.0f / max_val;
            float dequant_scale = (max_val / 127.0f) * weight_scale_;

            vec_quantize_int8_avx2(f_in, q_in, in_features_, quant_scale);

            size_t bytes_per_row = calc_packed_bytes(in_features_);
#if defined(_OPENMP)
            #pragma omp parallel for schedule(static) num_threads(num_threads)
#endif
            for (int64_t n_idx = 0; n_idx < static_cast<int64_t>(out_features_); ++n_idx) {
                size_t n = static_cast<size_t>(n_idx);
                const uint8_t* row_weights = packed_w + n * bytes_per_row;
                if (use_avx2) {
                    int_out[n] = kernels::dot_product_packed_avx2(q_in, row_weights, in_features_);
                } else {
                    int_out[n] = kernels::dot_product_packed_scalar(q_in, row_weights, in_features_);
                }
            }

            vec_dequantize_f32_avx2(int_out, f_out, out_features_, dequant_scale, bias_ptr, weight_scale_);
        }

        // Clean workspace scratchpad
        ctx.reset_workspace();
        return Status::OK();
    }

    // Direct INT32/INT8 path
    if (input.dtype() == TensorDType::INT32) {
        const int32_t* in_ptr = static_cast<const int32_t*>(input.raw_data());
        int32_t* out_ptr = static_cast<int32_t*>(output.raw_data());

        for (size_t b = 0; b < batch_elements; ++b) {
            const int32_t* row_in = in_ptr + b * in_features_;
            int32_t* row_out = out_ptr + b * out_features_;

            if (bias_ptr) {
                if (use_avx2) {
                    kernels::gemm_packed_bias_avx2(row_in, packed_w, bias_ptr, row_out, 1, out_features_, in_features_);
                } else {
                    kernels::gemm_packed_bias_scalar(row_in, packed_w, bias_ptr, row_out, 1, out_features_, in_features_);
                }
            } else {
                if (use_avx2) {
                    kernels::gemv_packed_avx2(row_in, packed_w, row_out, out_features_, in_features_);
                } else {
                    kernels::gemv_packed_scalar(row_in, packed_w, row_out, out_features_, in_features_);
                }
            }
        }
        return Status::OK();
    }

    return Status(StatusCode::TypeMismatch, "BitLinear: unsupported input tensor dtype");
}

} // namespace setun::tensor::nn
