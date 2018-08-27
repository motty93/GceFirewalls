#!/bin/bash

while read line
do
  if [ -s ./iptext/ip-addresses.txt ]; then
    ADDRESSES=`head -n 255 ./iptext/ip-philippines.txt | sed -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    sed -i -e 1,255d ./iptext/ip-addresses.txt
    echo $ADDRESSES
  fi
done < ./iptext/ip-addresses.txt

git checkout ./iptext/ip-philippines.txt
