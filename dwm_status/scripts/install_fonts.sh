#!/bin/bash -xe

cd /var/tmp
wget https://use.fontawesome.com/releases/v5.2.0/fontawesome-free-5.2.0-desktop.zip
unzip fontawesome-free-5.2.0-desktop.zip
cp fontawesome-free-5.2.0-desktop/otfs/*.otf /usr/local/share/fonts
fc-cache -f -v
rm -rf fontawesome-free-5.2.0-desktop
