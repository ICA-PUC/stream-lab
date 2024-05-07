#!/bin/bash --login

conda activate dvc-env
ffmpeg -pix_fmt yuv420p -re -i "sa09.yuv" -s 1920x1080 -preset ultrafast -vcodec libx264 -tune zerolatency -f flv "rtmp://rtmp-server/live/test"
