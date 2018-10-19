#!/bin/bash

chown root:root /etc/aliases
/usr/bin/newaliases

mkdir -p /var/run/mailman
chmod 777 /var/run/mailman

exec /usr/bin/supervisord
