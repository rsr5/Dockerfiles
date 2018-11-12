FROM oraclelinux:7-slim
RUN useradd -u 210337 robin

RUN yum install -y \
         tar bzip2 alsa-plugins-pulseaudio dbus gtk3 dbus-glib libXt \
         dejavu-fonts-common dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts \
         liberation-fonts-common liberation-mono-fonts liberation-narrow-fonts \
         liberation-serif-fonts liberation-sans-fonts && \
    curl https://download-installer.cdn.mozilla.net/pub/firefox/releases/63.0.1/linux-x86_64/en-US/firefox-63.0.1.tar.bz2 \
         -o firefox-63.0.1.tar.bz2 && \
    tar xvf firefox-63.0.1.tar.bz2 && \
    mv firefox /opt/firefox && \
    rm firefox-63.0.1.tar.bz2
COPY local.conf /etc/fonts/local.conf
RUN mkdir /var/run/dbus/
RUN chown robin /var/run/dbus
ENV LANG en-GB
ENV PULSE_SERVER tcp:127.0.0.1:4713
USER robin
CMD /usr/bin/dbus-daemon --system --fork && /opt/firefox/firefox -no-remote -P
