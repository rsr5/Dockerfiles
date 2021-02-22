ARG image
FROM ${image}

RUN dnf install -y shadow-utils && useradd -u 1000 -s /usr/bin/zsh robin
COPY yum.conf /etc/yum.conf

COPY repos.d /root/repos.d
RUN mkdir /root/pkgs.d/
COPY pkgs.d /root/pkgs.d/
COPY packaging.sh /root/
RUN /root/packaging.sh

RUN pip install flake8 flake8-colors flake8-comprehensions flake8-docstrings \
                flake8-import-order pep8-naming==0.5.0

RUN wget -O /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod 755 /usr/bin/jq
RUN chsh -s /bin/zsh robin

RUN wget -O /usr/bin/dumb-init \
         https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 && \
         chmod 755 /usr/bin/dumb-init

ENV LANG en_GB.utf8
ENV TERM xterm-256color
ENV DEFAULT_USER robin

RUN echo 'robin         ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers
USER robin
ENTRYPOINT [ "/usr/bin/dumb-init", "-c", "--" ]
CMD [ "/usr/bin/tmux", "-u" ]
