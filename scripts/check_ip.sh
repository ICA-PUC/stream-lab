#!/bin/bash

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' stream-lab-rtmp-server-1
