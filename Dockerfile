FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    lighttpd \
    mailman \
    rsyslog \
    supervisor \
    postfix-policyd-spf-python \
    opendkim \
    opendkim-tools \
    && rm -rf /var/lib/apt/lists/*

RUN adduser postfix opendkim

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY confirm.py /usr/lib/mailman/Mailman/Cgi/confirm.py
COPY MailList.py /usr/lib/mailman/Mailman/MailList.py

EXPOSE 25 80

ENTRYPOINT [ "supervisord" ]
