#!/bin/bash --login

conda init
conda activate dvc-env
ffmpeg -pix_fmt yuv420p -re -video_size 1920x1080 -stream_loop -1 -i "sa09.yuv" -preset ultrafast -vcodec libx264 -tune zerolatency -f flv "rtmp://rtmp-server/live/test"
