#!/bin/bash

chown root:root /etc/aliases
/usr/bin/newaliases

exec /usr/bin/supervisord
