#!/bin/sh
set -e

mkdir -p /code/playlists
rm -f /code/db
touch /code/db
chmod 777 /code/db
> /etc/mpd_custom.conf
>&2 echo "loading playlist category: "${DIR}""
[ ! -d "/code/data/"${DIR}"" ] && echo "Directory /code/data/"${DIR}" DOES NOT exists" && exit 1

echo "music_directory \"/code/data/"${DIR}"\"" >> /etc/mpd_custom.conf

>&2 echo "setup db file and playlists directory done..."

>&2 echo "starting icecast..."
/etc/init.d/icecast2 start
>&2 echo "icecast running..."
mpd
>&2 echo "mpd running..."

mpc add /
>&2 echo "playlist created..."
mpc random on
>&2 echo "playlist randomized..."
>&2 echo "current playlist content..."
mpc playlist
mpc play
# tail -f /dev/null

>&2 echo "Starting mpc play..."
exec "$@"