FROM python:3.10-slim-buster

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
            gcc \
            nginx \
        ; \
        \
        python -m venv /opt/venv; \
        \
        pip install --upgrade pip; \
        pip install -r requirements.txt;

RUN mkdir -p /run/daphne

COPY manage.py supervisord.conf ./
COPY docker-entrypoint.sh /usr/local/bin

COPY /nginx/nginx.conf /etc/nginx/nginx.conf
COPY streamer streamer

WORKDIR /code
EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["supervisord", "-c", "supervisord.conf", "-n"]