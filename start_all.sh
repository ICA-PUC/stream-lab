#!/bin/sh

bash scripts/create_network.sh
bash admin/run_net_admin.sh
bash scripts/run_rtmp_server.sh
bash streamer/run_streamer.sh
bash viewer/run_viewer.sh
