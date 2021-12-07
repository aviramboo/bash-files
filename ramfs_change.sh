#!/nin/bash
#
#mount ramfs and copy directories to mount point
#
#copy directories for backup
cp -rp /imsc/api /imsc/api.best
cp -rp /imsc/lib /imsc/lib.best
cp -rp /imsc/config /imsc/config.best

#
#mount ramfs
mount -t ramfs /dev/ram0 /imsc/api
mount -t ramfs /dev/ram1 /imsc/lib
mount -t ramfs /dev/ram2 /imsc/config

#
#copy directories to mount dir
cp -rp /imsc/api.best /imsc/api 
cp -rp /imsc/lib.best /imsc/lib
cp -rp /imsc/config.best /imsc/config
