#!/bin/bash

# DON'Ts
# hand in $1 and $2 without trailing /
# 
toverifydir=$1
chksumdir=$2
find $toverifydir -type f |
while read each; do
	regexp="s/$(echo $toverifydir | sed -e "s/\//\\\\\//g")//"
	file=$(echo "$each" | sed "$regexp")
	test -e $chksumdir/$file.sum && { 
		hash=`cat "$chksumdir/$file.sum" | awk '{ print $1 }'`
	        #echo "$hash $toverifydir/$file" | sha512sum -c 
	        echo "$hash $toverifydir/$file" | sha512sum -c --quiet 
	} || {
		echo "warning: file without checksum: $toverifydir$file"
	}
done

