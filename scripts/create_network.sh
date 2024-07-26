#!/bin/sh

docker network create -d ipvlan \
    --subnet=192.168.15.0/24 \
    --gateway=192.168.15.1 \
    -o parent=enp7s0 undersea-stream-lab
