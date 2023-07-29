#!/bin/sh
set -e

# echo "print dirs"
# search_dir=/code/data
# for entry in "$search_dir"/*
# do
#   echo "$entry"
#   echo $(basename $entry)
#   basename=$(basename $entry)
# echo "audio_output {    
#         type           \"httpd\"    
#         name           \"${basename}\"    
#         encoder        \"vorbis\"        # optional, vorbis or lame    
#         port           \"${PORT}\"    
#         quality        \"5.0\"            # do not define if bitrate is defined    
#     #    bitrate        \"128\"            # do not define if quality is defined    
#         format         \"48000:32:2\"    
#     }" >> /etc/mpd_custom.conf
# done

echo "music_directory \"/code/data/"${GENRE}"\"

audio_output {    
    type           \"httpd\"    
    name           \"${GENRE}\"    
    encoder        \"vorbis\"        # optional, vorbis or lame    
    port           \"${PORT}\"    
    quality        \"5.0\"            # do not define if bitrate is defined    
#    bitrate        \"128\"            # do not define if quality is defined    
    format         \"48000:32:2\"    
}" >> /etc/mpd_custom.conf