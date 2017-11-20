FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/BTCGPU/BTCGPU/releases/download/0.15.0.1/bitcoingold-0.15.0-x86_64-pc-linux-gnu.zip /tmp/

RUN apt-get update -y && apt-get -y install unzip && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    cd /tmp && unzip bitcoingold-0.15.0-x86_64-pc-linux-gnu.zip && cp -r /tmp/bin/* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 8232 8233 8234

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
