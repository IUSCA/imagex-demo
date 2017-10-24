#! /bin/bash

CONTNAME=imagex-importer
NETNAME=imgxnet

docker pull imagexdemo/imagex-importer

if docker network list | grep ${NETNAME}
then
echo "Found Network"
else
echo "Network not found!"
exit
fi

docker run \
        --restart=always \
        --name ${CONTNAME}  \
        --network ${NETNAME} \
        --ip="172.18.0.9" \
        -v `pwd`/../imagex-ui/uploads:/opt/sca/uploads \
        -v `pwd`/../imagex-config/importer:/opt/sca/config \
        -v `pwd`/../imagex-tiles:/opt/sca/imagex-tiles \
        -d imagexdemo/imagex-importer

docker ps -a

docker logs -f ${CONTNAME}
