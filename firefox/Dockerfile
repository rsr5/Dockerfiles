FROM oraclelinux:7-slim
RUN useradd -u 1000 robin

ARG firefox_version
ARG firefox_locale

RUN yum install -y \
         tar bzip2 pulseaudio dbus gtk3 dbus-glib libXt \
         dejavu-fonts-common dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts \
         liberation-fonts-common liberation-mono-fonts liberation-narrow-fonts \
         liberation-serif-fonts liberation-sans-fonts
RUN curl https://download-installer.cdn.mozilla.net/pub/firefox/releases/${firefox_version}/linux-x86_64/${firefox_locale}/firefox-${firefox_version}.tar.bz2 \
         -o firefox-${firefox_version}.tar.bz2 && \
    tar xvf firefox-${firefox_version}.tar.bz2 && \
    mv firefox /opt/firefox && \
    rm firefox-${firefox_version}.tar.bz2
COPY local.conf /etc/fonts/local.conf
RUN mkdir /var/run/dbus/
RUN chown robin /var/run/dbus
ENV LANG en-GB
ENV PULSE_SERVER tcp:127.0.0.1:4713
USER robin
CMD /usr/bin/dbus-daemon --system --fork && /opt/firefox/firefox -no-remote -P
