#!/bin/bash


FILENAME=$1

if [ -z ${FILENAME} ]; then 
echo "machines list file must be entered!!!"
exit
fi

cat $FILENAME | while read LINE
do
ping -c 5 "$LINE"
done





