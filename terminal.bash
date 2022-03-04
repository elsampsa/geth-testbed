#!/bin/bash
## this script opens you a konsole terminal into a running container
if [ $# -ne 1 ]; then
  echo "Give service name      "
  echo "    bootnode      "
  echo "    endpoint  "
  echo "    miner         "
  exit
fi
docker ps | grep -i $1 | awk '{print $1}' | xargs -I {} konsole --new-tab -e docker exec -it {} sh -l &
# docker ps | grep -i $1 | awk '{print $1}' | xargs -I {} docker exec -it {} bash -l
