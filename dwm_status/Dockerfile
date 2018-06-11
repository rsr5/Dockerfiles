FROM ubuntu:latest
RUN useradd -u 210337 robin
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:teejee2008/ppa && \
    apt-get update && \
    apt-get install -y conky-all locales x11-xserver-utils dzen2 fonts-powerline
# RUN rm -rf /var/lib/apt/lists/* \
#     && localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
RUN locale-gen en_GB.UTF-8
COPY local.conf /etc/fonts/local.conf
ENV LANG en-GB.UTF8
ENV LANGUAGE en-GB.UTF8
ENV LC_ALL en-GB.UTF8
USER robin
COPY status.sh /status.sh
CMD /status.sh
