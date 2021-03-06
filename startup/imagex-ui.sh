#! /bin/bash

CONTNAME=imagex-ui
NETNAME=imgxnet


docker pull imagexdemo/imagex-ui

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
        --ip="172.18.0.4" \
        -v `pwd`/../imagex-ui/uploads:/opt/sca/imagex-ui/uploads \
        -d imagexdemo/imagex-ui


docker ps -a

docker logs -f ${CONTNAME}

