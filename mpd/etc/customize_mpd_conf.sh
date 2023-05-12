#!/bin/sh
set -e

# echo "music_directory \"/code/data/"${GENRE}"\"

# audio_output {
# 	type		\"shout\"
# 	encoder		\"vorbis\"	
# 	name		\""${GENRE}"\"
# 	genre		\""${GENRE}"\"
# 	host		\""${ICECAST_HOST}"\"
# 	port		\"9000\"
# 	mount		\"/"${GENRE}"\"
# 	password	\"hackme\"
# 	quality		\"5.0\"
# 	# bitrate		\"128\"
# 	format		\"44100:24:2\"
#     always_on       \"yes\"
# }" >> /etc/mpd_custom.conf

echo "music_directory \"/code/data/"${GENRE}"\"

audio_output {    
    type           \"httpd\"    
    name           \"My HTTP Stream\"    
    encoder        \"vorbis\"        # optional, vorbis or lame    
    port           \"8000\"    
#    quality        \"5.0\"            # do not define if bitrate is defined    
    bitrate        \"128\"            # do not define if quality is defined    
    format         \"44100:16:1\"    
}" >> /etc/mpd_custom.conf