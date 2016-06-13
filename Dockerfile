FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    lighttpd \
    mailman \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 25 80

ENTRYPOINT [ "supervisord" ]
