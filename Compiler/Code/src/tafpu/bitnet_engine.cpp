#include "tafpu/bitnet_engine.hpp"
#include <algorithm>
#include <numeric>
#include <iostream>

namespace setun::ai {

void BitNetEngine::load_mnist_sample(int digit) {
    // 8x8 Standard Digit Bitmaps (64 pixels each: 1 = Stroke, 0 = Background)
    static const uint8_t mnist_digits[10][8] = {
        // 0
        {
            0b00111100,
            0b01100110,
            0b01100110,
            0b01100110,
            0b01100110,
            0b01100110,
            0b01100110,
            0b00111100
        },
        // 1
        {
            0b00011000,
            0b00111000,
            0b00011000,
            0b00011000,
            0b00011000,
            0b00011000,
            0b00011000,
            0b00111100
        },
        // 2
        {
            0b00111100,
            0b01100110,
            0b00000110,
            0b00001100,
            0b00011000,
            0b00110000,
            0b01100000,
            0b01111110
        },
        // 3
        {
            0b00111100,
            0b01100110,
            0b00000110,
            0b00011100,
            0b00000110,
            0b00000110,
            0b01100110,
            0b00111100
        },
        // 4
        {
            0b00001100,
            0b00011100,
            0b00101100,
            0b01001100,
            0b01111110,
            0b00001100,
            0b00001100,
            0b00001100
        },
        // 5
        {
            0b01111110,
            0b01100000,
            0b01100000,
            0b01111100,
            0b00000110,
            0b00000110,
            0b01100110,
            0b00111100
        },
        // 6
        {
            0b00111100,
            0b01100000,
            0b01100000,
            0b01111100,
            0b01100110,
            0b01100110,
            0b01100110,
            0b00111100
        },
        // 7
        {
            0b01111110,
            0b00000110,
            0b00001100,
            0b00011000,
            0b00110000,
            0b00110000,
            0b00110000,
            0b00110000
        },
        // 8
        {
            0b00111100,
            0b01100110,
            0b01100110,
            0b00111100,
            0b01100110,
            0b01100110,
            0b01100110,
            0b00111100
        },
        // 9
        {
            0b00111100,
            0b01100110,
            0b01100110,
            0b01100110,
            0b00111110,
            0b00000110,
            0b00000110,
            0b00111100
        }
    };

    int d = (digit >= 0 && digit <= 9) ? digit : 0;
    input_buffer_.resize(64);

    for (int row = 0; row < 8; ++row) {
        uint8_t byte_val = mnist_digits[d][row];
        for (int col = 0; col < 8; ++col) {
            bool pixel = (byte_val >> (7 - col)) & 1;
            input_buffer_[row * 8 + col] = pixel ? 1 : 0;
        }
    }
}

} // namespace setun::ai

extern "C" {

int setun_nn_create_dense(int in_features, int out_features, int act_type) {
    return setun::ai::BitNetEngine::instance().create_layer(in_features, out_features, act_type);
}

void setun_nn_set_weight(int layer_id, int row, int col, int val) {
    auto* layer = setun::ai::BitNetEngine::instance().get_layer(layer_id);
    if (layer) {
        layer->set_weight(row, col, static_cast<int8_t>(val));
    }
}

void setun_nn_set_bias(int layer_id, int row, int64_t val) {
    auto* layer = setun::ai::BitNetEngine::instance().get_layer(layer_id);
    if (layer) {
        layer->set_bias(row, val);
    }
}

void setun_nn_set_input(int index, int64_t val) {
    setun::ai::BitNetEngine::instance().set_input(index, val);
}

int64_t setun_nn_get_input(int index) {
    return setun::ai::BitNetEngine::instance().get_input(index);
}

void setun_nn_forward(int layer_id) {
    setun::ai::BitNetEngine::instance().forward(layer_id);
}

int64_t setun_nn_get_output(int layer_id, int index) {
    return setun::ai::BitNetEngine::instance().get_output(layer_id, index);
}

void setun_nn_copy_output_to_input(int layer_id) {
    setun::ai::BitNetEngine::instance().copy_output_to_input(layer_id);
}

int setun_nn_predict(int layer_id) {
    return setun::ai::BitNetEngine::instance().predict(layer_id);
}

int setun_nn_get_confidence(int layer_id, int predicted_class) {
    return setun::ai::BitNetEngine::instance().get_confidence(layer_id, predicted_class);
}

void setun_nn_load_mnist_sample(int digit) {
    setun::ai::BitNetEngine::instance().load_mnist_sample(digit);
}

void setun_nn_free_layer(int layer_id) {
    setun::ai::BitNetEngine::instance().free_layer(layer_id);
}

}
