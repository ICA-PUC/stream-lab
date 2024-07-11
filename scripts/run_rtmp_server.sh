#!/bin/sh

docker run -d \
    -p 1935:1935 \
    --name rtmp-server-undersea \
    --network undersea-stream-lab \
    --net-alias rtmp-server \
    tiangolo/nginx-rtmp
