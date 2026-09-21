#pragma once

#include "tensor/nn/format/model_manifest.hpp"
#include "tensor/nn/core/status.hpp"
#include <string>
#include <vector>
#include <string_view>

namespace setun::tensor::nn {

// ============================================================================
// ChatMessage & ChatTemplate
// Supports multi-turn conversational roles and ChatML / LLaMA-style prompt formatting
// ============================================================================
enum class MessageRole {
    System,
    User,
    Assistant
};

struct ChatMessage {
    MessageRole role{MessageRole::User};
    std::string content;

    static ChatMessage system(std::string text) {
        return {MessageRole::System, std::move(text)};
    }
    static ChatMessage user(std::string text) {
        return {MessageRole::User, std::move(text)};
    }
    static ChatMessage assistant(std::string text) {
        return {MessageRole::Assistant, std::move(text)};
    }
};

class ChatTemplate {
public:
    enum class Format {
        Auto,
        ChatML,   // <|im_start|>role\ncontent<|im_end|>\n
        Llama3,   // <|start_header_id|>role<|end_header_id|>\n\ncontent<|eot_id|>
        Raw       // User: ... \nAssistant: ...
    };

    static Status render(
        const std::vector<ChatMessage>& messages,
        const ModelManifest& manifest,
        bool add_generation_prompt,
        std::string& rendered_prompt,
        Format format = Format::Auto);
};

} // namespace setun::tensor::nn
