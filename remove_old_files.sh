#!/bin/bash

find /backup/tele-monitor -mtime +3 -type f -exec rm -rf {} \;

find /backup/smartdeal/db_backup/smartdeal -mtime +3 -type f -exec rm -rf {} \;

find /backup/smartdeal/db_backup/ads_smartdeal -mtime +3 -type f -exec rm -rf {} \;

find /backup/redmine/db_backup -mtime +3 -type f -exec rm -rf {} \;

find /backup/otrs/db_backup -mtime +3 -type f -exec rm -rf {} \;

find /backup/openfire -mtime +3 -type f -exec rm -rf {} \;

find /backup/mailbit/db_backup -mtime +3 -type f -exec rm -rf {} \;

find /backup/buyme/db_backup -mtime +3 -type f -exec rm -rf {} \;

find /backup/appbuzz/db_backup -mtime +3 -type f -exec rm -rf {} \;

find /backup/iplanet/db_backup/iplanet_generic -mtime +3 -type f -exec rm -rf {} \;

find /backup/iplanet/db_backup/iplanet_ista -mtime +3 -type f -exec rm -rf {} \;

find /backup/iplanet/db_backup/iplanetweb -mtime +3 -type f -exec rm -rf {} \;

find /backup/iplanet/db_backup/iplanetwww -mtime +3 -type f -exec rm -rf {} \;

find /backup/iplanet/db_backup/pick_and_date -mtime +3 -type f -exec rm -rf {} \;

