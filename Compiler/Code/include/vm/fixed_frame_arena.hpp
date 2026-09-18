#pragma once

#include "tafpu/exception.hpp"
#include <cstddef>
#include <cstdint>
#include <string>

namespace setun {

// CallFrame represents one active activation frame on the Tersun call stack.
struct CallFrame {
    size_t return_ip{0};
    size_t local_base{0};
    // Operand-stack depth at entry (after args were popped). OP_RET truncates
    // back to this before pushing the return value, so a callee's leftover
    // stack values (e.g. from STORE-peek semantics) can never contaminate
    // the caller's expression evaluation.
    size_t stack_depth{0};
    size_t frame_size{32};
    size_t func_entry{0};
};

// VMStackOverflowException is thrown when recursion exceeds the maximum configured call depth.
class VMStackOverflowException : public VMException {
public:
    explicit VMStackOverflowException(const std::string& msg = "Tersun CallStack depth limit (2048) exceeded.")
        : VMException(msg) {}
};

// FixedFrameArena provides an ultra-fast contiguous 64-byte-aligned call frame buffer.
// Hot path: Pointer/index bump with zero dynamic memory allocation.
// Cold path: Bounds check with __builtin_expect triggering VMStackOverflowException.
class alignas(64) FixedFrameArena {
public:
    static constexpr size_t kMaxCallDepth = 2048;

    FixedFrameArena() noexcept : top_(0) {}

    inline bool empty() const noexcept { return top_ == 0; }
    inline size_t size() const noexcept { return top_; }
    inline size_t capacity() const noexcept { return kMaxCallDepth; }

    inline CallFrame& back() noexcept {
        return frames_[top_ - 1];
    }

    inline const CallFrame& back() const noexcept {
        return frames_[top_ - 1];
    }

    inline void push_back(const CallFrame& frame) {
        if (__builtin_expect(top_ >= kMaxCallDepth, 0)) {
            handle_overflow();
        }
        frames_[top_++] = frame;
    }

    inline void pop_back() noexcept {
        if (__builtin_expect(top_ > 0, 1)) {
            --top_;
        }
    }

    inline void clear() noexcept {
        top_ = 0;
    }

    inline void resize(size_t new_size) {
        if (__builtin_expect(new_size > kMaxCallDepth, 0)) {
            handle_overflow();
        }
        top_ = new_size;
    }

    inline CallFrame* data() noexcept {
        return frames_;
    }

    inline const CallFrame* data() const noexcept {
        return frames_;
    }

    inline CallFrame& operator[](size_t idx) noexcept {
        return frames_[idx];
    }

    inline const CallFrame& operator[](size_t idx) const noexcept {
        return frames_[idx];
    }

    inline void unwind_to(size_t target_depth) noexcept {
        if (target_depth < top_) {
            top_ = target_depth;
        }
    }

private:
    [[noreturn]] void handle_overflow() const {
        throw VMStackOverflowException("Tersun CallStack depth limit (" + std::to_string(kMaxCallDepth) + ") exceeded.");
    }

    alignas(64) CallFrame frames_[kMaxCallDepth];
    size_t top_{0};
};

} // namespace setun
