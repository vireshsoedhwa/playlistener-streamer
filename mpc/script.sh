#!/bin/sh
set -e

echo "mpc reload playlist"
export $(grep -v '^#' /code/.env | xargs -0)

stat_time=$(stat -c %Y "/code/data/default")
# stat -c %Y "/code/data/default"
current_time=$(date +%s)
# date +%s

delta=$(($current_time - $stat_time))

echo "stat time"
echo $stat_time
echo "current time"
echo $current_time

echo "delta"
echo $delta
if [ "$delta" -lt "100" ]; then
    echo "delta test"
fi

# echo "$(($current_time - $stat_time))"

mpc rescan
mpc add /
mpc play
mpc stats
