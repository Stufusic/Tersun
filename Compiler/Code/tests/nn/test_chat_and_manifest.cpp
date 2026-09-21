#include "tensor/nn/format/model_manifest.hpp"
#include "tensor/nn/format/chat_template.hpp"
#include <iostream>
#include <cassert>
#include <cmath>
#include <string>
#include <vector>

namespace setun::test {

using namespace setun::tensor::nn;

void test_chat_and_manifest_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 7.4 TIER 4: MANIFEST & CHAT TEMPLATE VERIFICATION           \n";
    std::cout << "===================================================================\n";

    std::cout << "  [1. ModelManifest Parsing from HuggingFace config.json]... ";
    {
        std::string sample_config = R"({
            "model_type": "bitnet",
            "vocab_size": 128256,
            "hidden_size": 2560,
            "intermediate_size": 6912,
            "num_hidden_layers": 30,
            "num_attention_heads": 20,
            "num_key_value_heads": 5,
            "head_dim": 128,
            "max_position_embeddings": 4096,
            "rms_norm_eps": 1e-05,
            "rope_theta": 500000.0,
            "bos_token_id": 128000,
            "eos_token_id": [128001, 128008, 128009],
            "tie_word_embeddings": false
        })";

        auto res = ModelManifest::from_config_json(sample_config);
        assert(res.ok());
        const auto& m = res.value();
        assert(m.model_type == "bitnet");
        assert(m.vocab_size == 128256);
        assert(m.hidden_size == 2560);
        assert(m.intermediate_size == 6912);
        assert(m.num_hidden_layers == 30);
        assert(m.num_attention_heads == 20);
        assert(m.num_key_value_heads == 5);
        assert(m.head_dim == 128);
        assert(m.bos_token_id == 128000);
        assert(m.eos_token_ids.size() == 3);
        assert(m.is_eos_token(128001));
        assert(m.is_eos_token(128008));
        assert(m.is_eos_token(128009));
        assert(!m.is_eos_token(128000));

        BitNetConfig cfg = m.to_bitnet_config();
        assert(cfg.hidden_size == 2560);
        assert(cfg.num_attention_heads == 20);
        assert(cfg.num_key_value_heads == 5);
        assert(cfg.head_dim == 128);
        std::cout << "PASSED (multi-EOS and GQA 4:1 parsed)\n";
    }

    std::cout << "  [2. Generation Config Parsing]... ";
    {
        std::string sample_gen = R"({
            "temperature": 0.6,
            "top_p": 0.85,
            "top_k": 40,
            "repetition_penalty": 1.15,
            "presence_penalty": 0.2,
            "frequency_penalty": 0.1,
            "max_new_tokens": 512
        })";

        ModelManifest m;
        Status st = m.parse_generation_config_json(sample_gen);
        assert(st.ok());
        assert(std::fabs(m.default_temperature - 0.6f) < 1e-4f);
        assert(std::fabs(m.default_top_p - 0.85f) < 1e-4f);
        assert(m.default_top_k == 40);
        assert(std::fabs(m.default_repetition_penalty - 1.15f) < 1e-4f);
        assert(std::fabs(m.default_presence_penalty - 0.2f) < 1e-4f);
        assert(std::fabs(m.default_frequency_penalty - 0.1f) < 1e-4f);
        assert(m.default_max_new_tokens == 512);
        std::cout << "PASSED (generation defaults parsed)\n";
    }

    std::cout << "  [3. ChatTemplate ChatML Multi-Turn Formatting]... ";
    {
        ModelManifest m;
        std::vector<ChatMessage> history = {
            ChatMessage::system("You are Tersun AI assistant."),
            ChatMessage::user("Hello!"),
            ChatMessage::assistant("Hello! How can I help you today?"),
            ChatMessage::user("What is balanced ternary?")
        };

        std::string rendered;
        Status st = ChatTemplate::render(history, m, true, rendered, ChatTemplate::Format::ChatML);
        assert(st.ok());

        assert(rendered.find("<|im_start|>system\nYou are Tersun AI assistant.<|im_end|>\n") != std::string::npos);
        assert(rendered.find("<|im_start|>user\nHello!<|im_end|>\n") != std::string::npos);
        assert(rendered.find("<|im_start|>assistant\nHello! How can I help you today?<|im_end|>\n") != std::string::npos);
        assert(rendered.find("<|im_start|>user\nWhat is balanced ternary?<|im_end|>\n") != std::string::npos);
        assert(rendered.rfind("<|im_start|>assistant\n") == rendered.size() - 22);
        std::cout << "PASSED (ChatML multi-turn verified)\n";
    }
}

} // namespace setun::test
