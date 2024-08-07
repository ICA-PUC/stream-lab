#!/bin/sh

echo "Saving stream to MP4..."
ffmpeg -i "rtmp://rtmp-server/live/test" \
    -pixel_format yuv420p \
    -video_size 640x320 \
    -preset ultrafast \
    -c:v libx264 \
    -tune zerolatency \
    -r 5 \
    -maxrate 80k \
    -bufsize 320k \
    -t 00:01:10 \
    /viewer/out_stream.mp4
echo "Done!"
