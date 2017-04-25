Postgresql Docker: create db, restore and backup data
===

Create a database
---

A database automatically created after `docker run` script:

`run-container.sh`:

```
POSTGRES_VERSION=9.6.2
POSTGRES_DB=appdb

DB_LOCAL_PATH=$HOME/databases/$POSTGRES_DB
DB_CONTAINER_PATH=/var/lib/postgresql/data

mkdir -p DB_LOCAL_PATH

docker pull postgres:$POSTGRES_VERSION

docker run \
	   --name subd \
	   --restart always \
	   -e POSTGRES_PASSWORD=xxxxxxxx \
	   -e POSTGRES_USER=appuser \
	   -e POSTGRES_DB=$POSTGRES_DB \
	   -e PGDATA=$DB_CONTAINER_PATH/pgdata \
	   -v $DB_LOCAL_PATH:$DB_CONTAINER_PATH \
	   -d \
	   postgres:$POSTGRES_VERSION
```

A database will be created. No exposed ports. Any sensitive settings (user, password) can be accessed, using `docker link`


Restore data
---

Required:
- database dump (schema, data, etc.): `dumps/data.sql`




Alternative way: https://docs.docker.com/engine/tutorials/dockervolumes/#backup-restore-or-migrate-data-volumes