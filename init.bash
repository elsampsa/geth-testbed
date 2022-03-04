#!/bin/bash
docker-compose down
names="bootnode miner endpoint"
for name in $names
do
    echo $name
    rm -rf $name/geth
    # "geth" appears after $name (since it's the default entrypoint in Dockerfile)
    docker-compose run $name init /home/geth/genesis.json
    # docker-compose run --entrypoint="rm" $name -f ~/.ethereum/geth/nodekey
    ##..that one is not needed
    echo
done
