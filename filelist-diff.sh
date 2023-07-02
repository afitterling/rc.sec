#!/bin/bash
#

toverifydir=$1
chksumdir=$2

find $toverifydir -type f > /tmp/$(basename $1).txt
diff "$chksumdir.txt" "/tmp/$(basename $1).txt"

