FROM oraclelinux:7-slim
RUN useradd -u 210337 robin
COPY yum.conf /etc/yum.conf
COPY vim8.repo /etc/yum.repos.d/
COPY flatcap-neomutt-epel-7.repo /etc/yum.repos.d/

RUN yum install -y --enablerepo mcepl-vim8 \
                   --enablerepo ol7_developer_nodejs8 \
                   --enablerepo ol7_developer_EPEL \
                   --enablerepo flatcap-neomutt \
                tmux vim zsh util-linux git openssh nodejs man man-pages wget \
                gcc python-devel bzip2 tree python2-pip tree neomutt

RUN pip install -U pip flake8 flake8-colors flake8-comprehensions flake8-docstrings \
                flake8-import-order pep8-naming==0.5.0

RUN wget -O /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod 755 /usr/bin/jq
RUN npm install -g jshint
RUN npm install -g @oracle/ojet-cli@4.0.0
RUN chsh -s /usr/bin/zsh robin

ARG http_proxy
ENV http_proxy ${http_proxy}
ARG https_proxy
ENV https_proxy ${http_proxy}

ENV LANG en_GB.utf8
ENV TERM xterm-256color
ENV DEFAULT_USER robin

USER robin
ENTRYPOINT [ "/usr/bin/tmux", "-u" ]
