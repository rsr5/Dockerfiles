#!/bin/bash -xe

yum install -y --enablerepo mcepl-vim8 \
               --enablerepo ol7_developer_nodejs8 \
               --enablerepo ol7_developer_EPEL \
               --enablerepo flatcap-neomutt \
               --enablerepo ol7_software_collections \
               --enablerepo ol7_optional_latest \
                `cat /root/pkgs.d/*`
