#!/bin/bash
sqlplus "/as sysdba" <<EOF
alter database end backup;
exit;
EOF
status="$?"
time=`date`
if [ "$status" != "0" ]
than
echo "End backup success.   Time:  $time" >> /home/oracle/lock_db.log
else
echo "End backup failed.   Time:  $time"  >> /home/oracle/lock_db.log

