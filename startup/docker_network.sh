#!/bin/bash
NETNAME=imgxnet
if docker network list | grep ${NETNAME}
then
echo "Found Network"
else
docker network create ${NETNAME} --subnet="172.18.0.0/16" --gateway="172.18.0.1" \
    --opt com.docker.network.bridge.enable_icc=true \
    --opt com.docker.network.bridge.enable_ip_masquerade=true \
    --opt com.docker.network.bridge.name=dockerimgxnet \
    --opt com.docker.network.driver.mtu=1500
fi
