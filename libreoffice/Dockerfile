FROM firefox

USER root

RUN yum --enablerepo ol7_optional_latest install -y libreoffice xdg-utils

ENV LANG en-GB
ENV PULSE_SERVER tcp:127.0.0.1:4713
USER robin
CMD libreoffice
