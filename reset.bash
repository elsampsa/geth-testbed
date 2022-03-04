#!/bin/bash
docker-compose down
subdirs="geth"
for subdir in $subdirs
do
    rm -rf bootnode/$subdir
    rm -rf endpoint/$subdir
    rm -rf miner/$subdir
done
