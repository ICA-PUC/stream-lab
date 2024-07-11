#!/bin/sh

docker stop \
    consumer-undersea \
    streamer-undersea \
    rtmp-server-undersea \

docker rm \
    consumer-undersea \
    streamer-undersea \
    rtmp-server-undersea \

docker network rm undersea-stream-lab
