FROM        amazoncorretto:11

# Metadata
LABEL       author="Lovinoes" maintainer="lovinoes@lovinoes.de"
LABEL       org.opencontainers.image.source="https://github.com/lovinoes/images"
LABEL       org.opencontainers.image.licenses="MIT"

# Install necessary packages
RUN         yum upgrade -y \
            && yum install -y curl ca-certificates openssl git tar sqlite fontconfig freetype libstdc++.so.6 freetype-devel lsof build-essential tzdata iproute \
            git gcc gcc-c++ automake make libtool \
            && yum clean all \
            && rm -rf /var/cache/yum \
            && useradd -m -d /home/container container

# Set locale and language environment variables
ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

# Copy the entrypoint script
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Set the entrypoint command
COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
