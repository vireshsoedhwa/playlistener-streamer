#!/bin/sh
set -e

echo "music_directory \"/code/data/"${GENRE}"\"

audio_output {
	type		\"shout\"
	encoder		\"vorbis\"	
	name		\""${GENRE}"\"
	genre		\""${GENRE}"\"
	host		\""${ICECAST_HOST}"\"
	port		\"9000\"
	mount		\"/"${GENRE}"\"
	password	\"hackme\"
	quality		\"5.0\"
	# bitrate		\"128\"
	format		\"44100:24:2\"
    always_on       \"yes\"
}" >> /etc/mpd_custom.conf