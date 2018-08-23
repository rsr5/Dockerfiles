#!/bin/bash -xe

if grep 'VERSION="7.5"' /etc/os-release; then
  cp /root/repos.d/ol7/* /etc/yum.repos.d/
  yum install -y --enablerepo mcepl-vim8 \
                 --enablerepo ol7_developer_nodejs8 \
                 --enablerepo ol7_developer_EPEL \
                 --enablerepo flatcap-neomutt \
                 --enablerepo ol7_software_collections \
                 --enablerepo ol7_optional_latest \
                  `cat /root/pkgs.d/ol7/*`
  npm i npm@latest -g && npm install -g jshint && npm install -g @oracle/ojet-cli@4.0.0
  pip install -U pip
else
  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
  yum install -y `cat /root/pkgs.d/ol6/*`
fi
