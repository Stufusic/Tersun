#pragma once

#include "vm/value.hpp"
#include "tafpu/exception.hpp"
#include <vector>
#include <string>

namespace setun {

class VMStack {
public:
    explicit VMStack(size_t capacity = 4096) {
        stack_.reserve(capacity);
    }

    void push(const VMValue& val) {
        stack_.push_back(val);
    }

    VMValue pop() {
        if (stack_.empty()) {
            throw VMException("VM Stack Underflow: attempt to pop from empty stack.");
        }
        VMValue val = stack_.back();
        stack_.pop_back();
        return val;
    }

    VMValue& peek(size_t depth = 0) {
        if (depth >= stack_.size()) {
            throw VMException("VM Stack Index Out of Bounds.");
        }
        return stack_[stack_.size() - 1 - depth];
    }

    const VMValue& peek(size_t depth = 0) const {
        if (depth >= stack_.size()) {
            throw VMException("VM Stack Index Out of Bounds.");
        }
        return stack_[stack_.size() - 1 - depth];
    }

    size_t size() const { return stack_.size(); }
    bool empty() const { return stack_.empty(); }
    void clear() { stack_.clear(); }

    const std::vector<VMValue>& raw_stack() const { return stack_; }

private:
    std::vector<VMValue> stack_;
};

} // namespace setun
