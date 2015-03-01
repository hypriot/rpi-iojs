
# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Stefan Scherer <stefan@hypriot.com>

# Install io.js (from tarball)
ENV IOJS_VERSION 1.4.1
ADD https://iojs.org/dist/v${IOJS_VERSION}/iojs-v${IOJS_VERSION}-linux-armv6l.tar.xz /
RUN \
  cd /usr/local/ && \
  tar --strip-components 1 -xJf /iojs-v${IOJS_VERSION}-linux-armv6l.tar.xz && \
  rm -f iojs-v${IOJS_VERSION}-linux-armv6l.tar.xz

# Define working directory
WORKDIR /data

# Define default command
CMD ["bash"]
