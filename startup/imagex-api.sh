#! /bin/bash

CONTNAME=imagex-api
NETNAME=imgxnet

#docker pull imagex/imagex-api
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
        --ip="172.18.0.3" \
	    -d imagex-api


docker ps -a

docker logs -f ${CONTNAME}
