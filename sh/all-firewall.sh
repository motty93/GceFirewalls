#!/bin/bash

count=1
BASE_DIRECTORY=$(cd $(dirname $0); pwd)
DIR_NAME=$(dirname ${BASE_DIRECTORY})

while read line
do
  if [ -s $DIR_NAME/iptext/all-ip-addresses.txt ]; then
    count=$(( count + 1 ))
    ADDRESSES=`head -n 255 $DIR_NAME/iptext/all-ip-addresses.txt | sed -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    sed -i -e 1,255d $DIR_NAME/iptext/all-ip-addresses.txt
    gcloud compute firewall-rules create ip-reject-$count \
            --priority 10 \
            --action deny \
            --direction ingress \
            --rules all \
            --source-ranges $ADDRESSES
  fi
done < $DIR_NAME/iptext/all-ip-addresses.txt

cd $DIR_NAME
git checkout iptext/all-ip-addresses.txt
