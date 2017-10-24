#! /bin/bash

CONTNAME=imagex-nginx
NETNAME=imgxnet

docker pull nginx

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
    --ip="172.18.0.80" \
	-p 80:80 \
	-v `pwd`/imagex.conf:/etc/nginx/conf.d/imagex.conf \
    -d nginx

docker ps -a

docker logs -f ${CONTNAME}

