#!/bin/ash
OUT=opkg-packageloss.txt
TIME=/usr/bin/time
cat /dev/null > $OUT


function measure() {
  echo "$1 package loss" >> $OUT
  tc qdisc add dev eth0 root netem loss $1%

  for i in {1..5}
  do
    ($TIME -f '%e' opkg install nginx) 2>> $OUT
    opkg remove --force-remove --force-depends nginx
    sleep 5

  done

  tc qdisc del dev eth0 root netem loss $1%
}



for i in {0..50..5}
  do
    measure $i
  done
