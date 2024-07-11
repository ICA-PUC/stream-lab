#!/bin/sh

docker run -d \
    --name sniffer-undersea \
    --network undersea-stream-lab \
    --cap-add NET_ADMIN \
    --security-opt seccomp=unconfined \
    -p 3000:3000 \
    -e PUID=1000 \
    -e PGID=1000 \
    lscr.io/linuxserver/wireshark:latest
