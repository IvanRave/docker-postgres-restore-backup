#! /bin/sh -e

docker exec \
       -i \
       subd \
       pg_dump \
       --schema-only \
       --no-privileges \
       --no-owner \
       -U appuser \
       appdb > dumps/schema-only.sql
