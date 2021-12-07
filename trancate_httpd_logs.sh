#!/bin/bash
#
#script to tar http logs every 6 hours and then empty the current logs
#
#

LogTime=$(date +%m-%d-%Y)
cd /var/log/httpd/

#
#changing hosts file and stopping httpd and postfix services
#
#cat /etc/backup/hosts_file/hosts_before_apache_stop.txt > /etc/hosts
#/etc/init.d/httpd stop
#/etc/init.d/postfix stop 

#
#orange market logs
#
tar -cvzf market.orange.co.il-access.log$LogTime.tar.gz market.orange.co.il-access.log
cat /dev/null > market.orange.co.il-access.log

tar -cvzf market.orange.co.il-error.log$LogTime.tar.gz market.orange.co.il-error.log
cat /dev/null > market.orange.co.il-error.log

tar -cvzf market.orange.co.il-access.log$LogTime.tar.gz market.orange.co.il-access.log
cat /dev/null > market.orange.co.il-access.log

tar -cvzf market.orange.co.il-ssl-access.log$LogTime.tar.gz market.orange.co.il-ssl-access.log
cat /dev/null > market.orange.co.il-ssl-access.log

tar -cvzf market.orange.co.il-ssl-error.log$LogTime.tar.gz market.orange.co.il-ssl-error.log
cat /dev/null > market.orange.co.il-ssl-error.log

#
#maod logs
#
tar -cvzf maod.co.il-ssl-error.log$LogTime.tar.gz maod.co.il-ssl-error.log
cat /dev/null > maod.co.il-ssl-error.log

tar -cvzf maod.co.il-ssl-access.log$LogTime.tar.gz maod.co.il-ssl-access.log
cat /dev/null > maod.co.il-ssl-access.log

tar -cvzf maod.co.il-error.log$LogTime.tar.gz maod.co.il-error.log
cat /dev/null > maod.co.il-error.log

tar -cvzf maod.co.il-access.log$LogTime.tar.gz maod.co.il-access.log
cat /dev/null > maod.co.il-access.log

#
#main http log
#
tar -cvzf error.log$LogTime.tar.gz error.log
cat /dev/null > error.log

tar -cvzf access.log$LogTime.tar.gz access.log
cat /dev/null > access.log

tar -cvzf ssl_error_log$LogTime.tar.gz ssl_error_log
cat /dev/null > ssl_error_log

tar -cvzf error_log$LogTime.tar.gz error_log
cat /dev/null > error_log


#
#changing hosts file and restarting httpd and postfix services
#
#/etc/init.d/httpd start
#/etc/init.d/postfix start
#cat /etc/backup/hosts_file/hosts_after_apache_restart.txt > /etc/hosts
