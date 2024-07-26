FROM ubuntu

# install dependencies
RUN apt-get update
RUN apt-get update && apt-get install -y net-tools iproute2 netcat-traditional dnsutils curl iputils-ping tcpdump iperf3 speedtest-cli tcptrack
 
# rate-limit the network interface and
# upload the data when docker image is run
RUN echo "#!/bin/bash" >> /run_tc.sh
RUN echo "tc qdisc add dev eth0 root tbf rate 80kbit burst 32kbit latency 400ms" >> /run_tc.sh
RUN chmod a+x /run_tc.sh

COPY ./manage_network.sh /
RUN chmod a+x /manage_network.sh

ENTRYPOINT [ "/manage_network.sh" ]
