import base64
import sys

import paho.mqtt.client as mqtt

# This is the Publisher

client = mqtt.Client()
client.connect("mqtt", 1883, 60)
client.publish(sys.argv[1], base64.b64encode(sys.argv[2]));
client.disconnect();
