FROM ethereum/client-go:v1.10.15

ARG ACCOUNT_PASSWORD
#ARG USER_ID
#ARG GROUP_ID

# RUN id -u
# RUN id -nu 1000 # no such user

## trying to create a user that matches the hosts user & group id:
# RUN addgroup --gid $GROUP_ID geth
# RUN adduser --disabled-password --gecos '' --u $USER_ID --g $GROUP_ID geth
## ..that won't work for some reason?

## this set's all (by chance) ok:
RUN adduser --disabled-password --gecos '' geth

USER geth

COPY genesis.json /home/geth
RUN echo ${ACCOUNT_PASSWORD} > /home/geth/password

#RUN geth init /home/user/geth/genesis.json \
#    && rm -f ~/.ethereum/geth/nodekey \
#    && echo ${ACCOUNT_PASSWORD} > /tmp/password \
#    && geth account new --password /tmp/password \
#    && rm -f /tmp/password

ENTRYPOINT ["geth"]
