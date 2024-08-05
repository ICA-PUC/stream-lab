#!/bin/sh

docker run -d \
    -v ./streamer:/streamer \
    --name streamer-lr-undersea \
    --network undersea-stream-lab \
    undersea/streamer \
    sh /streamer/run_lr_stream.sh

# docker run -d \
#     -v ./streamer:/streamer \
#     --name streamer-hr-undersea \
#     --network undersea-stream-lab \
#     undersea/streamer \
#     sh /streamer/run_hr_stream.sh
