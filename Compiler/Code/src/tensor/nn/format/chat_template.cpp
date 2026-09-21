#include "tensor/nn/format/chat_template.hpp"
#include <sstream>

namespace setun::tensor::nn {

namespace {

std::string role_to_string(MessageRole role) {
    switch (role) {
        case MessageRole::System: return "system";
        case MessageRole::User: return "user";
        case MessageRole::Assistant: return "assistant";
    }
    return "user";
}

} // namespace

Status ChatTemplate::render(
    const std::vector<ChatMessage>& messages,
    const ModelManifest& manifest,
    bool add_generation_prompt,
    std::string& rendered_prompt,
    Format format) {
    (void)manifest;

    if (format == Format::Auto) {
        // ChatML is the standard conversational format for BitNet / Qwen / modern open weights
        format = Format::ChatML;
    }

    std::stringstream ss;

    if (format == Format::ChatML) {
        for (const auto& msg : messages) {
            ss << "<|im_start|>" << role_to_string(msg.role) << "\n";
            ss << msg.content << "<|im_end|>\n";
        }
        if (add_generation_prompt) {
            ss << "<|im_start|>assistant\n";
        }
    } else if (format == Format::Llama3) {
        for (const auto& msg : messages) {
            ss << "<|start_header_id|>" << role_to_string(msg.role) << "<|end_header_id|>\n\n";
            ss << msg.content << "<|eot_id|>";
        }
        if (add_generation_prompt) {
            ss << "<|start_header_id|>assistant<|end_header_id|>\n\n";
        }
    } else { // Raw fallback
        for (const auto& msg : messages) {
            if (msg.role == MessageRole::System) {
                ss << "System: " << msg.content << "\n";
            } else if (msg.role == MessageRole::User) {
                ss << "User: " << msg.content << "\n";
            } else {
                ss << "Assistant: " << msg.content << "\n";
            }
        }
        if (add_generation_prompt) {
            ss << "Assistant: ";
        }
    }

    rendered_prompt = ss.str();
    return Status::OK();
}

} // namespace setun::tensor::nn
