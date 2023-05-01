#!/bin/sh
set -e

echo "waiting for mpd to startup"
sleep 10
# echo "starting running mpc default..."
# mpc --host=$MPD_HOST_DEFAULT --port=6600 add /
# mpc --host=$MPD_HOST_DEFAULT --port=6600 random on
# mpc --host=$MPD_HOST_DEFAULT --port=6600 repeat on
# mpc --host=$MPD_HOST_DEFAULT --port=6600 play

# echo "starting running mpc dancehall..."
# mpc --host=$MPD_HOST_DANCEHALL --port=6600 add /
# mpc --host=$MPD_HOST_DANCEHALL --port=6600 random on
# mpc --host=$MPD_HOST_DANCEHALL --port=6600 repeat on
# mpc --host=$MPD_HOST_DANCEHALL --port=6600 play

# echo "current playlist content..."
# mpc playlist

echo "Image version: `cat /code/version`"
exec "$@"