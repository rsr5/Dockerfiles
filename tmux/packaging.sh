#!/bin/bash -xe

if grep 'VERSION="8.2"' /etc/os-release; then
  cp /root/repos.d/ol7/* /etc/yum.repos.d/
  dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
  #/usr/bin/ol_yum_configure.sh
  dnf install -y --enablerepo epel \
                  `cat /root/pkgs.d/ol7/*`
  npm install -g jshint && npm install -g @oracle/oraclejet@9.0.0 @oracle/ojet-cli@9.0.0
  pip3 install -U pip astor
else
  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
  yum install -y `cat /root/pkgs.d/ol6/*`
fi
