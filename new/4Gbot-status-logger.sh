#!/bin/sh

while true; do

    sleep 60
    DATE=`date +%Y%m%d`
    echo >> /var/log/4Gbot-$DATE
    echo ----------------------------------------------------------------->> /var/log/4Gbot-$DATE
    date >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    systemctl status 4Gbot-autossh-ssh.service --no-pager --full 2>&1 >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    systemctl status 4Gbot-autossh-vnc.service --no-pager --full 2>&1 >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    systemctl status 4Gbot-ppp-reconnect.service --no-pager --full 2>&1 >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    systemctl status 4Gbot-vnc-server@1.service --no-pager --full 2>&1 >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    ip addr >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    ip route >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    cat /var/log/syslog | egrep "(COPS:|CSQ:)" | tail -n 2 >> /var/log/4Gbot-$DATE
    echo >> /var/log/4Gbot-$DATE
    cat /var/log/syslog | egrep -i "PPP connection down" | tail -n 2 >> /var/log/4Gbot-$DATE
done
