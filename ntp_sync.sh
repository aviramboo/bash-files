#!/bin/bash

#finding the linux distribution
#israel ntp- il.pool.ntp.org
dist=`head -n 1 /etc/issue |cut -f 1 -d ' '`

if [ "$dist" == "CentOS" ]; then 
         /sbin/ntpdate 0.centos.pool.ntp.org
         /sbin/hwclock --systohc
else 
    if [ "$dist" == "Debian" ]; then
         /usr/sbin/ntpdate 0.debian.pool.ntp.org
         /sbin/hwclock --systohc
fi
fi
