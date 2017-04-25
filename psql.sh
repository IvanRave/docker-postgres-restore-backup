#! /bin/sh -e

docker exec \
       -it \
       subd \
       psql \
       -U appuser \
       appdb
