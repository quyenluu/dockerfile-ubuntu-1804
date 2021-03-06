#!/bin/bash
#get env MYSQL_ROOT_PASSWORD when docker run
echo "=> update App source"
/usr/local/bin/docker-entrypoint.sh --character-set-server=utf8 --collation-server=utf8_unicode_ci --sql_mode="" & 

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "status" > /dev/null 2>&1
    RET=$?
done
echo "=> mySQL service started"

#start cron
service cron start

#Start Apache2 in foreground mode
/usr/local/bin/apache2-foreground