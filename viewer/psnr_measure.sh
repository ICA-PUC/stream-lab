#!/bin/sh

echo "Measuring PSNR and MSSIM..."
ffmpeg -i /viewer/out_stream.mp4 /viewer/out_stream.yuv

ffmpeg -pixel_format yuv420p \
    -video_size 640x320 \
    -i /viewer/out_stream.yuv \
    -pixel_format yuv420p \
    -video_size 640x320 \
    -i /viewer/ciro-23.yuv \
    -lavfi "[0][1]ssim;[0][1]psnr" -f null - >> /viewer/ff.log
