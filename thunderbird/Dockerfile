FROM oraclelinux:7-slim
RUN useradd -u 210337 robin
RUN yum install -y --enablerepo ol7_optional_latest thunderbird freetype \
    fontconfig libXrender libXext libXdamage libXcomposite libjpeg-turbo \
    hunspell dbus-glib gtk2 startup-notification libXt adwaita-gtk2-theme
COPY local.conf /etc/fonts/local.conf
ENV LANG en-GB
USER robin
ENTRYPOINT [ "/usr/bin/thunderbird" ]