#!/bin/bash

# 7 day rotating non incremental backup.

# directory to backup
BDIR=/www/site_name

########################################################################

BACKUPDIR=`date +%A`
OPTS="--force --ignore-errors --delete --backup --backup-dir=/mnt/site_name/code_backup/$BACKUPDIR -a"

export PATH=$PATH:/bin:/usr/bin:/usr/local/bin

# the following line clears the last weeks incremental directory
[ -d $HOME/emptydir ] || mkdir $HOME/emptydir
rsync --delete -a $HOME/emptydir/ /mnt/site_name/code_backup/$BACKUPDIR/
rmdir $HOME/emptydir

# now the actual transfer
rsync $OPTS $BDIR /mnt/site_name/code_backup/$BACKUPDIR
