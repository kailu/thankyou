#!/bin/bash
# UP=$(pgrep mysql | wc -l);
# Set it up as a cron job(check the status every 3 mins to make sure db is up.):
# */3 * * * * /home/kailu/check_mysql.sh >> /home/kailu/mysql_status.log
UP=$(/etc/init.d/mysqld status | grep running | grep -v not | wc -l);

now=$(date +"%T")
echo "Current time: $now"


if [ "$UP" -ne 1 ];
then
        echo "MySQL is down.";
        sudo service mysqld restart

else
        echo "All is well.";
fi
