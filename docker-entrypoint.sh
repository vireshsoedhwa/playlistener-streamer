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

# ffmpeg -ac 1 -f alsa -i hw:0,0 -acodec libmp3lame -ab 32k -ac 1

# -content_type audio/mpeg -f mp3

# icecast://source:str3am@35.237.210.58:8000/live

# ffmpeg -stream_loop -1 -y -i test2.mp3 -f mp3 -acodec mp3 -ar 48000 -content_type audio/mpeg icecast://source:hackme@127.0.0.1:8000/live

# ffmpeg rtp://127.0.0.1:1234 -f mp3 -acodec mp3 -ar 48000 -content_type audio/mpeg icecast://source:hackme@127.0.0.1:8000/live

# ffmpeg -stream_loop -1 -y -i test2.mp3 -f mp3 -acodec mp3 -ar 48000 -content_type audio/mpeg

# ffplay -nodisp test2.mp3

# ffplay -nodisp test2.mp3 rtsp://127.0.0.1:9000/player

ffmpeg -i rtp://127.0.0.1:9000/play -f mp3 -acodec mp3 -ar 48000 -content_type audio/mpeg icecast://source:hackme@127.0.0.1:8000/live

ffmpeg -y -i test.mp3 -f rtp rtp://127.0.0.1:9000/play

>&2 echo "icecast running..."
tail -f /dev/null
# ffmpeg -re -i test.mp3 -f flv -acodec libmp3lame -ab 64 -ac 1 rtmp://localhost/show/stream

# ffmpeg -re -i test.mp3 -acodec aac -strict experimental -ab 96k -ar 44100 -vn -f flv rtmp://localhost/show/stream

# ffmpeg -y -i test.mp3 -acodec mp3 -vn -f flv rtmp://localhost/show/stream

# gst-launch-1.0 audiotestsrc ! audioconvert ! audioresample ! udpsink host=127.0.0.1 sync=false

# gst-launch-1.0 audiotestsrc ! audioconvert ! audioresample ! rtmpsink location=rtmp://localhost/show/stream live=1

# gst-launch-1.0 -v videotestsrc ! ffenc_flv ! flvmux ! rtmpsink location='rtmp://localhost/show/stream live=1'

# gst-launch-1.0 filesrc location=test.mp3 ! mpg123audiodec ! audioconvert ! flacenc ! filesink location=test.flac


# Start Django dev server
# >&2 echo "Starting runserver..."
# nginx -g daemon off;
# /usr/local/nginx/sbin/nginx -t

# /usr/local/nginx/sbin/nginx -g 'daemon off;'

exec "$@"