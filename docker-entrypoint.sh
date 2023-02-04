#!/bin/sh

set -e
>&2 echo "Make Database migrations"
python manage.py makemigrations app
echo "-------------------------------------------------------------------------------------------\n"

>&2 echo "Run Database migrations"
python manage.py migrate
echo "-------------------------------------------------------------------------------------------\n"

# Collect static files
>&2 echo "Collect static"
python manage.py collectstatic --noinput

# mkdir -p /code/data
tail -f /dev/null

>&2 echo "starting icecast..."
/etc/init.d/icecast2 start
>&2 echo "icecast running..."
# mpd --stderr --no-daemon --verbose
mpd
mpc ls | mpc add
# mpc --stderr --no-daemon --verbose play
mpc play

# tail -f /dev/null

>&2 echo "Starting Nginx..."
nginx

celery -A tasks worker --loglevel=INFO
# nginx -g daemon off;
# /usr/local/nginx/sbin/nginx -t
exec "$@"