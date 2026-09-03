#pragma once

#include "tafpu/trit.hpp"
#include <cstdint>
#include <vector>
#include <string>
#include <deque>
#include <memory>

namespace setun {

// -----------------------------------------------------------------------------
// Tryte Paging Hardware Permissions: -1 (RO), 0 (Protected), +1 (RW)
// -----------------------------------------------------------------------------
enum class TrytePagePermission : int8_t {
    READ_ONLY  = -1,
    NO_ACCESS  =  0,
    READ_WRITE =  1
};

struct TrytePage {
    uint32_t page_id{0};
    TrytePagePermission permission{TrytePagePermission::NO_ACCESS};
    std::vector<uint8_t> data;

    explicit TrytePage(uint32_t id, TrytePagePermission perm, size_t size = 729) // 729 bytes = 3^6 tryte size
        : page_id(id), permission(perm), data(size, 0) {}
};

// -----------------------------------------------------------------------------
// Tri-State Real-Time Process Priority: -1 (BG), 0 (Normal), +1 (Real-Time)
// -----------------------------------------------------------------------------
enum class TaskPriority : int8_t {
    LOW_BACKGROUND = -1,
    NORMAL_USER    =  0,
    CRITICAL_RT    =  1
};

struct TaskControlBlock {
    uint32_t task_id{0};
    std::string name;
    TaskPriority priority{TaskPriority::NORMAL_USER};
    int execution_ticks{0};
    bool is_finished{false};

    TaskControlBlock(uint32_t id, const std::string& task_name, TaskPriority prio)
        : task_id(id), name(task_name), priority(prio) {}
};

// -----------------------------------------------------------------------------
// Bare-Metal Microkernel & Tri-State Scheduler
// -----------------------------------------------------------------------------
class TernaryMicrokernel {
public:
    TernaryMicrokernel();

    // Memory Paging System
    void map_page(uint32_t page_id, TrytePagePermission perm);
    bool check_memory_access(uint32_t page_id, bool is_write) const;

    // Process & Task Management
    uint32_t spawn_task(const std::string& name, TaskPriority prio);
    bool run_scheduler_tick();

    size_t active_tasks_count() const;
    const TaskControlBlock* current_running_task() const { return current_task_; }

private:
    std::vector<TrytePage> page_table_;
    std::deque<TaskControlBlock> rt_queue_;   // Priority +1
    std::deque<TaskControlBlock> norm_queue_; // Priority  0
    std::deque<TaskControlBlock> bg_queue_;   // Priority -1
    TaskControlBlock* current_task_{nullptr};
    uint32_t next_task_id_{1};
};

} // namespace setun
