#!/usr/sbin/dtrace -qs

#pragma D option destructive
#pragma D option quiet

string keyboard;
int direction;
int keypresses;

BEGIN {
  /* Change to the name of your keyboard */
  keyboard = "Wootpatoot Lets Split v2";
  /* which direction to count, 1 for down and 0 for up. */
  direction = 1;
  /* The current count of key presses */
  keypresses = 0;

  /* Ensure the dir in /var/run exist. */
  system("mkdir -p /var/run/key_presses");
}

fbt:vmlinux:input_event:entry
/stringof(((struct input_dev *)arg0)->name) == keyboard && arg3 == direction/
{
  keypresses += 1;
}

profile:::tick-995ms
{
  fmt = "%m-%d-%y";
  system("echo %d > /var/run/key_presses/`date +%s`", keypresses, fmt);
  system("echo %d > /var/run/key_presses/today", keypresses);
}

profile:::tick-1s
/ 
  ((walltimestamp / 1000000000) % 60) == 59 && /* seconds */
  (((walltimestamp / 1000000000) % 3600) / 60) == 59 &&  /* minutes */
  (((walltimestamp / 1000000000) % 86400) / 3600) == 23 /* hours */
/
{
  keypresses = 0;
  system("rm /var/run/key_presses/today");
}
