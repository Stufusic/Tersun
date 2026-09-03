#pragma once

#include "runtime/lockfree_queue.hpp"
#include <functional>
#include <thread>
#include <vector>
#include <atomic>
#include <chrono>
#include <iostream>

namespace setun {
namespace runtime {

enum class TaskPriority : int8_t {
    LOW = -1,    // Background IO, GC, streaming
    NORMAL = 0,  // Gameplay, AI NPC
    HIGH = 1     // 120+ FPS Physics / Real-time Rendering
};

struct FiberTask {
    std::function<void()> fn;
    TaskPriority priority{TaskPriority::NORMAL};
    uint64_t task_id{0};
};

class TriPriorityScheduler {
public:
    TriPriorityScheduler(size_t num_threads = std::thread::hardware_concurrency())
        : running_(true), next_task_id_(1), active_tasks_(0) {
        if (num_threads == 0) num_threads = 4;
        workers_.reserve(num_threads);

        for (size_t i = 0; i < num_threads; ++i) {
            // First core is dedicated to HIGH priority real-time
            bool is_high_core = (i == 0);
            workers_.emplace_back([this, is_high_core]() {
                this->worker_loop(is_high_core);
            });
        }
    }

    ~TriPriorityScheduler() {
        stop();
    }

    void stop() {
        if (!running_.exchange(false)) return;
        for (auto& w : workers_) {
            if (w.joinable()) {
                w.join();
            }
        }
    }

    uint64_t spawn(std::function<void()> fn, TaskPriority priority = TaskPriority::NORMAL) {
        uint64_t id = next_task_id_.fetch_add(1, std::memory_order_relaxed);
        active_tasks_.fetch_add(1, std::memory_order_relaxed);
        FiberTask task{std::move(fn), priority, id};

        if (priority == TaskPriority::HIGH) {
            while (!high_queue_.push(std::move(task))) {
                std::this_thread::yield();
            }
        } else if (priority == TaskPriority::NORMAL) {
            while (!normal_queue_.push(std::move(task))) {
                std::this_thread::yield();
            }
        } else {
            while (!low_queue_.push(std::move(task))) {
                std::this_thread::yield();
            }
        }
        return id;
    }

    void wait_all() {
        while (active_tasks_.load(std::memory_order_acquire) > 0) {
            std::this_thread::yield();
        }
    }

    size_t pending_high() const { return high_queue_.size(); }
    size_t pending_normal() const { return normal_queue_.size(); }
    size_t pending_low() const { return low_queue_.size(); }

private:
    void worker_loop(bool is_high_core) {
        FiberTask task;
        while (running_.load(std::memory_order_relaxed) || active_tasks_.load(std::memory_order_relaxed) > 0) {
            bool found_task = false;

            // 1. Always attempt HIGH priority first
            if (high_queue_.pop(task)) {
                found_task = true;
            }
            // 2. Attempt NORMAL priority next
            else if (normal_queue_.pop(task)) {
                found_task = true;
            }
            // 3. Attempt LOW priority ONLY IF NOT on dedicated HIGH core (Chống Cache Pollution)
            else if (!is_high_core && low_queue_.pop(task)) {
                found_task = true;
            }

            if (found_task) {
                task.fn();
                active_tasks_.fetch_sub(1, std::memory_order_release);
            } else {
                if (is_high_core) {
                    // Fast spin-wait (pause instruction) on high core for zero-latency wakeup
#if defined(_MSC_VER) || defined(__GNUC__) || defined(__clang__)
                    #if defined(__x86_64__) || defined(_M_X64)
                    __builtin_ia32_pause();
                    #else
                    std::this_thread::yield();
                    #endif
#else
                    std::this_thread::yield();
#endif
                } else {
                    std::this_thread::yield();
                }
            }
        }
    }

    std::atomic<bool> running_{false};
    std::atomic<uint64_t> next_task_id_{1};
    std::atomic<size_t> active_tasks_{0};

    MPMCQueue<FiberTask, 65536> high_queue_;
    MPMCQueue<FiberTask, 65536> normal_queue_;
    MPMCQueue<FiberTask, 65536> low_queue_;

    std::vector<std::thread> workers_;
};

} // namespace runtime
} // namespace setun
