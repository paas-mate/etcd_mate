#!/bin/bash

nohup etcd >>$ETCD_HOME/etcd.stdout.log 2>>$ETCD_HOME/etcd.stderr.log &
