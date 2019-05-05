#!/bin/sh

while true; do

    sleep 20

    if [ -c "/dev/#FOURGBOTDEVICE" ] ; then

        :

    else

        echo "Device not found, restarting..."
        /usr/sbin/reboot

    fi

done
