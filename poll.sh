#!/bin/sh

while :
do
	climate=`python fetch.py`
	if [ $? -eq 0 ]
	then
		temp=`echo $climate | jq '.temperature.value'`
                humidity=`echo $climate | jq '.humidity.value'`
		echo "T: $temp"
		echo "H: $humidity"
		mosquitto_pub -h $MQTT_HOST -t $MQTT_TOPIC_PREFIX/temperature -m $temp
		mosquitto_pub -h $MQTT_HOST -t $MQTT_TOPIC_PREFIX/humidity -m $humidity
        else
		$?
	fi


	sleep 10s
done
