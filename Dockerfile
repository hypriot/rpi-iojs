# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Stefan Scherer <stefan@hypriot.com>

RUN apt-get update && apt-get install -y curl

# Install io.js (from tarball)
ENV IOJS_VERSION 1.3.0

# gpg keys listed at https://github.com/iojs/io.js
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 9554F04D7259F04124DE6B476D5A82AC7E37093B DD8F2338BAE7501E3DD5AC78C273792F7D83545D

RUN curl -SLO "https://iojs.org/dist/v$IOJS_VERSION/iojs-v$IOJS_VERSION-linux-armv6l.tar.gz" && \
    curl -SLO "https://iojs.org/dist/v$IOJS_VERSION/SHASUMS256.txt.asc" && \
    gpg --verify SHASUMS256.txt.asc && \
    grep " iojs-v$IOJS_VERSION-linux-armv6l.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - && \
    tar -xzf "iojs-v$IOJS_VERSION-linux-armv6l.tar.gz" -C /usr/local --strip-components=1 && \
    rm "iojs-v$IOJS_VERSION-linux-armv6l.tar.gz" SHASUMS256.txt.asc

CMD [ "iojs" ]
