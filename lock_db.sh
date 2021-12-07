#!/bin/bash
sqlplus "/as sysdba" <<EOF
alter database begin backup;
exit;
EOF
status="$?"
time=`date`
if [ "$status" != "0" ]
than
echo "Begin backup success.   Time:  $time" >> /home/oracle/lock_db.log
else
echo "Begin backup failed.   Time:  $time"  >> /home/oracle/lock_db.log

