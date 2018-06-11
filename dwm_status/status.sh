#!/bin/bash

if [ ! -f /var/run/key_presses/today ]; then
  echo -n 0 > /var/run/key_presses/today;
fi

conky -c ~/.conkydwmrcnew | \
dzen2 -w 900\
      -ta r\
      -x "-900"\
      -fn "Meslo LG S for Powerline:pixelsize=14:antialias=true:autohint=true"

