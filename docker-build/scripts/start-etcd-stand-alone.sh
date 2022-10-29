#!/bin/bash

if [[ -z "$ETCD_ADVERTISE_ETH" ]]; then
  nohup etcd >>$ETCD_HOME/etcd.stdout.log 2>>$ETCD_HOME/etcd.stderr.log &
else
  MY_IP=`ifconfig $ETCD_ADVERTISE_ETH|grep -w inet|awk '{print $2}'`
  nohup etcd --listen-client-urls http://0.0.0.0:2379 --advertise-client-urls https://$MY_IP:2379 >>$ETCD_HOME/etcd.stdout.log 2>>$ETCD_HOME/etcd.stderr.log &
fi
