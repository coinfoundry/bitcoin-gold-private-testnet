FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://download.libsodium.org/libsodium/releases/libsodium-1.0.15.tar.gz \
    https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    /tmp/

RUN apt-get -y update && apt-get -y install build-essential libssl-dev libboost-all-dev libdb5.3 \
    libdb5.3-dev libdb5.3++-dev libtool automake libevent-dev bsdmainutils git ntp make g++ gcc \
    autoconf cpp ngrep iftop sysstat autotools-dev pkg-config libminiupnpc-dev libzmq3-dev \
    libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev mc

RUN tar xzf /tmp/libsodium-1.0.15.tar.gz -C /tmp && cd /tmp/libsodium-1.0.15 && \
    ./configure && make && make test && make install && ldconfig

RUN cd /tmp && git clone https://github.com/coinfoundry/BTCGPU && \
    cd BTCGPU && ./autogen.sh && ./configure --with-incompatible-bdb && make && make install && echo 6

RUN apt-get update -y && apt-get -y install unzip && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 8232 8233 8234

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
