#! /bin/bash

CONTNAME=imagex-mongodb
NETNAME=imgxnet
docker rm -f ${CONTNAME}


docker pull tutum/mongodb
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
        --ip="172.18.0.2" \
        -v `pwd`/../docker-data/${CONTNAME}:/data/db \
        -e AUTH=no \
        -d tutum/mongodb

docker ps -a

docker logs -f ${CONTNAME}

