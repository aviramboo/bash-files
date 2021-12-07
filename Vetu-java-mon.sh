#!/bin/bash
#script to check java MEM consuming
#USE=$(jstat -gcutil `ps -ef | grep java | grep Bootstrap | awk '{print $2}'` | awk '{print $4}'| sed -n '2p')
VAR1=$(runuser -l swm -c "jstat -gcutil `ps -ef | grep java | grep Bootstrap | awk '{print $2}'` "| awk '{print $4}'| sed -n '2p')
VAR2=$(printf "%.0f\n" "$VAR1")
echo $VAR2
if [ $VAR2 -le 85 ]
then
exit 0
fi
if [ $VAR2 -gt 85 ]
then
 if [ $VAR2 -lt 95 ]
 then
 exit 1
 fi
fi
if [ $VAR2 -gt 95 ]
then
exit 2
fi
