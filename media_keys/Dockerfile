FROM dtrace
MAINTAINER Robin Ridler <robin.ridler@gmail.com>

RUN yum install -y nmap-ncat
COPY events.d /root/events.d
CMD /root/events.d
