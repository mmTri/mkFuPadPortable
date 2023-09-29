FROM ubuntu:22.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends msitools p7zip-full genisoimage curl wget openssh-client git \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -m -d /home/dev-user -s /bin/bash dev-user