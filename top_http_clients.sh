#!/bin/bash
#
#script to find top ip's connected to specific domain
#
DEST=/var/log/reports/ips
SOURCE=/var/log/httpd
echo "Enter log file to sort:      "
read LOG


[ ! -d $DEST ] && mkdir -p $DEST

#awk '{ print $1}' $LOG | sort  | uniq -c  | sort -nr > /var/log/reports/ips/$LOG.txt

if [ -f $LOG ]
then
        echo "Processing log for dealcity..."
        awk '{ print $1}' $SOURCE/$LOG | sort  | uniq -c  | sort -nr > $DEST/$LOG.txt
        echo "Report written to $DEST/$LOG.txt"
fi

