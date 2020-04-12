FROM ubuntu:latest

MAINTAINER Raxul257, <luxar.pl@outlook.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl screen htop unzip lib32stdc++6 mono-runtime mono-reference-assemblies-2.0 libc6 libgl1-mesa-glx libxcursor1 libxrandr2 libc6-dev libgcc-4.8-dev openssl libcurl4 gdb lldb tzdata && \
    useradd -d /home/container -m container

RUN echo "Europe/Warsaw" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./Modules /Modules
COPY ./start.sh /start.sh
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
