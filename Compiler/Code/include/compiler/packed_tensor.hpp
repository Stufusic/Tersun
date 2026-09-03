#pragma once

#include "compiler/native_runtime.hpp"
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <stdexcept>
#include <memory>
#include <cassert>

namespace setun {
namespace memory {

// ============================================================================
// 1. Aligned Memory Buffer (Strict 32/64-byte Alignment for SIMD Streaming)
// ============================================================================

class AlignedBuffer {
public:
    AlignedBuffer(size_t bytes = 0, size_t alignment = 32)
        : size_(bytes), alignment_(alignment) {
        if (size_ > 0) {
            allocate();
        }
    }

    ~AlignedBuffer() {
        free_storage();
    }

    AlignedBuffer(const AlignedBuffer& other)
        : size_(other.size_), alignment_(other.alignment_) {
        if (size_ > 0) {
            allocate();
            std::memcpy(data_, other.data_, size_);
        }
    }

    AlignedBuffer& operator=(const AlignedBuffer& other) {
        if (this != &other) {
            free_storage();
            size_ = other.size_;
            alignment_ = other.alignment_;
            if (size_ > 0) {
                allocate();
                std::memcpy(data_, other.data_, size_);
            }
        }
        return *this;
    }

    AlignedBuffer(AlignedBuffer&& other) noexcept
        : data_(other.data_), size_(other.size_), alignment_(other.alignment_) {
        other.data_ = nullptr;
        other.size_ = 0;
    }

    AlignedBuffer& operator=(AlignedBuffer&& other) noexcept {
        if (this != &other) {
            free_storage();
            data_ = other.data_;
            size_ = other.size_;
            alignment_ = other.alignment_;
            other.data_ = nullptr;
            other.size_ = 0;
        }
        return *this;
    }

    void resize(size_t new_size, uint8_t init_val = 0) {
        if (new_size == size_) return;
        uint8_t* new_data = nullptr;
        if (new_size > 0) {
#if defined(_MSC_VER)
            new_data = static_cast<uint8_t*>(_aligned_malloc(new_size, alignment_));
#elif defined(__MINGW32__) || defined(__MINGW64__)
            new_data = static_cast<uint8_t*>(__builtin_assume_aligned(_aligned_malloc(new_size, alignment_), 32));
#else
            if (posix_memalign(reinterpret_cast<void**>(&new_data), alignment_, new_size) != 0) {
                new_data = static_cast<uint8_t*>(std::malloc(new_size));
            }
#endif
            if (!new_data) throw std::bad_alloc();
            size_t copy_bytes = (size_ < new_size) ? size_ : new_size;
            if (data_ && copy_bytes > 0) {
                std::memcpy(new_data, data_, copy_bytes);
            }
            if (new_size > size_) {
                std::memset(new_data + size_, init_val, new_size - size_);
            }
        }
        free_storage();
        data_ = new_data;
        size_ = new_size;
    }

    uint8_t* data() { return data_; }
    const uint8_t* data() const { return data_; }
    size_t size() const { return size_; }

private:
    void allocate() {
#if defined(_MSC_VER) || defined(__MINGW32__) || defined(__MINGW64__)
        data_ = static_cast<uint8_t*>(_aligned_malloc(size_, alignment_));
#else
        if (posix_memalign(reinterpret_cast<void**>(&data_), alignment_, size_) != 0) {
            data_ = static_cast<uint8_t*>(std::malloc(size_));
        }
#endif
        if (!data_) throw std::bad_alloc();
        std::memset(data_, 0, size_);
    }

    void free_storage() {
        if (data_) {
#if defined(_MSC_VER) || defined(__MINGW32__) || defined(__MINGW64__)
            _aligned_free(data_);
#else
            std::free(data_);
#endif
            data_ = nullptr;
        }
    }

    uint8_t* data_{nullptr};
    size_t size_{0};
    size_t alignment_{32};
};

// ============================================================================
// 2. Hierarchical Compression Structures
// ============================================================================

// Level 1: 1 Byte packs 4 ternary weights in {-1, 0, 1}
// 2 bits per weight: 00 -> 0, 01 -> +1, 11 -> -1 (2's complement)
struct BitNetTryte8 {
    uint8_t packed{0};

    constexpr BitNetTryte8() = default;
    constexpr BitNetTryte8(int8_t w0, int8_t w1, int8_t w2, int8_t w3) {
        packed = encode_trit(w0) | (encode_trit(w1) << 2) | (encode_trit(w2) << 4) | (encode_trit(w3) << 6);
    }

    static constexpr uint8_t encode_trit(int8_t w) {
        if (w == 1) return 0b01;
        if (w == -1) return 0b11;
        return 0b00;
    }

    static constexpr int8_t decode_trit(uint8_t raw, int shift) {
        uint8_t bits = (raw >> shift) & 0b11;
        if (bits == 0b01) return 1;
        if (bits == 0b11) return -1;
        return 0;
    }

    int8_t get(int index) const {
        return decode_trit(packed, index * 2);
    }
};

// Level 2: 4 Bytes packed TAFPU (10 bits A, 10 bits B, 4 bits S, 8 bits scale)
// Used for input tensors and normalized data in [-364, 364]
struct alignas(4) PackedTafpu16 {
    int32_t a_10 : 10;
    int32_t b_10 : 10;
    int32_t s_4  : 4;
    int32_t _pad : 8;

    PackedTafpu16() : a_10(0), b_10(0), s_4(0), _pad(0) {}
    PackedTafpu16(int64_t a, int64_t b, int32_t s) {
        pack(a, b, s);
    }

    void pack(int64_t a, int64_t b, int32_t s) {
        if (a > 511) a = 511; if (a < -512) a = -512;
        if (b > 511) b = 511; if (b < -512) b = -512;
        if (s > 7) s = 7; if (s < -8) s = -8;
        a_10 = static_cast<int32_t>(a);
        b_10 = static_cast<int32_t>(b);
        s_4  = static_cast<int32_t>(s);
        _pad = 0;
    }

    runtime::TafpuNum_C unpack() const {
        return runtime::TafpuNum_C(a_10, b_10, s_4);
    }
};

// Level 3: 8 Bytes packed TAFPU (24 bits A, 24 bits B, 16 bits S)
// Preserves exact 0% error for medium-range computations in [-8.38M, 8.38M]
struct alignas(8) PackedTafpu32 {
    int64_t a_24 : 24;
    int64_t b_24 : 24;
    int64_t s_16 : 16;

    PackedTafpu32() : a_24(0), b_24(0), s_16(0) {}
    PackedTafpu32(int64_t a, int64_t b, int32_t s) {
        pack(a, b, s);
    }

    void pack(int64_t a, int64_t b, int32_t s) {
        a_24 = a;
        b_24 = b;
        s_16 = s;
    }

    runtime::TafpuNum_C unpack() const {
        return runtime::TafpuNum_C(a_24, b_24, static_cast<int32_t>(s_16));
    }
};

// ============================================================================
// 3. PackedTensor with SIMD Streaming Unpack/Pack
// ============================================================================

enum class TensorPrecision {
    TRYTE_BITNET_8,  // Level 1: 1B (4 weights)
    PACKED_TAFPU_16, // Level 2: 4B
    PACKED_TAFPU_32, // Level 3: 8B
    FULL_TAFPU_64    // Level 4: 32B (Registers/Accumulator)
};

class PackedTensor {
public:
    PackedTensor(size_t rows, size_t cols, TensorPrecision prec = TensorPrecision::PACKED_TAFPU_16)
        : rows_(rows), cols_(cols), precision_(prec), buffer_(0, 32) {
        allocate_storage();
    }

    size_t rows() const { return rows_; }
    size_t cols() const { return cols_; }
    size_t size() const { return rows_ * cols_; }
    size_t byte_size() const { return buffer_.size(); }
    TensorPrecision precision() const { return precision_; }

    void set(size_t r, size_t c, const runtime::TafpuNum_C& val) {
        size_t idx = r * cols_ + c;
        if (precision_ == TensorPrecision::PACKED_TAFPU_16) {
            auto* ptr = reinterpret_cast<PackedTafpu16*>(buffer_.data());
            ptr[idx].pack(val.a, val.b, val.s);
        } else if (precision_ == TensorPrecision::PACKED_TAFPU_32) {
            auto* ptr = reinterpret_cast<PackedTafpu32*>(buffer_.data());
            ptr[idx].pack(val.a, val.b, val.s);
        }
    }

    runtime::TafpuNum_C get(size_t r, size_t c) const {
        size_t idx = r * cols_ + c;
        if (precision_ == TensorPrecision::PACKED_TAFPU_16) {
            const auto* ptr = reinterpret_cast<const PackedTafpu16*>(buffer_.data());
            return ptr[idx].unpack();
        } else if (precision_ == TensorPrecision::PACKED_TAFPU_32) {
            const auto* ptr = reinterpret_cast<const PackedTafpu32*>(buffer_.data());
            return ptr[idx].unpack();
        }
        return runtime::TafpuNum_C(0, 0, 0);
    }

    // Streaming Unpack 4 elements into Full Register SIMD
    void stream_unpack_4x(size_t offset, runtime::TafpuNum_C* out_4) const {
        if (precision_ == TensorPrecision::PACKED_TAFPU_16) {
            const auto* ptr = reinterpret_cast<const PackedTafpu16*>(buffer_.data() + offset * sizeof(PackedTafpu16));
            out_4[0] = ptr[0].unpack();
            out_4[1] = ptr[1].unpack();
            out_4[2] = ptr[2].unpack();
            out_4[3] = ptr[3].unpack();
        } else if (precision_ == TensorPrecision::PACKED_TAFPU_32) {
            const auto* ptr = reinterpret_cast<const PackedTafpu32*>(buffer_.data() + offset * sizeof(PackedTafpu32));
            out_4[0] = ptr[0].unpack();
            out_4[1] = ptr[1].unpack();
            out_4[2] = ptr[2].unpack();
            out_4[3] = ptr[3].unpack();
        }
    }

    // Streaming Pack 4 elements from Full Register SIMD into Storage Buffer
    void stream_pack_4x(size_t offset, const runtime::TafpuNum_C* in_4) {
        if (precision_ == TensorPrecision::PACKED_TAFPU_16) {
            auto* ptr = reinterpret_cast<PackedTafpu16*>(buffer_.data() + offset * sizeof(PackedTafpu16));
            ptr[0].pack(in_4[0].a, in_4[0].b, in_4[0].s);
            ptr[1].pack(in_4[1].a, in_4[1].b, in_4[1].s);
            ptr[2].pack(in_4[2].a, in_4[2].b, in_4[2].s);
            ptr[3].pack(in_4[3].a, in_4[3].b, in_4[3].s);
        } else if (precision_ == TensorPrecision::PACKED_TAFPU_32) {
            auto* ptr = reinterpret_cast<PackedTafpu32*>(buffer_.data() + offset * sizeof(PackedTafpu32));
            ptr[0].pack(in_4[0].a, in_4[0].b, in_4[0].s);
            ptr[1].pack(in_4[1].a, in_4[1].b, in_4[1].s);
            ptr[2].pack(in_4[2].a, in_4[2].b, in_4[2].s);
            ptr[3].pack(in_4[3].a, in_4[3].b, in_4[3].s);
        }
    }

    const uint8_t* data() const { return buffer_.data(); }
    uint8_t* data() { return buffer_.data(); }

private:
    void allocate_storage() {
        size_t total_elements = rows_ * cols_;
        size_t bytes = 0;
        if (precision_ == TensorPrecision::TRYTE_BITNET_8) {
            bytes = (total_elements + 3) / 4;
        } else if (precision_ == TensorPrecision::PACKED_TAFPU_16) {
            bytes = total_elements * sizeof(PackedTafpu16);
        } else if (precision_ == TensorPrecision::PACKED_TAFPU_32) {
            bytes = total_elements * sizeof(PackedTafpu32);
        } else {
            bytes = total_elements * sizeof(runtime::TafpuNum_C);
        }
        buffer_.resize(bytes, 0);
    }

    size_t rows_{0};
    size_t cols_{0};
    TensorPrecision precision_{TensorPrecision::PACKED_TAFPU_16};
    AlignedBuffer buffer_;
};

} // namespace memory
} // namespace setun
