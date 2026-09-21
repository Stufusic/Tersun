cmake_minimum_required(VERSION 3.20)
project(TersunAIRunner VERSION 1.0.3 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

# 1. Scalar Kernel Reference (G7.1-SOC: strictly scalar flags)
add_library(tersun_kernel_scalar STATIC
    src/tensor/kernels/bitnet_scalar_ladder.cpp
)
target_include_directories(tersun_kernel_scalar PUBLIC include)
target_compile_options(tersun_kernel_scalar PRIVATE -O3 -fno-tree-vectorize)

# 2. NEON Microkernels (ARM64)
add_library(tersun_kernel_neon STATIC
    src/tensor/kernels/bitnet_neon.cpp
)
target_include_directories(tersun_kernel_neon PUBLIC include)

# 3. Core Tensor & AI Runtime
add_library(tersun_ai_core STATIC
    src/tensor/tensor.cpp
    src/tensor/edge_arena.cpp
    src/tensor/safetensors_loader.cpp
    src/tensor/bitnet_model.cpp
    src/compiler/tensor_ir.cpp
    src/runtime/target_capabilities.cpp
    src/runtime/kernel_registry.cpp
)
target_include_directories(tersun_ai_core PUBLIC include)
target_link_libraries(tersun_ai_core PUBLIC
    tersun_kernel_scalar
    tersun_kernel_neon
)

# 4. CLI Options
add_library(tersun_cli_options STATIC
    src/cli/ai_options.cpp
)
target_include_directories(tersun_cli_options PUBLIC include)

# 5. Standalone Minimalist Executable
add_executable(tersun_ai_runner
    src/cli/ai_runner_main.cpp
)
target_include_directories(tersun_ai_runner PUBLIC include)
target_link_libraries(tersun_ai_runner PRIVATE
    tersun_ai_core
    tersun_cli_options
)

# 6. Canonical Vector Replay Runner
add_executable(test_canonical_replay
    tests/g7_1/test_canonical_replay.cpp
)
target_include_directories(test_canonical_replay PUBLIC include)
target_link_libraries(test_canonical_replay PRIVATE
    tersun_ai_core
)
