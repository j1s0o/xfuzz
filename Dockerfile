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
    python3-pip \
    libleveldb-dev # dùng để chạy sfuzz


COPY sfuzz /usr/local/bin
#setup solc==0.4.25
RUN curl -LO https://github.com/ethereum/solidity/releases/download/v0.4.25/solc-static-linux \
    && mv solc-static-linux solc \
    && chmod +x solc \
    && mv solc /usr/bin/

#setup xfuzz base
#solc --combined-json abi,bin,bin-runtime,srcmap,srcmap-runtime,srcmap,srcmap-runtime,ast ReentrancyAttacker.sol > ReentrancyAttacker.sol.json
# install slither-analyzer 0.6.9
RUN pip3 install slither-analyzer==0.6.9 mythril==0.23.5





