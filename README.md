# Geth testbed


## 1. Synopsis

We fire up a private ethereum network inside docker with three nodes.

Each node's keystore and blockchain is visible at the host's local filesystem.

One of the nodes exposes it's http API endpoint at localhost port ``8545``.

We can then use, say, ``web3.py`` conveniently with local keys to interact with the node through
the port ``8545`` - in the same way as you would interact with, say, infura.


## 2. The Containers

There are three containers:

- ``bootnode`` : that is
- ``miner``: mines blocks
- ``endpoint`` : normal "full node" with json-rpc accessible at host port ``8545``

Each container has it's ``~/.ethereum/`` folder mapped here, into your hosts local directory
with the same name as the container.

Each node has, in it's ``~/.ethereum/keystore/`` (i.e. ``bootnode/keystore``, ``miner/keystore``, etc.) the same keyfile/account with the password ``kikkelis``.

That account is pre-loaded with a motherlode of ethers (see ``genesis.json``).


## 3. Usage

A. Build the images:
```
docker compose build
```

B. Init geth:
```
./init.bash
```
It cleans up the local ``endpoint/geth`` etc. directories & initializes geth using ``genesis.json``.

Run the private network with:
```
docker-compose up
```

## 4. Helper scripts

Create yet another account for node ``endpoint``:
```
./account.bash endpoint
```
(after that, check ``endpoint/keystore``).

## 5. Web3 playground

Create virtualenv & install web3 and python notebooking:
```
virtualenv -p python3 venv
source env/bin/activate
pip install web3.py jupyter
cd notebook
jupyter notebook
```

Now you can start fooling around with web3 python interface that connects to your local docker ethereum minicluster!

## 6. Refs

- https://vsupalov.com/docker-shared-permissions/
- https://hub.docker.com/r/ethereum/client-go/
- https://medium.com/scb-digital/running-a-private-ethereum-blockchain-using-docker-589c8e6a4fe8

## 7. Copyright & License

(C) 2022 Sampsa Riikonen

Do What The Fuck You Want To Public License

