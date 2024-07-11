#!/bin/sh

docker run -d \
    -v ./streamer:/streamer \
    --name streamer-undersea \
    --network undersea-stream-lab \
    undersea/streamer \
    sh /streamer/run_stream.sh
