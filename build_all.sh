#!/bin/sh

cd server
docker build -t rtmp-server .

cd ../streamer
docker build -t ffmpeg-streamer .
