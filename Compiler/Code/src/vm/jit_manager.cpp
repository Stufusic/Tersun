#include "vm/jit_manager.hpp"

namespace setun {

JITManager::JITManager() = default;

std::shared_ptr<JITCodeObject> JITManager::get_or_create(size_t func_ip) {
    auto it = code_cache_.find(func_ip);
    if (it != code_cache_.end()) {
        return it->second;
    }
    auto obj = std::make_shared<JITCodeObject>();
    obj->start_ip = func_ip;
    code_cache_[func_ip] = obj;
    return obj;
}

bool JITManager::compile_function(const Chunk& chunk, size_t func_ip, size_t end_ip) {
    auto obj = get_or_create(func_ip);
    if (obj->status == JITCodeStatus::COMPILED) return true;

    obj->status = JITCodeStatus::COMPILING;
    obj->start_ip = func_ip;
    obj->end_ip = end_ip;

    if (!compiler_.compile_chunk(chunk, func_ip, end_ip, obj->buffer, obj->safepoints, obj->osr_table, obj->deopt_table)) {
        obj->status = JITCodeStatus::FAILED;
        return false;
    }

    obj->entry_point = reinterpret_cast<JITNativeEntryPoint>(const_cast<void*>(obj->buffer.entry_point()));
    obj->status = JITCodeStatus::COMPILED;
    return true;
}

int64_t JITManager::execute_native(VM* vm, size_t func_ip, JITFrame* frame) {
    auto it = code_cache_.find(func_ip);
    if (it == code_cache_.end() || !it->second->is_executable()) {
        return 0;
    }
    return it->second->entry_point(vm, frame);
}

int64_t JITManager::execute_osr(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame) {
    auto it = code_cache_.find(func_ip);
    if (it == code_cache_.end() || !it->second->is_executable()) {
        return 0;
    }
    const auto* osr_rec = it->second->osr_table.find_by_bytecode_ip(loop_header_ip);
    if (!osr_rec) {
        return 0;
    }
    auto osr_entry = reinterpret_cast<JITNativeEntryPoint>(
        const_cast<uint8_t*>(it->second->buffer.data() + osr_rec->osr_native_entry_offset));
    return osr_entry(vm, frame);
}

JITExit JITManager::execute_osr_advanced(VM* vm, size_t func_ip, uint32_t loop_header_ip, JITFrame* frame) {
    JITExit exit_info;
    auto it = code_cache_.find(func_ip);
    if (it == code_cache_.end() || !it->second->is_executable()) {
        exit_info.reason = JITExitReason::Bailout;
        return exit_info;
    }
    const auto* osr_rec = it->second->osr_table.find_by_bytecode_ip(loop_header_ip);
    if (!osr_rec) {
        exit_info.reason = JITExitReason::Bailout;
        return exit_info;
    }
    auto osr_entry = reinterpret_cast<JITNativeEntryPoint>(
        const_cast<uint8_t*>(it->second->buffer.data() + osr_rec->osr_native_entry_offset));

    int64_t raw_res = osr_entry(vm, frame);
    exit_info.value = VMValue::from_raw(static_cast<uint64_t>(raw_res));
    exit_info.reason = frame->exit_reason;
    exit_info.continuation = frame->continuation;
    return exit_info;
}

void JITManager::record_invocation(size_t func_ip) {
    auto obj = get_or_create(func_ip);
    obj->invocation_count++;
}

void JITManager::record_backedge(size_t func_ip) {
    auto obj = get_or_create(func_ip);
    obj->backedge_count++;
}

void JITManager::invalidate(size_t func_ip) {
    auto it = code_cache_.find(func_ip);
    if (it != code_cache_.end()) {
        it->second->status = JITCodeStatus::INVALIDATED;
        it->second->state = CodeState::Invalidated;
        it->second->entry_point = nullptr;
    }
}

void JITManager::clear() {
    code_cache_.clear();
}

size_t JITManager::compiled_count() const {
    size_t count = 0;
    for (const auto& [_, obj] : code_cache_) {
        if (obj->status == JITCodeStatus::COMPILED) count++;
    }
    return count;
}

} // namespace setun
