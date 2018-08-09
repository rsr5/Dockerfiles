#!/bin/bash -xe

sw=$(xdpyinfo | awk -F '[ x]+' '/dimensions:/{print $3}');
sh=$(xdpyinfo | awk -F '[ x]+' '/dimensions:/{print $4}');

width=200
height=100

top=$((($sh / 2) - ($height / 2)));
left=$((($sw / 2) - ($width / 2)));

echo $1 | dzen2 -p 1 \
                -x $left \
                -y $top \
                -h $height \
                -w $width
                # -fn "Meslo LG S for Powerline:pixelsize=16:antialias=true:autohint=true"
