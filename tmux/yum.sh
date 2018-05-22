#!/bin/bash -xe

yum install -y --enablerepo mcepl-vim8 \
               --enablerepo ol7_developer_nodejs8 \
               --enablerepo ol7_developer_EPEL \
               --enablerepo flatcap-neomutt \
                `cat /root/pkgs.d/*`
