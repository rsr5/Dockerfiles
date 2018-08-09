from base64 import b64decode
from subprocess import Popen

import paho.mqtt.client as mqtt

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("topic/message")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    print repr(b64decode(msg.payload))
    print b64decode(msg.payload)
    Popen(
        [
            '/bin/dzen2_popup.sh',
            b64decode(msg.payload)
        ]
    ).communicate()

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("mqtt", 1883, 60)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
client.loop_forever()
