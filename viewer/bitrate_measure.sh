#!/bin/sh

echo "Measuring bitrate..."
python -m ffmpeg_bitrate_stats --read-duration 60 rtmp://rtmp-server/live/test > /viewer/probe_output.json
echo "Done!"
