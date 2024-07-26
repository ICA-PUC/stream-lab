#!/bin/sh

docker stop \
    viewer-undersea \
    streamer-undersea \
    rtmp-server-undersea \
    net-admin-undersea \

docker rm \
    viewer-undersea \
    streamer-undersea \
    rtmp-server-undersea \
    net-admin-undersea \

docker network rm undersea-stream-lab
