FROM        shipilev/openjdk:8

# Metadata
LABEL       author="Lovinoes" maintainer="lovinoes@lovinoes.de"
LABEL       org.opencontainers.image.source="https://github.com/lovinoes/images"
LABEL       org.opencontainers.image.licenses="MIT"

# Install necessary packages
RUN         apt-get update -y \
            && apt-get install -y --no-install-recommends curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 libstdc++6 lsof build-essential tzdata iproute2 locales \
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
