#!/bin/bash

if [ -z "$*" ]; then
  echo "$0 [VERIFY_DIR] [CHKSUM_DIR]"
  exit
fi

toverifydir=$1
chksumdir=$2
find $toverifydir -type f |
while read each; do
	regexp="s/$(echo $toverifydir | sed -e "s/\//\\\\\//g")//"
	file=$(echo "$each" | sed "$regexp")
	test -f "$chksumdir/$file.sum" && {
	  hash=`cat "$chksumdir/$file.sum" | awk '{ print $1 }'`
          #echo "$hash $toverifydir/$file" | sha512sum -c 
          echo "$hash $toverifydir/$file" | sha512sum -c --quiet 
	}
	test -f "$chksumdir/$file.sum" || {
	  echo "WARNING: untracked file: $toverifydir$file"
	}
done
