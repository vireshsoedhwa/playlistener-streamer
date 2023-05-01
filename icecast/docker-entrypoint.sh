#!/bin/sh
set -e

echo "removing icecast pages..."
rm -r /usr/share/icecast2

echo "starting icecast..."
/etc/init.d/icecast2 start
echo "icecast running..."

echo "Starting streamer image version: `cat /code/version`"
exec "$@"