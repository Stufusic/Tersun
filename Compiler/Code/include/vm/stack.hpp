#pragma once

#include "vm/value.hpp"
#include "tafpu/exception.hpp"
#include <vector>
#include <string>

namespace setun {

class VMStack {
public:
    explicit VMStack(size_t capacity = 65536) : stack_(capacity), top_(0) {}

    void push(const VMValue& val) {
        if (__builtin_expect(top_ >= stack_.size(), 0)) {
            stack_.resize(stack_.size() * 2);
        }
        stack_[top_++] = val;
    }

    VMValue pop() {
        if (__builtin_expect(top_ == 0, 0)) {
            throw VMException("VM Stack Underflow: attempt to pop from empty stack.");
        }
        return stack_[--top_];
    }

    VMValue& peek(size_t depth = 0) {
        if (__builtin_expect(depth >= top_, 0)) {
            throw VMException("VM Stack Index Out of Bounds.");
        }
        return stack_[top_ - 1 - depth];
    }

    const VMValue& peek(size_t depth = 0) const {
        if (__builtin_expect(depth >= top_, 0)) {
            throw VMException("VM Stack Index Out of Bounds.");
        }
        return stack_[top_ - 1 - depth];
    }

    size_t size() const { return top_; }
    bool empty() const { return top_ == 0; }
    void clear() { top_ = 0; }

    // Drop values above depth (exception unwinding).
    void truncate(size_t depth) {
        if (depth < top_) {
            top_ = depth;
        }
    }

    VMValue* data() { return stack_.data(); }
    const VMValue* data() const { return stack_.data(); }
    size_t capacity() const { return stack_.size(); }
    void set_top(size_t t) {
        if (t > stack_.size()) stack_.resize(t * 2);
        top_ = t;
    }

    void reserve(size_t c) {
        if (c > stack_.size()) stack_.resize(c);
    }
    void resize(size_t s) {
        set_top(s);
    }
    std::vector<VMValue>& raw_stack() { return stack_; }
    const std::vector<VMValue>& raw_stack() const { return stack_; }

private:
    std::vector<VMValue> stack_;
    size_t top_{0};
};

} // namespace setun
