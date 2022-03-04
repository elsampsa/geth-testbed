#!/bin/bash
names="bootnode endpoint miner"
for name in $names
do
    echo $name
    docker container ls | grep testbed_$name | awk '{print $1}' | xargs -I {} docker inspect {} | grep "IPAddress" | grep "172"
    echo
done
