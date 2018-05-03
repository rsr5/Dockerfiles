FROM oraclelinux:7-slim
RUN useradd -u 210337 robin
RUN yum install -y xterm
USER robin
ENTRYPOINT [ "/usr/bin/xterm" ]
