#!/bin/bash 
source /home/db2inst1/sqllib/db2profile
su - db2inst1 -c "db2 catalog tcpip node db2node remote db2 server 50000"
su - db2inst1 -c "db2 catalog database ${DB_NAME} as remotedb at node db2node"

function healthCheck() {
  su - db2inst1 -c "db2 connect to remotedb user db2inst1 using ${DB_PASSWORD}" &>/dev/null
}
echo -n "Waiting for db2"
healthCheck
until [ $? -eq 0 ]
do
  echo -ne "."
  sleep 1
  healthCheck
done
echo -e "\nDB2 ready"
