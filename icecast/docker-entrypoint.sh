#!/bin/sh
set -e

>&2 echo "starting icecast..."
/etc/init.d/icecast2 start
>&2 echo "icecast running..."

>&2 echo "Starting streamer image version: `cat /code/version`"
exec "$@"