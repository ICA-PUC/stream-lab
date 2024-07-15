#!/bin/sh

docker run -d \
    -v ./viewer:/viewer \
    --name viewer-undersea \
    --network undersea-stream-lab \
    undersea/viewer \
    /bin/bash /viewer/probe_stream.sh
