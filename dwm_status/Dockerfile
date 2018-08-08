FROM ubuntu:latest
RUN useradd -u 210337 robin
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:teejee2008/ppa && \
    apt-get update && \
    apt-get install -y \
      conky-all \
      locales \
      x11-xserver-utils \
      dzen2 \
      fonts-powerline \
      fonts-font-awesome \
      tzdata \
      python-pip python-dev build-essential && \
      dpkg-reconfigure --frontend noninteractive tzdata
RUN locale-gen en_GB.UTF-8 && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
COPY local.conf /etc/fonts/local.conf
RUN pip install humanize pytz
ADD countdown.py /bin/countdown.py
ENV LANG en-GB.UTF8
ENV LANGUAGE en-GB.UTF8
ENV LC_ALL en-GB.UTF8
ENV TZ Europe/London
USER robin
COPY status.sh /status.sh
CMD /status.sh
