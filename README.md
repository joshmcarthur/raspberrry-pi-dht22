DHT22 for Raspberry Pi 0
====

This repository contains a reference implementation of a DHT22 temperature sensor that reports the
sensor temperature and humidity to STDOUT and an MQTT broker.

Requirements
----

* Raspberry Pi (tested on Pi 0 W, should also work on Pi 2/3 and I suspect any other Pi with a
  network connection available).
* DHT22 temperature sensor
* Docker installed on Raspberry Pi with Docker-compose (docker-compose convenient, but not required)


Wiring
---

![Pinout](https://pinout.xyz/resources/raspberry-pi-pinout.png)
From https://pinout.xyz.

This is how I have my DHT22 wired. A resistor is probably required or at least strongly recommended,
but mine works fine without one. If one _was_ required, my research suggested it should be 5k-10k
resistor between the data and ground pins. 

1. 3.3v (bottom left) to left hand pin on DHT22 (with intake grill facing up)
2. GPIO4 (4th from left) to second-from-left pin on DHT22
3. Ground (bottom right) to right hand pin on DHT22

Operation
---

With the DHT22 set up as above, I run this using `docker-compose up -d` on my raspberry pi. Here are
some notes that may help with your specific setup:

* I have my own environment variables in `docker-compose.yml`. You will need to provide your own. 
* I have not added support for an MQTT username/password as my broker just operates within my local
network. 
* GPIO pin 4 is hardcoded - just change it in `fetch.py` to whatever you'd prefer.
* The `privileged: true` flag in `docker-compose.yml` is needed so that the Adafruit DHT22 library
  can see and communicate with GPIO. There are other ways of accessing GPIO with Docker, but
privileged mode is the easiest and the one that consistently works. 

License
---

See LICENSE. Please note that `Adafruit_DHT` is bootstrapped by the `Dockerfile` in this project and
is MIT licensed as of release. See
https://github.com/adafruit/Adafruit_Python_DHT/blob/master/LICENSE for more information.

