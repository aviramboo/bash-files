#!/bin/bash

#file = `cat "test.txt"`

#for i in $file;
# do 
#echo "$i" 
#done

count="0"
cat test.txt | while read line; do 
    echo $line 
    echo "line count is: $count"
    count=$((count+1))
done
