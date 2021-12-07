#!/bin/bash

filepostfix=$(date +"%Y%m%d%H")


/etc/scripts/check_backups.sh > /var/log/backup_checks/backups_check.log

COUNT=`cat /var/log/backup_checks/backups_check.log |wc -l`

if [ $COUNT != 17 ]
then
   echo "not all backups were done - date: $filepostfix" >> /var/log/backup_checks/db_backup_check.log
else 
   echo "all backups are done - date: $filepostfix" >> /var/log/backup_checks/db_backup_check.log
fi
