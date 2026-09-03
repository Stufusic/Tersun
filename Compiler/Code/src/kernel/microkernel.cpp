#include "kernel/microkernel.hpp"
#include <algorithm>
#include <iostream>

namespace setun {

TernaryMicrokernel::TernaryMicrokernel() = default;

void TernaryMicrokernel::map_page(uint32_t page_id, TrytePagePermission perm) {
    for (auto& p : page_table_) {
        if (p.page_id == page_id) {
            p.permission = perm;
            return;
        }
    }
    page_table_.emplace_back(page_id, perm);
}

bool TernaryMicrokernel::check_memory_access(uint32_t page_id, bool is_write) const {
    for (const auto& p : page_table_) {
        if (p.page_id == page_id) {
            if (p.permission == TrytePagePermission::NO_ACCESS) {
                return false; // Hardware Page Fault
            }
            if (is_write && p.permission == TrytePagePermission::READ_ONLY) {
                return false; // Write Violation on RO Page
            }
            return true;
        }
    }
    return false; // Unmapped Page Fault
}

uint32_t TernaryMicrokernel::spawn_task(const std::string& name, TaskPriority prio) {
    uint32_t tid = next_task_id_++;
    TaskControlBlock tcb(tid, name, prio);

    if (prio == TaskPriority::CRITICAL_RT) {
        rt_queue_.push_back(tcb);
    } else if (prio == TaskPriority::NORMAL_USER) {
        norm_queue_.push_back(tcb);
    } else {
        bg_queue_.push_back(tcb);
    }
    return tid;
}

bool TernaryMicrokernel::run_scheduler_tick() {
    // 1. Highest priority: Critical Realtime tasks (+1)
    if (!rt_queue_.empty()) {
        auto task = rt_queue_.front();
        rt_queue_.pop_front();
        task.execution_ticks++;
        if (task.execution_ticks >= 3) {
            task.is_finished = true;
        } else {
            rt_queue_.push_back(task);
        }
        return true;
    }

    // 2. Normal tasks (0)
    if (!norm_queue_.empty()) {
        auto task = norm_queue_.front();
        norm_queue_.pop_front();
        task.execution_ticks++;
        if (task.execution_ticks >= 2) {
            task.is_finished = true;
        } else {
            norm_queue_.push_back(task);
        }
        return true;
    }

    // 3. Background tasks (-1)
    if (!bg_queue_.empty()) {
        auto task = bg_queue_.front();
        bg_queue_.pop_front();
        task.execution_ticks++;
        if (task.execution_ticks >= 1) {
            task.is_finished = true;
        } else {
            bg_queue_.push_back(task);
        }
        return true;
    }

    return false; // All queues idle
}

size_t TernaryMicrokernel::active_tasks_count() const {
    return rt_queue_.size() + norm_queue_.size() + bg_queue_.size();
}

} // namespace setun
