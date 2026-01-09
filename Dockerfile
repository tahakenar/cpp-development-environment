FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    software-properties-common \
    ca-certificates \
    gpg \
    curl \
    wget \
    git \
    gnupg \
    lsb-release \
    build-essential \
    pkg-config \
    ninja-build \
    make \
    python3 \
    python3-pip \
    vim \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Install CMake from Kitware apt repo https://apt.kitware.com to install latest version
RUN apt-get update
RUN test -f /usr/share/doc/kitware-archive-keyring/copyright || wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN apt-get update
RUN apt-get install kitware-archive-keyring -y
RUN apt-get install cmake -y

# Install pre-commit
RUN pip install pre-commit --break-system-packages

RUN apt-get update && apt-get install -y \
    clang \
    clang-tools \
    clang-format \
    clang-tidy \
    clangd \
    lldb \
    llvm \
    llvm-dev \
    llvm-runtime \
    valgrind \
    cppcheck \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace

CMD ["/bin/bash"]
