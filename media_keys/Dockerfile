FROM dtrace
MAINTAINER Robin Ridler <robin.ridler@gmail.com>

RUN yum install -y --enablerepo ol7_developer_EPEL \
                   nmap-ncat \
                   python-paho-mqtt \
                   wget && \
    mkdir /root/events.d

RUN wget -O /usr/bin/dumb-init \
         https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 && \
         chmod 755 /usr/bin/dumb-init

COPY scripts/*.d /root/events.d/
COPY scripts/rund.sh /root/
COPY scripts/message /root/

ENV LANG en-GB.UTF8

ENTRYPOINT [ "/usr/bin/dumb-init", "-c", "--" ]
CMD [ "/root/rund.sh" ]
