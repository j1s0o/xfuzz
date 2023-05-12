FROM ubuntu:18.04

# Cập nhật và cài đặt các gói cơ bản
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    gcc \
    make \
    libleveldb-dev # dùng để chạy sfuzz

RUN mkdir -p xfuzz/sfuzz
COPY sfuzz /xfuzz/sfuzz

#run script for setup sfuzz
RUN cd /xfuzz/sfuzz/scripts \
    && sh install_cmake.sh --prefix /usr/local \
    && sh install_deps.sh \
    && cd .. \
    && mkdir build \
    && cd build \
    && git submodule update --init \
    && cmake .. \
    && cd fuzzer; make



