# FROM python:3.10-slim-buster
FROM ubuntu:22.10

ENV PYTHONUNBUFFERED 1
ENV PATH /code:/opt/venv/bin:$PATH

WORKDIR /code

COPY requirements.txt ./

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
            build-essential \
            curl \
            ffmpeg \
            wget \
            gcc \
            libpcre3 \
            libpcre3-dev \
            libssl-dev \
            zlib1g \
            zlib1g-dev \
            libssl-dev \
        ;

RUN wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/refs/tags/v1.2.2-r1.tar.gz --no-check-certificate
RUN tar -xf v1.2.2-r1.tar.gz && mv nginx-rtmp-module-1.2.2-r1 nginx-rtmp-module

RUN wget https://nginx.org/download/nginx-1.23.0.tar.gz --no-check-certificate
RUN tar -xf nginx-1.23.0.tar.gz
WORKDIR /code/nginx-1.23.0

RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module
RUN make -j 1
RUN make install
# CMD ["tail", "-f", "/dev/null"]

RUN mkdir -p /run/daphne

COPY manage.py supervisord.conf ./
COPY docker-entrypoint.sh /usr/local/bin

# COPY /nginx/nginx.conf /etc/nginx/nginx.conf
COPY /nginx/nginx.conf /usr/local/nginx/conf/nginx.conf
COPY streamer streamer

WORKDIR /code
EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["supervisord", "-c", "supervisord.conf", "-n"]