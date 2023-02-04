# ============================================ BASE
FROM python:3.10-slim-buster as base
ENV PYTHONUNBUFFERED 1
ENV PATH /code:/opt/venv/bin:$PATH
COPY requirements.txt ./
RUN set -ex; \
        python -m venv /opt/venv; \
        pip install --upgrade pip; \
        pip install -r requirements.txt;

# ============================================ Release

FROM python:3.10-slim-buster AS release
ARG DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED 1
ENV PATH /code:/opt/venv/bin:$PATH
WORKDIR /code
RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            build-essential \
            icecast2 \
            curl \
            ffmpeg \
            wget \
            gcc \
            alsa-utils \
            pulseaudio \
            mpd \
            mpc \
            nginx \
            ;

COPY --from=base /root/.cache /root/.cache
COPY --from=base /opt/venv /opt/venv

RUN mkdir -p /run/daphne
COPY manage.py ./
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY app app/
COPY streamer streamer/

RUN mkdir -p data
# RUN touch data/tag_cache
COPY icecast.xml icecast.xml
COPY ./etc /etc
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]
RUN chown -R icecast2 /etc/icecast2


EXPOSE 8000
EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["supervisord", "-c", "supervisord.conf", "-n"]