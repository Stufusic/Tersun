# Multi-stage Dockerfile for Setun-70 Balanced Ternary Compiler & TAFPU VM
FROM ubuntu:24.04 AS builder

# Install build dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    cmake \
    ninja-build \
    libgtest-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Copy source code
COPY . .

# Build project with CMake
RUN mkdir -p build && cd build && \
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release .. && \
    ninja

# Run tests in container during build
RUN cd build && ./setunc test && ./setunc benchmark

# Runtime minimal image
FROM ubuntu:24.04 AS runtime

WORKDIR /app
COPY --from=builder /workspace/build/setunc /usr/local/bin/setunc
COPY --from=builder /workspace/examples /app/examples

ENTRYPOINT ["setunc"]
CMD ["test"]
