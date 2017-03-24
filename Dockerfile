FROM ibmcom/db2express-c
COPY wait-for-db2.sh /wait-for-db2.sh
ENTRYPOINT bash wait-for-db2.sh