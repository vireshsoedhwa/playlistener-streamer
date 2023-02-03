#!/bin/sh

set -e

>&2 echo "Starting runserver..."

# exec ffmpeg -hide_banner -loglevel error $@ 2>&1

# ffmpeg -loglevel error -re -f lavfi -i aevalsrc="sin(400*2*PI*t)" -ar 8000 -f mulaw -f rtp rtp://127.0.0.1:1234

# /usr/local/nginx/sbin/nginx

# ffmpeg -re -i test.mp4 -vcodec libx264 -vprofile baseline -g 30 -acodec aac -strict -2 -f flv rtmp://localhost/show/stream

# convert mp3 to flv
# ffmpeg -y -i test.mp3 -f flv -acodec mp3 -ab 64 -ac 1 test.flv 

# convert to flv and stream
# ffmpeg -y -i test.mp3 -f flv -acodec aac -ar 44100 -ac 1 -flvflags no_duration_filesize rtmp://localhost/show/stream

# icecast2 -c icecast.xml

# ffmpeg -y -i test2.mp3 -f flv -acodec aac -ar 44100 -ac 1 -flvflags no_duration_filesize rtmp://localhost/show/stream

>&2 echo "starting icecast..."
# /etc/init.d/icecast2 start && tail -F /var/log/icecast2/error.log

/etc/init.d/icecast2 start

>&2 echo "icecast running..."
# mpd --stderr --no-daemon --verbose
mpd
# mpc ls | mpc add
# mpc --stderr --no-daemon --verbose play
# mpc play

tail -f /dev/null

# Start Django dev server
# >&2 echo "Starting runserver..."
# nginx -g daemon off;
# /usr/local/nginx/sbin/nginx -t

# /usr/local/nginx/sbin/nginx -g 'daemon off;'

exec "$@"