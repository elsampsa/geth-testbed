#!/bin/bash
docker-compose down
names="bootnode miner endpoint"
for name in $names
do
    # "geth" appears after $name (since it's the default entrypoint in Dockerfile)
    docker-compose run $name removedb
done
#
## bad idea
#subdirs="chaindata lightchaindata"
#for subdir in $subdirs
#do
#    rm -rf bootnode/geth/$subdir/*
#    rm -rf endpoint/geth/$subdir/*
#    rm -rf miner/geth/$subdir/*
#done
