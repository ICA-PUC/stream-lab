#!/bin/sh

sh run_tc.sh
speedtest-cli
tcptrack -i eth0
