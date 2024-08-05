#!/bin/sh

REFDIR=$(pwd)

docker run --cap-add=NET_ADMIN -t -d \
    --name net-admin-undersea \
    --network undersea-stream-lab \
    -v $REFDIR/server:/server \
    undersea/net-admin manager_network.sh
