#!/bin/bash
#
#script to update resources,update system and install relevant packages
#

echo "********************************************************"
echo "-----Adding additional dag repo to packages sources-----"
echo "********************************************************"
PS3='Enter choice:   '
LIST="Centos5-32bit Centos5-64bit Centos6-32bit Centos6-64bit skip"

select i in $LIST
   do
   if [ $i = "Centos5-32bit" ]
   then
          wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm
          rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
          rpm -K rpmforge-release-0.5.2-2.el5.rf.*.rpm
          rpm -i rpmforge-release-0.5.2-2.el5.rf.*.rpm
   elif [ $i = "Centos5-64bit" ]
   then
          wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
          rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
          rpm -K rpmforge-release-0.5.2-2.el5.rf.*.rpm
          rpm -i rpmforge-release-0.5.2-2.el5.rf.*.rpm
   elif [ $i = "Centos6-32bit" ]
   then
          wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
          rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
          rpm -K rpmforge-release-0.5.2-2.el6.rf.*.rpm
          rpm -i rpmforge-release-0.5.2-2.el6.rf.*.rpm
   elif [ $i = "Centos6-64bit" ]
   then 
          wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
          rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
          rpm -K rpmforge-release-0.5.2-2.el6.rf.*.rpm
          rpm -i rpmforge-release-0.5.2-2.el6.rf.*.rpm       
   elif [ $i = "skip" ]
   then
          break
   fi
break
done

echo "*************************"
echo "-----Updating system-----"
echo "*************************"
echo "Do you want to update system? y/n: "
read VAR
   if [ $VAR = "y" ]
   then
          yum -y update
          yum -y upgrade
   fi

echo "***************************************************"
echo "-----installing relevant packages and services-----"
echo "***************************************************"
PS3='Enter choice:   '
LIST="WebServer-Apache WebServer-Apache-Nginx MysqlServer MinimalServer"
select i in $LIST
   do
   if [ $i = "WebServer-Apache" ]
   then
          yum -y install httpd
          yum -y install httpd-devel
          yum -y install openssl
          yum -y install openssl-devel
	  yum -y install php
	  yum -y install php-devel
	  yum -y install php-gd
	  yum -y install php-mysql
	  yum -y install php-pear
	  yum -y install php-xml
	  yum -y install php-xmlrpc
	  yum -y install php-pecl-Fileinfo
          yum -y install sendmail
          chkconfig --level 35 httpd on
          chkconfig --level 35 sendmail on
   elif [ $i = "WebServer-Apache-Nginx" ]
   then
          yum -y install httpd
          cd /etc/yum.repos.d/
          echo -e [nginx]'\n'name=nginx repo'\n''baseurl=http://nginx.org/packages/centos/$releasever/$basearch/''\n'gpgcheck=0'\n'enabled=1 > nginx.repo
          yum -y install nginx
          yum -y install httpd-devel
          yum -y install openssl
          yum -y install openssl-devel
          yum -y install php
          yum -y install php-devel
          yum -y install php-gd
          yum -y install php-mysql
          yum -y install php-pear
          yum -y install php-xml
          yum -y install php-xmlrpc
          yum -y install php-pecl-Fileinfo
          yum -y install sendmail
          chkconfig --level 35 httpd on
          chkconfig --level 35 sendmail on

   elif [ $i = "MysqlServer" ]
   then
          yum -y install mysql-server
          yum -y install mysql
          chkconfig --level 35 mysqld on
   elif [ $i = "MinimalServer" ]
   then
          echo "--nothing to install--"
   fi
break
done

echo "****************************"
echo "-----Sync Time With NTP-----"
echo "****************************"
echo "Do you want to sync server with local NTP Server? y/n: "
read VAR
   if [ $VAR = "y" ]
   then
         cd /etc
         mkdir scripts
         cd scripts
         wget http://10.107.1.110/scripts/ntp_sync.sh
         chmod +x ntp_sync.sh
         crontab -l > file; echo '*/15 * * * * /etc/scripts/ntp_sync.sh >/dev/null 2>&1' >> file; crontab file
         echo  "--Server is now sync with main NTP server--"
   fi

echo "*********************"
echo "-----adding user-----"
echo "*********************"
echo "Would you like to configure new sudo user? y/n: "
read VARI
   if [ $VARI = "y" ]
   then
       echo "Enter user name:   "
       read name
       useradd $name
       passwd $name
       echo "$name ALL=(ALL)       ALL" >> /etc/sudoers         
   fi

      
#
#END

