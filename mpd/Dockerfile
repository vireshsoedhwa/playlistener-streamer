FROM debian:stable-slim AS release
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /code
ARG VERSION
ENV VERSION=${VERSION:-1.0.0}
RUN echo $VERSION > version

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            mpd \
            mpc;

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY ./etc /etc

EXPOSE 8000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f", "/var/log/mpd/mpd.log"]