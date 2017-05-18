# apcupsd-mqtt

Script description:
Instructions
1.) Install dependency software.
# $ apt-get update && apt-get install -y apcupsd mosquitto-clients
2.) Give permissions.
 $ chmod +x apcupsd-mqtt.sh
3.) Add this to cronjobs.
4.) Modify /etc/apcupsd/apcupsd: Change IsConfigured=yes
5.) Modify /etc/apcupsd/apcupsd.conf
6.) sudo service apcupsd start
#Things to be considered:
#Topic Name
#Different Models will have different parameters dispensed.  This needs to be addressed.
#Build Script which has a list of configuration parameters in a single file.
