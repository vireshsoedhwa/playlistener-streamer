FROM debian:stable-slim AS release
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /code
RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            icecast2;

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY ./etc /etc
RUN chown -R icecast2 /etc/icecast2

EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]