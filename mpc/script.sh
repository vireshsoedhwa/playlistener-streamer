#!/bin/sh
set -e

echo "mpc reload playlist"
export $(grep -v '^#' /code/.env | xargs -0)

mpc rescan
mpc add /
mpc play
mpc stats
