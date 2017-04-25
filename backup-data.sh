#! /bin/sh -e

DUMPS="$PWD"/dumps
mkdir -p $DUMPS

docker exec \
	   -i \
       subd \
       pg_dump \
       --no-privileges \
       --no-owner \
	   -U appuser \
	   appdb > $DUMPS/data.sql
