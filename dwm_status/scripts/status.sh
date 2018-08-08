#!/bin/bash

if [ ! -f /var/run/key_presses/today ]; then
  echo -n 0 > /var/run/key_presses/today;
fi

# Start the mqtt server that listens for messages that should be sent to dzen2
python /bin/server.py &

conky -c ~/.conkydwmrcnew | \
dzen2 -w 1200\
      -ta r\
      -x "-1200"\
      -fn "Meslo LG S for Powerline:pixelsize=14:antialias=true:autohint=true" &

wait;
