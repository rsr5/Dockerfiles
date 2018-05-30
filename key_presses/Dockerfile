FROM oraclelinux:7-slim
MAINTAINER Robin Ridler <robin.ridler@gmail.com>

RUN yum install -y dtrace-utils
RUN mkdir -p /lib/modules/4.14.32-dtrace/kernel/
COPY vmlinux.ctfa /lib/modules/4.14.32-dtrace/kernel/vmlinux.ctfa
COPY 4.14 /usr/lib64/dtrace/4.14
RUN rm -rf /usr/lib64/dtrace/4.14.28
COPY events.d /root/events.d
CMD /root/events.d
