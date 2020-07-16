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
    && apt-get install -y --no-install-recommends cmake build-essential clang

RUN updatedb

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

USER ${NRUSER}
WORKDIR /home/${NRUSER}

RUN mkdir -p /home/${NRUSER}/workdir
RUN sudo chmod -R a+wr /home/${NRUSER}
RUN git clone https://github.com/T20X/scripts.git
RUN cd ~/scripts && ./bootstrap.sh

EXPOSE 8000 8001 50051 
ENTRYPOINT tail -f /dev/null



