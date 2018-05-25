FROM ubuntu:latest
RUN useradd -u 210337 robin
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:teejee2008/ppa && \
    apt-get update && \
    apt-get install -y conky-all locales x11-xserver-utils
RUN rm -rf /var/lib/apt/lists/* \
    && localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
COPY local.conf /etc/fonts/local.conf
ENV LANG en-GB.utf8
USER robin
ENTRYPOINT bash -c 'conky -c ~/.conkydwmrc | while read LINE; do xsetroot -name "$LINE"; done'
