#!/bin/sh

tc qdisc add dev eth0 handle 10: root tbf rate 0.5mbit \
burst 5kb latency 70ms peakrate 1mbit \
minburst 1540

tc qdisc add dev eth0 parent 10:1 handle 100: sfq

wondershaper eth0 80 80
