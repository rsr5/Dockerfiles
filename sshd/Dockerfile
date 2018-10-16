FROM tmux

USER root

RUN yum install -y openssh-server && \
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

EXPOSE 2222

CMD /usr/sbin/sshd -D

