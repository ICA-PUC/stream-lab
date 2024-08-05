#!/bin/sh

docker run -d \
    -p 1935:1935 \
    --name rtmp-lr-server-undersea \
    --network undersea-stream-lab \
    --net-alias rtmp-lr-server \
    tiangolo/nginx-rtmp

docker run -d \
    -p 1936:1935 \
    --name rtmp-hr-server-undersea \
    --network undersea-stream-lab \
    --net-alias rtmp-hr-server \
    tiangolo/nginx-rtmp