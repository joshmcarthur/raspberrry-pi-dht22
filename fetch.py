import time 
import sys
import Adafruit_DHT
import json

sensor = Adafruit_DHT.DHT22

# Set to your GPIO pin
pin    = 4

humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
if humidity is not None and temperature is not None:
    temp_data = { "unit": "celcius", "value": "{0:0.1f}".format(temperature) }
    humidity_data = { "unit": "%", "value": "{0:0.1f}".format(humidity) }
    print(json.dumps({"temperature": temp_data, "humidity": humidity_data}))
    exit(0)
else:
    print('Failed to get reading.', file=sys.stderr)
    exit(1)

