#!/bin/sh
set -e

mkdir -p /code/playlists
rm -f /code/db
touch /code/db
chmod 777 /code/db
> /etc/mpd_custom.conf
>&2 echo "loading playlist category: "${GENRE}""
[ ! -d "/code/data/"${GENRE}"" ] && echo "Directory /code/data/"${GENRE}" DOES NOT exists" && exit 1

. /etc/customize_mpd_conf.sh

>&2 echo "setup db file and playlists directory done..."

mpd
sleep 2
>&2 echo "mpd running..."

mpc add /
>&2 echo "playlist created..."
mpc random on
mpc repeat on
>&2 echo "current playlist content..."
mpc playlist
mpc play

>&2 echo "Starting mpc play..."
exec "$@"