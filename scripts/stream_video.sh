#!/bin/sh

ffmpeg -pix_fmt yuv420p -re -i "sa09.yuv" -s 1920x1080 -preset ultrafast -vcodec libx264 -tune zerolatency -f flv "rtmp://172.17.0.2/live/test"
