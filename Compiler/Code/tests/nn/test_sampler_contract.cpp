#include "tensor/nn/runtime/sampler.hpp"
#include <iostream>
#include <cassert>
#include <cmath>
#include <vector>

namespace setun::test {

using namespace setun::tensor::nn;

void test_sampler_contract_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 7.4 TIER 2: SAMPLER CONTRACT & STOP MATCHER VERIFICATION    \n";
    std::cout << "===================================================================\n";

    constexpr size_t V = 8;
    float logits[V] = {1.0f, 2.0f, 5.0f, 3.0f, -2.0f, 0.5f, 4.0f, 1.5f};
    float scratch_probs[V];
    size_t scratch_indices[V];

    std::cout << "  [1. Greedy Deterministic Sampling]... ";
    {
        uint32_t top = Sampler::sample_greedy(logits, V);
        assert(top == 2);
        std::cout << "PASSED (max logit selected)\n";
    }

    std::cout << "  [2. Repetition Penalty Contract]... ";
    {
        float test_logits[V];
        for (size_t i = 0; i < V; ++i) test_logits[i] = logits[i];

        uint32_t context[2] = {2, 4};
        Sampler::apply_repetition_penalty(test_logits, V, context, 2, 2.0f);

        assert(std::fabs(test_logits[2] - 2.5f) < 1e-5f);
        assert(std::fabs(test_logits[4] - (-4.0f)) < 1e-5f);
        assert(std::fabs(test_logits[6] - 4.0f) < 1e-5f);

        assert(Sampler::sample_greedy(test_logits, V) == 6);
        std::cout << "PASSED (positive divided, negative multiplied)\n";
    }

    std::cout << "  [3. Presence & Frequency Penalty Contracts]... ";
    {
        float test_logits[V];
        for (size_t i = 0; i < V; ++i) test_logits[i] = logits[i];

        uint32_t context[4] = {2, 2, 2, 6};
        Sampler::apply_presence_and_frequency_penalty(test_logits, V, context, 4, 1.0f, 0.5f);

        assert(std::fabs(test_logits[2] - 2.5f) < 1e-5f);
        assert(std::fabs(test_logits[6] - 2.5f) < 1e-5f);
        assert(Sampler::sample_greedy(test_logits, V) == 3);
        std::cout << "PASSED (presence & frequency isolated correctly)\n";
    }

    std::cout << "  [4. Strict Sampling Pipeline (Temp, Top-K, Top-P)]... ";
    {
        SamplingConfig cfg;
        cfg.temperature = 0.00001f;
        cfg.top_k = 50;
        cfg.top_p = 0.9f;

        uint32_t chosen = Sampler::sample(logits, V, cfg, nullptr, 0, scratch_probs, scratch_indices);
        assert(chosen == 2);

        cfg.temperature = 0.8f;
        cfg.seed = 12345;
        uint32_t s1 = Sampler::sample(logits, V, cfg, nullptr, 0, scratch_probs, scratch_indices);
        cfg.seed = 12345;
        uint32_t s2 = Sampler::sample(logits, V, cfg, nullptr, 0, scratch_probs, scratch_indices);
        assert(s1 == s2);
        std::cout << "PASSED (deterministic seed verified)\n";
    }

    std::cout << "  [5. StopMatcher (Tokens & Sequences)]... ";
    {
        StopMatcher matcher;
        matcher.add_stop_token_id(2);
        matcher.add_stop_sequence({10, 11, 12});

        size_t match_len = 0;
        uint32_t stream1[4] = {5, 6, 7, 2};
        assert(matcher.should_stop(Span<const uint32_t>(stream1, 4), match_len));
        assert(match_len == 1);

        uint32_t stream2[5] = {5, 6, 10, 11, 12};
        assert(matcher.should_stop(Span<const uint32_t>(stream2, 5), match_len));
        assert(match_len == 3);

        uint32_t stream3[4] = {5, 6, 7, 8};
        assert(!matcher.should_stop(Span<const uint32_t>(stream3, 4), match_len));
        assert(match_len == 0);
        std::cout << "PASSED (zero-overhead stream matching)\n";
    }
}

} // namespace setun::test
