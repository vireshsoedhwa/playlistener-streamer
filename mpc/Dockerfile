FROM debian:stable-slim AS release
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /code
ARG VERSION
ENV VERSION=${VERSION:-1.0.0}
RUN echo $VERSION > version

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            mpc \
            cron;

COPY docker-entrypoint.sh /usr/local/bin
COPY script.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/script.sh
COPY cronjob /etc/cron.d/cronjob


RUN chmod 0644 /etc/cron.d/cronjob
RUN crontab /etc/cron.d/cronjob
RUN touch /code/cron.log

ENTRYPOINT ["docker-entrypoint.sh"]
CMD cron && tail -f /code/cron.log