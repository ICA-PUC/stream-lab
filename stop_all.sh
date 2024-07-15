#!/bin/sh

docker stop \
    viewer-undersea \
    streamer-undersea \
    rtmp-server-undersea \

docker rm \
    viewer-undersea \
    streamer-undersea \
    rtmp-server-undersea \

docker network rm undersea-stream-lab
