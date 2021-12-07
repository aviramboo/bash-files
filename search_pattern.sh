#!/bin/bash
#
# script to find pattern in all files in system
echo "Enter path to start from:  "
read PATHH
echo "Enter pattern tp search for:   "
read PATTERN
find "$PATHH" -type f -exec grep -l "$PATTERN" {} + > /tmp/search_resault.txt

echo "search ended - search resault found in /tmp/search_resault.txt"
