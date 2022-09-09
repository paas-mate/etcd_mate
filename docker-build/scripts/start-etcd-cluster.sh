#!/bin/bash

MY_IP=`ifconfig eth0|grep -w inet|awk '{print $2}'`

nohup etcd --name $POD_NAME --initial-advertise-peer-urls http://$MY_IP:2380 \
  --listen-peer-urls http://$MY_IP:2380 \
  --listen-client-urls http://$MY_IP:2379,http://127.0.0.1:2379 \
  --advertise-client-urls http://$MY_IP:2379 \
  --initial-cluster-token cluster \
  --initial-cluster etcd-0=http://etcd-0.etcd:2380,etcd-1=http://etcd-1.etcd:2380,etcd-2=http://etcd-2.etcd:2380 \
  --initial-cluster-state new >>$ETCD_HOME/etcd.stdout.log 2>>$ETCD_HOME/etcd.stderr.log &
