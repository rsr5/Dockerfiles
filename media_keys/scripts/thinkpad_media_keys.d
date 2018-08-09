#!/usr/sbin/dtrace -qs

#pragma D option destructive
#pragma D option quiet

string keyboard;
int direction;

BEGIN {
  /* which direction to count, 1 for down and 0 for up. */
  direction = 1;

  /* Key codes */
  play  = 144;
  volup = 115;
  voldn = 114;
  next  = 163;
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == "ThinkPad Extra Buttons" &&
  arg3 == direction &&
  arg2 == play
/
{
  system("python /root/message.py topic/message '^fn(Font Awesome 5 Free Solid) / ^fn() (Play / Pause)'");
  system("echo pause > /mplayer/mplayer_fifo");
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == "AT Translated Set 2 keyboard" &&
  arg3 == direction &&
  arg2 == volup
/
{
  system("python /root/message.py topic/message '^fn(Font Awesome 5 Free Solid)^fn() (Volume ++)'");
  system("echo volume 10 > /mplayer/mplayer_fifo")
}

fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == "AT Translated Set 2 keyboard" &&
  arg3 == direction &&
  arg2 == voldn
/
{
  system("python /root/message.py topic/message '^fn(Font Awesome 5 Free Solid)^fn() (Volume --)'");
  system("echo volume -10 > /mplayer/mplayer_fifo")
}
/*
 * No next key on the think pad.  Might choose another one.
 *
fbt:vmlinux:input_event:entry
/
  stringof(((struct input_dev *)arg0)->name) == keyboard &&
  arg3 == direction &&
  arg2 == next
/
{
  system("echo stop > /mplayer/mplayer_fifo")
}
*/
