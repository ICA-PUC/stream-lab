#!/bin/sh

echo "Measuring bitrate..."
# python -m ffmpeg_bitrate_stats --read-duration 60 rtmp://rtmp-server/live/test > /viewer/probe_output.json
echo "Done!"

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

# TODO: grab PSNR and MSSIM using FFMPEG!
