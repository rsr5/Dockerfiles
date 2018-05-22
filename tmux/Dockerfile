ARG image
FROM ${image}

RUN useradd -u 210337 robin
COPY yum.conf /etc/yum.conf

COPY repos.d/* /etc/yum.repos.d/
RUN mkdir /root/pkgs.d/
COPY pkgs.d/* /root/pkgs.d/
COPY yum.sh /root/
RUN /root/yum.sh

RUN pip install -U pip flake8 flake8-colors flake8-comprehensions flake8-docstrings \
                flake8-import-order pep8-naming==0.5.0 virtualenv

RUN wget -O /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod 755 /usr/bin/jq
RUN npm i npm@latest -g
RUN npm install -g jshint
RUN npm install -g @oracle/ojet-cli@4.0.0
RUN chsh -s /usr/bin/zsh robin

ENV LANG en_GB.utf8
ENV TERM xterm-256color
ENV DEFAULT_USER robin

RUN echo 'robin         ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers
USER robin
ENTRYPOINT [ "/usr/bin/tmux", "-u" ]
