#pragma once

#include "runtime/lockfree_queue.hpp"
#include "runtime/async_scheduler.hpp"
#include <memory>
#include <string>
#include <unordered_map>
#include <mutex>
#include <atomic>

namespace setun {
namespace runtime {

// ============================================================================
// 1. Zero-Copy Base Message
// ============================================================================

struct Message {
    uint32_t type_id{0};
    uint64_t sender_id{0};
    virtual ~Message() = default;
};

// Simple String Message for text communication
struct StringMessage : public Message {
    std::string payload;
    StringMessage(std::string text, uint64_t sender = 0) : payload(std::move(text)) {
        sender_id = sender;
        type_id = 1;
    }
};

// Numeric Message for high-performance physics/computation
struct NumericMessage : public Message {
    int64_t val1{0};
    int64_t val2{0};
    NumericMessage(int64_t v1, int64_t v2, uint64_t sender = 0) : val1(v1), val2(v2) {
        sender_id = sender;
        type_id = 2;
    }
};

// ============================================================================
// 2. Actor Base Class with Zero-Copy Move Semantics
// ============================================================================

class Actor {
public:
    Actor(uint64_t id) : id_(id), mailbox_() {}
    virtual ~Actor() = default;

    uint64_t id() const { return id_; }

    // Zero-copy message sending: O(1) pointer ownership transfer
    bool send(std::unique_ptr<Message> msg) {
        return mailbox_.push(std::move(msg));
    }

    // Process one pending message in mailbox
    bool process_one() {
        std::unique_ptr<Message> msg;
        if (mailbox_.pop(msg)) {
            if (msg) {
                on_receive(std::move(msg));
                return true;
            }
        }
        return false;
    }

    virtual void on_receive(std::unique_ptr<Message> msg) = 0;

private:
    uint64_t id_{0};
    MPMCQueue<std::unique_ptr<Message>, 2048> mailbox_;
};

// ============================================================================
// 3. High-Performance Actor System & Supervisor Pool
// ============================================================================

class ActorSystem {
public:
    ActorSystem(TriPriorityScheduler& scheduler)
        : scheduler_(scheduler), next_actor_id_(1), running_actors_(0) {}

    template <typename ActorClass, typename... Args>
    std::shared_ptr<ActorClass> spawn(Args&&... args) {
        uint64_t id = next_actor_id_.fetch_add(1, std::memory_order_relaxed);
        auto actor = std::make_shared<ActorClass>(id, std::forward<Args>(args)...);
        
        {
            std::lock_guard<std::mutex> lock(registry_mutex_);
            actors_[id] = actor;
        }
        return actor;
    }

    // Trigger an actor to execute its pending mailbox messages via Scheduler
    void schedule_actor(const std::shared_ptr<Actor>& actor, TaskPriority priority = TaskPriority::NORMAL) {
        running_actors_.fetch_add(1, std::memory_order_relaxed);
        scheduler_.spawn([actor, this]() {
            while (actor->process_one()) {
                // Drain mailbox
            }
            this->running_actors_.fetch_sub(1, std::memory_order_release);
        }, priority);
    }

    void wait_all() {
        while (running_actors_.load(std::memory_order_acquire) > 0) {
            std::this_thread::yield();
        }
        scheduler_.wait_all();
    }

private:
    TriPriorityScheduler& scheduler_;
    std::atomic<uint64_t> next_actor_id_{1};
    std::atomic<size_t> running_actors_{0};
    std::mutex registry_mutex_;
    std::unordered_map<uint64_t, std::shared_ptr<Actor>> actors_;
};

} // namespace runtime
} // namespace setun
