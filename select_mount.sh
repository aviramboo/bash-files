#!/bin/bash
#
#mount specific directories with specific protocols on servers
#
echo " nfs_apps - debby,dobby,neo"
echo " cifs_sites - marty,tele-internet,tele-ticket,tele-monitor,tele-host"

PS3='Please select the server name:  '
LIST="hippie beagle victoria eve web2 nfs_app cifs_sites exit"

select i in $LIST
     do
     if [ $i = "beagle" ]
     then
           mount -t nfs 192.168.220.10:/vol/VastData/Data /mysqlData         #storage - beagle
           mount -t nfs 192.168.220.11:/vol/VastData2 /vastdata2             #storage - victoria
     elif [ $i = "victoria" ]
     then
           mount -t nfs 192.168.220.10:/vol/VastData/Data /mysqlData         #storage - beagle
           mount -t nfs 192.168.220.11:/vol/VastData2 /vastdata2             #storage - victoria
     elif [ $i = "hippie" ]
     then 
               ### mount main code directories
           mount -t nfs fas250:/vol/vol3/IMSC /imsc
           mount -t nfs fas250:/vol/vol3/Content /imsc/content
           mount -t nfs fas250:/vol/vol3/Lib /var/lib/vast
           mount -t nfs fas250:/vol/vol3/Backup /backup
               ### mount ramfs and move file to ram
#           cd /imsc
#           mount -t ramfs /dev/ram0 /imsc/api
#           tar vfxz api.tgz
#           mount -t ramfs /dev/ram1 /imsc/lib
#           tar vfxz lib.tgz
#           mount -t ramfs /dev/ram2 /imsc/config
#           tar vfxz config.tgz
           mount -t smbfs -o username=aviramb //10.107.1.38/BankIsrael /imsc/interfaces/NP/BankIsrael
           mount -t smbfs -o username=aviramb //10.107.1.38/OfficeCore /imsc/interfaces/NP/officecore
     elif [ $i = "nfs_app" ]
     then
              ### mount main code directories
           mount -t nfs fas250:/vol/vol3/IMSC /imsc
           mount -t nfs fas250:/vol/vol3/Content /imsc/content
           mount -t nfs fas250:/vol/vol3/Lib /var/lib/vast
           mount -t nfs fas250:/vol/vol3/Backup /backup
              ### mount ramfs and move file to ram   
#           cd /imsc
#           mount -t ramfs /dev/ram0 /imsc/api
#           tar vfxz api.tgz
#           mount -t ramfs /dev/ram1 /imsc/lib
#           tar vfxz lib.tgz
#           mount -t ramfs /dev/ram2 /imsc/config
#           tar vfxz config.tgz
     elif [ $i = "cifs_sites" ]
     then
           mount -t cifs -o username=appbackup,password=Passw0rd 10.107.0.145:\nfsbackup /backup
     elif [ $i = "eve" ]
     then
           mount -t cifs -o username=teledom1/appbackup,password=Passw0rd 10.107.0.145:/nfsbackup /backup
     elif [$i = "web2" ]
     then
           mount -t cifs -o username=teledom1/appbackup,password=Passw0rd 10.107.0.145:nfsbackup /backup
     elif [ $i = "exit" ]
     then
           exit
     fi
break
done
