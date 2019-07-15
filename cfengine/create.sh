#!/bin/bash

CDIR=$(pwd)


#1. create docker containers
#policy server
docker run -d -t -i --name="cf-ps"  -h "cf-ps"  -v $CDIR:/mnt_hosts   trumanz/ubuntu12.04:dev  /bin/bash
#client
docker run -d -t -i --name="cf-c1"  -h "cf-c1"  -v $CDIR:/mnt_hosts  trumanz/ubuntu12.04:dev  /bin/bash


#2. install package 
docker exec -t -i cf-ps  dpkg -i   /mnt_hosts/cfengine-nova-hub_3.7.0-1_amd64.deb
docker exec -t -i cf-c1  dpkg -i   /mnt_hosts/cfengine-nova_3.7.0-1_amd64.deb
