FROM oraclelinux:7-slim
MAINTAINER Robin Ridler <robin.ridler@gmail.com>

RUN useradd -u 210337 robin

RUN yum install -y \
                iputils
USER robin
ENV HOME /home/robin

ENTRYPOINT ["ping"]
