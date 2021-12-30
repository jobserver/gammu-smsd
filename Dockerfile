FROM debian:buster-slim

# Set UTF-8 locale
ENV LC_ALL C.UTF-8

# Set right timezone
ARG TZ=America/Bahia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Gammu SMSD
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    gammu-smsd && \
   rm -rf /var/lib/apt/lists/*

COPY gammu-smsdrc /etc/
COPY entrypoint.sh /