#!/bin/bash

count=0
BASE_PATH=$(cd $(dirname $0); pwd)
DIR_PATH=$(dirname ${BASE_PATH})
IP_TEXT_PATH=$DIR_PATH/iptext/all-ip-addresses.txt

function GcloudFirewall() {
  gcloud compute firewall-rules create ip-reject-$1 \
    --priority 10 \
    --action deny \
    --direction ingress \
    --rules all \
    --source-ranges $2
}

while read line
do
  if [ -s $IP_TEXT_PATH ]; then
    count=$(( count + 1 ))
    if [ "$(uname)" == 'Linux' ]; then
      ADDRESSES=`head -n 255 $IP_TEXT_PATH | sed -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    elif [ "$(uname)" == 'Darwin' ]; then
      ADDRESSES=`head -n 255 $IP_TEXT_PATH | sed "" -e ':loop; N; $!b loop; s/[\r\n]\+/,/g'`
    else
      echo 'Windows cannot use this shell script.' && exit 0
    fi

    sed -i -e 1,255d $IP_TEXT_PATH

    if [ $count -lt 10 ]; then
      GcloudFirewall 0$count $ADDRESSES
    else
      GcloudFirewall $count $ADDRESSES
    fi
  fi
done < $IP_TEXT_PATH

cd $DIR_PATH
git checkout iptext/all-ip-addresses.txt
