#!/bin/ash

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

  #egress
  tc qdisc add dev eth0 handle 1: root htb default 11
  tc class add dev eth0 parent 1: classid 1:1 htb rate 20kbps
  tc class add dev eth0 parent 1:1 classid 1:11 htb rate 20kbps

  #ingress policing
  #attach ingress policer:
  tc qdisc add dev eth0 handle ffff: ingress
  ## filter *everything* to it (0.0.0.0/0), drop everything that's
  ## coming in too fast:
  tc filter add dev eth0 parent ffff: protocol ip prio 50 u32 match ip src 0.0.0.0/0 police rate 20bit burst 10k drop flowid :1
