# Resets the network stack so that the Drone is no longer an open AP but instead logs into our temporary DAN-DRONE wifi network setup on the 6th Floor
# Then starts the NodeJS REST service to listen for "say" commands
# Will shortly add second NodeJS service to run the autonomous flight control
echo Switching drone to 192.168.0.10 - Do not forget to log into DAN-DRONE Wifi.; ifconfig ath0 192.168.0.10; iwconfig ath0 essid "DAN-DRONE" && wpa_supplicant -B -Dwext -iath0 -c/etc/wpa_supplicant.conf; /data/video/node /data/video/server.js & 