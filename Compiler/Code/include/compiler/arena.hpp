#pragma once

#include <cstddef>
#include <cstdint>
#include <vector>
#include <memory>
#include <utility>
#include <new>

namespace setun {

class ArenaAllocator {
public:
    static constexpr size_t DEFAULT_BLOCK_SIZE = 64 * 1024; // 64 KB per block

    explicit ArenaAllocator(size_t block_size = DEFAULT_BLOCK_SIZE)
        : block_size_(block_size), current_offset_(0) {
        allocate_new_block();
    }

    ~ArenaAllocator() {
        run_destructors();
    }

    // Non-copyable
    ArenaAllocator(const ArenaAllocator&) = delete;
    ArenaAllocator& operator=(const ArenaAllocator&) = delete;

    // Moveable
    ArenaAllocator(ArenaAllocator&& other) noexcept
        : block_size_(other.block_size_), current_offset_(other.current_offset_),
          blocks_(std::move(other.blocks_)), cleanup_head_(other.cleanup_head_) {
        other.cleanup_head_ = nullptr;
    }
    ArenaAllocator& operator=(ArenaAllocator&& other) noexcept {
        if (this != &other) {
            run_destructors();
            block_size_ = other.block_size_;
            current_offset_ = other.current_offset_;
            blocks_ = std::move(other.blocks_);
            cleanup_head_ = other.cleanup_head_;
            other.cleanup_head_ = nullptr;
        }
        return *this;
    }

    // Allocate raw aligned memory
    void* allocate(size_t size, size_t alignment = alignof(std::max_align_t)) {
        // Calculate padding for alignment
        size_t current_addr = reinterpret_cast<size_t>(blocks_.back().get() + current_offset_);
        size_t padding = (alignment - (current_addr % alignment)) % alignment;

        if (current_offset_ + padding + size > block_size_) {
            // Need a new block
            size_t new_size = (size + alignment > block_size_) ? (size + alignment) : block_size_;
            allocate_new_block(new_size);
            current_addr = reinterpret_cast<size_t>(blocks_.back().get());
            padding = (alignment - (current_addr % alignment)) % alignment;
        }

        current_offset_ += padding;
        void* ptr = blocks_.back().get() + current_offset_;
        current_offset_ += size;
        return ptr;
    }

    // Allocate and construct an object of type T in O(1) with automatic destructor tracking
    template <typename T, typename... Args>
    T* make(Args&&... args) {
        void* mem = allocate(sizeof(T), alignof(T));
        T* obj = new (mem) T(std::forward<Args>(args)...);
        if constexpr (!std::is_trivially_destructible_v<T>) {
            void* node_mem = allocate(sizeof(CleanupNode), alignof(CleanupNode));
            auto* node = new (node_mem) CleanupNode{
                [](void* ptr) { static_cast<T*>(ptr)->~T(); },
                obj,
                cleanup_head_
            };
            cleanup_head_ = node;
        }
        return obj;
    }

    // Reset the arena, executing all tracked destructors and freeing memory blocks
    void reset() {
        run_destructors();
        blocks_.clear();
        current_offset_ = 0;
        allocate_new_block();
    }

    // Total memory allocated across all blocks
    size_t total_allocated() const {
        return blocks_.size() * block_size_;
    }

private:
    struct CleanupNode {
        void (*destroy_fn)(void*);
        void* obj_ptr;
        CleanupNode* next;
    };

    void run_destructors() {
        CleanupNode* curr = cleanup_head_;
        while (curr) {
            if (curr->destroy_fn && curr->obj_ptr) {
                curr->destroy_fn(curr->obj_ptr);
            }
            curr = curr->next;
        }
        cleanup_head_ = nullptr;
    }

    void allocate_new_block(size_t size = 0) {
        size_t sz = (size == 0) ? block_size_ : size;
        blocks_.push_back(std::make_unique<uint8_t[]>(sz));
        current_offset_ = 0;
    }

    size_t block_size_;
    size_t current_offset_;
    std::vector<std::unique_ptr<uint8_t[]>> blocks_;
    CleanupNode* cleanup_head_{nullptr};
};

} // namespace setun
