FROM debian:stable-slim AS release
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /code
ARG VERSION
ENV VERSION=${VERSION:-1.0.0}
RUN echo $VERSION > version

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            mpc;

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]