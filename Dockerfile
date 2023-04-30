FROM debian:stable-slim AS release
ARG DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED 1
ENV PATH /code:/opt/venv/bin:$PATH
WORKDIR /code
RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            icecast2 \
            mpd \
            mpc \
            nginx \
            ;

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
# COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY icecast.xml icecast.xml
COPY ./etc /etc
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]
RUN chown -R icecast2 /etc/icecast2

EXPOSE 8000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f", "/var/log/mpd/mpd.log"]