#!/bin/bash
filepostfix=$(date +"%Y%m%d")

find /backup/smartdeal/db_backup/smartdeal -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/smartdeal/db_backup/ads_smartdeal -mtime -1 -type f  |grep -i sql #-iname "$filepostfix"

find /backup/maod/db_backup -mtime -1 -type f  |grep -i sql #-iname "$filepostfix"

##find /backup/dealcity/db_backup -mtime -1 -type f  |grep -i sql #-iname "$filepostfix"

##find /backup/ads_dealcity/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/appbuzz/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

#find /backup/b144/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/buyme/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/iplanet/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/lottocash/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/openfire -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/otrs/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

##find /backup/redmine/db_backup -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/tele-monitor -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/mailbit/db_backup  -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/mycafecafe/db_backup  -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/cellcom/db_backup  -mtime -1 -type f |grep -i sql #-iname "$filepostfix"

find /backup/dbd/db_backup  -mtime -1 -type f |grep -i sql

find /backup/leumit/db_backup  -mtime -1 -type f |grep -i sql

find /backup/VtigerCRM/db_backup  -mtime -1 -type f |grep -i sql

find /backup/orange/db_backup  -mtime -1 -type f |grep -i sql
