#!/usr/bin/bash

for script in `ls -1 /root/events.d/`; do
  echo $script;
  eval "/root/events.d/$script &";
done;

wait;
