#!/bin/sh

set -e

mkdir -p /code/playlists
# > /code/db
echo $null >> /code/db
chmod 777 /code/db
[ ! -d "/code/data" ] && echo "Directory /code/data DOES NOT exists" && exit 1
[ ! -d "/code/playlists" ] && echo "Directory /code/playlists DOES NOT exists" && exit 1
[ ! -f "/code/db" ] && echo "db file /code/db DOES NOT exist " && exit 1
>&2 echo "setup db file and playlists directory done..."

>&2 echo "starting icecast..."
/etc/init.d/icecast2 start
>&2 echo "icecast running..."
# mpd --stderr --verbose
mpd
>&2 echo "mpd running..."

mpc ls | mpc add
# mpc --stderr --no-daemon --verbose play
mpc play

tail -f /dev/null

# >&2 echo "Starting Nginx..."
# nginx

# nginx -g daemon off;
# /usr/local/nginx/sbin/nginx -t
exec "$@"