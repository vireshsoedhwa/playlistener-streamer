FROM python:3.10-slim-buster
# FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV PYTHONUNBUFFERED 1
ENV PATH /code:/opt/venv/bin:$PATH

WORKDIR /code

COPY requirements.txt ./

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
            vlc \
        ;

# RUN set -ex; \
#         apt-get update; \
#         apt-get install -y --no-install-recommends \
#             build-essential \
#             curl \
#             ffmpeg \
#             wget \
#             gcc \
#             libpcre3 \
#             libpcre3-dev \
#             libssl-dev \
#             zlib1g \
#             zlib1g-dev \
#             libssl-dev \
#             libgstreamer1.0-dev \
#             libgstreamer-plugins-base1.0-dev \
#             libgstreamer-plugins-bad1.0-dev \
#             gstreamer1.0-plugins-base \
#             gstreamer1.0-plugins-good \
#             gstreamer1.0-plugins-bad \
#             gstreamer1.0-plugins-ugly \
#             gstreamer1.0-libav \
#             gstreamer1.0-doc \
#             gstreamer1.0-tools \
#             gstreamer1.0-x \
#             gstreamer1.0-alsa \
#             gstreamer1.0-gl \
#             gstreamer1.0-gtk3 \
#             gstreamer1.0-qt5 \
#             gstreamer1.0-pulseaudio \
#         ;

# RUN wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/refs/tags/v1.2.2-r1.tar.gz --no-check-certificate
# RUN tar -xf v1.2.2-r1.tar.gz && mv nginx-rtmp-module-1.2.2-r1 nginx-rtmp-module

# RUN wget https://nginx.org/download/nginx-1.23.0.tar.gz --no-check-certificate
# RUN tar -xf nginx-1.23.0.tar.gz
# WORKDIR /code/nginx-1.23.0

# RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module
# RUN make -j 1
# RUN make install

# RUN mkdir -p /run/daphne

# COPY manage.py supervisord.conf ./
COPY docker-entrypoint.sh /usr/local/bin

# COPY /nginx/nginx.conf /etc/nginx/nginx.conf
# COPY /nginx/nginx.conf /usr/local/nginx/conf/nginx.conf

# WORKDIR /

# RUN mkdir -p /usr/share/icecast2
# RUN mkdir -p /usr/share/icecast2/web
# RUN mkdir -p /usr/share/icecast2/admin
# RUN mkdir -p /var/log/icecast2

# COPY icecast.xml icecast.xml
# COPY streamer streamer
COPY ./etc /etc
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]
RUN chown -R icecast2 /etc/icecast2

WORKDIR /code
EXPOSE 8000
EXPOSE 1234

ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["supervisord", "-c", "supervisord.conf", "-n"]