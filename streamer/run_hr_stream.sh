#!/bin/bash --login

ffmpeg -pix_fmt yuv420p \
    -re \
    -video_size 1920x1080 \
    -stream_loop -1 \
    -i "/streamer/data/sa09.yuv" \
    -vcodec libx264 \
    -f flv "rtmp://rtmp-hr-server/live/test"
