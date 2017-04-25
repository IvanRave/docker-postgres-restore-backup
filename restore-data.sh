#! /bin/sh -e

# copy a dump file to dumps/ folder
# then - restore

DUMPS="$PWD"/dumps
mkdir -p $DUMPS

docker exec \
       -i \
       subd \
       psql \
       --single-transaction \
       --set ON_ERROR_STOP=on \
       -U appuser \
       appdb < $DUMPS/data.sql
