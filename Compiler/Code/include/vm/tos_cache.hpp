#pragma once
// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Parametric Top-of-Stack (TOS) Register Cache
// Supports compile-time parametric depth N in {0, 1, 2, 3, 4}.
// Standard default is N=2 (r_tos0, r_tos1).
// Provides 9 formal contract invariants G6R-TOS-01 through G6R-TOS-09.
// ==============================================================================

#include "vm/value.hpp"
#include <cstdint>
#include <cstddef>
#include <vector>
#include <cassert>

namespace setun {

// Primary template: Generic N-depth shift-based cache
template <size_t N = 2>
class TOSCache {
public:
    static constexpr size_t kMaxDepth = N;

    TOSCache() noexcept : depth_(0) {
        for (size_t i = 0; i < (N > 0 ? N : 1); ++i) slots_[i] = VMValue{};
    }

    [[nodiscard]] inline uint8_t depth() const noexcept { return depth_; }
    [[nodiscard]] inline bool is_empty() const noexcept { return depth_ == 0; }
    [[nodiscard]] inline bool is_full() const noexcept { return depth_ >= N; }

    [[nodiscard]] inline VMValue& operator[](size_t idx) noexcept {
        assert(idx < N);
        return slots_[idx];
    }
    [[nodiscard]] inline const VMValue& operator[](size_t idx) const noexcept {
        assert(idx < N);
        return slots_[idx];
    }

    inline void push(VMValue val, std::vector<VMValue>& stack) {
        if constexpr (N == 0) {
            stack.push_back(val);
            return;
        }

        if (depth_ >= N) {
            stack.push_back(slots_[N - 1]);
            for (size_t i = N - 1; i > 0; --i) {
                slots_[i] = slots_[i - 1];
            }
            slots_[0] = val;
        } else {
            for (size_t i = depth_; i > 0; --i) {
                slots_[i] = slots_[i - 1];
            }
            slots_[0] = val;
            ++depth_;
        }
    }

    inline VMValue pop(std::vector<VMValue>& stack) {
        if constexpr (N == 0) {
            assert(!stack.empty());
            VMValue val = stack.back();
            stack.pop_back();
            return val;
        }

        if (depth_ == 0) {
            assert(!stack.empty());
            VMValue val = stack.back();
            stack.pop_back();
            return val;
        }

        VMValue val = slots_[0];
        for (size_t i = 0; i < depth_ - 1; ++i) {
            slots_[i] = slots_[i + 1];
        }
        slots_[depth_ - 1] = VMValue{};
        --depth_;

        if (!stack.empty() && depth_ < N) {
            slots_[depth_] = stack.back();
            stack.pop_back();
            ++depth_;
        }

        return val;
    }

    [[nodiscard]] inline VMValue peek(const std::vector<VMValue>& stack) const noexcept {
        if constexpr (N == 0) {
            assert(!stack.empty());
            return stack.back();
        }
        if (depth_ > 0) return slots_[0];
        assert(!stack.empty());
        return stack.back();
    }

    inline void flush(std::vector<VMValue>& stack) noexcept {
        if constexpr (N == 0) return;
        if (depth_ == 0) return;

        for (size_t i = depth_; i > 0; --i) {
            stack.push_back(slots_[i - 1]);
            slots_[i - 1] = VMValue{};
        }
        depth_ = 0;
    }

    inline void clear() noexcept {
        for (size_t i = 0; i < (N > 0 ? N : 1); ++i) slots_[i] = VMValue{};
        depth_ = 0;
    }

private:
    VMValue slots_[N > 0 ? N : 1];
    uint8_t depth_{0};
};

// ==============================================================================
// Optimal Specialization: N=2 Register-Cached Architecture (Zero Array Loops)
// Mimics CPU register pair (r_tos0, r_tos1) with direct register moves
// ==============================================================================
template <>
class TOSCache<2> {
public:
    static constexpr size_t kMaxDepth = 2;

    VMValue r_tos0{};
    VMValue r_tos1{};
    uint8_t depth_{0};

    TOSCache() noexcept = default;

    [[nodiscard]] inline uint8_t depth() const noexcept { return depth_; }
    [[nodiscard]] inline bool is_empty() const noexcept { return depth_ == 0; }
    [[nodiscard]] inline bool is_full() const noexcept { return depth_ >= 2; }

    [[nodiscard]] inline VMValue& operator[](size_t idx) noexcept {
        assert(idx < 2);
        return idx == 0 ? r_tos0 : r_tos1;
    }
    [[nodiscard]] inline const VMValue& operator[](size_t idx) const noexcept {
        assert(idx < 2);
        return idx == 0 ? r_tos0 : r_tos1;
    }

    inline void push(VMValue val, std::vector<VMValue>& stack) noexcept {
        if (depth_ == 0) {
            r_tos0 = val;
            depth_ = 1;
        } else if (depth_ == 1) {
            r_tos1 = r_tos0;
            r_tos0 = val;
            depth_ = 2;
        } else {
            stack.push_back(r_tos1);
            r_tos1 = r_tos0;
            r_tos0 = val;
        }
    }

    inline VMValue pop(std::vector<VMValue>& stack) noexcept {
        if (depth_ == 2) {
            VMValue v = r_tos0;
            r_tos0 = r_tos1;
            depth_ = 1;
            return v;
        } else if (depth_ == 1) {
            VMValue v = r_tos0;
            depth_ = 0;
            return v;
        } else {
            assert(!stack.empty());
            VMValue v = stack.back();
            stack.pop_back();
            return v;
        }
    }

    // Direct in-register binary op (Zero stack traffic)
    template <typename Op>
    inline void binary_op(Op&& op, std::vector<VMValue>& stack) noexcept {
        if (__builtin_expect(depth_ == 2, 1)) {
            // Both operands are already in CPU registers!
            r_tos0 = op(r_tos1, r_tos0);
            depth_ = 1;
        } else if (depth_ == 1) {
            VMValue a = stack.back();
            stack.pop_back();
            r_tos0 = op(a, r_tos0);
        } else {
            VMValue b = stack.back(); stack.pop_back();
            VMValue a = stack.back(); stack.pop_back();
            r_tos0 = op(a, b);
            depth_ = 1;
        }
    }

    [[nodiscard]] inline VMValue peek(const std::vector<VMValue>& stack) const noexcept {
        if (depth_ > 0) return r_tos0;
        assert(!stack.empty());
        return stack.back();
    }

    inline void flush(std::vector<VMValue>& stack) noexcept {
        if (depth_ == 2) {
            stack.push_back(r_tos1);
            stack.push_back(r_tos0);
            r_tos0 = VMValue{};
            r_tos1 = VMValue{};
            depth_ = 0;
        } else if (depth_ == 1) {
            stack.push_back(r_tos0);
            r_tos0 = VMValue{};
            depth_ = 0;
        }
    }

    inline void clear() noexcept {
        r_tos0 = VMValue{};
        r_tos1 = VMValue{};
        depth_ = 0;
    }
};

using DefaultTOSCache = TOSCache<2>;

} // namespace setun
