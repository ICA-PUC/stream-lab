#!/bin/sh

REFDIR=$(pwd)

docker run --cap-add=NET_ADMIN -t -d \
    --name net-admin-undersea \
    --network undersea-stream-lab \
    -v $REFDIR/admin:/admin \
    undersea/net-admin /admin/manage_network.sh
