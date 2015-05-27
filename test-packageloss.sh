#!/bin/ash
OUT=opkg-packageloss.txt
TIME=/usr/bin/time
cat /dev/null > $OUT



function measure() {
  insmod sch_ingress
  insmod sch_fq_codel
  insmod ipt_TOS
  insmod ipt_tos
  insmod ipt_length
  insmod sch_prio
  insmod sch_red
  insmod sch_htb
  insmod sch_sfq
  insmod cls_tcindex
  insmod cls_fw
  insmod cls_route
  insmod cls_u32
  insmod em_u32
  insmod ifb
  insmod sch_hfsc
  insmod act_police
  insmod ipt_TTL
  insmod cls_rsvp
  insmod cls_rsvp6
  insmod sch_cbq
  insmod sch_csz
  insmod sch_dsmark
  insmod sch_gred
  insmod sch_teql

  echo "$1 package loss" >> $OUT
  tc qdisc add dev eth0 root netem loss $1%

  for i in {1..5}
  do
    (time opkg install nginx) 2>> $OUT
    opkg remove --force-remove --force-depends nginx
    sleep 5

  done

  #tc qdisc del dev eth0 root netem loss $1%
  tc qdisc del dev eth0 root
}



for i in {0..50..5}
  do
    measure $i
  done
