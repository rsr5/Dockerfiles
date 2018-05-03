FROM oraclelinux:7-slim
RUN useradd -u 210337 robin
RUN yum install -y --enablerepo ol7_optional_latest thunderbird freetype
RUN yum install -y fontconfig libXrender libXext libXdamage libXcomposite libjpeg-turbo
RUN yum install -y hunspell dbus-glib gtk2 startup-notification libXt
COPY local.conf /etc/fonts/local.conf
ENV LANG en-GB
USER robin
ENTRYPOINT [ "/usr/bin/thunderbird" ]
