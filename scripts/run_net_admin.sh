#!/bin/sh

docker run --cap-add=NET_ADMIN -t -d \
    --name net-admin-undersea \
    --network undersea-stream-lab \
    undersea/net-admin
