ARG NRUSER=maine
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ARG NRUSER

RUN apt-get update
RUN apt-get update && apt-get install -y sudo
RUN apt-get update && apt-get install -y ca-certificates

RUN useradd -m -s /bin/bash ${NRUSER} \
    && usermod -aG sudo ${NRUSER} \
    && sed -ri "s/%sudo.*/%sudo ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers

RUN apt-get update && apt-get install -y --no-install-recommends perl unzip net-tools ssh bash telnet curl \
    && apt-get install -y --no-install-recommends vim binutils bash less locate inetutils-ping lsof git python3-dev \ 
    && apt-get install -y --no-install-recommends cmake build-essential clang wget clangd-10

RUN apt-get update && apt-get install -y --no-install-recommends libboost-all-dev libevent-dev libdouble-conversion-dev libgoogle-glog-dev libgflags-dev libiberty-dev liblz4-dev liblzma-dev libsnappy-dev zlib1g-dev binutils-dev libjemalloc-dev libssl-dev pkg-config libunwind-dev

RUN apt-get update && git clone https://github.com/fmtlib/fmt.git && cd fmt \
   && mkdir _build && cd _build && cmake -DBUILD_SHARED_LIBS=TRUE .. && make -j3 && sudo make install

RUN apt-get update && wget https://github.com/google/googletest/archive/release-1.8.0.tar.gz \
 && tar zxf release-1.8.0.tar.gz \
 && rm -f release-1.8.0.tar.gz \
 && cd googletest-release-1.8.0 \
 && cmake . \
 && make \
 && make install 
RUN updatedb

RUN apt-get update && wget https://github.com/facebook/folly/releases/download/v2020.08.31.00/folly-v2020.08.31.00.zip && mkdir folly &&  unzip folly-v2020.08.31.00.zip -d ./folly && cd folly && mkdir _build \
 && cd _build && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_POSITION_INDEPENDENT_CODE=ON .. && make -j3 && sudo make install

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

USER ${NRUSER}
WORKDIR /home/${NRUSER}

RUN mkdir -p /home/${NRUSER}/workdir
RUN sudo chmod -R a+wr /home/${NRUSER}

RUN git clone https://github.com/T20X/scripts.git
RUN git clone https://github.com/T20X/cpp_snippets.git

#RUN git clone https://github.com/T20X/scripts.git
#RUN cd ~/scripts && ./bootstrap.sh

EXPOSE 8000 8001 50051 
ENTRYPOINT tail -f /dev/null



