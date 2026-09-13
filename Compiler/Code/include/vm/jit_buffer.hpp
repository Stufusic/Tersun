#pragma once

#include <cstdint>
#include <cstddef>

namespace setun {

class JITCodeBuffer {
public:
    JITCodeBuffer();
    ~JITCodeBuffer();

    // Movable, non-copyable
    JITCodeBuffer(const JITCodeBuffer&) = delete;
    JITCodeBuffer& operator=(const JITCodeBuffer&) = delete;
    JITCodeBuffer(JITCodeBuffer&& other) noexcept;
    JITCodeBuffer& operator=(JITCodeBuffer&& other) noexcept;

    // Strict W^X Lifecycle:
    // 1. allocate() -> PAGE_READWRITE
    // 2. emit / write()
    // 3. finalize() -> FlushInstructionCache + PAGE_EXECUTE_READ
    bool allocate(size_t size);
    bool write(const uint8_t* data, size_t size);
    bool finalize();
    void release();

    uint8_t* data() const { return buffer_; }
    const void* entry_point() const { return reinterpret_cast<const void*>(buffer_); }
    size_t size() const { return size_; }
    size_t capacity() const { return capacity_; }
    bool is_executable() const { return is_executable_; }
    bool is_valid() const { return buffer_ != nullptr; }

private:
    uint8_t* buffer_{nullptr};
    size_t capacity_{0};
    size_t size_{0};
    bool is_executable_{false};
};

} // namespace setun
