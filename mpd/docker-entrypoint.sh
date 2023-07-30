#!/bin/sh
set -e

ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime

echo "loading Directory: "${DIR}""
[ ! -d "/code/data/"${DIR}"" ] && echo "Directory /code/data/"${DIR}" DOES NOT exists" && exit 1

mkdir -p /code/playlists
rm -f /code/db
touch /code/db
chmod 777 /code/db
> /etc/mpd_custom.conf

. /etc/customize_mpd_conf.sh

echo "setup db file and playlists directory done..."

echo "Image version: `cat /code/version`"
exec "$@"