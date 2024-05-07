#!/bin/sh

docker pull tiangolo/nginx-rtmp
docker build --no-cache -t ffmpeg-streamer streamer/
