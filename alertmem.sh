#!/bin/bash
test -f ~/.msmtprc && receiver=` awk '$1=="from" { print $2}' ~/.msmtprc `
THRESHOLD=80
MOBILE=`getprop ro.product.brand`
USED_MEM=$(free | grep Mem | awk '{print $3/$2 * 100}')
USED_ME=`echo $USED_MEM|awk -F\. '{ print $1  }'`
if [ $USED_ME -gt $THRESHOLD ]; then
  echo "Attenzione: uso memoria exceeds the threshold $THRESHOLD% $MOBILE" 
  test -z $receiver ||  echo  "Subject: Mobile Memory threshold $USED_MEM\n\nHi, \n clean memory of your $MOBILE mobile ." | msmtp   $receiver

fi

