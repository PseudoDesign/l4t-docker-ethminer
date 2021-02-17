ARG L4TBASE_VERSION=""
ARG ETHMINER_VERSION=""

FROM nvcr.io/nvidia/l4t-base:${L4TBASE_VERSION}

# Install Requirements
RUN apt-get update
COPY build-requirements.txt /tmp/
RUN apt-get install -y $(grep -vE "^\s*#" /tmp/build-requirements.txt  | tr "\n" " ")

# Fetch Sources
WORKDIR /app/
RUN git clone https://github.com/ethereum-mining/ethminer.git -b v0.19.0
WORKDIR /app/ethminer
RUN git submodule update --init --recursive

# Run the build
RUN mkdir build
WORKDIR /app/ethminer/build
RUN cmake ..
RUN cmake --build .