#!/bin/sh
set -e

echo "this is script TWO"
echo ""${GENRE}""

echo "music_directory \"/code/data/"${GENRE}"\"" >> /etc/mpd_custom.conf