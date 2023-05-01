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

mpd
sleep 2
echo "mpd running..."

mpc add /
echo "playlist created..."
mpc random on
mpc repeat on
echo "current playlist content..."
mpc playlist
mpc play


echo "Starting player image version: `cat /code/version`"
exec "$@"