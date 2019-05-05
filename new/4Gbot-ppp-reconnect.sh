#!/bin/sh

COUNTER=0

while true ; do

    ping -I ppp0 -c 1 -W 20 #FOURGBOTMASTERIP > /dev/null 2>&1

    if [ $? -eq 0 ] ; then

        COUNTER=0

    else

        if [ $COUNTER -eq 20 ] ; then
            echo "PPP connection problem, restarting..."
            /usr/sbin/reboot
        fi

        COUNTER=`expr $COUNTER + 1`

        echo "PPP connection down, reconnecting ($COUNTER) ..."

        sudo poff

        sleep 2

        sudo pon

    fi

    sleep 10

done
