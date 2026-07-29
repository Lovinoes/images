FROM        container-registry.oracle.com/graalvm/jdk:21

# Metadata
LABEL       author="Lovinoes" maintainer="lovinoes@lovinoes.de"
LABEL       org.opencontainers.image.source="https://github.com/lovinoes/images"
LABEL       org.opencontainers.image.licenses="MIT"
LABEL       org.opencontainers.image.title="java21_graalvm-ee"
LABEL       org.opencontainers.image.description="Oracle GraalVM (Enterprise Edition, JDK 21) image."

# Install necessary packages (Oracle GraalVM images are Oracle Linux slim based; use microdnf)
RUN         microdnf update -y \
            && microdnf install -y curl ca-certificates openssl tar gzip git sqlite fontconfig freetype libstdc++ lsof tzdata iproute findutils glibc-langpack-en \
            gcc gcc-c++ make automake libtool \
            && microdnf clean all \
            && rm -rf /var/cache/yum /var/cache/dnf \
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
