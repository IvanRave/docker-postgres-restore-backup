Postgresql Docker: create db, restore and backup data
===

Requirements
---

- [Install Docker](https://docs.docker.com/engine/installation/)
- [Pull Postgres image](https://hub.docker.com/_/postgres/)


Create a database
---

A database automatically created after `docker run` script:


```bash
CONTAINER_NAME=subd

# docker stop $CONTAINER_NAME
# docker rm $CONTAINER_NAME

POSTGRES_VERSION=9.6.2

# docker pull postgres:$POSTGRES_VERSION

POSTGRES_DB=appdb

DB_LOCAL_PATH=$HOME/databases/$POSTGRES_DB
DB_CONTAINER_PATH=/var/lib/postgresql/data

mkdir -p $DB_LOCAL_PATH

docker run \
       --name $CONTAINER_NAME \
       --restart always \
       -e POSTGRES_PASSWORD=xxxxxxxx \
       -e POSTGRES_USER=appuser \
       -e POSTGRES_DB=$POSTGRES_DB \
       -e PGDATA=$DB_CONTAINER_PATH/pgdata \
       -v $DB_LOCAL_PATH:$DB_CONTAINER_PATH \
       -d \
       postgres:$POSTGRES_VERSION
```

[source script](run-container.sh)


Restore data
---

Required database dump (schema, data, etc.): `dumps/data.sql`

```bash
docker exec \
  -i \
  subd \
  psql \
  --single-transaction \
  --set ON_ERROR_STOP=on \
  -U appuser \
  appdb < ./dumps/data.sql
```

[source script](restore-data.sh)


Backup data
---

```bash
docker exec \
  -i \
  subd \
  pg_dump \
  --no-privileges \
  --no-owner \
  -U appuser \
  appdb > ./dumps/data.sql
```

[source script](backup-data.sh)

Alternative way: data volume containers
---

https://docs.docker.com/engine/tutorials/dockervolumes/#backup-restore-or-migrate-data-volumes