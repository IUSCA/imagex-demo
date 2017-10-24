#! /bin/bash

NETNAME=imgxnet
CONTNAME=imgx_batch


docker pull imagexdemo/imagex-importer

if docker network list | grep ${NETNAME}
then
echo "Found Network"
else
echo "Network not found!"
exit
fi

docker run \
        --network ${NETNAME} \
        --name ${CONTNAME} \
        -v `pwd`/../imagex-config/importer:/opt/sca/config \
        -v `pwd`/../imagex-tiles:/opt/sca/imagex-tiles \
        -v /path/to/import/dir:/opt/sca/batch_import \
        -d imagexdemo/imagex-importer \
        bash -c "python preprocess.py /opt/sca/batch_import"

docker ps -a

docker logs -f ${CONTNAME}
