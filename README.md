# AR Drone WPA2 Support
Forked from Diego Araos [ardrone-wpa2](https://github.com/daraosn/ardrone-wpa2) github project

Diego's scripts do not work on Windows machines because telnet is not available. Telnet can be added using Windows add/remove programs but security features do not allow it to be run with the scripts even from a Bash prompt. I found it easier to take the final output of his scripts and create a net-new bash file that is uploaded to the drone.

# How to Install
Edit the connect.sh script locally

    ifconfig ath0 {new drone ip}; iwconfig ath0 essid "{ssid}" && wpa_supplicant -B -Dwext -iath0 -c/etc/wpa_supplicant.conf
    // replace {new drone ip} with your preferred static IP
    // replace {ssid} with the SSID of your Wifi network

Connect your laptop to your drone and copy all required files to the drone including the edited connect script. If your drone's IP is not 192.168.1.1 then edit the curl lines accordingly. After copying the files move them from the default FTP directory of /data/video to their final location and make them executable.

    curl -T bin/wpa_cli "ftp://192.168.1.1"
    curl -T bin/wpa_passphrase "ftp://192.168.1.1"
    curl -T bin/wpa_supplicant "ftp://192.168.1.1"
    curl -T bin/boot2drone.sh "ftp://192.168.1.1"
    mv /data/video/wpa_* /bin
    mv /data/video/boot2drone.sh /bin
    chmod +x /bin/wpa_*
    chmod +x /bin/boot2drone.sh

Create a new wpa_supplicant.conf file


    wpa_passphrase {ssid} {password} > /etc/wpa_supplicant.conf
    // Replace {ssid} and {password} with your Wifi credentials

# How to Connect
Connect your laptop to your drone. By default it exposes itself as a WAP listening on 192.168.1.1. If for some reason your drone does not use this address change the following line accordingly.

    telnet 192.168.1.1
    connect.sh
    // connect.sh is in /bin and should be in your path

Your existing laptop connection will now be broken. Connect your laptop to the same Wifi network as the drone and try to ping or telnet to the static address you set in connect.sh.

# Collaboration

Feel free to fork and collaborate :)

# License

ardrone-wpa2 @tforster, MIT (see LICENSE)

wpa_supplicant (BSD licensed)
Copyright (c) 2003-2013, Jouni Malinen <j@w1.fi> and contributors.