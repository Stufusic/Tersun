#include <iostream>
#include <vector>
#include <cassert>
#include <cstring>
#include <string>
#include "tensor/safetensors_loader.hpp"

using namespace setun::tensor;

static void assert_throws_with_message(const uint8_t* buffer, size_t size, const std::string& scenario_name) {
    bool caught = false;
    try {
        auto st = SafeTensorsFile::load_from_memory(buffer, size);
        std::cerr << "  FAIL: Expected exception for scenario [" << scenario_name << "] but succeeded!\n";
    } catch (const std::exception& e) {
        caught = true;
        std::cout << "  [PASS] " << scenario_name << " -> Cleanly caught: " << e.what() << "\n";
    }
    assert(caught && "Expected exception was not thrown!");
}

// Helper to construct a synthetic safetensors buffer
static std::vector<uint8_t> make_safetensors_buffer(uint64_t header_len, const std::string& json_str, const std::vector<uint8_t>& payload) {
    std::vector<uint8_t> buf(8 + json_str.size() + payload.size());
    std::memcpy(buf.data(), &header_len, 8);
    if (!json_str.empty()) {
        std::memcpy(buf.data() + 8, json_str.data(), json_str.size());
    }
    if (!payload.empty()) {
        std::memcpy(buf.data() + 8 + json_str.size(), payload.data(), payload.size());
    }
    return buf;
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.1 Sprint 5: SafeTensors Fuzzing & Robustness Test Suite   \n";
    std::cout << "===================================================================\n";

    // -------------------------------------------------------------------------
    // Scenario 1: File Truncation & Underflow (< 8 bytes)
    // -------------------------------------------------------------------------
    std::cout << "\n--- Category 1: Header Underflow & Truncation ---\n";
    {
        uint8_t tiny_buf[7] = {1, 2, 3, 4, 5, 6, 7};
        assert_throws_with_message(tiny_buf, 0, "Zero-byte buffer");
        assert_throws_with_message(tiny_buf, 4, "4-byte buffer (< 8 bytes)");
        assert_throws_with_message(tiny_buf, 7, "7-byte buffer (< 8 bytes)");
    }

    // -------------------------------------------------------------------------
    // Scenario 2: Invalid / Exorbitant Header Length
    // -------------------------------------------------------------------------
    std::cout << "\n--- Category 2: Invalid Header Length Specifications ---\n";
    {
        // header_len = 0
        uint64_t zero_len = 0;
        uint8_t buf_zero[16] = {0};
        std::memcpy(buf_zero, &zero_len, 8);
        assert_throws_with_message(buf_zero, 16, "Header length = 0");

        // header_len = 101 MB (> 100MB sanity limit)
        uint64_t huge_len = 101ULL * 1024ULL * 1024ULL;
        uint8_t buf_huge[16] = {0};
        std::memcpy(buf_huge, &huge_len, 8);
        assert_throws_with_message(buf_huge, 16, "Header length exceeds 100MB sanity limit");

        // header_len exceeds actual buffer size
        uint64_t declared_len = 200;
        std::vector<uint8_t> truncated = make_safetensors_buffer(declared_len, "{\"a\": {}}", std::vector<uint8_t>(10));
        assert_throws_with_message(truncated.data(), truncated.size(), "Declared header length exceeds actual buffer size");
    }

    // -------------------------------------------------------------------------
    // Scenario 3: Malformed JSON Syntax & Negative Dimensions
    // -------------------------------------------------------------------------
    std::cout << "\n--- Category 3: Malformed JSON & Negative Dimension Fuzzing ---\n";
    {
        // Unclosed JSON
        std::string unclosed_json = "{\"weight\": {\"dtype\": \"I32\", \"shape\": [4, 4]";
        auto buf1 = make_safetensors_buffer(unclosed_json.size(), unclosed_json, std::vector<uint8_t>(64));
        // Does not parse a complete tensor, so entries empty, or fails
        auto st = SafeTensorsFile::load_from_memory(buf1.data(), buf1.size());
        assert(!st->has_tensor("weight"));
        std::cout << "  [PASS] Unclosed JSON -> Safely ignored incomplete entries without crash\n";

        // Negative shape dimension
        std::string neg_shape_json = "{\"w\": {\"dtype\": \"I32\", \"shape\": [-5, 4], \"data_offsets\": [0, 64]}}";
        auto buf2 = make_safetensors_buffer(neg_shape_json.size(), neg_shape_json, std::vector<uint8_t>(64));
        assert_throws_with_message(buf2.data(), buf2.size(), "Negative shape dimension rejection");

        // Non-numeric shape dimension
        std::string bad_dim_json = "{\"w\": {\"dtype\": \"I32\", \"shape\": [\"xyz\", 4], \"data_offsets\": [0, 64]}}";
        auto buf3 = make_safetensors_buffer(bad_dim_json.size(), bad_dim_json, std::vector<uint8_t>(64));
        assert_throws_with_message(buf3.data(), buf3.size(), "Non-numeric shape dimension rejection");
    }

    // -------------------------------------------------------------------------
    // Scenario 4: Offset Inversion & Out-of-Bounds Payload Access
    // -------------------------------------------------------------------------
    std::cout << "\n--- Category 4: Offset Inversion & Buffer Overflow Attempts ---\n";
    {
        // Inverted offsets: start (100) > end (50)
        std::string inv_json = "{\"w\": {\"dtype\": \"I32\", \"shape\": [4], \"data_offsets\": [100, 50]}}";
        auto buf1 = make_safetensors_buffer(inv_json.size(), inv_json, std::vector<uint8_t>(200));
        assert_throws_with_message(buf1.data(), buf1.size(), "Inverted offsets (start > end)");

        // Out of bounds offset: end (300) > payload capacity (100)
        std::string oob_json = "{\"w\": {\"dtype\": \"I32\", \"shape\": [4], \"data_offsets\": [0, 300]}}";
        auto buf2 = make_safetensors_buffer(oob_json.size(), oob_json, std::vector<uint8_t>(100));
        assert_throws_with_message(buf2.data(), buf2.size(), "Out of bounds offset (end > payload size)");

        // Negative offset
        std::string neg_off_json = "{\"w\": {\"dtype\": \"I32\", \"shape\": [4], \"data_offsets\": [-10, 50]}}";
        auto buf3 = make_safetensors_buffer(neg_off_json.size(), neg_off_json, std::vector<uint8_t>(100));
        assert_throws_with_message(buf3.data(), buf3.size(), "Negative offset rejection");
    }

    // -------------------------------------------------------------------------
    // Scenario 5: Overlapping Tensor Ranges (Memory Aliasing Attack)
    // -------------------------------------------------------------------------
    std::cout << "\n--- Category 5: Overlapping Tensor Ranges (Aliasing Attack) ---\n";
    {
        // w1: [0, 64], w2: [32, 96] -> Overlap in [32, 64]
        std::string overlap_json = "{\"w1\": {\"dtype\": \"I32\", \"shape\": [16], \"data_offsets\": [0, 64]}, "
                                   "\"w2\": {\"dtype\": \"I32\", \"shape\": [16], \"data_offsets\": [32, 96]}}";
        auto buf = make_safetensors_buffer(overlap_json.size(), overlap_json, std::vector<uint8_t>(128));
        assert_throws_with_message(buf.data(), buf.size(), "Overlapping tensor data regions");
    }

    // -------------------------------------------------------------------------
    // Scenario 6: Valid In-Memory SafeTensors Parsing
    // -------------------------------------------------------------------------
    std::cout << "\n--- Category 6: Valid Multi-Tensor Buffer Verification ---\n";
    {
        // 2 disjoint tensors:
        // t1: I32 [2, 2], 16 bytes, offsets [0, 16]
        // t2: I32 [2], 8 bytes, offsets [16, 24]
        std::string valid_json = "{\"t1\": {\"dtype\": \"I32\", \"shape\": [2, 2], \"data_offsets\": [0, 16]}, "
                                 "\"t2\": {\"dtype\": \"I32\", \"shape\": [2], \"data_offsets\": [16, 24]}}";
        std::vector<uint8_t> payload(24, 0);
        int32_t t1_data[4] = {10, 20, 30, 40};
        int32_t t2_data[2] = {99, 100};
        std::memcpy(payload.data(), t1_data, 16);
        std::memcpy(payload.data() + 16, t2_data, 8);

        try {
            auto buf = make_safetensors_buffer(valid_json.size(), valid_json, payload);
            auto st = SafeTensorsFile::load_from_memory(buf.data(), buf.size());
            assert(st != nullptr);
            assert(st->has_tensor("t1"));
            assert(st->has_tensor("t2"));

            const TensorView v1 = st->get_tensor_view("t1");
            assert(v1.shape().rank() == 2);
            assert(v1.shape().dim(0) == 2 && v1.shape().dim(1) == 2);
            assert(v1.dtype() == TensorDType::INT32);
            const int32_t* ptr1 = static_cast<const int32_t*>(v1.raw_data());
            assert(ptr1[0] == 10 && ptr1[1] == 20 && ptr1[2] == 30 && ptr1[3] == 40);

            const TensorView v2 = st->get_tensor_view("t2");
            assert(v2.shape().rank() == 1);
            assert(v2.shape().dim(0) == 2);
            const int32_t* ptr2 = static_cast<const int32_t*>(v2.raw_data());
            assert(ptr2[0] == 99 && ptr2[1] == 100);

            std::cout << "  [PASS] Successfully parsed valid disjoint tensors with exact value verification\n";
        } catch (const std::exception& ex) {
            std::cerr << "  FAIL Category 6 exception: " << ex.what() << "\n";
            assert(false);
        }
    }

    std::cout << "\n===================================================================\n";
    std::cout << "  SafeTensors Fuzzing & Security Tests: 100% SUCCESSFUL!\n";
    std::cout << "===================================================================\n";
    return 0;
}
