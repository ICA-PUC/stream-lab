#!/bin/sh

docker pull tiangolo/nginx-rtmp
docker build -t undersea/streamer streamer/
docker build -t undersea/viewer viewer/
docker build -t undersea/net-admin admin/
