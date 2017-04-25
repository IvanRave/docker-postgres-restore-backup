#! /bin/sh -e

CONTAINER_NAME=subd

# docker stop $CONTAINER_NAME
# docker rm $CONTAINER_NAME

POSTGRES_VERSION=9.6.2

# docker pull postgres:$POSTGRES_VERSION

POSTGRES_DB=appdb

DB_LOCAL_PATH=$HOME/databases/$POSTGRES_DB
DB_CONTAINER_PATH=/var/lib/postgresql/data

mkdir -p $DB_LOCAL_PATH

# docker network create appnet

docker run \
       --name $CONTAINER_NAME \
       --restart always \
       --network appnet \
       -e POSTGRES_PASSWORD=xxxxxxxx \
       -e POSTGRES_USER=appuser \
       -e POSTGRES_DB=$POSTGRES_DB \
       -e PGDATA=$DB_CONTAINER_PATH/pgdata \
       -v $DB_LOCAL_PATH:$DB_CONTAINER_PATH \
       -d \
       postgres:$POSTGRES_VERSION
