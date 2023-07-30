#!/bin/sh
set -e

echo "mpc reload playlist"
export $(grep -v '^#' /code/.env | xargs -0)

stat_time=$(stat -c %Y "/code/data/${DIR}")
current_time=$(date +%s)
delta=$(($current_time - $stat_time))

# echo "stat time"
# echo $stat_time
# echo "current time"
# echo $current_time
# echo "delta"
# echo $delta

if [ "$delta" -lt "100" ]; then
    echo "directory contents changed... $delta seconds ago... rescanning "
    mpc clear
    mpc rescan
    mpc add /
    mpc repeat on
    mpc random on
    mpc consume off
    mpc play
fi

mpc stats
mpc status

