FROM oraclelinux:7-slim
RUN useradd -u 210337 robin
RUN yum install -y firefox
RUN yum -y install http://linuxdownload.adobe.com/linux/x86_64//adobe-release-x86_64-1.0-1.noarch.rpm && \
    yum install -y flash-plugin alsa-plugins-pulseaudio libcurl dbus adwaita-gtk2-theme
COPY local.conf /etc/fonts/local.conf
RUN mkdir /var/run/dbus/
RUN chown robin /var/run/dbus
ENV LANG en-GB
ENV PULSE_SERVER tcp:127.0.0.1:4713
USER robin
CMD /usr/bin/dbus-daemon --system --fork && /usr/bin/firefox -no-remote
