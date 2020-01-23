FROM oraclelinux:7-slim
RUN useradd -u 1000 robin
RUN yum install -y --enablerepo ol7_optional_latest --enablerepo ol7_latest freetype \
    fontconfig libXrender libXext libXdamage libXcomposite libjpeg-turbo \
    hunspell dbus-glib startup-notification libXt libstdc++  \
    dejavu-fonts-common dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts \
    liberation-fonts-common liberation-mono-fonts liberation-narrow-fonts \
    liberation-sans-fonts liberation-serif-fonts pango gtk3 bzip2

COPY local.conf /etc/fonts/local.conf
USER robin

RUN cd /home/robin && \
    curl https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/68.4.1/linux-x86_64/en-US/thunderbird-68.4.1.tar.bz2 -o thunderbird-68.4.1.tar.bz2 && \
    tar xvf thunderbird-68.4.1.tar.bz2 && \
    rm thunderbird-68.4.1.tar.bz2

ENV LANG en-GB
ENV TZ Europe/London

ENTRYPOINT [ "/home/robin/thunderbird/thunderbird" ]
