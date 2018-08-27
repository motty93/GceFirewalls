#!/bin/bash

count=0
BASE_PATH=$(cd $(dirname $0); pwd)
DIR_PARH=$(dirname ${BASE_PATH})

while read line
do
  if [ -s $DIR_PATH/iptext/all-ip-addresses.txt ]; then
    count=$(( count + 1 ))
    if [ "$(uname)" == 'Linux' ]; then
      ADDRESSES=`head -n 255 $DIR_PATH/iptext/all-ip-addresses.txt | sed -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    elif [ "$(uname)" == 'Darwin' ]; then
      ADDRESSES=`head -n 255 $DIR_PATH/iptext/all-ip-addresses.txt | sed "" -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    else
      ADDRESSES=""
    fi
    sed -i -e 1,255d $DIR_PATH/iptext/all-ip-addresses.txt
    if [ $count -lt 10 ]; then
      gcloud compute firewall-rules create ip-reject-0$count \
              --priority 10 \
              --action deny \
              --direction ingress \
              --rules all \
              --source-ranges $ADDRESSES
    else
      gcloud compute firewall-rules create ip-reject-$count \
              --priority 10 \
              --action deny \
              --direction ingress \
              --rules all \
              --source-ranges $ADDRESSES
    fi
  fi
done < $DIR_PATH/iptext/all-ip-addresses.txt

cd $DIR_PATH
git checkout iptext/all-ip-addresses.txt
