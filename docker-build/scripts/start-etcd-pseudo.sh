#!/bin/bash

MY_IP=`ifconfig eth0|grep -w inet|awk '{print $2}'`

nohup etcd --name infra0 \
--data-dir /opt/sh/etcd/data \
--wal-dir /opt/sh/etcd/wal \
--initial-advertise-peer-urls http://127.0.0.1:2000 \
--listen-peer-urls http://127.0.0.1:2000 \
--listen-client-urls http://$MY_IP:3000,http://127.0.0.1:3000 \
--advertise-client-urls http://$MY_IP:3000,http://127.0.0.1:3000 \
--initial-cluster-token cluster \
--initial-cluster infra0=http://127.0.0.1:2000,infra1=http://127.0.0.1:2001,infra2=http://127.0.0.1:2002 \
--initial-cluster-state new >>$ETCD_HOME/etcd.stdout.log 2>>$ETCD_HOME/node0/etcd.stderr.log &
