#!/bin/bash

mkdir $ETCD_HOME/node0
mkdir $ETCD_HOME/node1
mkdir $ETCD_HOME/node2

MY_IP=`ifconfig eth0|grep -w inet|awk '{print $2}'`

nohup etcd --name infra0 \
--data-dir /opt/sh/etcd/node0/data \
--wal-dir /opt/sh/etcd/node0/wal \
--initial-advertise-peer-urls http://127.0.0.1:2000 \
--listen-peer-urls http://127.0.0.1:2000 \
--listen-client-urls http://$MY_IP:3000,http://127.0.0.1:3000 \
--advertise-client-urls http://$MY_IP:3000,http://127.0.0.1:3000 \
--initial-cluster-token cluster \
--initial-cluster infra0=http://127.0.0.1:2000,infra1=http://127.0.0.1:2001,infra2=http://127.0.0.1:2002 \
--initial-cluster-state new >$ETCD_HOME/node0/etcd.log 2>$ETCD_HOME/node0/etcd_error.log &

nohup etcd --name infra1 \
--data-dir /opt/sh/etcd/node1/data \
--wal-dir /opt/sh/etcd/node1/wal \
--initial-advertise-peer-urls http://127.0.0.1:2001 \
--listen-peer-urls http://127.0.0.1:2001 \
--listen-client-urls http://$MY_IP:3001,http://127.0.0.1:3001 \
--advertise-client-urls http://$MY_IP:3001 \
--initial-cluster-token cluster \
--initial-cluster infra0=http://127.0.0.1:2000,infra1=http://127.0.0.1:2001,infra2=http://127.0.0.1:2002 \
--initial-cluster-state new >$ETCD_HOME/node1/etcd.log 2>$ETCD_HOME/node1/etcd_error.log &

nohup etcd --name infra2 \
--data-dir /opt/sh/etcd/node2/data \
--wal-dir /opt/sh/etcd/node2/wal \
--initial-advertise-peer-urls http://127.0.0.1:2002 \
--listen-peer-urls http://127.0.0.1:2002 \
--listen-client-urls http://$MY_IP:3002 \
--advertise-client-urls http://$MY_IP:3002 \
--initial-cluster-token cluster \
--initial-cluster infra0=http://127.0.0.1:2000,infra1=http://127.0.0.1:2001,infra2=http://127.0.0.1:2002 \
--initial-cluster-state new >$ETCD_HOME/node2/etcd.log 2>$ETCD_HOME/node2/etcd_error.log &
