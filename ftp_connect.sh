#!/bin/bash

echo "Press U for Upload or D for Download"
read CHOICE

echo "enter FTP server IP"
read SERVER

echo "enter username"
read USER

echo "enter password"
read PASS

echo "enter file name"
read FILE

if [ $CHOICE == "U" ]
then
ftp -n <<EOF
open "$SERVER"
user "$USER" "$PASS"
put "$FILE"
exit
EOF
else
ftp -n <<EOF
open "$SERVER"
user "$USER" "$PASS"
get "$FILE"
exit
EOF
fi

