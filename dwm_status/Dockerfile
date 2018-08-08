FROM ubuntu:latest
RUN useradd -u 210337 robin
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:teejee2008/ppa && \
    apt-get update && \
    apt-get install -y \
      wget \
      conky-all \
      locales \
      x11-xserver-utils \
      x11-utils \
      dzen2 \
      fonts-powerline \
      fonts-font-awesome \
      tzdata \
      python-pip python-dev build-essential && \
      dpkg-reconfigure --frontend noninteractive tzdata

RUN locale-gen en_GB.UTF-8 && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8

# Install dub-init to manage signals correctly
RUN wget -O /usr/bin/dumb-init \
         https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 && \
         chmod 755 /usr/bin/dumb-init

COPY local.conf /etc/fonts/local.conf

# Install the Python dependencies
RUN pip install humanize pytz paho-mqtt

# Copy in the scripts
ADD scripts/countdown.py /bin/countdown.py
ADD scripts/status.sh /bin/status.sh
ADD scripts/server.py /bin/server.py
ADD scripts/dzen2_popup.sh /bin/dzen2_popup.sh
RUN chmod 755 /bin/*.sh /bin/*.py

# Configure the locales for dzen2
ENV LANG en-GB.UTF8
ENV LANGUAGE en-GB.UTF8
ENV LC_ALL en-GB.UTF8
ENV TZ Europe/London

# Run as me.
USER robin

ENTRYPOINT [ "/usr/bin/dumb-init", "-c", "--" ]
CMD [ "/bin/status.sh" ]
