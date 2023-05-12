#!/bin/sh
set -e

echo "music_directory \"/code/data/"${GENRE}"\"

audio_output {    
    type           \"httpd\"    
    name           \"${GENRE}\"    
    encoder        \"vorbis\"        # optional, vorbis or lame    
    port           \"${PORT}\"    
    quality        \"5.0\"            # do not define if bitrate is defined    
#    bitrate        \"128\"            # do not define if quality is defined    
    format         \"44100:16:1\"    
}" >> /etc/mpd_custom.conf