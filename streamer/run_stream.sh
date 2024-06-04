#!/bin/bash --login

ffmpeg -pix_fmt yuv420p \
    -re \
    -video_size 640x320 \
    -stream_loop -1 \
    -i "/streamer/data/ciab-23.yuv" \
    -preset ultrafast \
    -vcodec libx264 \
    -tune zerolatency \
    -r 5 \
    -maxrate 80k \
    -bufsize 320k \
    -f flv "rtmp://rtmp-server/live/test"
