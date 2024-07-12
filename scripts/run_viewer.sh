#!/bin/sh

docker run -it \
    -v ./viewer:/viewer \
    --name viewer-undersea \
    --network undersea-stream-lab \
    undersea/viewer \
    python -m ffmpeg_bitrate_stats -rd 60 rtmp://rtmp-server/live/test
