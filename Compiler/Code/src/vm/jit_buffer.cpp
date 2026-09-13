#include "vm/jit_buffer.hpp"
#include <cstring>
#include <algorithm>

#if defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <sys/mman.h>
#include <unistd.h>
#endif

namespace setun {

JITCodeBuffer::JITCodeBuffer() = default;

JITCodeBuffer::~JITCodeBuffer() {
    release();
}

JITCodeBuffer::JITCodeBuffer(JITCodeBuffer&& other) noexcept
    : buffer_(other.buffer_),
      capacity_(other.capacity_),
      size_(other.size_),
      is_executable_(other.is_executable_) {
    other.buffer_ = nullptr;
    other.capacity_ = 0;
    other.size_ = 0;
    other.is_executable_ = false;
}

JITCodeBuffer& JITCodeBuffer::operator=(JITCodeBuffer&& other) noexcept {
    if (this != &other) {
        release();
        buffer_ = other.buffer_;
        capacity_ = other.capacity_;
        size_ = other.size_;
        is_executable_ = other.is_executable_;

        other.buffer_ = nullptr;
        other.capacity_ = 0;
        other.size_ = 0;
        other.is_executable_ = false;
    }
    return *this;
}

bool JITCodeBuffer::allocate(size_t size) {
    release();
    if (size == 0) return false;

    // Page align allocation (at least 4KB)
    size_t page_size = 4096;
#if !defined(_WIN32)
    page_size = sysconf(_SC_PAGESIZE);
#endif
    size_t aligned_size = (size + page_size - 1) & ~(page_size - 1);

#if defined(_WIN32)
    buffer_ = static_cast<uint8_t*>(VirtualAlloc(
        nullptr, aligned_size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE));
#else
    buffer_ = static_cast<uint8_t*>(mmap(
        nullptr, aligned_size, PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0));
    if (buffer_ == MAP_FAILED) buffer_ = nullptr;
#endif

    if (!buffer_) return false;

    capacity_ = aligned_size;
    size_ = 0;
    is_executable_ = false;
    return true;
}

bool JITCodeBuffer::write(const uint8_t* data, size_t size) {
    if (!buffer_ || is_executable_) return false;
    if (size > capacity_) return false;

    std::memcpy(buffer_, data, size);
    size_ = size;
    return true;
}

bool JITCodeBuffer::finalize() {
    if (!buffer_ || is_executable_ || size_ == 0) return false;

#if defined(_WIN32)
    // 1. Flush CPU instruction cache
    if (!FlushInstructionCache(GetCurrentProcess(), buffer_, size_)) {
        return false;
    }
    // 2. Transition page protection to PAGE_EXECUTE_READ (Strict W^X)
    DWORD old_protect = 0;
    if (!VirtualProtect(buffer_, capacity_, PAGE_EXECUTE_READ, &old_protect)) {
        return false;
    }
#else
    // 1. Clear processor instruction cache
    __builtin___clear_cache(reinterpret_cast<char*>(buffer_), reinterpret_cast<char*>(buffer_ + size_));
    // 2. Transition protection to PROT_READ | PROT_EXEC
    if (mprotect(buffer_, capacity_, PROT_READ | PROT_EXEC) != 0) {
        return false;
    }
#endif

    is_executable_ = true;
    return true;
}

void JITCodeBuffer::release() {
    if (buffer_) {
#if defined(_WIN32)
        VirtualFree(buffer_, 0, MEM_RELEASE);
#else
        munmap(buffer_, capacity_);
#endif
        buffer_ = nullptr;
    }
    capacity_ = 0;
    size_ = 0;
    is_executable_ = false;
}

} // namespace setun
