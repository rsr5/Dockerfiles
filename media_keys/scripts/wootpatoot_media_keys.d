#!/usr/sbin/dtrace -qs

#pragma D option destructive
#pragma D option quiet

string keyboard;
int direction;

BEGIN {
  /* Change to the name of your keyboard */
  keyboard = "Wootpatoot Lets Split v2";
  /* which direction to count, 1 for down and 0 for up. */
  direction = 1;

  /* Key codes */
  play  = 164;
  volup = 115;
  voldn = 114;
  next  = 163;
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == keyboard &&
  arg3 == direction &&
  arg2 == play
/
{
  system("python /root/message.py topic/message 'Play / Pause'");
  system("echo pause > /mplayer/mplayer_fifo")
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == keyboard &&
  arg3 == direction &&
  arg2 == volup
/
{
  system("python /root/message.py topic/message 'Volume ++'");
  system("echo volume 10 > /mplayer/mplayer_fifo")
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == keyboard &&
  arg3 == direction &&
  arg2 == voldn
/
{
  system("python /root/message.py topic/message 'Volume --'");
  system("echo volume -10 > /mplayer/mplayer_fifo")
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == keyboard &&
  arg3 == direction &&
  arg2 == next
/
{
  system("python /root/message.py topic/message 'Next Track'");
  system("echo stop > /mplayer/mplayer_fifo")
}
