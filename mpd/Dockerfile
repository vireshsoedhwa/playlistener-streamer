FROM debian:stable-slim AS release
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /code
ARG VERSION
ENV VERSION=${VERSION:-1.0.0}
RUN echo $VERSION > version

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            mpd ;

COPY docker-entrypoint.sh /usr/local/bin
COPY ./etc /etc
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 6600

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mpd", "--no-daemon", "--verbose"]