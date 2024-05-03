#!/bin/sh

ffmpeg -i sa09.yuv -preset ultrafast -pix_fmt yuv420p -s 1920x1080  -vcodec libx264 -tune zerolatency -f flv "rtmp://172.17.0.2/live/test"
