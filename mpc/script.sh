#!/bin/sh
set -e

echo "mpc reload playlist"
export $(grep -v '^#' /code/.env | xargs -0)

echo HOST : $MPD_HOST

mpc rescan --wait
mpc stats