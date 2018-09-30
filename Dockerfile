FROM python:alpine
ENV DHT22_LIBRARY_GIT_URL https://github.com/adafruit/Adafruit_Python_DHT.git
RUN mkdir -p /opt/adafruit-dht22
WORKDIR /opt/adafruit-dht22
RUN apk --update add git build-base jq mosquitto-clients &&\  
    git clone $DHT22_LIBRARY_GIT_URL . &&\
    python setup.py install &&\ 
    sed -i -e 's/\/usr\/bin\/python/\/usr\/bin\/env python/g' examples/AdafruitDHT.py

RUN mkdir -p /opt/dht22 
ADD . /opt/dht22/
WORKDIR /opt/dht22
ENTRYPOINT ["sh"]
CMD ["poll.sh"]
