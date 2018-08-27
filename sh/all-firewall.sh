#!/bin/bash

COUNT=1
BASE_DIRECTORY=$(cd $(dirname $0); pwd)
DIR_NAME=$(dirname ${BASE_DIRECTORY})
echo DIR_NAME

while read line
do
  if [ -s $DIR_NAME/iptext/all-ip-addresses.txt ]; then
    ADDRESSES=`head -n 255 $DIR_NAME/iptext/all-ip-philippines.txt | sed -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    sed -i -e 1,255d $DIR_NAME/iptext/all-ip-addresses.txt
    echo "gcloud compute firewall-rules create ip-block-$COUNT \
            --priority 10 \
            --action deny \
            --direction ingress \
            --rules all \
            --source-ranges $ADDRESSES"
    $COUNT=`expr $COUNT + 1`
  fi
done < $DIR_NAME/iptext/all-ip-addresses.txt

git checkout $DIR_NAME/iptext/all-ip-addresses.txt
