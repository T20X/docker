ARG NRUSER=maine
FROM ubuntu:18.04
ARG NRUSER

RUN apt-get update
RUN apt-get update && apt-get install -y sudo
RUN apt-get update && apt-get install -y ca-certificates

RUN useradd -m -s /bin/bash ${NRUSER} \
    && usermod -aG sudo ${NRUSER} \
    && sed -ri "s/%sudo.*/%sudo ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers

RUN apt-get update && apt-get install -y --no-install-recommends perl unzip net-tools ssh bash telnet curl \
    && apt-get install -y --no-install-recommends vim binutils bash less locate inetutils-ping lsof git 

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



