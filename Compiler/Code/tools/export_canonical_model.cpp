#include "tensor/bitnet_model.hpp"
#include <iostream>

int main() {
    setun::tensor::BitNetMnistModel model;
    model.init_synthetic(42);
    model.save_safetensors("mnist_bitnet.safetensors");
    std::cout << "Successfully exported canonical model 'mnist_bitnet.safetensors' (42 seed)\n";
    std::cout << "Total parameters: " << model.total_parameters() << "\n";
    std::cout << "Total weight bytes: " << model.total_weight_bytes() << "\n";
    return 0;
}
