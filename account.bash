#!/bin/bash
#names="bootnode miner endpoint"
#for name in $names
#do
#    # "geth" appears after $name (since it's the default entrypoint in Dockerfile)
#    docker-compose run $name account new --password /home/geth/password
#done
docker-compose run $1 account new --password /home/geth/password
