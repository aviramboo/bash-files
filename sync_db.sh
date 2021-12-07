#!/bin/bash
filepostfix=$(date +"%Y%m%d%H%M").sql
cd /mnt/site_name/db_backup/
mysqldump -uUSER -pPASSWORD  site_name > $filepostfix
