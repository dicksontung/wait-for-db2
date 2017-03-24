# wait-for-db2
Docker to wait for db2 initialization process
```bash
$ docker run --rm \
    -e DB2INST1_PASSWORD=password \
    -e LICENSE=accept \
    -e DB_PASSWORD=password \
    -e DB_NAME=remotedb \
    --net=database_network wait-for-db2
```