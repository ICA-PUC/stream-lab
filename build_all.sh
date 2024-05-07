#!/bin/sh

docker pull tiangolo/nginx-rtmp

cd streamer
docker build -t ffmpeg-streamer .
