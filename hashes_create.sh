#!/bin/bash

if [ -z "$*" ]; then
  echo "$0 [VERIFY_DIR] [CHKSUM_DIR]"
  exit
fi

toverifydir=$1
chksumdir=$2

filelist=$2.txt

rm -f $filelist
touch $filelist

find $toverifydir -type f |
while read each; do
	regexp="s/$(echo $toverifydir | sed -e "s/\//\\\\\//g")//"
	file=$(echo "$each" | sed "$regexp")
	echo $file
	echo "$file" >> $filelist
	dirname=`dirname "$file"`
	mkdir -p "$chksumdir/$dirname"
	sha512sum "$each" | awk '{ print $1 }' > "$chksumdir/$file.sum"
done
