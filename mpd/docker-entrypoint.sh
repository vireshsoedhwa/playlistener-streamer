#!/bin/sh
set -e

echo "loading playlist category: "${GENRE}""
[ ! -d "/code/data/"${GENRE}"" ] && echo "Directory /code/data/"${GENRE}" DOES NOT exists" && exit 1

mkdir -p /code/playlists
rm -f /code/db
touch /code/db
chmod 777 /code/db
> /etc/mpd_custom.conf

. /etc/customize_mpd_conf.sh

echo "setup db file and playlists directory done..."

echo "Image version: `cat /code/version`"
exec "$@"