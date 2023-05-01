#!/bin/sh
set -e

echo "mpc startup"

mpc --host=$MPD_HOST --port=$MPD_PORT add /
mpc --host=$MPD_HOST --port=$MPD_PORT random on
mpc --host=$MPD_HOST --port=$MPD_PORT repeat on
mpc --host=$MPD_HOST --port=$MPD_PORT play

echo "Image version: `cat /code/version`"
exec "$@"