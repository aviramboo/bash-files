#!/bin/bash
#
#this script will change network configurations
#

#this part will change gateway configurations at all interfaces
#
echo "Gateway need to be changed? y/n   "
read VARGW

if [ "$VARGW" == "y" ]
then
   echo  "***************************************"
   echo  "*** Changing gateway configurations ***"
   echo  "***************************************"

   echo "Enter old GATEWAY:   "
   read OLDGW

   echo "Enter new GATEWAY:   "
   read NEWGW

   find /etc/sysconfig/network-scripts/ifcfg-eth* -type f sed 's/"$OLDGW"/"$NEWGW"/g' {} \;
 
 echo "Gateway changing status is $?"
fi

#this part will change the netmask at all interfaces#
#
echo "NETMASK need to be changed? y/n   "
read VARMASK

if [ "$VARMASK" == "y" ]
then
   echo  "***************************************"
   echo  "*** Changing Netmask configurations ***"
   echo  "***************************************"

   echo "Enter old Netmask:   "
   read OLDMASK

   echo "Enter new Netmask:   "
   read NEWMASK

   find /etc/sysconfig/network-scripts/ifcfg-eth* -type f sed 's/"$OLDMASK"/"$NEWMASK"/g' {} \;
 
 echo "Netmask changing status is $?"
fi

#this part will change all interfaces network addreses
#

echo "Need Network interfaces IP change?  y/n"
 VARMORE

if [ "$VARMORE" == "y" ]
then  
     echo  "********************************"
     echo  "*** changing interfaces ip's ***"
     echo  "********************************"

   while [ "$VARMORE" == "y" ]
   do
     echo "Enter old IP:   "
     read OLDIP

     echo "Enter new IP:   "
     read NEWIP
 
     find /etc/sysconfig/network-scripts/ifcfg-eth* -type f sed 's/"$OLDIP"/"$NEWIP"/g' {} \; 
     echo "Interface IP change status is $? "
     find /etc/hosts -type f sed 's/"$OLDIP"/"$NEWIP"/g' {} \;
     echo "host file IP change status is $? "
   
     echo "More changes?  y/n "
     read VARMORE
   done
fi

#this part will restart networking service
#

echo "Restart Networking?  y/n "
VARSERVICE

if [ "$VARSERVICE" == "y" ]
then 
  /etc/init.d/network restart
fi  
