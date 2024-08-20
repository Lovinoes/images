FROM        azul/zulu-openjdk:8

# Metadata
LABEL       author="Lovinoes" maintainer="lovinoes@lovinoes.de"
LABEL       org.opencontainers.image.source="https://github.com/lovinoes/images"
LABEL       org.opencontainers.image.licenses="MIT"

ENV         DEBIAN_FRONTEND noninteractive

# Install necessary packages
RUN         apt-get update \
            && apt-get -y install --no-install-recommends ffmpeg iproute2 git sqlite3 python3 tzdata ca-certificates dnsutils fontconfig libfreetype6 libstdc++6 lsof build-essential locales \
            && apt-get clean \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container \
            && locale-gen en_US.UTF-8

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
