#!/bin/sh
set -e

echo "mpc start"
echo MPD_HOST=$MPD_HOST >> .env
echo MPD_PORT=$MPD_PORT >> .env
mpc --host=$MPD_HOST --port=$MPD_PORT clear
mpc --host=$MPD_HOST --port=$MPD_PORT add /
mpc --host=$MPD_HOST --port=$MPD_PORT random on
mpc --host=$MPD_HOST --port=$MPD_PORT repeat off
mpc --host=$MPD_HOST --port=$MPD_PORT play

echo "Image version: `cat /code/version`"
exec "$@"