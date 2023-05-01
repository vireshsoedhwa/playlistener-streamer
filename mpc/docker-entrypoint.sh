#!/bin/sh
set -e

echo "starting running mpc ..."
# sleep 10
mpc --host=mpd_dancehall --port=6600 add /
echo "playlist created..."
mpc --host=mpd_dancehall --port=6600 random on
mpc --host=mpd_dancehall --port=6600 repeat on
# echo "current playlist content..."
# mpc playlist
mpc --host=mpd_dancehall --port=6600 play


echo "Image version: `cat /code/version`"
exec "$@"