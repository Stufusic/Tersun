#include "tensor/nn/format/tokenizer.hpp"
#include <iostream>
#include <cassert>
#include <string>
#include <vector>

namespace setun::test {

using namespace setun::tensor::nn;

void test_tokenizer_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 7.4 TIER 1: TOKENIZER SUITE VERIFICATION                    \n";
    std::cout << "===================================================================\n";

    auto tok = std::make_unique<HuggingFaceBPETokenizer>();

    // 1. Setup synthetic vocabulary
    tok->add_token("<unk>", 0, true);
    tok->add_token("<s>", 1, true);
    tok->add_token("</s>", 2, true);
    tok->add_token("<|im_start|>", 3, true);
    tok->add_token("<|im_end|>", 4, true);
    tok->set_special_ids(1, 2, 0, 0);

    // Add byte tokens for ASCII letters
    uint32_t next_id = 5;
    for (char c = 'a'; c <= 'z'; ++c) {
        std::string s(1, c);
        tok->add_token(s, next_id++);
    }
    for (char c = 'A'; c <= 'Z'; ++c) {
        std::string s(1, c);
        tok->add_token(s, next_id++);
    }
    tok->add_token(" ", next_id++);
    tok->add_token("!", next_id++);
    tok->add_token("?", next_id++);

    // Merges
    uint32_t rank = 0;
    tok->add_token("th", next_id++); tok->add_merge("t", "h", rank++);
    tok->add_token("he", next_id++); tok->add_merge("h", "e", rank++);
    tok->add_token("the", next_id++); tok->add_merge("th", "e", rank++);
    tok->add_token("in", next_id++); tok->add_merge("i", "n", rank++);
    tok->add_token("er", next_id++); tok->add_merge("e", "r", rank++);
    tok->add_token("un", next_id++); tok->add_merge("u", "n", rank++);
    tok->add_token("sun", next_id++); tok->add_merge("s", "un", rank++);
    tok->add_token("Ter", next_id++); tok->add_merge("Ter", "sun", rank++);
    tok->add_token("Tersun", next_id++); tok->add_merge("Ter", "sun", rank++);

    std::cout << "  [1. Basic Word & Merge Encoding]... ";
    {
        EncodeOptions opts;
        opts.add_bos = false;
        opts.add_eos = false;
        opts.add_special_tokens = true;

        std::vector<uint32_t> tokens = tok->encode("Tersun", opts);
        assert(!tokens.empty());
        assert(tokens.size() == 1);
        assert(tok->token_to_piece(tokens[0]) == "Tersun");

        std::string decoded = tok->decode(tokens);
        assert(decoded == "Tersun");
        std::cout << "PASSED\n";
    }

    std::cout << "  [2. Special Tokens & ChatML Tagging]... ";
    {
        EncodeOptions opts;
        opts.add_bos = true;
        opts.add_eos = true;
        opts.add_special_tokens = true;

        std::string prompt = "<|im_start|>user\nTersun<|im_end|>";
        tok->add_token("user", next_id++);
        tok->add_token("\n", next_id++);

        std::vector<uint32_t> tokens = tok->encode(prompt, opts);
        assert(tokens[0] == 1); // BOS
        assert(tokens[1] == 3); // <|im_start|>
        assert(tokens[tokens.size() - 2] == 4); // <|im_end|>
        assert(tokens[tokens.size() - 1] == 2); // EOS

        DecodeOptions dec_opts;
        dec_opts.skip_special_tokens = false;
        std::string full_decoded = tok->decode(tokens, dec_opts);
        assert(full_decoded.find("<|im_start|>") != std::string::npos);
        assert(full_decoded.find("<|im_end|>") != std::string::npos);

        dec_opts.skip_special_tokens = true;
        std::string clean_decoded = tok->decode(tokens, dec_opts);
        assert(clean_decoded.find("<|im_start|>") == std::string::npos);
        assert(clean_decoded.find("Tersun") != std::string::npos);
        std::cout << "PASSED\n";
    }

    std::cout << "  [3. Byte-Level UTF-8 & Vietnamese Robustness]... ";
    {
        tok->add_token("Xin", next_id++);
        tok->add_token("chào", next_id++);

        EncodeOptions opts;
        opts.add_bos = false;
        opts.add_eos = false;
        std::vector<uint32_t> tokens = tok->encode("Xinchào", opts);
        std::string decoded = tok->decode(tokens);
        assert(decoded == "Xinchào");
        std::cout << "PASSED (Unicode preserved)\n";
    }

    std::cout << "  [4. Hot-Path Zero-Allocation API (encode_into / decode_into)]... ";
    {
        uint32_t out_tokens[16];
        size_t actual_tokens = 0;
        EncodeOptions opts;
        Status st_enc = tok->encode_into("Tersun", out_tokens, 16, actual_tokens, opts);
        assert(st_enc.ok());
        assert(actual_tokens == 1);

        char out_buf[64];
        size_t actual_bytes = 0;
        Status st_dec = tok->decode_into(Span<const uint32_t>(out_tokens, actual_tokens), out_buf, 64, actual_bytes);
        assert(st_dec.ok());
        assert(std::string(out_buf) == "Tersun");
        std::cout << "PASSED (Hot-path buffers verified)\n";
    }

    std::cout << "  [5. HuggingFace JSON Loader Validation]... ";
    {
        std::string sample_json = R"({
            "model": {
                "type": "BPE",
                "vocab": {
                    "<unk>": 0,
                    "<s>": 1,
                    "</s>": 2,
                    "H": 3,
                    "e": 4,
                    "l": 5,
                    "o": 6,
                    "He": 7,
                    "ll": 8,
                    "llo": 9,
                    "Hello": 10
                },
                "merges": [
                    "H e",
                    "l l",
                    "ll o",
                    "He llo"
                ]
            },
            "added_tokens": [
                {"id": 1, "content": "<s>", "special": true},
                {"id": 2, "content": "</s>", "special": true}
            ]
        })";

        auto load_res = HuggingFaceBPETokenizer::load_from_json_string(sample_json);
        assert(load_res.ok());
        auto hf_tok = std::move(load_res.value());
        assert(hf_tok->vocab_size() >= 11);
        assert(hf_tok->bos_token_id() == 1);
        assert(hf_tok->eos_token_id() == 2);

        EncodeOptions opts;
        opts.add_bos = false;
        opts.add_eos = false;
        std::vector<uint32_t> tokens = hf_tok->encode("Hello", opts);
        assert(tokens.size() == 1);
        assert(tokens[0] == 10);
        assert(hf_tok->decode(tokens) == "Hello");
        std::cout << "PASSED (HuggingFace JSON BPE parsed)\n";
    }
}

} // namespace setun::test
