#!/bin/sh

set -e

>&2 echo "Starting runserver..."

# exec ffmpeg -hide_banner -loglevel error $@ 2>&1

# ffmpeg -loglevel error -re -f lavfi -i aevalsrc="sin(400*2*PI*t)" -ar 8000 -f mulaw -f rtp rtp://127.0.0.1:1234

/usr/local/nginx/sbin/nginx

ffmpeg -re -i test.mp4 -vcodec libx264 -vprofile baseline -g 30 -acodec aac -strict -2 -f flv rtmp://localhost/show/stream


# Start Django dev server
# >&2 echo "Starting runserver..."
# nginx -g daemon off;
# /usr/local/nginx/sbin/nginx -t

# /usr/local/nginx/sbin/nginx -g 'daemon off;'

exec "$@"