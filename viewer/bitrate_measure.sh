#!/bin/sh

echo "##################"
echo "Measuring bitrate..."
python -m ffmpeg_bitrate_stats --read-duration 10 rtmp://rtmp-lr-server/live/test > /viewer/bitrate_measures.json
echo "Done!"
echo "##################"
