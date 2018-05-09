FROM oraclelinux:7-slim
RUN useradd -u 210337 robin
COPY yum.conf /etc/yum.conf
COPY vim8.repo /etc/yum.repos.d/vim8.repo
RUN yum install -y --enablerepo mcepl-vim8 --enablerepo ol7_developer_nodejs8 \
                tmux vim zsh util-linux git openssh nodejs man man-pages
RUN npm install -g jshint
RUN chsh -s /usr/bin/zsh robin
ENV LANG en_GB.utf8
ENV TERM xterm-256color
ENV DEFAULT_USER robin
USER robin
ENTRYPOINT [ "/usr/bin/tmux", "-u" ]
