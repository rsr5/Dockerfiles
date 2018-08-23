from base64 import b64decode
import json
from subprocess import Popen, PIPE
import sys
import re

import paho.mqtt.client as mqtt


def screen_dimensions():
    """Retrieve the current screen dimensions."""
    process = Popen(['xdpyinfo'], stdout=PIPE, stderr=PIPE)
    stdout, stderr = process.communicate()
    match = re.compile(r"^\s*dimensions:\s*(\d+)x(\d+) pixels.*$", re.MULTILINE)
    return [int(x) for x in match.findall(stdout)[0]]


def dzen2(x, y, width, height, title, timeout, msg, events, slave_alignment):
    """Run dzen2."""
    args = [
        'dzen2',
        '-p', str(timeout),
        '-x', str(x), '-y', str(y),
        '-w', str(width), '-h', str(height),
        '-sa', slave_alignment,
        '-e', events
    ]

    if len(msg.strip().split('\n')) > 0:
        args.extend(['-l', str(len(msg.strip().split('\n')))])

    process = Popen(args, stdin=PIPE, stdout=PIPE, stderr=PIPE)
    process.communicate(title + ('' if msg == '' else ('\n' + msg)))


# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("topic/message")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    try:
        message = json.loads(msg.payload)

        width = message.get('width', 200)
        height = message.get('height', 17)
        timeout = message.get('timeout', 1)
        title = b64decode(message.get('title'))
        msg = b64decode(message.get('msg', ''))
        slave_alignment = message.get('slave_alignment', 'center')
        events = message.get('events', 'onstart=togglecollapse;')

        sw, sh = screen_dimensions()
        x = (sw / 2) - (width / 2)
        y = (sh / 2) - (height / 2)

        dzen2(x, y, width, height, title, timeout, msg, events, slave_alignment)
    except ValueError:
        print('Cannot parse JSON')
        print(msg.payload)


client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect(sys.argv[1], 1883, 60)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
client.loop_forever()
