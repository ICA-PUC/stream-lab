#!/bin/bash --login

conda init
conda activate dvc-env
ffmpeg -pix_fmt yuv420p -re -video_size 640x320 -stream_loop -1 -i "ciab-23.yuv" -preset ultrafast -vcodec libx264 -tune zerolatency -f flv "rtmp://rtmp-server/live/test"
