#!/usr/bin/python

from datetime import date, datetime, time, timedelta
import sys

from humanize import naturaltime

from pytz import timezone

TUESDAY = 1
THURSDAY = 3

now = date.today()
utc = timezone('UTC')

tuesday = now + timedelta((TUESDAY - now.weekday()) % 7)
thursday = now + timedelta((THURSDAY - now.weekday()) % 7)

releases = [
    datetime.now(utc) - datetime.combine(tuesday, time(hour=14, tzinfo=utc)),
    datetime.now(utc) - datetime.combine(thursday, time(hour=14, tzinfo=utc))
]

sys.stdout.write(" | ".join(map(naturaltime, reversed(sorted(releases)))))
