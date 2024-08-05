#!/bin/sh

docker stop \
    viewer-undersea \
    streamer-hr-undersea \
    streamer-lr-undersea \
    rtmp-lr-server-undersea \
    rtmp-hr-server-undersea \
    net-admin-undersea \

docker rm \
    viewer-undersea \
    streamer-hr-undersea \
    streamer-lr-undersea \
    rtmp-lr-server-undersea \
    rtmp-hr-server-undersea \
    net-admin-undersea \

docker network rm undersea-stream-lab
