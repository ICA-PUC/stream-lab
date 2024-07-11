#!/bin/sh

docker run -d \
    -v ./consumer:/consumer \
    --name consumer-undersea \
    --network undersea-stream-lab \
    jjanzic/docker-python3-opencv \
    python3 /consumer/consumer.py
