#!/bin/bash

if [ ! -f /var/run/key_presses/today ]; then
  echo -n 0 > /var/run/key_presses/today;
fi

conky -c ~/.conkydwmstatus 2>> /dev/null | \
dzen2 -w 1400 \
      -bg '#222222' \
      -ta r \
      -x -1400 \
      -fn "Meslo LG S for Powerline:pixelsize=16:antialias=true:autohint=true" &
wait;
