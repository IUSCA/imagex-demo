#! /bin/bash

CONTNAME=imagex-data
NETNAME=imgxnet

docker pull imagexdemo/imagex-data
# docker network rm imgxnet
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
        --ip="172.18.0.5" \
        -v `pwd`/../imagex-tiles:/opt/sca/imagex-tiles \
        -v `pwd`/../imagex-config/data:/opt/sca/config \
        -d imagexdemo/imagex-data

docker ps -a

docker logs -f ${CONTNAME}

