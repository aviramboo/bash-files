#!/bin/bash
#
#This script will change server ip including changes in network files\web file\hosts file
#

echo  "*********************************************************"
echo  "***This script will change only one network address!!!***"
echo  "*********************************************************"
 
sleep 2
 
echo "Enter old ip:   "
read OLDIP

echo "Enter new ip:   "
read NEWIP

echo "Is there also netmask and gateway changes needed? y/n  "
read ANSWER1

echo "Is this server also requires changes? y/n  "
read ANSWER2


if [ "$ANSWER1" == "y" ]
then 

    echo "Enter old netmask:   "
    read OLDMASK

    echo "Enter new netmask:   "
    read NEWMASK

    echo "Enter old gateway:   "
    read OLDGW

    echo "Enter new gateway:   "
    read NEWGW

    echo "Enter path for web files:   "
    read WPATH

#change netmask and gateway in network scripts files

   find /etc/sysconfig/network-scripts -type f sed 's/"$OLDMASK"/"$NEWMASK"/g' {} \;
 
    if [ $? != 0 ] 
    then
         echo "problen changing netmask"
    fi
   find /etc/sysconfig/network-scripts -type f sed 's/"$OLDGW"/"$NEWGW"/g' {} \;
    if [ $? != 0 ] 
    then
         echo "problen changing gateway"
    fi
fi

#change network address  in network scripts files
find /etc/sysconfig/network-scripts -type f sed 's/"$OLDIP"/"$NEWIP"/g' {} \;
if [ $? != 0 ] 
then
   echo "problen changing ip"
fi


#change hosts file
find /etc/hosts -type f sed 's/"$OLDIP"/"$NEWIP"/g' {} \;
if [ $? != 0 ] 
then
   echo "problen changing hosts file"
fi

if [ "$ANSWER2" == "y" ]
then
 #change sites files
 find $WPATH -type f sed 's/"$OLDIP"/"$NEWIP"/g' {} \;
 if [ $? != 0 ] 
 then
    echo "problen changing site ip"
 fi
fi

#restart networking to changes to take affect
echo "Restart networking y/n?    "
read ANSWER3
if [ "$ANSWER3" == "y" ]
then
/etc/init.d/network restart
fi

echo   "***************"
echo   "changes applied"
echo   "***************"
echo   "restart relevant services affected by network changes! "


