FROM ubuntu:22.04

# install dependencies
RUN apt-get update
RUN apt-get update && apt-get install -y net-tools iproute2 netcat-traditional \
    dnsutils curl iputils-ping tcpdump iperf3 speedtest-cli tcptrack wondershaper

CMD [ "/bin/bash" ]
