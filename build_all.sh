#!/bin/sh

docker pull tiangolo/nginx-rtmp
docker pull jjanzic/docker-python3-opencv
docker build -t undersea/streamer streamer/
docker build -t undersea/viewer viewer/
