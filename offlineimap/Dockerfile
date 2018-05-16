FROM oraclelinux:7-slim
MAINTAINER Robin Ridler <robin.ridler@gmail.com>

RUN useradd -u 210337 robin

RUN yum install -y --enablerepo ol7_developer_EPEL \
                offlineimap
USER robin
ENV HOME /home/robin

ENTRYPOINT ["offlineimap", "-c", "/home/robin/.offlineimap/offlineimaprc", "-l", "/home/robin/.offlineimap/log"]
