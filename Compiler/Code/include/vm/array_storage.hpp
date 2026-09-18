#pragma once

#include "tafpu/tafpu.hpp"
#include <cstdint>
#include <cstddef>
#include <vector>
#include <memory>
#include <string>
#include <algorithm>

namespace setun {

struct VMValue;

// ============================================================================
// Gate 6.0-E: Flat Array Storage Contract (Doc/rv newg6.md Section 6)
// ============================================================================
enum class ArrayRep : uint8_t {
    Generic = 0, // VMValue[] (heterogeneous / boxed / heap references)
    I64     = 1, // int64_t[] (64-bit dense flat signed integer buffer)
    U8      = 2, // uint8_t[] (8-bit dense flat unsigned byte buffer)
    F64     = 3, // double[]  (64-bit IEEE 754 flat float buffer)
    TAFPU   = 4  // TafpuNum[] (field Q(sqrt(3)) exact ternary scalar buffer)
};

class ArrayObject {
public:
    ArrayRep rep{ArrayRep::Generic};
    uint8_t flags{0};

    // Concrete contiguous storage vectors
    std::vector<VMValue>  generic_data;
    std::vector<int64_t>  i64_data;
    std::vector<uint8_t>  u8_data;
    std::vector<double>   f64_data;
    std::vector<TafpuNum> tafpu_data;

    ArrayObject() = default;
    explicit ArrayObject(ArrayRep r) : rep(r) {}
    explicit ArrayObject(size_t initial_capacity, ArrayRep r = ArrayRep::Generic);
    explicit ArrayObject(std::vector<VMValue> data);
    explicit ArrayObject(std::vector<int64_t> data);
    explicit ArrayObject(std::vector<uint8_t> data);
    explicit ArrayObject(std::vector<double> data);
    explicit ArrayObject(std::vector<TafpuNum> data);

    // Dimension & capacity properties
    size_t size() const noexcept;
    size_t capacity() const noexcept;
    bool empty() const noexcept;
    void resize(size_t new_size);
    void reserve(size_t new_cap);
    void clear() noexcept;

    // Representation-aware element access (Zero-Drift invariant)
    VMValue get(size_t index) const;
    void set(size_t index, const VMValue& val);
    VMValue operator[](size_t index) const;

    // Direct fast-path accessors for homogeneous flat arrays (zero boxing overhead)
    inline int64_t  get_i64_fast(size_t index) const noexcept   { return i64_data[index]; }
    inline uint8_t  get_u8_fast(size_t index) const noexcept    { return u8_data[index]; }
    inline double   get_f64_fast(size_t index) const noexcept   { return f64_data[index]; }
    inline const TafpuNum& get_tafpu_fast(size_t index) const noexcept { return tafpu_data[index]; }

    inline void set_i64_fast(size_t index, int64_t val) noexcept   { i64_data[index] = val; }
    inline void set_u8_fast(size_t index, uint8_t val) noexcept    { u8_data[index] = val; }
    inline void set_f64_fast(size_t index, double val) noexcept    { f64_data[index] = val; }
    inline void set_tafpu_fast(size_t index, const TafpuNum& val) noexcept { tafpu_data[index] = val; }

    // Direct pointer to contiguous memory buffer
    void* raw_data() noexcept;
    const void* raw_data() const noexcept;

    // Lifecycle transitions:
    // Promotion: tries to promote a Generic array to a specialized flat buffer if homogeneous
    bool try_promote();

    // Degradation: safely degrades a flat buffer back to Generic on heterogeneous write
    void degrade_to_generic();

    // Container operations
    void push_back(const VMValue& val);
    void pop_back();
    VMValue back() const;
    std::shared_ptr<ArrayObject> slice(int64_t start, int64_t count) const;
    void sort();
    void reverse();
};

std::string_view array_rep_name(ArrayRep rep) noexcept;

} // namespace setun
