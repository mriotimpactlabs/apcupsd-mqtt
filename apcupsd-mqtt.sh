#!/bin/bash
#Script to grab APC status and update Domoticz variables.

#APC universal power supply data feed.
data=`/sbin/apcaccess status`

#MQTT topic.
mqtt_topic="domoticz/out/LangwaterGH/UPS"


#Assigns variables to the 
ups_status=`awk '/STATUS / {print $3}' <<< "$data"`
ups_line_voltage=`awk '/LINEV / {print $3}' <<< "$data"`
ups_load=`awk '/LOADPCT / {print $3}' <<< "$data"`
ups_battery_charge=`awk '/BCHARGE / {print $3}' <<< "$data"`
ups_battery_voltage=`awk '/BATTV    / {print $3}' <<< "$data"`
ups_time_remaining=`awk '/TIMELEFT / {print $3}' <<< "$data"`
ups_model=`awk '/MODEL / {print $4 $5 }' <<< "$data"`

#JSON String to be pushed to MQTT.
payload="{\"Status\":\""$ups_status"\",\"LineVoltage\":\""$ups_line_voltage"V\",\"Load\":\""$ups_load"%\",\"BatteryCharge\":\""$ups_battery_charge"%\",\"BatteryVoltage\":\""$ups_battery_voltage"V\",\"TimeRemaining\":\""$ups_time_remaining"m\",\"Model\":\""$ups_model"}"

#Publishes UPS data via MQTT.
mosquitto_pub -h iot.eclipse.org -m $payload -t $mqtt_topic


:'

Script description:

Instructions

1.) Install dependency software.

# $ apt-get update && apt-get install -y apcupsd mosquitto-clients

2.) Give permissions.

 $ chmod +x apcupsd-mqtt.sh

3.) Add this to cronjobs.

'
